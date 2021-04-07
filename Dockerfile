FROM node AS build

WORKDIR /build/
COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm i

COPY . .

RUN make build

FROM httpd:alpine

COPY --from=build /build/dist /usr/local/apache2/htdocs/
