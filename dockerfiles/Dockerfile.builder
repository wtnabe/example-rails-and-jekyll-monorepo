FROM node:16.15-slim as node
FROM ruby:3.1-bullseye as buildenv

#
# Node.js　バイナリをこの後の install プロセスで利用できるように
#

RUN mkdir -p /opt

COPY --from=node /usr/local/bin/node /usr/local/bin
COPY --from=node /opt/yarn-v1.22.18 /opt/yarn

#
# 依存パッケージの install 開始
#

WORKDIR /workspace

COPY ./rails rails
RUN cd rails && \
		bundle config set --local path vendor && \
		bundle install && \
		ln -s /opt/yarn/bin/yarn /usr/local/bin && \
		yarn install

#
# アプリケーションの build が可能な image を作る
#

FROM ruby:3.1-slim as appbuilder

WORKDIR /workspace

COPY --from=node /usr/local/bin/node /usr/local/bin
COPY --from=node /opt/yarn-v1.22.18 /opt/yarn
RUN ln -s /opt/yarn/bin/yarn /usr/local/bin

RUN mkdir -p /packages
COPY --from=buildenv /workspace/rails/vendor /packages/vendor
COPY --from=buildenv /workspace/rails/node_modules /packages/node_modules
