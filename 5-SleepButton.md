## Chapter 5) Enabling Reliable Sleep Button Support

Sleep button enabled for Release 1.0.0 and above

The sleep button now has support and launches the power menu when pressed. In some situations however, it can be either slow to launch or may stop working for a few restarts. To enable full Sleep Button Support use "Stable Release 1.0.0" and then open Terminal and run the following command:

```
defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool no
```

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
