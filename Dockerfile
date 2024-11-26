# 基于官方 Ollama 镜像
FROM ollama/ollama:latest

# 设置工作目录
WORKDIR /root/.ollama

# 定义环境变量
ARG MODEL_NAME=qwen2:0.5b

# 启动容器时自动运行模型
CMD ["ollama", "run", "qwen2:0.5b"]