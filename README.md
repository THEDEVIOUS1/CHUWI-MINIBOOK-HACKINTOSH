# CHUWI Minibook Hackintosh

EFI files for hackintosh on the CHUWI Minibook, works on Catalina and Mojave with initial support for Big Sur.
If you see anything that could be added or changed don't hesitate to make a pull request.

![Catalina with working Graphics Acceleration](/images/Catalina.jpeg)

## *CRITICAL ISSUE WARNING*
## The Fan does not work on its own and requires a special patch. Please use EFI release version 0.1.0 or higher to enable automatic Fan operation. 

##  Basic Install (Windows or Linux as Primary OS)

1. Create a bootable Mojave or Catalina bootable USB using a macOS installer downloaded from the AppStore or using this [tutorial](https://internet-install.gitbook.io/macos-internet-install/). I recommend using the free "Install Disk Creator" by MacDaddy to create the installer USB.
2. Once install disk is created mount EFI partition and copy either the CLOVER or OpenCore EFI folder to your Install Disk's EFI partition you just mounted. DO NOT CREATE YOUR OWN CLOVER OR OPENCORE EFI, this device requires special patches to protect it from overheating.
3. Boot into Windows or Linux and resize your partition and format as either NTFS or exFAT for you macOS install. If you are installing on a new device that comes with only an SSD and no EMMC then you must resize your EFI partition or simply wipe and reinstall your operating systems. In order to successfully install and run macOS with our EFI folders you must have at least an EFI partition of 200mb (300mb or greater recommended)
4. Boot from this usb then install macOS on the partition you created (please note...must be installed to ssd as macos does not detect emmc)
5. During first boot, after installing the OS, mount your EFI partition and copy over your Clover or OpenCore folders along with your BOOT folder found in the EFI folder on your install usb; you must copy/overwrite the same folders on the same partition located on your SSD.
6. Reboot and change BIOS bootloader order to have Clover or OpenCore bootloader as first entry
7. Open your config.plist and generate a new serial number [Tutorial here](https://hackintosher.com/forums/thread/generate-your-own-hackintosh-serial-number-board-serial-number-uuid-mlb-rom-in-clover.306/)
8. Install any additional software and drivers if needed for your specific needs.
9. Reboot and enjoy !

## BootCamp Install (Requires OpenCore: macOS as Primary OS, Windows as secondary)

PRE-WORK: 
- Create a Windows 10 iso file using the "Windows Media Creation Tool" within Windows OR google search Windows 10 iso file from Safari. Set aside, we will need this later.
- Format your entire SSD as GPT partition scheme with only an EFI partition and what will be your macOS partition. I recommend using a linux live USB and gparted for formating and partitioning your SSD. Set the EFI partition size as 200mb (recommend 300-500mb), the rest of the drive should be partitioned for macOS and you should use either NTFS or exFAT partioning.
- You MUST USE OPENCORE for your EFI. NO EXCEPTIONS, this will not work properly if you use Clover.

1. Install macOS from install disk to SSD using the entire drive. (Follow steps 1-2 & 5-8)
* If you only want macOS and no other OS then you can stop here. Otherwise go to step 2.
2. Launch "Boot Camp Assistant" and "partition" your drive the way you would like. You must have your Windows iso copied over to your macOS install now. 
3. Boot Camp Assistant will ask you where your Windows iso is and will create a special partition with the Boot Camp files and Windows installer. After it has finished it will attempt to reboot to start the Windows install. IT WILL FAIL and thats ok.
4. Once the reboot into the Windows install fails you now need to do one of two things, either:
    
    a) Boot into your linux boot disk and mount the new drive called something like "OSXRECOVERY". Copy all files to an MBR partitioned FAT32 USB disk and proceed to step 5.
    
    b) "Create" a USB disk by booting back into macOS, opening Boot Camp Assistant, click on "Action" in the menu bar, and then click on "Download Windows Support Software". Mount your Windows iso and copy all files in the ISO to your MBR partitioned FAT32 USB disk and copy all files within the "WindowsSupport" folder to the root of your USB you just copied the Windows installer to. If you are asked if you would like to overwrite files click yes.
