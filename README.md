# CHUWI-MINIBOOK-HACKINTOSH

CHUWI Minibook Hackintosh  EFI files for hackintosh on the GPD P2 MAX, works on Catalina and Mojave. If you see anything that could be added or changed don't hesitate to make a pull request.  Catalina with working Graphics Acceleration  



Basic Usage  

1. Create a bootable Mojave or Catalina bootable USB using this tutorial but use my CLOVER folder at the point where you should configure CLOVER bootloader 
2. Boot from this usb then install Mojave/Catalina on a free partition of your drive 
3. During first boot, after installing the OS, mount your EFI partition and place the CLOVER folder alongside other OSes bootloader 
4. Reboot and change BIOS bootloader order to have clover bootloader as first entry 
5. Open your config.plist and generate a new serial number Tutorial here 
6. Install additionals drivers 
7. Reboot and enjoy ! 


Additional drivers  

Wifi dongle driver  


What works

Graphics Acceleration 
Bluetooth 
Brigthness control 
Audio 
Power Management 
Battery Status ( patch differs if you have a 1st batch or 2nd batch GPD P2 MAX, if you have the 2nd batch remove DSDT.aml, and rename DSDT_2.aml as DSDT.aml ) 
USB and USB Mapping 
Keyboard 
Camera 
Sleep / Wake ( Catalina 10.15.1 has known issues )
TouchPad


What doesn't work  

TouchScreen 
Fingerprint Sensor 
Internal Wi-Fi ( Intel AC 3165 ) 
Card Reader

Credits  

All users from the GPD Discord  
Fewt's Hackintosh guide  
CHUWI for making the great Minibook
