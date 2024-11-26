FROM ollama/ollama:latest

WORKDIR /root/.ollama

# 安装必要工具
RUN apt-get update && apt-get install -y git git-lfs && git lfs install

# 添加启动脚本
COPY start_model.sh /root/start_model.sh
RUN chmod +x /root/start_model.sh

# 配置为以 Shell 运行启动脚本
ENTRYPOINT ["/bin/bash", "/root/start_model.sh"]