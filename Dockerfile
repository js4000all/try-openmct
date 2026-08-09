FROM node:24-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        git \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app \
    && chown node:node /app

USER node
WORKDIR /app
RUN git clone https://github.com/nasa/openmct.git .

RUN npm install

EXPOSE 8080

CMD ["npm", "start", "--", "--host", "0.0.0.0"]