5. Open your Boot Camp Windows Installer USB you just created regardless of which method you used to create it. Delete all files in the folder "$WinPEDriver$" but DO NOT delete the folder.
6. Open the "BootCamp" folder on your install USB, then open your "Drivers" folder. Delete both "Broadcom" & "Intel" folders.
7. Restart and boot from your Boot Camp Windows installer USB. Follow the installation prompts. (If you get an error regarding the partitioning, simply reboot and try again. It usually works on the second try)
8. Your computer may reboot a few times before Windows has completed its install. I recommend removing the USB on its first reboot to avoid accidently starting the installer again.
9. After installation boot back into the UEFI/BIOS and select OpenCore as the primary boot option. Reboot and select Windows in the OpenCore boot menu if needed to boot back into Windows.
10. After installation you should reinsert your USB installer and run the BootCamp driver installation program. This will run with no problems and install drivers for all Apple products and also the BootCamp control panel to allow you to "Bless" drives just like on a real mac. This will not install any of the drivers that belong to a real mac which will cause conflicts on your hack.
10. Install any programs and make sure to install the WiFi, GoodixTouch, and Fingerprint drivers before updating Windows (see "Drivers" in Github). You may update Windows after those three are installed.
11. Once you are ready to boot back into macOS make sure you are still booting to OpenCore first and then select you macOS install.
12. Congratulations you are done. 

* Final Thoughts: Windows is now installed thinking its on a mac, if you accidently boot into Windows using your UEFI boot options you may get a notification that your Microsoft account requires an update or authentication. This is related to the computer now identifying differently and is related to the activation of Windows. Don't worry, you won't loose activation but it is annoying. I simply recommend always booting to Windows from OpenCore and you won't ever have to deal with this. Simply reboot into Windows using OpenCore and then re-authenticate when it pops up. You won't see it again until the next time you accidently boot direct to Windows from the UEFI.
* Installing other OS's: see "Using Other Operating Systems with OpenCore section below"


## Changing the display orientation

To correct the screen orientation within macOS download the [Display Rotation Menu](https://www.magesw.com/displayrotation/) app and set the view to portrait flipped OR press and hold down cmd+opt (Windows+alt) and open System Preferences...keep holding down those two buttons and click on Displays then the rotation option will appear so set it to 270 degrees for the fixed layout


## Enabling HiDPI mode

to enable HiDPI mode ( adds 960 x 600 ) enter the following command in terminal post-installation then reboot:

sudo defaults write /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true


## Enabling Reliable Sleep Button Support (Sleep button will be enabled in Stable Release 1.0.0)

The sleep button now has support and launches the power menu when pressed. In some situations however, it can be either slow to launch or may stop working for a few restarts. To enable full Sleep Button Support use "Stable Release 1.0.0" and then open Terminal and run the following command:

defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool no

If your sleep button isn't working the way you want there is a really great workaround that can be used with any EFI release version 0.2.0 or higher. Use the following instructions to implement this workaround *Requires Xcode*:

1. Once you have installed macOS [Download PowerKey](https://pkamb.github.io/PowerKey/) source code. Or support the developer and purchase the compiled version.
2. Unzip the source code and open the xcode project --> Build the project and then archive and export the compiled application --> Once compiled copy to Applications.
3. Launch the PowerKey application (You might need to authorize the application with GateKeeper).
4. Click the drop down and select "F13" (you can select something else if you want but then it won't work to put your computer to sleep)
5. Check the box to open at login
6. Click Run in Background
7. Open the Settings application
8. Click Keyboard
9. Click Shortcuts
10. Click App Shortcuts
11. Click the Plus icon
12. Leave the dropdown as All Applications and click into Menu Title
13. Type in "Sleep" without the ""
14. Click into the Keyboard Shortcut box and then press the Sleep Button once quickly
15. If the box says F13 then you have done everything correctly. If not go back to the beginning because you have missed something.
16. Click Add

Congratulations your sleep button now works as it should and it will remain reliable. If PowerKey keeps opening up at login instead of running in the background at launch you can fix this really easily. 
1. Go back to the Settings App if you closed it
2. Click Users & Groups
3. Your User Profile should be selected already so go ahead and click Login Items
4. You should see PowerKey in this list. Click the check box to "hide" the application

You may see the app launch one or two times more (not sure why) but should stop after that.

#Credit goes to Peter Kamb for the excellent PowerKey application [pkamb GitHub](https://github.com/pkamb/PowerKey)

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
- Bluetooth
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
- TouchScreen / Stylus (double click doesnt work well)
- Internal Wi-Fi (Use Heliport for OpenCore 0.6.0 or below and for all Clover bootloaders. OpenCore 0.6.1 and higher now has native WiFi support without 3rd party app)
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
[Peter Kamb for the excellent PowerKey application on GitHub](https://github.com/pkamb/PowerKey) <br>
