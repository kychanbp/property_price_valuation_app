docker build -t property_price_valuation_app .
docker rm property_price_valuation_app
docker run  -d -p 80:80 property_price_valuation_app
docker tag property_price_valuation_app kychanbp/property_price_valuation_app:develop
docker push kychanbp/property_price_valuation_app