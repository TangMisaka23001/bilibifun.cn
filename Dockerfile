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