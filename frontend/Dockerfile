FROM node:18-alpine

WORKDIR /frontend

COPY package*.json ./
RUN npm install --legacy-peer-deps

COPY . .

EXPOSE 3000
CMD ["npm", "start"]