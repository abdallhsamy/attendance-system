FROM node:16.14-alpine
WORKDIR /app
COPY . .
RUN npm install -g @angular/cli
RUN npm install
EXPOSE 4200
CMD ["ng" "serve -o"]