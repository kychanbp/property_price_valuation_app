FROM node:latest as build-stage
WORKDIR /property_price_valuation_app
COPY /property_price_valuation_app/package*.json ./
RUN npm install
COPY property_price_valuation_app .
RUN npm run build

FROM nginx as production-stage
RUN mkdir /property_price_valuation_app
COPY --from=build-stage /property_price_valuation_app/dist /property_price_valuation_app
COPY nginx.conf /etc/nginx/nginx.conf