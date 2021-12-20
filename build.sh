git pull

docker build -t bilibifun-home .

(docker stop bilibifun-home && docker rm bilibifun-home) || true

docker run -p 9013:80 --name bilibifun-home -d bilibifun-home

echo y | docker system prune
