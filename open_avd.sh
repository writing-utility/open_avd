#!/bin/sh

# The script work with ubuntu-based distro
# Type the follwing to run the script
# sh ~/open_avd.sh

#ADD nice output (mute commands outputs + print running cmd + output err + declare if commands are complted)

# install jave
#sudo apt update && 
sudo apt install unzip openjdk-17-jre openjdk-8-jre curl #ADD auto yes

# install android-studio command-line tools
#ADD check if files already exist
mkdir -p ~/Android/cmdline-tools
curl -o ~/cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip #ADD exist if file is not availabe
unzip ~/cmdline-tools.zip -d ~/Android/cmdline-tools
cd ~/Android/cmdline-tools && mv cmdline-tools latest

# update sdk
#~/Android/cmdline-tools/latest/bin/sdkmanager --update
~/Android/cmdline-tools/latest/bin/sdkmanager platform-tools emulator

~/Android/cmdline-tools/latest/bin/sdkmanager “platforms;android-30” “system-images;android-30;google_apis_playstore;x86_64” “build-tools;30.0.2”
# install platform
#ADD check if platform is already installed
#~/Android/cmdline-tools/latest/bin/sdkmanager "platforms;android-25" #ADD auto yes

# install system image
#ADD check if system image is already installed
#~/Android/cmdline-tools/latest/bin/sdkmanager "system-images;android-25;google_apis;x86_64" 

# install emulator
#~/Android/cmdline-tools/latest/bin/sdkmanager --channel=3 emulator

# create avd
#~/Android/cmdline-tools/latest/bin/avdmanager create avd --force --name Nexus6P --abi google_apis/x86_64 --package 'system-images;android-25;google_apis;x86_64' --device "Nexus 6P"
~/Android/cmdline-tools/latest/bin/avdmanager create avd -n “my_avd_30” -k “system-images;android-30;google_apis_playstore;x86_64”

# run emulator
~/Android/emulator/emulator -avd "my_avd_30"
