#!/bin/sh

# Проверяем, что переменные окружения заданы
if [ -z "$AUTH_USER" ] || [ -z "$AUTH_PASS" ]; then
  echo "Error: AUTH_USER and AUTH_PASS must be set"
  exit 1
fi

# Генерируем .htpasswd
echo -n "$AUTH_USER:$(openssl passwd -apr1 $AUTH_PASS)" > /etc/nginx/.htpasswd

# Запускаем Nginx
exec "$@"
