FROM alpine:3.7
RUN apk update \
	&& apk upgrade \
	&& apk --update --no-cache add nginx docker py2-pip bash \
	&& pip install certbot \
	&& rm -rf /var/cache/apk/* \
 	&& rm -rf /tmp/* \
	&& mkdir -p /run/nginx /var/www/html
ADD default.conf /etc/nginx/conf.d/default.conf
CMD nginx -g 'daemon off;'
