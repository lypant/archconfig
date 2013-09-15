#!/bin/bash

# Wired, dynamic IP, using dhcpcd
systemctl enable dhcpcd@enp0s3.service

