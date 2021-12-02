FROM node:16-alpine as builder

WORKDIR /usr/mehul2205/project3

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# EXPOSE 80 for AWS
COPY --from=builder /usr/mehul2205/project3/build /usr/share/nginx/html