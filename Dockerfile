FROM node:17-alpine as builder

COPY . /workdir
WORKDIR /workdir
RUN ls
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org
RUN cnpm -v
RUN cnpm i yarn tyarn -g
RUN tyarn -v
RUN tyarn
RUN tyarn docs:build

# 选择更小体积的基础镜像
FROM nginx:alpine
COPY --from=builder /workdir/docs/.vuepress/dist /usr/share/nginx/html

# traefik自动注册发现
LABEL traefik.enable=true
LABEL traefik.http.routers.home-page.rule=Host(`www.bilibifun.cn`)
LABEL traefik.http.routers.home-page.entrypoints=websecure
LABEL traefik.http.services.home-page.loadbalancer.server.port=80
LABEL traefik.http.routers.home-page.service=home-page
LABEL traefik.http.routers.home-page.tls.certresolver=leresolver
# 关闭watchtower自动更新
LABEL com.centurylinklabs.watchtower.enable=false
