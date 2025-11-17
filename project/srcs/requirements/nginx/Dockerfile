FROM alpine:3.21

RUN apk add --no-cache nginx openssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
