#!/usr/bin/env sh

# Install WordPress.
wp core install \
  --path="/var/www/html" \
  --url="http://${WORDPRESS_HOST}:${WORDPRESS_PORT}" \
  --title="${WORDPRESS_TITLE}" \
  --admin_user="${WORDPRESS_ADMIN_USER}" \
  --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
  --admin_email="${WORDPRESS_ADMIN_EMAIL}"

# Update permalink structure.
wp option update \
  permalink_structure "${WORDPRESS_PERMALINK_STRUCTURE}" \
  --skip-themes \
  --skip-plugins


# Plugin installation
wp plugin uninstall --all
wp plugin install ${WORDPRESS_PLUGINS_TO_INSTALL} --activate

echo -e "\nREPORT\n"

# List users
echo "== User List =="
wp user list
echo ""

# Show installed themes
echo "== Theme List =="
wp theme list
echo ""

# Show installed plugin
echo "== Plugin List =="
wp plugin list
echo ""