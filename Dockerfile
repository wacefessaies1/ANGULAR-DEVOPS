
FROM node:16.16-alpine AS build
WORKDIR /dist/src/app
RUN npm cache clean --force
COPY . .
RUN npm install --force
RUN npm run build --prod
FROM nginx:latest AS ngi
COPY --from=build /dist/src/app/dist/crudtuto-Front /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d
EXPOSE 80
