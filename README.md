# CHUWI Minibook Hackintosh

EFI files for hackintosh on the CHUWI Minibook, works on Catalina and Mojave with initial support for Big Sur.
If you see anything that could be added or changed don't hesitate to make a pull request.

![Catalina with working Graphics Acceleration](/images/Catalina.jpeg)

## *** NOTICE ***
### - The Fan does not work on its own and requires a special patch. Please use EFI release version 0.1.0 or higher to enable automatic Fan operation. 
### - Final Clover Release Version 1.1.0 (Clover supports macOS Catalina and below)
### - OpenCore Release Version 1.1.0 and below should be used for macOS Catalina and below. 
### - OpenCore Release Version 1.2.0 and above should be used for macOS Big Sur and above.


##
## Full Instruction Guide

### [Chapter 1) Quick Start Install](/1-QuickStart.md)
### [Chapter 2) BootCamp Install](/2-BootCamp.md)
### [Chapter 3) Changing the Display Orientation](/3-Orientation.md)
### [Chapter 4) Enabling HiDPI Mode](/4-HiDPI.md)
### [Chapter 5) Enabling Reliable Sleep Button Support](/5-SleepButton.md)
### [Chapter 6) Setting Resolutions Over 1080p](/6-1080p&up.md)
### [Chapter 7) Additional Drivers](/7-drivers.md)
### [Chapter 8) Other Operating Systems](/8-OtherOS.md)
### [Chapter 9) Other OS's and OpenCore](/9-OtherOS&OC.md)

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
