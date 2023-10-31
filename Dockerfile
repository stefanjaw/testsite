FROM node:18.12 as build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

RUN npm run prod
RUN pwd 

FROM nginx:1.18
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build app/dist/testsite/ /usr/share/nginx/html

