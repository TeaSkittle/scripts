#!/usr/bin/sh
# (c) Travis Dowd
# Date: 5-24-2020
# Setup wifi for wpa_supplicant

# Add network to wpa_supplicant config
set_up() {
    echo "[+]Setting up WiFi..."
    if [ ! -f /etc/wpa_supplicant/wpa_supplicant-$wifi.conf ]; then
	echo "ctrl_interface=/run/wpa_supplicant" > /etc/wpa_supplicant/wpa_supplicant-$wifi.conf
	echo "update_config=1" >> /etc/wpa_supplicant/wpa_supplicant-$wifi.conf
	wpa_passphrase $ssid $pass >> /etc/wpa_supplicant/wpa_supplicant-$wifi.conf
    else
	if [ grep -q $ssid /etc/wpa_supplicant/wpa_supplicant-$wifi.conf ]; then
	    echo "[-]SSID already configured..."
	else
            wpa_passphrase $ssid $pass >> /etc/wpa_supplicant/wpa_supplicant-$wifi.conf
	fi
    fi
}

# Initialize connection
init() {
    echo "[+]Initializing connection..."
    wpa_supplicant -B -i $wifi -c /etc/wpa_supplicant/wpa_supplicant-$wifi.conf
}

# View ipv4 of interfaces
ip_show() {
    ip -o addr | awk '{split($4, a); print $2" : "a[1]}' | grep -v '::'
}

echo "Available Devices"
ip link
echo "Enter wifi interface: "
read wifi
echo "SSID: "
read ssid
echo "Password: "
read pass
echo "[+]Enabling Device..."
ip link set $wifi up
# Connect and set up
set_up
init
echo "[+]IPv4 Status:"
ip_show

