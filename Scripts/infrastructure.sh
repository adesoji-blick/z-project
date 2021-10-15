#!/bin/bash

# Build packer AMI
echo +-+-+- building packer AMis -+-+-+
cd PackerAMI/
packer build .

cd ..
echo +-+-+- building terraform infrastructures -+-+-+
terraform init
terraform apply --auto-approve

echo +-+-+- build completed successfully -+-+-+