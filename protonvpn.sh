#!/usr/bin/sh
# (c) Travis Dowd
# 
# Install and configure proton VPN (debian-based)
#
sudo apt install -y openvpn dialog python3-pip python3-setuptools
sudo pip3 install protonvpn-cli
echo "Use OpenVPN account settings, not ProtonVPN."
echo "Log into protonvpn.com to find OpenVPN account and password"
echo "[+] Opening https://account.protonvpn.com/ in browser..."
xdg-open https://account.protonvpn.com/ || echo "[!] Error: Can't open URL"
read -r "Press [Enter] to resume ..."
sudo protonvpn init
echo "[+] Connecting to fastest VPN server..."
sudo protonvpn c -f
echo "Connection status:"
sudo protonvpn status
echo "use protonvpn --help to see options"
