FROM adbv/base

LABEL maintainer="Günther Morhart"
#
# Setup
#
RUN apk add --no-cache \
        nginx \
        openssl && \
    rm /etc/nginx/conf.d/default.conf && \
    chown app:app /var/tmp/nginx && \
    mkdir /etc/nginx/ssl && \
    openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048

COPY default.conf /app/nginx.conf
COPY etc/ /etc/nginx/

#
# Ports
#
EXPOSE 80 443

#
# Command
#
CMD ["nginx"]
