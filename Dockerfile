FROM ollama/ollama:latest

# 设置工作目录
WORKDIR /root/.ollama

# 添加模型加载脚本
COPY start_model.sh /root/start_model.sh
RUN chmod +x /root/start_model.sh

# 默认启动 Ollama 服务（可覆盖）
CMD ["ollama", "serve"]