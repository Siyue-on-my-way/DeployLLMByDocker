# 使用 Ollama 官方镜像
# FROM registry.cn-hangzhou.aliyuncs.com/docker_all_mirrors/ollama:latest
FROM ollama/ollama:latest

# 安装必要工具
RUN apt-get update && apt-get install -y git git-lfs && git lfs install

# 设置工作目录
WORKDIR /root/.ollama

# 添加下载和启动脚本
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 暴露服务端口
EXPOSE 11434

# 使用自定义启动脚本
ENTRYPOINT ["/entrypoint.sh"]