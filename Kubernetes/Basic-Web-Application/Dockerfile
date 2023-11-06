# Resmi PHP Apache görüntüsünü başlangıç noktası olarak kullanın
FROM php:7.4-apache

# Çalışma dizinini /var/www/html olarak ayarlayın
WORKDIR /var/www/html

# curl paketini yükleyin
RUN apt-get update && apt-get install -y curl

# index.php dosyasını GitHub'dan çekin
RUN curl -o index.php -L https://raw.githubusercontent.com/bekirokutan/My-Projects/c25aee8c90dd64b618c8b8f59ed5d6f18dc6d473/Kubernetes/Basic-Web-Application/index.php

# Docker içindeki Apache'yi yapılandırın
RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Docker içindeki Apache'nin çalışmasını başlatın
CMD ["apache2-foreground"]