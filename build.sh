git pull

docker build -t bilibifun-home .

(docker stop bilibifun-home && docker rm bilibifun-home) || true

docker run --name bilibifun-home -d --network traefik-public --restart=always bilibifun-home
