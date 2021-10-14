#!/bin/bash

## Installing Grafana ---- port 3000
echo ----- Installing grafana -------
# cd /home/ansible/
wget https://dl.grafana.com/enterprise/release/grafana-enterprise-8.1.5-1.x86_64.rpm
sudo yum install grafana-enterprise-8.1.5-1.x86_64.rpm -y
sudo systemctl enable grafana-server
sudo systemctl start grafana-server