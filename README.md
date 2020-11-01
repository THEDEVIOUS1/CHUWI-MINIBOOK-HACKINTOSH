# CHUWI Minibook Hackintosh

EFI files for hackintosh on the CHUWI Minibook, works on Catalina and Mojave with initial support for Big Sur.
If you see anything that could be added or changed don't hesitate to make a pull request.

![Catalina with working Graphics Acceleration](/images/Catalina.jpeg)

## *** NOTICE ***
## 1) The Fan does not work on its own and requires a special patch. Please use EFI release version 0.1.0 or higher to enable automatic Fan operation. 
## 2) Final Clover Release Version 1.1.0 (Clover supports macOS Catalina and below)
## 3) OpenCore Release Version 1.1.0 and below should be used for macOS Catalina and below. 
## 4) OpenCore Release Version 1.2.0 and above should be used for macOS Big Sur and above.

##  Quick Start Install (Windows or Linux as Primary OS)

1. Create a bootable Mojave or Catalina bootable USB using a macOS installer downloaded from the AppStore or using this [tutorial](https://internet-install.gitbook.io/macos-internet-install/). I recommend using the free "Install Disk Creator" by MacDaddy to create the installer USB.
2. Once install disk is created mount EFI partition and copy either the CLOVER or OpenCore EFI folder to your Install Disk's EFI partition you just mounted. DO NOT CREATE YOUR OWN CLOVER OR OPENCORE EFI, this device requires special patches to protect it from overheating.
3. Boot into Windows or Linux and resize your partition and format as either NTFS or exFAT for you macOS install. If you are installing on a new device that comes with only an SSD and no EMMC then you must resize your EFI partition or simply wipe and reinstall your operating systems. In order to successfully install and run macOS with our EFI folders you must have at least an EFI partition of 200mb (300mb or greater recommended)
4. Boot from this usb then install macOS on the partition you created (please note...must be installed to ssd as macos does not detect emmc)
5. During first boot, after installing the OS, mount your EFI partition and copy over your Clover or OpenCore folders along with your BOOT folder found in the EFI folder on your install usb; you must copy/overwrite the same folders on the same partition located on your SSD.
6. Reboot and change BIOS bootloader order to have Clover or OpenCore bootloader as first entry
7. Open your config.plist and generate a new serial number [Tutorial here](https://hackintosher.com/forums/thread/generate-your-own-hackintosh-serial-number-board-serial-number-uuid-mlb-rom-in-clover.306/)
8. Enable Full Sleep Button Support by following instructions below at section titled "Enabling Sleep Button Support"
9. Install any additional software and drivers if needed for your specific needs
10. Reboot and enjoy!

## Full Instruction Guide

## [Chapter 1) BootCamp Install](/1-BootCamp.md)
## [Chapter 2) Changing the Display Orientation](/2-Orientation.md)
## [Chapter 3) Enabling HiDPI Mode](/3-HiDPI.md)
## [Chapter 4) Enabling Reliable Sleep Button Support](/4-SleepButton.md)
## [Chapter 5) Setting Resolutions Over 1080p](/5-1080p&up.md)
## [Chapter 6) Additional Drivers](/6-drivers.md)
## [Chapter 7) Other Operating Systems](/7-OtherOS.md)
## [Chapter 8) Other OS's and OpenCore](/8-OtherOS&OC.md)

## What works 

- Graphic Acceleration including 4K support
- Bluetooth (some reliability issues may still exist)
- Brightness
- Audio
- Power Management
- Battery 
- USB
- Keyboard
- Camera
- Sleep / Wake
- Fully Automated FAN
- TrackPoint 
- HDMI / Type-C
- Windows boot from OpenCore
- TouchScreen / Stylus (Beta Support with issues: double click doesnt work well, touch won't disable with lid close but will on sleep, Voodooi2C 2.3 is currently supported only)(Please file all issues related to touch with the VoodooGoodix team)
- Internal Wi-Fi 
    - Use Heliport for OpenCore 0.6.0 or below and for all Clover bootloaders. 
    - OpenCore 0.6.1 and higher now has native WiFi support with no other additional software
- FileVault Supported
- Recovery Supported
- Fan Speed reporting (estimated speed not actual, requires use of special EFI located in Archive folder (NO LONGER BEING UPDATED))
- Native Sleep Button Support (OpenCore only)

## Planned Features

- Auto rotate screen and keyboard shut-off when in tablet mode
- Additional resolutions for internal monitor

## What doesn't work

- Fingerprint Sensor
- Native Brightness Key Buttons (limitation imposed on the Embedded Controller programming from OEM)
- Card Reader
- Emmc
- Accelerometer
- Additional Resolutions other than default


## Credits
Special thanks to my Minibook bro [@Balopez](https://github.com/balopez83/One-Mix-3-Hackintosh) for all of his assistance and [@Lazd](https://github.com/lazd/VoodooI2CGoodix) for the touchscreen driver <br>
[All users from the GPD Discord]() especially [@azkali](https://github.com/Azkali/GPD-P2-MAX-Hackintosh) <br>
[Fewt's Hackintosh guide](https://fewt.gitbook.io/laptopguide/) <br>
[CHUWI for making the great Minibook](https://www.chuwi.com/cn/) <br>
[Peter Kamb for the excellent PowerKey application on GitHub](https://github.com/pkamb/PowerKey) <br>
