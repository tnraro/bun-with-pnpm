FROM node:22-slim
ENV PNPM_HOME="/pnpm"
ENV BUN_INSTALL="/home/node/.bun"
ENV PATH="$PNPM_HOME:$BUN_INSTALL/bin:$PATH"
RUN apt-get update && apt-get upgrade -y && apt-get install -y curl unzip
RUN npm install -g corepack@latest
RUN corepack enable
WORKDIR /app/
RUN mkdir -p /app /data
RUN chown -R node /app /data
RUN curl -fsSL https://bun.sh/install | bash