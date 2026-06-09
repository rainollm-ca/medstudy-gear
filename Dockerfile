FROM wordpress:6.8.2-php8.3-apache

RUN apt-get update \
  && apt-get install -y --no-install-recommends curl less default-mysql-client unzip \
  && curl -fsSL -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /usr/local/bin/wp \
  && rm -rf /var/lib/apt/lists/*

COPY docker/medstudy-entrypoint.sh /usr/local/bin/medstudy-entrypoint.sh
COPY wp/mu-plugins/medstudy-brand.php /opt/medstudy/mu-plugins/medstudy-brand.php
RUN chmod +x /usr/local/bin/medstudy-entrypoint.sh

ENTRYPOINT ["medstudy-entrypoint.sh"]
CMD ["apache2-foreground"]
