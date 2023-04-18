FROM node:19-alpine3.16

WORKDIR /app
COPY . /app

RUN apk update \
    && apk add bash git g++ make python3 \
    && apt-get update && apt-get install -y curl \
    && curl -sL https://firebase.tools | bash

RUN chmod +x /app/entrypoint.sh
RUN chmod +x /app/parse_output.sh
COPY /app/parse_output.sh /usr/local/bin/

ENTRYPOINT [ "/app/entrypoint.sh" ]

