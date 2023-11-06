# Resmi PHP-Apache görüntüsünü kullan
FROM php:7.4-apache

# Gerekli PHP eklentilerini etkinleştir
RUN docker-php-ext-install mysqli


WORKDIR /var/www/html

# curl paketini yükleyin
RUN apt-get update && apt-get install -y curl

# index.php dosyasını GitHub'dan çekin
RUN curl -o index.php -L https://raw.githubusercontent.com/bekirokutan/My-Projects/c25aee8c90dd64b618c8b8f59ed5d6f18dc6d473/Kubernetes/Basic-Web-Application/index.php

# PHP uygulama dosyalarını /var/www/html/ içine kopyala
#COPY your-php-app.php /var/www/html/

# Ortam değişkenleri tanımla
#ENV DB_HOST=mysql-host
#ENV MYSQL_USER=mysql-user
#ENV MYSQL_PASSWORD=mysql-password
#ENV MYSQL_DATABASE=mysql-database

# Apache URL yeniden yazma etkinleştir
RUN a2enmod rewrite

# Giriş sayfasını etkinleştir
RUN a2ensite 000-default.conf

# Apache'yi yeniden başlat
RUN service apache2 restart

# Docker konteyner çalıştığında bu komutu çalıştır
CMD ["apache2-foreground"]
