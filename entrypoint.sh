#!/bin/bash

# 获取环境变量
MODEL_NAME=${MODEL_NAME:-"default-model"}
MODEL_REPO=${MODEL_REPO:-""}

# 检查模型是否已经存在
if [ ! -d "/root/.ollama/$MODEL_NAME" ]; then
    echo "模型 $MODEL_NAME 不存在，尝试从 $MODEL_REPO 克隆..."
    if [ -z "$MODEL_REPO" ]; then
        echo "错误：未提供模型仓库地址。请设置 MODEL_REPO 环境变量。"
        exit 1
    fi

    # 克隆模型仓库并下载大文件
    git clone "$MODEL_REPO" "$MODEL_NAME" && cd "$MODEL_NAME" && git lfs pull
    if [ $? -ne 0 ]; then
        echo "模型克隆失败，请检查仓库地址或网络连接。"
        exit 1
    fi
    echo "模型 $MODEL_NAME 下载完成。"
else
    echo "模型 $MODEL_NAME 已存在，跳过下载。"
fi

# 启动 Ollama 服务
echo "启动 Ollama 服务，加载模型 $MODEL_NAME..."
# exec ollama serve --model "/root/.ollama/$MODEL_NAME"
exec ollama serve