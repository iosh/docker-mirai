在 Docker 中使用 [mirai](https://github.com/mamoe/mirai)

run [mirai](https://github.com/mamoe/mirai) in Docker

<div align="center">
   <img width="160" src="https://github.com/mamoe/mirai/blob/dev/docs/mirai.png" alt="logo"></br>

   <img width="95" src="https://github.com/mamoe/mirai/blob/dev/docs/mirai.svg" alt="title">
</div>


# Use

首先克隆项目到本地


```bash
git clone https://github.com/iosh/docker-mirai.git
```

然后使用docker compose (或者使用docker-compose)运行项目

```bash
docker compose up -d
```

稍等一下等待项目初始化成功中间可以看日志(docker compose logs -f)等到出现 ` W/console: Closing input service...` 既可以停止容器

在你的本地的mirai/config/Console目录中找到AutoLogin.yml文件进行修改


```yml
accounts: 
  - # 账号, 现只支持 QQ 数字账号
    account: 你的qq号码
    password: 
      # 密码种类, 可选 PLAIN 或 MD5
      kind: MD5
      # 密码内容, PLAIN 时为密码文本, MD5 时为 16 进制 可以在 https://tool.chinaz.com/tools/md5.aspx 这里生成md5 复制结果中的 32位小 到下面
      value: 这里是32位md5密码
    # 账号配置. 可用配置列表 (注意大小写):
    # "protocol": "ANDROID_PHONE" / "ANDROID_PAD" / "ANDROID_WATCH" / "MACOS" / "IPAD"
    # "device": "device.json"
    # "enable": true
    # "heartbeatStrategy": "STAT_HB" / "REGISTER" / "NONE"
    configuration: 
      protocol: ANDROID_PAD
      device: device.json
      enable: true
      heartbeatStrategy: STAT_HB
```

之后在使用docker compose up -d 启动项目，这个时候是无法进行交互的第一次登陆大概率是需要验证码之类的

所以使用 docker compose exec -it mirai sh 进入容器， 然后执行 `./mcl` 这个时候就可以进行交互登陆了， 登陆成功之后退出

之后重启容器，就可以自动登录了。