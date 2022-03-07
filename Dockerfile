FROM node:16-alpine

WORKDIR /usr/src/app

# create certs
RUN apk update && \
    apk add ca-certificates && \
    apk add openssl && \
    rm -rf /var/cache/apk/* && \
    openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out cert.pem \
        -subj "/C=SE/ST=South/L=Lund/O=Qlik/OU=R&D/CN=docker.com"

# install certs
RUN mkdir -p /usr/local/share/ca-certificates && \
    cp cert.pem /usr/local/share/ca-certificates/ca.crt && \
    update-ca-certificates

RUN npm install -g http-server

RUN mkdir public

CMD ["http-server", "public", "-p", "8080", "--ssl", "--cors"]

EXPOSE 8080
