# Copyright 2018 Google, Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is a modified version of https://github.com/GoogleContainerTools/kaniko/blob/v1.2.0/deploy/Dockerfile

FROM golang:latest AS BUILD

ARG GOARCH=amd64
ARG KANIKO_VERSION=master

ENV REPO https://github.com/GoogleContainerTools/kaniko

WORKDIR /go/src

RUN git clone ${REPO} kaniko \
    && git -C /go/src/kaniko checkout --detach ${KANIKO_VERSION} \
    && make --directory /go/src/kaniko GOARCH=${GOARCH}

FROM scratch

COPY --from=BUILD /go/src/kaniko/out/executor /kaniko/executor
COPY --from=BUILD /go/src/kaniko/files/ca-certificates.crt /kaniko/ssl/certs/

ENV HOME /root
ENV USER root
ENV PATH /usr/local/bin:/kaniko
ENV SSL_CERT_DIR=/kaniko/ssl/certs
ENV DOCKER_CONFIG /kaniko/.docker/

ENV container kube

WORKDIR /workspace

ENTRYPOINT ["/kaniko/executor"]
