FROM nginx:latest

# Копируем кастомный конфиг Nginx
COPY ./configs/nginx.conf /etc/nginx/nginx.conf

# Скрипт для генерации .htpasswd при запуске
COPY ./scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
