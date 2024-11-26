#!/bin/bash

MODEL_NAME=${MODEL_NAME:-"qwen2:0.5b"}

# 启动服务后加载模型
ollama serve &
sleep 2
ollama run "$MODEL_NAME"