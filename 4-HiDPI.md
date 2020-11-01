## Chapter 4) Enabling HiDPI Mode

You can enable HiDPI mode which adds 960x600 to the list of available display resolution options.

Enter the following command in terminal post-installation then reboot:

```
sudo defaults write /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true
```
