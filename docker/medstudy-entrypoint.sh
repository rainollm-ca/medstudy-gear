#!/usr/bin/env bash
set -euo pipefail

/usr/local/bin/docker-entrypoint.sh "$@" &
apache_pid=$!

wp_cli() { wp --allow-root --path=/var/www/html "$@"; }

for i in $(seq 1 120); do
  if wp_cli db check >/dev/null 2>&1; then
    break
  fi
  sleep 2
done

if ! wp_cli core is-installed >/dev/null 2>&1; then
  wp_cli core install \
    --url="${WORDPRESS_SITE_URL}" \
    --title="${WORDPRESS_SITE_TITLE}" \
    --admin_user="${WORDPRESS_ADMIN_USER}" \
    --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
    --admin_email="${WORDPRESS_ADMIN_EMAIL}" \
    --skip-email
fi

wp_cli rewrite structure '/%postname%/' --hard || true
wp_cli option update blogdescription 'Premium study essentials for healthcare learners.' || true
wp_cli option update timezone_string 'America/Edmonton' || true

mkdir -p /var/www/html/wp-content/mu-plugins
cp -f /opt/medstudy/mu-plugins/medstudy-brand.php /var/www/html/wp-content/mu-plugins/medstudy-brand.php || true

# Install only free WordPress.org plugins needed for Printful/WooCommerce readiness.
wp_cli plugin install woocommerce --activate || true
wp_cli plugin install woocommerce-legacy-rest-api --activate || true
wp_cli plugin install printful-shipping-for-woocommerce --activate || true
wp_cli plugin install woocommerce-gateway-stripe --activate || true
wp_cli plugin install wordpress-seo --activate || true

# WooCommerce baseline settings.
wp_cli option update woocommerce_store_address "${WOOCOMMERCE_STORE_ADDRESS:-Edmonton, AB}" || true
wp_cli option update woocommerce_default_country "${WOOCOMMERCE_STORE_COUNTRY:-CA:AB}" || true
wp_cli option update woocommerce_currency "${WOOCOMMERCE_CURRENCY:-CAD}" || true
wp_cli option update woocommerce_calc_taxes yes || true
wp_cli option update woocommerce_enable_shipping_calc yes || true
wp_cli option update woocommerce_api_enabled yes || true
wp_cli option update woocommerce_custom_orders_table_enabled no || true

# Create core pages if missing.
create_page() {
  local slug="$1" title="$2" content="$3"
  if ! wp_cli post list --post_type=page --name="$slug" --field=ID | grep -q .; then
    wp_cli post create --post_type=page --post_status=publish --post_name="$slug" --post_title="$title" --post_content="$content" >/dev/null || true
  fi
}

create_page "about" "About MedStudy Gear" "<p>MedStudy Gear creates clean, practical study essentials for healthcare learners: students, residents, nurses, and clinicians in training.</p>"
create_page "shipping-returns" "Shipping & Returns" "<p>Products are printed on demand and fulfilled by Printful. Shipping rates and delivery estimates are calculated at checkout. Because items are custom-made, returns are accepted for damaged, defective, or incorrect items according to the store policy.</p>"
create_page "contact" "Contact" "<p>For order questions, use the contact form or email support after launch.</p>"
create_page "privacy-policy" "Privacy Policy" "<p>This store collects only the information required to process orders, provide support, and improve the shopping experience.</p>"
create_page "terms" "Terms of Service" "<p>By purchasing from MedStudy Gear, customers agree that products are made to order and fulfilled by third-party print-on-demand providers.</p>"

wait "$apache_pid"
