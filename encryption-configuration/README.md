```
$ sudo vim /etc/systemd/system/k3s.service
ExecStart=/usr/local/bin/k3s \
     server \
         '--secrets-encryption' \

$ sudo systemctl daemon-reload
$ sudo systemctl restart k3s

$ sudo k3s secrets-encrypt status
Encryption Status: Enabled
Current Rotation Stage: start
Server Encryption Hashes: All hashes match

Active  Key Type  Name
------  --------  ----
 *      AES-CBC   aescbckey
```

https://kubernetes.io/docs/tasks/administer-cluster/encrypt-data/
https://docs.k3s.io/security/secrets-encryption
