# Use base image
FROM registry.cn-hangzhou.aliyuncs.com/docker_all_mirrors/ollama:latest

# Install Git and Git LFS
RUN apt-get update && apt-get install -y git git-lfs && git lfs install

# Set working directory
WORKDIR /root/.ollama

# Clone the model repository
ARG MODEL_REPO=${MODEL_REPO}
RUN git clone ${MODEL_REPO} model && cd model && git lfs pull

# Expose the API port
EXPOSE 11434

# Start Ollama
CMD ["ollama", "serve", "--model", "/root/.ollama/model"]