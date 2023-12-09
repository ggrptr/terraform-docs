ARG TERRAFORM_DOCS_VERSION=0.16.0
ARG ALPINE_VERSION=3.18.4
ARG ARTIFACT_POSTFIX=linux-amd64
ARG TERRAFORM_DOCS_URL="https://github.com/terraform-docs/terraform-docs/releases/download/v0.16.0/terraform-docs-v${TERRAFORM_DOCS_VERSION}-${ARTIFACT_POSTFIX}.tar.gz"

FROM alpine:${ALPINE_VERSION} AS terraform-docs
ARG TERRAFORM_DOCS_URL

WORKDIR /tmp
RUN wget -q  -O- "${TERRAFORM_DOCS_URL}" | tar -xz terraform-docs \
    && chmod +x terraform-docs \
    && mv terraform-docs /usr/local/bin/terraform-docs

ENTRYPOINT ["terraform-docs"]