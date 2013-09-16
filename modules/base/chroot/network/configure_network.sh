#!/bin/bash

# Wired, dynamic IP, using dhcpcd
systemctl enable "$NETWORK_SERVICE@$NETWORK_INTERFACE_WIRED.service"

