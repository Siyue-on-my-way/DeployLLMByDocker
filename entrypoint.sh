#!/bin/bash

# Variables
MODEL_NAME=${MODEL_NAME:-"google/gemma-2-2b"}
DEFAULT_MODEL_URL=${DEFAULT_MODEL_URL:-"https://default-repo.com/models/gemma-2-2b.bin"}
CUSTOM_MODEL_URL=${CUSTOM_MODEL_URL}
USE_CUSTOM_URL=${USE_CUSTOM_URL:-"false"}
MODEL_PATH="/root/.ollama/${MODEL_NAME}.bin"

# Function to download model
download_model() {
    local url=$1
    echo "Downloading model from $url..."
    curl -L "$url" -o "$MODEL_PATH"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to download model from $url"
        exit 1
    fi
    echo "Model downloaded successfully to $MODEL_PATH"
}

# Check if the model already exists
if [ ! -f "$MODEL_PATH" ]; then
    echo "Model $MODEL_NAME not found. Preparing to download..."
    if [ "$USE_CUSTOM_URL" == "true" ] && [ -n "$CUSTOM_MODEL_URL" ]; then
        download_model "$CUSTOM_MODEL_URL"
    else
        download_model "$DEFAULT_MODEL_URL"
    fi
else
    echo "Model $MODEL_NAME already exists at $MODEL_PATH"
fi

# Start Ollama with the specified model
echo "Starting Ollama with model $MODEL_NAME..."
exec ollama serve --model "$MODEL_NAME"