# Use Ollama's official image as the base
FROM registry.cn-hangzhou.aliyuncs.com/docker_all_mirrors/ollama:latest

# Set working directory
WORKDIR /root

# Create model directory
RUN mkdir -p /root/.ollama

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose the API port
EXPOSE 11434

# Use entrypoint script to manage startup
ENTRYPOINT ["/entrypoint.sh"]