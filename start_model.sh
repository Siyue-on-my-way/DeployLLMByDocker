#!/bin/bash

MODEL_NAME=${MODEL_NAME:-"qwen2:0.5b"}

# 检查 Ollama 是否可用
if ! command -v ollama &> /dev/null; then
    echo "错误：Ollama CLI 未找到，请检查安装。"
    exit 1
fi

# 启动 Ollama 服务
ollama serve &

# 确保服务启动
sleep 2

# 加载模型
ollama run "$MODEL_NAME"