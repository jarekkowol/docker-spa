FROM node:alpine AS base
COPY . .
RUN npm run build

FROM nginx
COPY nginx.config /etc/nginx/conf.d/default.conf
COPY --from=base build /usr/share/nginx/html
