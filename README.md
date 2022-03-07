# https-server

A node based http server running with --ssl and locally trusted certificates

Running this container will start a http-server with port on 8050. Copy files to a `/public` folder which will served.

## Example

```Dockerfile
FROM nilzona/https-server:latest

COPY dist ./public
```

build with:

```shell
docker build -t my-https-server:latest .
```

then run with:

```shell
docker run --name my-container -d -p 8080:8080 my-https-server:latest
```

This will start a https-server serving the files copied from the dist folder with port 8080
