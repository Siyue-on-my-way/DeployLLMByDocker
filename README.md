# Ollama 部署与使用
### 部署ollama
<p>启动ollama并暴露服务端口<p>
<p>使用docker-compose启动ollama服务，并暴露服务端口。<p>
<p>进入docker ollama容器<p>

```
docker exec -it ollama bash
```


### ollama启动大模型
<p>使用ollama命令启动大模型<p>
<p>ollama工具会自动下载qwen2:0.5b的模型并运行。<p>

```
ollama run qwen2:0.5b
```


### 测试
1. 生成回复
```
curl http://118.178.241.227:11411/api/generate -d '{
  "model": "qwen2:0.5b",
  "prompt": "Why is the sky blue?",
  "stream": false
}'
```
2. 模型对话
```
curl http://118.178.241.227:11411/api/chat -d '{
  "model": "qwen2:0.5b",
  "messages": [
    { "role": "user", "content": "why is the sky blue?" }
  ],
  "stream": false
}'
```

3、接入第三方工具
例如，使用dify或ragflow配置大模型，只需输入URL和模型名称即可。

>模型类型：LLM
>
>服务器URL: http://118.178.241.227:11411
>
>模型名称: qwen2:0.5b
>
>Completion type: 对话


<p>这样，您就可以在第三方工具上愉快地使用自己部署的大模型了，直接在网页上进行对话或文章解读。<p>