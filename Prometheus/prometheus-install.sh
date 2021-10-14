#!/bin/bash

## Installing Prometheus
echo ----- Installing Prometheus ------
wget https://github.com/prometheus/prometheus/releases/download/v2.30.0/prometheus-2.30.0.linux-amd64.tar.gz
tar -xvf prometheus-2.30.0.linux-amd64.tar.gz
cd prometheus-2.30.0.linux-amd64
sudo cp -r . /usr/local/bin/prometheus
sudo cp /tmp/prometheus.service /etc/systemd/system/prometheus.service
sudo cp /tmp/prometheus.yml /usr/local/bin/prometheus/prometheus.yml 
# sudo cp /tmp/prometheus_rules.yml  /usr/local/bin/prometheus/prometheus_rules.yml
sudo systemctl enable prometheus
sudo systemctl start prometheus