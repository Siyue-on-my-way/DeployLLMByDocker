FROM ubuntu:20.04

# 安装必要工具
RUN apt-get update && apt-get install -y \
    git \
    git-lfs \
    curl && \
    git lfs install && \
    apt-get clean

# 设置工作目录
WORKDIR /root/.ollama

# 环境变量
ARG MODEL_REPO=""
ENV MODEL_REPO=${MODEL_REPO}

# 拉取模型
RUN if [ -n "$MODEL_REPO" ]; then \
        git clone "$MODEL_REPO" model && cd model && git lfs pull; \
    fi

# 启动 Ollama 服务
ENTRYPOINT ["ollama"]
CMD ["serve"]