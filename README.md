# xinference的部署

## 使用CPU部署xinfenrence
```
  xinference:
    image: docker-registry.neuedu.com/xprobe/xinference:v0.15.2-cpu
    container_name: xinference
    restart: always
    ports:
      - "9997:9997"
    environment:
      - XINFERENCE_HOME=/opt/xinference
    volumes:
      - /opt/xinference:/opt/xinference
    command: xinference-local -H 0.0.0.0
```

## 使用GPU部署xinfenrence
  ```
  xinference:
    image: xprobe/xinference:v0.15.3
    container_name: xinference
    restart: always
    ports:
      - "9998:9997"
    environment:
      - XINFERENCE_HOME=/opt/xinference
      - XINFERENCE_MODEL_SRC=modelscope
    volumes:
      - /opt/xinference_gpu:/opt/xinference
    deploy:
      resources:
        reservations:
          devices:
            - capabilities: [gpu]
    command: xinference-local -H 0.0.0.0
  ```


## 使用xinfenrence部署大模型请参考其他分支 xinfenrence/xxxxxx