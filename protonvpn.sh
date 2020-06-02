#!/usr/bin/sh
# shellcheck disable=SC2012
#
# (c) Travis Dowd
# 
# Install and configure proton VPN (debian-based)
#

set_up() {
	apt install -y openvpn dialog python3-pip python3-setuptools
	pip3 install protonvpn-cli
	printf "\n\nIMPORTANT: Use OpenVPN account settings, not ProtonVPN! Can be found on protonvpn.com\n"
	echo "[+] Opening https://account.protonvpn.com/ in browser..."
	# This is to avoid running xd-open as root ( can cause issues )
	new_user=$(ls -l /run/user/1000/gdm/Xauthority | awk '{print $3}')
	sudo -u "$new_user" xdg-open https://account.protonvpn.com/ || echo "[!] Error: Can't open URL"
	printf "\nPress enter to continue..."
	read -r _
	protonvpn init
	echo "[+] Connecting to fastest VPN server..."
	protonvpn c -f
	echo "Connection status:"
	protonvpn status
	echo "To see options use: protonvpn --help"
}    

is_root() {
	if [ "$HOME" = "/root" ]; then
		set_up
	else
		echo "[-] Error: xdg-open need home to be /root"
		exit 1;
	fi
}

is_root