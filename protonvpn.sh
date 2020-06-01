#!/usr/bin/sh
# (c) Travis Dowd
# 
# Install and configure proton VPN (debian-based)
#
apt install -y openvpn dialog python3-pip python3-setuptools
pip3 install protonvpn-cli
echo "IMPORTANT: Use OpenVPN account settings, not ProtonVPN! Can be found on protonvpn.com"
echo "[+] Opening https://account.protonvpn.com/ in browser..."
xdg-open https://account.protonvpn.com/ || echo "[!] Error: Can't open URL"
read -r "Press [Enter] to resume..."
protonvpn init
echo "[+] Connecting to fastest VPN server..."
protonvpn c -f
echo "Connection status:"
protonvpn status
echo "use protonvpn --help to see options"
