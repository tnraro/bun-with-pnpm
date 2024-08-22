FROM node:22-slim
ENV PNPM_HOME="/pnpm"
ENV BUN_INSTALL="/home/node/.bun"
ENV PATH="$PNPM_HOME:$BUN_INSTALL/bin:$PATH"
RUN corepack enable
WORKDIR /app/
RUN mkdir -p /app /data
RUN chown -R node /app /data
RUN apt update && apt upgrade && apt install -y curl unzip
RUN curl -fsSL https://bun.sh/install | bash