#!/bin/sh

# The script work with ubuntu-based distro
# Type the follwing to run the script
# sh ~/open_android_virtual_device_avd.sh

# install jave
sudo apt update && sudo apt install unzip openjdk-17-jre openjdk-8-jre curl

# install android-studio command-line tools
# check if files already exist
mkdir -p ~/Android/cmdline-tools/latest
curl -o ~/cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
unzip ~/cmdline-tools.zip -d ~/Android/cmdline-tools/latest

# update sdk
~/Android/cmdline-tools/latest/bin/sdkmanager --update

# install platform
# check if platform is installed
~/Android/cmdline-tools/latest/bin/sdkmanager "platforms;android-25"

# install system image
# check if system image is installed
~/Android/cmdline-tools/latest/bin/sdkmanager "system-images;android-25;google_apis;x86_64" 

# create avd
~/Android/cmdline-tools/latest/bin/avdmanager create avd --force --name Nexus6P --abi google_apis/x86_64 --package 'system-images;android-25;google_apis;x86_64' --device "Nexus 6P"

# run emulator
~/Android/emulator -avd Nexus6P