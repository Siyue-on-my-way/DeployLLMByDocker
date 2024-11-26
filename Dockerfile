FROM ollama/ollama:latest

WORKDIR /root/.ollama

# 安装必要工具（如有需要）
RUN apt-get update && apt-get install -y git git-lfs && git lfs install

# 添加启动脚本
COPY start_model.sh /root/start_model.sh
RUN chmod +x /root/start_model.sh

# 默认启动脚本
CMD ["/root/start_model.sh"]