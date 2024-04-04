FROM debian:stable-slim

RUN apt update && apt install -y curl unzip

RUN mkdir /app
WORKDIR /app

RUN curl -LO https://github.com/pocketbase/pocketbase/releases/download/v0.22.7/pocketbase_0.22.7_linux_amd64.zip
RUN unzip pocketbase_0.22.7_linux_amd64.zip
RUN mkdir pb_public
RUN mkdir pb_data
COPY ./pb_public/*.html pb_public

ENTRYPOINT [ "./pocketbase", "serve", "--http", "0.0.0.0:8090" ]