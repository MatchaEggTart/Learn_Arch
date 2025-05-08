#!/bin/bash
echo "" | sudo tee -a /etc/tlp.conf
echo "RESTORE_DEVICE_STATE_ON_STARTUP=1" | sudo tee -a /etc/tlp.conf
echo "START_CHARGE_THRESH_BAT1=40" | sudo tee -a /etc/tlp.conf
echo "STOP_CHARGE_THRESH_BAT1=80" | sudo tee -a /etc/tlp.conf
sudo systemctl enable tlp.service
sudo systemctl restart tlp
