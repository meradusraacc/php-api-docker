FROM php:8.2-apache

# Enable mod_rewrite (optional, for APIs with routing)
RUN a2enmod rewrite

# Copy your app
COPY . /var/www/html/

# Let Apache use the PORT Render provides
RUN sed -i 's/Listen 80/Listen ${PORT}/' /etc/apache2/ports.conf && \
    sed -i 's/:80/:${PORT}/' /etc/apache2/sites-enabled/000-default.conf

EXPOSE 80
CMD ["apache2-foreground"]
