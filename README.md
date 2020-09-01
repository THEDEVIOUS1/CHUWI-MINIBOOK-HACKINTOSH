# CHUWI Minibook Hackintosh

EFI files for hackintosh on the CHUWI Minibook, works on Catalina and Mojave with initial support for Big Sur.
If you see anything that could be added or changed don't hesitate to make a pull request.

![Catalina with working Graphics Acceleration](/images/Catalina.jpeg)

## *CRITICAL ISSUE WARNING*
## The Fan does not work on its own and requires a special patch. Please use EFI release version 0.1.0 or higher to enable automatic Fan operation. 

##  Basic Usage

1. Create a bootable Mojave or Catalina bootable USB using a macOS installer downloaded from the AppStore or using this [tutorial](https://internet-install.gitbook.io/macos-internet-install/). I recommend using the free "Install Disk Creator" by MacDaddy to create the installer USB.
2. Once install disk is created mount EFI partition and copy either the CLOVER or OpenCore EFI folder to your Install Disk's EFI partition you just mounted. DO NOT CREATE YOUR OWN CLOVER OR OPENCORE EFI, this device requires special patches to protect it from overheating.
3. Boot from this usb then install macOS on a free partition of your drive ( please note...must be installed to ssd as macos does not detect emmc )
3. During first boot, after installing the OS, mount your EFI partition and copy over your Clover or OpenCore folders along with your BOOT folder found in the EFI folder on your install usb; you must copy/overwrite the same folders on the same partition located on your SSD.
4. Reboot and change BIOS bootloader order to have Clover or OpenCore bootloader as first entry
5. Open your config.plist and generate a new serial number [Tutorial here](https://hackintosher.com/forums/thread/generate-your-own-hackintosh-serial-number-board-serial-number-uuid-mlb-rom-in-clover.306/)
6. Install any additional software and drivers if needed for your specific needs.
7. Reboot and enjoy !


## Changing the display orientation

To correct the screen orientation within macOS download the [Display Rotation Menu](https://www.magesw.com/displayrotation/) app and set the view to portrait flipped OR press and hold down cmd+opt (Windows+alt) and open System Preferences...keep holding down those two buttons and click on Displays then the rotation option will appear so set it to 270 degrees for the fixed layout


## Enabling HiDPI mode

to enable HiDPI mode ( adds 960 x 600 ) enter the following command in terminal post-installation then reboot:

sudo defaults write /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true


## Setting resolutions over 1080p
- Method 1
1. flash modified bios *warning-possibility of windows serial key being deleted so proceed with caution* (format usb stick to fat 32, copy files inside of folder to root of drive then reboot)
2. enter bios using f7(fn + 7) then go to chipset -> system agent -> graphics configuration -> dvmt pre-allocated and change to 64mb
3. delete config.plist and rename config4k.plist (or similar name) to config.plist

- Method 2
1. load clover and select "start uefi shell 64" 
2. enter the command "setup_var_3 0x894 0x2" (without the quotations) hit enter then type exit
3. delete config.plist and rename config4k.plist (or similar name) to config.plist

### Additional drivers

[Wifi dongle driver](https://github.com/chris1111/Wireless-USB-Adapter-Clover)

[Wifi dongle driver(older adapters)](https://github.com/chris1111/Wireless-Ralink-Panel-Utility)

[Latest AutoBuild of Intel WiFi Driver & HeliPort App](https://github.com/1hbb/OpenIntelWireless-Factory/releases)

[Latest AutoBuild of OpenCore (You will need to merge our release into one provided at this link if you want to use this. Will not boot otherwise)](https://github.com/williambj1/OpenCore-Factory/releases)



## What works

- Graphic Acceleration including 4K support
- Bluetooth (Improved Reliability)
- Brightness
- Audio
- Power Management
- Battery 
- USB
- Keyboard
- Camera
- Sleep / Wake ( lid, timed & manual sleep seem to function fine but button appears to be problematic even though power awake works)
- FAN now operates automatically on Cold/Warm boot and after sleep.
- TrackPoint 
- HDMI / Type-C
- Windows boot from OpenCore
- TouchScreen / Stylus (double click doesnt work well and only works in Catalina)
- Internal Wi-Fi (use the heliport app to join networks just like the built in wireless and check "load at login" to autostart it if u would like...if u want to connect to your home internet automatically then u will need to edit the info.plist of the itlwm.kext with your ssid and password)
- FileVault Supported
- Recovery Supported
- Fan Speed reporting (estimated speed not actual, requires use of FakeSMC and special EFI)

## Planned/In Progress Fixes

- Accelerometer (Researching options)
- Auto shut off of Keyboard when flipped into tablet mode (Researching options)
- Additional resolutions on internal monitor (In-Progress; might actually be possible)
- Native Brightness Key Activation
- Native Sleep Button support
- Touch Screen support in Big Sur

## What doesn't work

- Fingerprint Sensor
- Card Reader
- Emmc
- Accelerometer
- Additional Resolutions other than default

## Other Operating Systems

OS ( Version ) ( Issues )
- [Android](https://www.android-x86.org/)    ( Android-x86 9.0-rc1 )                   ( cast screen, auto rotate broken )
- [Chrome - Brunch Method & Tools](https://github.com/sebanc/brunch) ( v80+ ) ( none & preferred method. Dual boot works best when installed to alternate drive such as EMMC or SD card, Installation on same SSD is challenging and requires chromeOS to be installed first before Windows or macOS )
- [Chrome - Chromify Method & Tools](https://github.com/imperador/chromefy) ( v80+ ) ( none & works well with dual boot and installed on same SSD )
- [Linux](https://manjaro.org/)                   ( Manjaro-cinnamon-18.0.4-stable-x86_64 ) ( none )
- [Ubuntu](https://ubuntu.com/)                  ( 20.04 LTS )                             ( none )

## Using Other Operating Systems with OpenCore
Windows: Should be installed and booted from the OpenCore menu. OpenCore will automatically show Windows in the menu with no additional effort. 

Linux: Ubuntu is the only flavor tested. Requires special steps for OpenCore to show Linux in the boot menu:
  1. Install macOS & optionally Windows first before attempting to install Linux, period, full stop. (This is important)
  2. Shrink drive and create a new partition for your Ubuntu install. If using macOS to partition you must choose partition and DO-NOT add a volume to your APFS partion. (Won't work if you don't do this right)
  3. Create Ubuntu boot disk
  4. Insert Installer into USB port and restart computer. Enter UEFI and select OpenCore from the boot menu.
  5. You will see the Ubuntu installer USB show in the boot menu. Select the Ubuntu installer to begin installation.
  6. Follow all installation prompts and when asked if you want to install Ubuntu alongside Windows or completely erase the drive; instead select "something else"
  7. Change Nothing else except the following: Select the partition you want to use for Linux and then click "change", format as Ext4 and set mount point as "/".
  8. Confirm and then continue with the install as normal.
  9. Reboot once install has completed and Ubuntu should show in the OpenCore boot menu.
  * If you restore a partition after installing Ubuntu you may loose the ability to boot Ubuntu from the OpenCore menu which may result in needing to reinstall Ubuntu

chromeOS: I recommend installing to a Ultra High Speed SD card especially if using the "Brunch" method of installation. Once installed to the SD card it will show up in the OpenCore boot menu.

## Credits
Special thanks to my Minibook bro [@Balopez](https://github.com/balopez83/One-Mix-3-Hackintosh) for all of his assistance and [@Lazd](https://github.com/lazd/VoodooI2CGoodix) for the touchscreen driver <br>
[All users from the GPD Discord]() especially [@azkali](https://github.com/Azkali/GPD-P2-MAX-Hackintosh) <br>
[Fewt's Hackintosh guide](https://fewt.gitbook.io/laptopguide/) <br>
[CHUWI for making the great Minibook](https://www.chuwi.com/cn/) <br>
