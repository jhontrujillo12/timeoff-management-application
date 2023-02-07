# -------------------------------------------------------------------
# Minimal dockerfile from alpine base
#
# Instructions:
# =============
# 1. Create an empty directory and copy this file into it.
#
# 2. Create image with: 
#	docker build --tag timeoff:latest .
#
# 3. Run with: 
#	docker run -d -p 3000:3000 --name alpine_timeoff timeoff
#
# 4. Login to running container (to update config (vi config/app.json): 
#	docker exec -ti --user root alpine_timeoff /bin/sh
# --------------------------------------------------------------------
FROM alpine:latest as dependencies

RUN apk add --no-cache \
    nodejs npm 

COPY package.json  .

RUN apt-get update && \
    apt-get install -y --no-install-recommends libsqlite3-dev python3 build-essential && \
    yarn config set python /usr/bin/python3

RUN yarn install --frozen-lockfile --network-timeout 600000 && rm -rf "$(yarn cache dir)"

RUN npm install

FROM alpine:latest

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.docker.cmd="docker run -d -p 3000:3000 --name alpine_timeoff"

RUN apk add --no-cache \
    nodejs npm \
    vim

RUN adduser --system app --home /app
USER app
WORKDIR /app
COPY . /app
COPY --from=dependencies node_modules ./node_modules

CMD npm start

EXPOSE 3000
