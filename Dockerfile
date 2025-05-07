FROM node:18-alpine

# 安装 pm2 和 mintlify CLI
RUN npm install -g pm2 @mintlify/cli

# 设置工作目录
WORKDIR /app

# 拷贝项目文件
COPY . .

# 设置默认环境变量
ENV HOST=0.0.0.0
ENV PORT=3000

EXPOSE 3000

# 使用 pm2 启动 mintlify dev
CMD ["pm2-runtime", "start", "--interpreter", "bash", "--name", "mintlify-docs", "--", "mint", "dev"]
