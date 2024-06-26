FROM node:17-alpine as builder

COPY . /workdir
WORKDIR /workdir
RUN ls
RUN npm install -g cnpm --registry=https://registry.npmmirror.com
RUN cnpm -v
RUN cnpm i yarn tyarn -g
RUN tyarn -v
RUN tyarn
RUN tyarn docs:build

# 选择更小体积的基础镜像
FROM nginx:alpine
# 时区
ENV TimeZone=Asia/Shanghai
COPY --from=builder /workdir/docs/.vuepress/dist /usr/share/nginx/html

# traefik自动注册发现
LABEL traefik.enable=true
LABEL traefik.http.routers.home-page.rule="Host(`oxcafebabe.cn`) || Host(`www.oxcafebabe.cn`)"
LABEL traefik.http.routers.home-page.entrypoints=websecure
LABEL traefik.http.services.home-page.loadbalancer.server.port=80
LABEL traefik.http.routers.home-page.service=home-page
LABEL traefik.http.routers.home-page.tls.certresolver=leresolver
