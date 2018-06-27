# overmind88_infra
overmind88 Infra repository

ДЗ №3

bastion_IP = 35.204.213.127  
someinternalhost_IP = 10.164.0.3

Подключение к someinternalhost в одну строчку:

`ssh -i ~/.ssh/appuser -A overmind88@35.204.213.127 -t ssh 10.164.0.3`

Подключение по алиасу someinternalhost:

В ~/.ssh/config прописать следующее:

```
Host someinternalhost
    HostName 10.164.0.3
    ForwardAgent yes
    User overmind88
    ProxyCommand ssh overmind88@35.204.213.127 nc %h %p
```

testapp_IP = 5.205.80.235
testapp_port = 9292 
