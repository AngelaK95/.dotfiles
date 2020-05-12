#!/bin/bash
#An extremely simple colored battery status applet for KDE connect
qdbus org.kde.kdeconnect /modules/kdeconnect/devices/{DEVICE_NAME} org.kde.kdeconnect.device.battery.charge > battery.temp &&
qdbus org.kde.kdeconnect /modules/kdeconnect/devices/{DEVICE_NAME} org.kde.kdeconnect.device.battery.isCharging >> battery.temp && 
tr '\n' ':' < battery.temp > battery &&
rm battery.temp &&
awk -F: '{
	if($2=="true")
		{print"📱<font color=\"#0090ff\">"$1"</font>"}
	else if($1>65)
		{print"📱<font color=\"#40FF00\">"$1"</font>"}
	else if($1>35)
		{print"📱<font color=\"#F7FE2E\">"$1"</font>"}
	else
		{print"📱<font color=\"#FF0000\">"$1"</font>"}
}' <battery
