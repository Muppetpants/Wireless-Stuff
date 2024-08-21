#!/bin/bash

# Will need to run bundle install in the Blue Hyrda directory after install

# Checks to verify that the script is not running as root
if [[ $EUID -eq 0 ]]; then
   echo "THIS SCRIPT SHOULD NOT BE RUN AS ROOT."
   echo "EX:  ./installTools.sh"
   exit 1
fi

sudo sh -c "apt update && apt install hackrf libhackrf-dev libhackrf0 airgraph-ng gpsd gpsprune bluez bluez-test-scripts python3-bluez python3-dbus libsqlite3-dev ubertooth ruby-dev bundler git"


wget  https://github.com/AlexandreRouma/SDRPlusPlus/releases/download/nightly/sdrpp_debian_sid_amd64.deb
sudo apt install ./sdrpp_debian_sid_amd64.deb

mkdir -p Bluetooth_Tools/blue_hydra Bluetooth_Tools/blue_sonar
# Clone Bluetooth Tool Repos
git clone https://github.com/ZeroChaos-/blue_hydra.git Bluetooth_Tools/blue_hydra
git clone https://github.com/ZeroChaos-/blue_sonar.git Bluetooth_Tools/blue_sonar

git clone https://github.com/Muppetpants/pcaps.git
wget https://raw.githubusercontent.com/Muppetpants/KismetFiles/main/kismetSetup.sh
git clone https://github.com/Muppetpants/Password-Lists.git
git clone https://github.com/Muppetpants/apks.git
git clone https://github.com/Muppetpants/customWLAN.git
git clone https://github.com/Muppetpants/convertSSID.git

clear
echo "Finished! Creating an example airgraph output and opening GPSprune to install depends"
airgraph-ng -i example.csv -o example_output.png -g CAPR
gpsprune 




