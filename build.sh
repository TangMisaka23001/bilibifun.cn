docker build -t bilibifun-home .

docker stop bilibifun-home && docker rm bilibifun-home

docker run -p 9013:80 --name bilibifun-home -d bilibifun-home