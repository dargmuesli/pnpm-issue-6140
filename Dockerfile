FROM node:19.7.0-alpine@sha256:51dd437f31812df71108b81385e2945071ec813d5815fa3403855669c8f3432b AS prepare

WORKDIR /srv/app/

COPY ./package.json ./

RUN corepack enable \
    && pnpm install \
    && echo "TMPDIR: $TMPDIR"; echo "const os = require('os'); console.log('tmpdir(): ' + os.tmpdir())" | node -
