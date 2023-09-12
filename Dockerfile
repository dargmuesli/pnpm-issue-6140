FROM node:20.6.0-alpine@sha256:c843f4a4060246a25f62c80b3d4cf4a6b4c4639cdce421e4f2ee3102257225b4 AS prepare

WORKDIR /srv/app/

COPY ./package.json ./

RUN corepack enable \
    && pnpm install \
    && echo "TMPDIR: $TMPDIR"; echo "const os = require('os'); console.log('tmpdir(): ' + os.tmpdir())" | node -
