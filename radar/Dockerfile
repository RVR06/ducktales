# -- -- -- -- -- -- -- -- -- -- -- -- -- --
FROM node:20.11.0 AS build
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .

RUN npm run build

# -- -- -- -- -- -- -- -- -- -- -- -- -- --
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html/

WORKDIR /usr/share/nginx/html/
EXPOSE 80