## Chapter 8) Other OS's and OpenCore

## Windows: 

Should be installed and booted from the OpenCore menu. OpenCore will automatically show Windows in the menu with no additional effort. 

## Linux: 

Ubuntu is the only flavor tested. Requires special steps for OpenCore to show Linux in the boot menu:
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

## chromeOS: 

I recommend installing to a Ultra High Speed SD card especially if using the "Brunch" method of installation. Once installed to the SD card it will show up in the OpenCore boot menu.
