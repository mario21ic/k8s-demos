sudo vim /etc/systemd/system/k3s.service
ExecStart=/usr/local/bin/k3s \
     server \
         '--secrets-encryption' \
sudo systemctl daemon-reload
sudo systemctl restart k3s
sudo k3s secrets-encrypt status

https://kubernetes.io/docs/tasks/administer-cluster/encrypt-data/
