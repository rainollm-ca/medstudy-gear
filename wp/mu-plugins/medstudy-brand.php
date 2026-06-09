<?php
/**
 * Plugin Name: MedStudy Gear Brand Tweaks
 * Description: Lightweight storefront defaults for MedStudy Gear.
 */
add_action('wp_head', function () {
  echo '<style>:root{--msg-navy:#172033;--msg-mint:#70e0c6;--msg-cream:#f8f3e7} body{font-family:Inter,system-ui,-apple-system,BlinkMacSystemFont,"Segoe UI",sans-serif} .site-title a{letter-spacing:-.04em}.woocommerce ul.products li.product .price{color:#172033;font-weight:700}</style>';
});
