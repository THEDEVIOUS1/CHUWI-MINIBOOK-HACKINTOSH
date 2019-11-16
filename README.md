# CHUWI Minibook Hackintosh

EFI files for hackintosh on the CHUWI Minibook, works on Catalina and Mojave.
If you see anything that could be added or changed don't hesitate to make a pull request.

![Catalina with working Graphics Acceleration](/images/Catalina.jpeg)

## Basic Usage

1. Create a bootable Mojave or Catalina bootable USB using this [tutorial](https://internet-install.gitbook.io/macos-internet-install/) but use my CLOVER folder at the point where you should configure CLOVER bootloader
2. Boot from this usb then install Mojave/Catalina on a free partition of your drive
3. During first boot, after installing the OS, mount your EFI partition and place the CLOVER folder alongside other OSes bootloader
4. Reboot and change BIOS bootloader order to have clover bootloader as first entry
5. Open your config.plist and generate a new serial number [Tutorial here](https://hackintosher.com/forums/thread/generate-your-own-hackintosh-serial-number-board-serial-number-uuid-mlb-rom-in-clover.306/)
6. Install additionals drivers
7. Reboot and enjoy !

## Changing the display orientation

To correct the display orientation within macOS, press and hold down cmd+opt (Windows+alt) and open System Preferences. Keep holding down those two buttons and click on Displays. The screen orientation option will now appear even for the built-in display. Set it to 270 degrees for the correct orientation.


### Additional drivers

[Wifi dongle driver](https://github.com/chris1111/Wireless-USB-Adapter-Clover)


## What works

- Graphic Acceleration
- Bluetooth
- Brigthness
- Audio
- Power Management
- Battery 
- USB
- Keyboard
- Camera
- Sleep / Wake ( timed & manual sleep seem to work fine but button & lid appear to be problematic in 10.14.6)
- TouchPad 
- HDMI / Type-C


## What doesn't work

- TouchScreen / Stylus
- Fingerprint Sensor
- Internal Wi-Fi ( Intel AC 3165 )
- Card Reader
- Emmc


## Credits

[All users from the GPD Discord]() <br>
[Fewt's Hackintosh guide](https://fewt.gitbook.io/laptopguide/) <br>
[CHUWI for making the great Minibook](https://www.chuwi.com/cn/) <br>
