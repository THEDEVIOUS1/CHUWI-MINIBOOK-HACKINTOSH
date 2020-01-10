# CHUWI Minibook Hackintosh

EFI files for hackintosh on the CHUWI Minibook, works on Catalina and Mojave.
If you see anything that could be added or changed don't hesitate to make a pull request.

![Catalina with working Graphics Acceleration](/images/Catalina.jpeg)

## Basic Usage

1. Create a bootable Mojave or Catalina bootable USB using this [tutorial](https://internet-install.gitbook.io/macos-internet-install/) OR this [tutorial](https://olarila.com/forum/viewtopic.php?f=50&t=8685)(arguably easier but must register) but use my CLOVER folder at the point where you should configure CLOVER bootloader
2. Boot from this usb then install Mojave/Catalina on a free partition of your drive ( please note...must be installed to ssd as macos does not detect emmc )
3. During first boot, after installing the OS, mount your EFI partition and place the CLOVER folder alongside other OSes bootloader
4. Reboot and change BIOS bootloader order to have clover bootloader as first entry
5. Open your config.plist and generate a new serial number [Tutorial here](https://hackintosher.com/forums/thread/generate-your-own-hackintosh-serial-number-board-serial-number-uuid-mlb-rom-in-clover.306/)
6. Install additionals drivers
7. Reboot and enjoy !


## Changing the display orientation

To correct the screen orientation within macOS download the [Display Rotation Menu](https://www.magesw.com/displayrotation/) app and set the view to portrait flipped OR press and hold down cmd+opt (Windows+alt) and open System Preferences...keep holding down those two buttons and click on Displays then the rotation option will appear so set it to 270 degrees for the fixed layout


## Enabling HiDPI mode

to enable HiDPI mode ( adds 960 x 600 ) enter the following command in terminal post-installation then reboot:

sudo defaults write /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true


## Setting resolutions over 1080p
1. flash modified bios *warning-possibility of windows serial key being deleted so proceed with caution* (format usb stick to fat 32, copy files inside of folder to root of drive then reboot)
2. enter bios using f7(fn + 7) then go to chipset -> system agent -> graphics configuration -> dvmt pre-allocated and change to 64mb
3. either delete config.plist and rename config4k.plist to config.plist OR select config4k at clover boot screen under options

### Additional drivers

[Wifi dongle driver](https://github.com/chris1111/Wireless-USB-Adapter-Clover)
[Wifi dongle driver(older adapters)](https://github.com/chris1111/Wireless-Ralink-Panel-Utility)


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
- Sleep / Wake ( lid, timed & manual sleep seem to function fine but button appears to be problematic even though power awake works in 10.14.6 /10.15.1 )
- TrackPoint 
- HDMI / Type-C


## What doesn't work

- TouchScreen / Stylus
- Fingerprint Sensor
- Internal Wi-Fi ( Intel AC 3165 )
- Card Reader
- Emmc


## Other Operating Systems

OS ( Version ) ( Issues )
- [Android](https://www.android-x86.org/)    ( Android-x86 9.0-rc1 )                   ( cast screen, auto rotate broken )
- [Chrome](https://arnoldthebat.co.uk/wordpress/) ( SPECIAL BUILD – R78-12499.B )          ( none )
- [Linux](https://manjaro.org/)                   ( Manjaro-cinnamon-18.0.4-stable-x86_64 ) ( none )

## Credits
Special thanks to my Minibook bro Balopez for all of his assistance <br>
[All users from the GPD Discord]() <br>
[Fewt's Hackintosh guide](https://fewt.gitbook.io/laptopguide/) <br>
[CHUWI for making the great Minibook](https://www.chuwi.com/cn/) <br>
