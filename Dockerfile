FROM node:16-alpine3.14
RUN addgroup app && adduser -S -G app app && mkdir app && chmod -R og+rwx app
# also do manually before building: chmod uog+rwx yarn.lock 
USER app
WORKDIR /app
COPY . .
RUN npm install
ENV API_URL=http://api.myapp.com/
EXPOSE 3000
CMD [ "npm", "start"]