@ECHO off
mode con: cols=100 lines=44
title HardLaunch by Bladez1992 (v1.1.2.0)
color 0c

REM --------------------Main Menu----------------------------------------------------------------------------

:main_menu
cls
ECHO			        HardLaunch
ECHO			         v1.1.2.0
ECHO			      By Bladez1992
ECHO --------------------------------------------------------------------------
ECHO -------------------- World/Server Options --------------------------------
ECHO --------------------------------------------------------------------------
ECHO 1.  Create A New Local World					 
ECHO 2.  Create A New Network Game					 
ECHO 3.  Create A New Dedicated Server
ECHO -------------------------------------------
ECHO 4.  Load A Local World						 
ECHO 5.  Load A Network Game						 
ECHO 6.  Load A Dedicated Server				 
ECHO 7.  Connect (Connect to a Network Game or Dedicated Server)
ECHO --------------------------------------------------------------------------
ECHO -------------------- Game Configuration ----------------------------------
ECHO --------------------------------------------------------------------------
ECHO 8.  Change Resolution						 
ECHO 9.  Graphics Options						 
ECHO 10. Audio Options							 
ECHO 11. Network Options
ECHO 12. Input Options
ECHO -------------------------------------------
ECHO 13. Debug/Other/Unknown Functions
ECHO 14. Version Switcher
ECHO 15. Moth Skin Swapper
ECHO 16. Mods
ECHO --------------------------------------------------------------------------
ECHO -------------------- Other Options ---------------------------------------
ECHO --------------------------------------------------------------------------
ECHO 17. Open Hardman
ECHO 18. Registry Cleanup
ECHO 19. Set The UIM.06 Install Directory
ECHO -------------------------------------------
ECHO 20. Create Backup UIM.06 Files
ECHO 21. Restore Backup UIM.06 Files
ECHO 22. Change Interface Colors
ECHO 23. Exit HardLaunch					 
ECHO --------------------------------------------------------------------------
ECHO          - Run option 20 ONCE the first time you run HardLaunch -
ECHO --------------------------------------------------------------------------
set choice=
set /p choice=Type the number of your selection: 
if not '%choice%'=='' set choice=%choice:~0,2%
if '%choice%'=='1' goto newworld
if '%choice%'=='2' goto newnetworld
if '%choice%'=='3' goto newdedworld
if '%choice%'=='4' goto loadworld
if '%choice%'=='5' goto loadnetworld
if '%choice%'=='6' goto loaddedworld
if '%choice%'=='7' goto connectnetgame
if '%choice%'=='8' goto resolution_switcher
if '%choice%'=='9' goto graphics_options
if '%choice%'=='10' goto audio_options
if '%choice%'=='11' goto network_options
if '%choice%'=='12' goto input_options
if '%choice%'=='13' goto dou_functions
if '%choice%'=='14' goto version_switcher
if '%choice%'=='15' goto moth_skin_swapper
if '%choice%'=='16' goto mods
if '%choice%'=='17' goto hardman
if '%choice%'=='18' goto registrycleanup
if '%choice%'=='19' goto setdirectory
if '%choice%'=='20' goto createbackups
if '%choice%'=='21' goto restorefiles
if '%choice%'=='22' goto interface_colors
if '%choice%'=='23' goto end
ECHO "%choice%" is invalid, choose something on the list!
goto main_menu

REM --------------------World/Game/Network Commands----------------------------------------------------------

:newworld
set /p LocalSaveName="What would you like your Local World to be called: "
@echo off
set "currentDirectory=%cd%"
start HardwarW.exe /t:new "%cd%\Savegames\%LocalSaveName%.sav"
goto end
:newnetworld
set /p NetSaveName="What would you like your Network Game to be called: "
@echo off
set "currentDirectory=%cd%"
start HardwarW.exe /t:newserver "%cd%\Savegames\%NetSaveName%.sav"
goto end
:newdedworld
set /p DedSaveName="What would you like your Dedicated Server to be called: "
@echo off
set "currentDirectory=%cd%"
start HardwarW.exe /t:newded "%cd%\Savegames\%DedSaveName%.sav"
goto end
:loadworld
set /p LoadLocalSaveName="Type your Local World's name to load it: "
@echo off
set "currentDirectory=%cd%"
start HardwarW.exe /t:load "%cd%\Savegames\%LoadLocalSaveName%.sav"
goto end
:loadnetworld
set /p LoadNetSaveName="Type your Network Game's name to load it: "
@echo off
set "currentDirectory=%cd%"
start HardwarW.exe /t:loadserver "%cd%\Savegames\%LoadNetSaveName%.sav"
goto end
:loaddedworld
set /p LoadDedSaveName="Type your Dedicated Server's name to load it: "
@echo off
set "currentDirectory=%cd%"
start HardwarW.exe /t:loadded "%cd%\Savegames\%LoadDedSaveName%.sav"
goto end
:connectnetgame
start HardwarW.exe /t:connect
goto end
:hardman
@echo off
cd
start Hardman.exe
goto main_menu

REM --------------------Graphics Options Menu----------------------------------------------------------------

:graphics_options
cls
ECHO			--- Graphics Options ---
ECHO  All of these options except fog are either 0 (disabled) or 1 (enabled)
ECHO If you try to set them to anything else you will probably cause a crash!
ECHO --------------------------------------------------------------------------
ECHO			 --- Image Quality ---
ECHO 1.  32 Bit Textures
ECHO 2.  Building Smoke
ECHO 3.  Clamp Textures at 256 x 256
ECHO 4.  Clouds
ECHO 5.  Embossed Texture Detail
ECHO 6.  Fog Depth (Set anywhere between 0 and 3 / 0 being no fog - 3 being max)
ECHO 7.  Lens Flare
ECHO 8.  MipMaps (RGB Text)
ECHO 9.  RGB Display (For most people this should always be enabled)
ECHO 10. W-Buffering
ECHO 11. Original Explosions
ECHO 12. Original Fog
ECHO --------------------------------------------------------------------------
ECHO			    --- Others ---
ECHO 13. Phil's Ending
ECHO 14. Skip All Videos
ECHO 15. Simulate Lag
ECHO 16. Back to Main Menu
ECHO --------------------------------------------------------------------------
set /p go=Type the number of your selection: 
if %go%==1 goto 32btex
if %go%==2 goto bldgsmoke
if %go%==3 goto clamptex
if %go%==4 goto clouds
if %go%==5 goto embossedtex
if %go%==6 goto fogdepth
if %go%==7 goto lensflare
if %go%==8 goto mipmaps
if %go%==9 goto rgbdisplay
if %go%==10 goto wbuffering
if %go%==11 goto origexplosions
if %go%==12 goto origfog
if %go%==13 goto philsending
if %go%==14 goto skipgdv
if %go%==15 goto simulatelag
if %go%==16 goto main_menu
ECHO "%go%" is invalid, choose something on the list!
goto main_menu

REM --------------------Graphics Options Commands------------------------------------------------------------

:32btex
set /p T="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v 32Bit /t REG_DWORD /d 0x0000000%T% /f
ECHO Set 32 Bit Textures Value - Done!
@echo off
timeout /t 5
goto graphics_options
:bldgsmoke
set /p S="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v BuildingSmoke /t REG_DWORD /d 0x0000000%S% /f
ECHO Set Building Smoke Value - Done!
@echo off
timeout /t 5
goto graphics_options
:clamptex
set /p P="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ClampTPage /t REG_DWORD /d 0x0000000%P% /f
ECHO Set Clamp Textures Value - Done!
@echo off
timeout /t 5
goto graphics_options
:clouds
set /p C="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v BuildingSmoke /t REG_DWORD /d 0x0000000%C% /f
ECHO Set Clouds Value - Done!
@echo off
timeout /t 5
goto graphics_options
:embossedtex
set /p E="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Emboss /t REG_DWORD /d 0x0000000%E% /f
ECHO Set Embossed Textures Value - Done!
@echo off
timeout /t 5
goto graphics_options
:fogdepth
set /p F="Type 0 thru 3 with 0 being no fog, 3 being max fog"
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Foglevel /t REG_DWORD /d 0x0000000%F% /f
ECHO Set Fog Depth Value - Done!
@echo off
timeout /t 5
goto graphics_options
:lensflare
set /p L="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v LensFlare /t REG_DWORD /d 0x0000000%L% /f
ECHO Set Lens Flare Value - Done!
@echo off
timeout /t 5
goto graphics_options
:mipmaps
set /p mm="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v RGBText /t REG_DWORD /d 0x0000000%mm% /f
ECHO Set MipMaps Value - Done!
@echo off
timeout /t 5
goto graphics_options
:rgbdisplay
set /p R="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v RGBDisplay /t REG_DWORD /d 0x0000000%R% /f
ECHO Set RGB Display Value - Done!
@echo off
timeout /t 5
goto graphics_options
:origexplosions
set /p X="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v NewExplosions /t REG_DWORD /d 0x0000000%X% /f
ECHO Set Original Explosions Value - Done!
@echo off
timeout /t 5
goto graphics_options
:origfog
set /p O="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v OldFog /t REG_DWORD /d 0x0000000%O% /f
ECHO Set Original Fog Value- Done!
@echo off
timeout /t 5
goto graphics_options
:philsending
set /p N="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v PhilsEnding /t REG_DWORD /d 0x0000000%N% /f
ECHO Set Phil's Ending Value - Done!
@echo off
timeout /t 5
goto graphics_options
:simulatelag
set /p M="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Lag /t REG_DWORD /d 0x0000000%M% /f
ECHO Set Simulate Lag Value - Done!
@echo off
timeout /t 5
goto graphics_options

REM --------------------Audio Options Menu------------------------------------------------------------------------

:audio_options
cls
ECHO      All of these options are either 0 (disabled) or 1 (enabled)
ECHO If you try to set them to anything else you will probably cause a crash!
ECHO --------------------------------------------------------------------------
ECHO 		--- Audio Options ---
ECHO 1.  3D Audio
ECHO 2.  Computer Voice
ECHO 3.  Hangar Sound Effects
ECHO 4.  Music (CD Audio)
ECHO 5.  Sample Rate (0 = 11khz / 1 = 22khz)
ECHO 6.  Soud (Enable/Disable)
ECHO 7.  Stereo Audio (0 = Mono / 1 = Stereo)
ECHO 8.  Back to Main Menu
ECHO --------------------------------------------------------------------------
SET /P ao=Type the number of your selection: 
if %ao%==1 goto 3daud
if %ao%==2 goto compvoice
if %ao%==3 goto hangarfx
if %ao%==4 goto cdaudio
if %ao%==5 goto samplerate
if %ao%==6 goto sound
if %ao%==7 goto stereoaudio
if %ao%==8 goto main_menu
ECHO "%ao%" is invalid, choose something on the list!
goto main_menu

REM --------------------Audio Options Commands---------------------------------------------------------------

:3daud
set /p D="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Sound3DAudio /t REG_DWORD /d 0x0000000%D% /f
ECHO Set 3D Audio Value - Done!
@echo off
timeout /t 5
goto audio_options
:compvoice
set /p V="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SoundCompVoice /t REG_DWORD /d 0x0000000%V% /f
ECHO Set Computer Voice Value - Done!
@echo off
timeout /t 5
goto audio_options
:hangarfx
set /p H="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v HangarSounds /t REG_DWORD /d 0x0000000%H% /f
ECHO Set Hangar Sound Effects Value - Done!
@echo off
timeout /t 5
goto audio_options
:cdaudio
set /p A="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Music /t REG_DWORD /d 0x0000000%A% /f
ECHO Set Music/CD Audio Value - Done!
@echo off
timeout /t 5
goto audio_options
:samplerate
set /p G="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SampleRate /t REG_DWORD /d 0x0000000%G% /f
ECHO Set Sample Rate Value - Done!
@echo off
timeout /t 5
goto audio_options
:sound
set /p I="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Sound /t REG_DWORD /d 0x0000000%I% /f
ECHO Set Sound Effects Value - Done!
@echo off
timeout /t 5
goto audio_options
:stereoaudio
set /p J="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Stereo /t REG_DWORD /d 0x0000000%J% /f
ECHO Set Stereo Audio Value - Done!
@echo off
timeout /t 5
goto audio_options

REM --------------------Network Options Menu------------------------------------------------------------------

:network_options
cls
ECHO				        --- Network Options ---
ECHO 1.  Blood Money
ECHO 2.  CPU (AI) Pilots
ECHO 3.  God Hangar Access
ECHO 4.  Maximum Players (Set anywhere between 2 - 16)
ECHO 5.  Moth Hopping (Unoccupied moths can be stolen)
ECHO 6.  Persistent Game (0 = Network Game / 1 = Dedicated Server)
ECHO 7.  Player Announcement (0 = Anonymous / 1 = Named / 2 = Name and Target)
ECHO 8.  Restrict Gameplay to Alpha Crater
ECHO 9.  Require Players to Enter Passwords
ECHO 10. Terminal Port (0 = Disabled / 9001 = HW Recommended / or enter a 4-digit port number)
ECHO 11. Back to Main Menu
ECHO --------------------------------------------------------------------------
SET /P no=Type the number of your selection: 
if %no%==1 goto bloodmoney
if %no%==2 goto cpupilots
if %no%==3 goto godhangaraccess
if %no%==4 goto maxplayers
if %no%==5 goto mothhopping
if %no%==6 goto persistentgame
if %no%==7 goto playerannouncement
if %no%==8 goto restrictalpha
if %no%==9 goto requirepasswords
if %no%==10 goto terminalport
if %no%==11 goto main_menu
ECHO "%no%" is invalid, choose something on the list!
ECHO
goto main_menu

REM --------------------Network Options Commands-------------------------------------------------------------

:bloodmoney
set /p bm="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v CashOnKill /t REG_DWORD /d 0x0000000%bm% /f
ECHO Set Blood Money Value - Done!
@echo off
timeout /t 5
goto network_options
:cpupilots
set /p cp="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v IncludeCPU /t REG_DWORD /d 0x0000000%cp% /f
ECHO Set CPU (AI) Pilots Value - Done!
@echo off
timeout /t 5
goto network_options
:godhangaraccess
set /p gh="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v LinkAllowGodHangar /t REG_DWORD /d 0x0000000%gh% /f
ECHO Set God Hangar Access Value - Done!
@echo off
timeout /t 5
goto network_options
:maxplayers
set /p mp="Set anywhere between 2 - 16 (other values may cause a crash): "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v MaxPlayersInt /t REG_DWORD /d 0x0000000%mp% /f
ECHO Set Max Players Value - Done!
@echo off
timeout /t 5
goto network_options
:mothhopping
set /p mh="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v MothHopping /t REG_DWORD /d 0x0000000%mh% /f
ECHO Set Moth Hopping Value - Done!
@echo off
timeout /t 5
goto network_options
:persistentgame
set /p pg="Type 0 to set Network Game, 1 to set Dedicated Server: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v PersistentGame /t REG_DWORD /d 0x0000000%pg% /f
ECHO Set Persistent Game Value - Done!
@echo off
timeout /t 5
goto network_options
:playerannouncement
set /p pa="0 = Anonymous, 1 = Named, 2 = Name and Target: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v PlayerAnnounce /t REG_DWORD /d 0x0000000%pa% /f
ECHO Set Player Announcement Value - Done!
@echo off
timeout /t 5
goto network_options
:restrictalpha
set /p ra="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v RestrictAlpha /t REG_DWORD /d 0x0000000%ra% /f
ECHO Set Restrict Gamplay to Alpha Crater Value - Done!
@echo off
timeout /t 5
goto network_options
:requirepasswords
set /p rp="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v PilotPasswords /t REG_DWORD /d 0x0000000%rp% /f
ECHO Set Require Players to Enter Passwords Value - Done!
@echo off
timeout /t 5
goto network_options
:terminalport
set /p tp="0 = Disabled, 9001 = HW Recommended, or enter a 4-digit port number: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v MothHopping /t REG_DWORD /d 0x0000000%tp% /f
ECHO Set Terminal Port Value - Done!
@echo off
timeout /t 5
goto network_options

REM --------------------Input Options Menu-------------------------------------------------------------------

:input_options
cls
ECHO 			  --- Input Options ---
ECHO 1.  Force Feedback (0 = Disabled / 1 = Enabled)
ECHO 2.  Joystick - Multiple Button Detection (0 = Enabled / 1 = Disabled)
ECHO 3.  POV Hat for Directional Thrust (For controller or joystick - 0 = Disabled / 1 = Enabled)
ECHO 4.  Rudder for Pilot's Head (For controller or joystick - 0 = Disabled / 1 = Enabled)
ECHO 			 --- Rebind Controls ---
ECHO 5.  Rebind Controller Buttons
ECHO 6.  Rebind Keyboard Controls
ECHO 7.  Reset All Controls and Buttons to Defaults
ECHO 8.  Back to Main Menu
ECHO --------------------------------------------------------------------------
SET /P io=Type the number of your selection: 
if %io%==1 goto forcefeedback
if %io%==2 goto joystickmbd
if %io%==3 goto povhat
if %io%==4 goto rudder
if %io%==5 goto rebindcontroller
if %io%==6 goto rebindkeyboard
if %io%==7 goto resetkeybinds
if %io%==8 goto main_menu
ECHO "%io%" is invalid, choose something on the list!
goto main_menu

REM --------------------Input Options Commands---------------------------------------------------------------

:forcefeedback
set /p ff="Type 0 to enable, 1 to disable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ForceFeedback /t REG_DWORD /d 0x0000000%ff% /f
ECHO Set Force Feedback Value - Done!
@echo off
timeout /t 5
goto input_options
:joystickmbd
set /p jb="Type 0 to enable, 1 to disable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v OneButtonOnly /t REG_DWORD /d 0x0000000%jb% /f
ECHO Set Joystick Multiple Button Detection Value - Done!
@echo off
timeout /t 5
goto input_options
:povhat
set /p ph="Type 0 to enable, 1 to disable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v PovHat /t REG_DWORD /d 0x0000000%ph% /f
ECHO Set POV Hat for Directional Thrust Value - Done!
@echo off
timeout /t 5
goto input_options
:rudder
set /p ru="Type 0 to enable, 1 to disable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v OneButtonOnly /t REG_DWORD /d 0x0000000%ru% /f
ECHO Set Joystick Multiple Button Detection Value - Done!
@echo off
timeout /t 5
goto input_options
:resetkeybinds
@echo off
set "currentDirectory=%cd%"
@echo off
regedit /s "%~dp0\HardLaunch\REG\default_controls.reg"
ECHO Set All Controls and Buttons to Defaults - Done!
@echo off
timeout /t 5
goto input_options

REM --------------------Rebind Controller Buttons Menu-----------------------------------------------------------------

:rebindcontroller
cls
ECHO 		--- Rebind Controller Buttons ---
ECHO 1.  Button 0			2.  Button 1
ECHO 3.  Button 2			4.  Button 3
ECHO 5.  Button 4			6.  Button 5
ECHO 7.  Button 6			8.  Button 7
ECHO 9.  Button 8			10. Button 9
ECHO 11. Button 10			12. Button 11
ECHO 13. Button 12			14. Button 13
ECHO 15. Button 14			16. Button 15
ECHO 17. Back to Input Options
ECHO --------------------------------------------------------------------------
SET /P rc=Type the number of your selection: 
if %rc%==1 goto button0
if %rc%==2 goto button1
if %rc%==3 goto button2
if %rc%==4 goto button3
if %rc%==5 goto button4
if %rc%==6 goto button5
if %rc%==7 goto button6
if %rc%==8 goto button7
if %rc%==9 goto button8
if %rc%==10 goto button9
if %rc%==11 goto button10
if %rc%==12 goto button11
if %rc%==13 goto button12
if %rc%==14 goto button13
if %rc%==15 goto button14
if %rc%==16 goto button15
if %rc%==17 goto input_options
REM --------------------Rebind Controller Buttons Commands-------------------------------------------------------------
:button0
ECHO                --- Bind Button 0 - Controller ---
ECHO Accelerate = 000	Brake = 001		Stop = 002
ECHO	Aceelerate Max = 003	Reverse Max = 004	Fire = 005
ECHO	Messages = 006		Navigation = 007	Flare = 008
ECHO	Chaff = 009		Starshell = 00a		Jettison Cargo = 00b
ECHO Drone = 00c		Next Weapon = 00d	Previous Weapon = 00e
ECHO God Hangar = 00f	Target = 010		Next Target = 011
ECHO Pan View Left = 012	Pan View Right = 013	Pan View Down = 014
ECHO	Pan View Up = 015	Zoom View In = 016	Zoom View Out = 017
ECHO	View Special = 018	Cockpit View = 019	External View = 01a
ECHO	Target View = 01b	Chase View = 01c	InvTarget View = 01d
ECHO	Padlock View = 01e	Nightscope = 01f	HUD Function = 020
ECHO	Console = 021		Chat = 022		Rankings (Network Only) = 023
ECHO	Left = 024		Right = 025		Up = 026
ECHO	Down = 027		Jink/Strafe = 028	Autopilot = 029
ECHO	Terminal = 02a		Unassigned = 123
ECHO --------------------------------------------------------------------------
set /p bt0="Type a 3 digit code above to bind it to Button 0: "
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Button1" /t REG_DWORD /d 0x00000%bt0% /f
ECHO Set Button 0 Binding - Done!
@echo off
timeout /t 2
goto rebindcontroller
:button1
ECHO                --- Bind Button 1 - Controller ---
ECHO Accelerate = 000	Brake = 001		Stop = 002
ECHO	Aceelerate Max = 003	Reverse Max = 004	Fire = 005
ECHO	Messages = 006		Navigation = 007	Flare = 008
ECHO	Chaff = 009		Starshell = 00a		Jettison Cargo = 00b
ECHO Drone = 00c		Next Weapon = 00d	Previous Weapon = 00e
ECHO God Hangar = 00f	Target = 010		Next Target = 011
ECHO Pan View Left = 012	Pan View Right = 013	Pan View Down = 014
ECHO	Pan View Up = 015	Zoom View In = 016	Zoom View Out = 017
ECHO	View Special = 018	Cockpit View = 019	External View = 01a
ECHO	Target View = 01b	Chase View = 01c	InvTarget View = 01d
ECHO	Padlock View = 01e	Nightscope = 01f	HUD Function = 020
ECHO	Console = 021		Chat = 022		Rankings (Network Only) = 023
ECHO	Left = 024		Right = 025		Up = 026
ECHO	Down = 027		Jink/Strafe = 028	Autopilot = 029
ECHO	Terminal = 02a		Unassigned = 123
ECHO --------------------------------------------------------------------------
set /p bt1="Type a 3 digit code above to bind it to Button 1: "
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Button2" /t REG_DWORD /d 0x00000%bt1% /f
ECHO Set Button 1 Binding - Done!
@echo off
timeout /t 2
goto rebindcontroller
:button2
ECHO                --- Bind Button 2 - Controller ---
ECHO Accelerate = 000	Brake = 001		Stop = 002
ECHO	Aceelerate Max = 003	Reverse Max = 004	Fire = 005
ECHO	Messages = 006		Navigation = 007	Flare = 008
ECHO	Chaff = 009		Starshell = 00a		Jettison Cargo = 00b
ECHO Drone = 00c		Next Weapon = 00d	Previous Weapon = 00e
ECHO God Hangar = 00f	Target = 010		Next Target = 011
ECHO Pan View Left = 012	Pan View Right = 013	Pan View Down = 014
ECHO	Pan View Up = 015	Zoom View In = 016	Zoom View Out = 017
ECHO	View Special = 018	Cockpit View = 019	External View = 01a
ECHO	Target View = 01b	Chase View = 01c	InvTarget View = 01d
ECHO	Padlock View = 01e	Nightscope = 01f	HUD Function = 020
ECHO	Console = 021		Chat = 022		Rankings (Network Only) = 023
ECHO	Left = 024		Right = 025		Up = 026
ECHO	Down = 027		Jink/Strafe = 028	Autopilot = 029
ECHO	Terminal = 02a		Unassigned = 123
ECHO --------------------------------------------------------------------------
set /p bt2="Type a 3 digit code above to bind it to Button 2: "
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Button3" /t REG_DWORD /d 0x00000%bt2% /f
ECHO Set Button 2 Binding - Done!
@echo off
timeout /t 2
goto rebindcontroller
:button3
ECHO                --- Bind Button 3 - Controller ---
ECHO Accelerate = 000	Brake = 001		Stop = 002
ECHO	Aceelerate Max = 003	Reverse Max = 004	Fire = 005
ECHO	Messages = 006		Navigation = 007	Flare = 008
ECHO	Chaff = 009		Starshell = 00a		Jettison Cargo = 00b
ECHO Drone = 00c		Next Weapon = 00d	Previous Weapon = 00e
ECHO God Hangar = 00f	Target = 010		Next Target = 011
ECHO Pan View Left = 012	Pan View Right = 013	Pan View Down = 014
ECHO	Pan View Up = 015	Zoom View In = 016	Zoom View Out = 017
ECHO	View Special = 018	Cockpit View = 019	External View = 01a
ECHO	Target View = 01b	Chase View = 01c	InvTarget View = 01d
ECHO	Padlock View = 01e	Nightscope = 01f	HUD Function = 020
ECHO	Console = 021		Chat = 022		Rankings (Network Only) = 023
ECHO	Left = 024		Right = 025		Up = 026
ECHO	Down = 027		Jink/Strafe = 028	Autopilot = 029
ECHO	Terminal = 02a		Unassigned = 123
ECHO --------------------------------------------------------------------------
set /p bt3="Type a 3 digit code above to bind it to Button 3: "
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Button4" /t REG_DWORD /d 0x00000%bt3% /f
ECHO Set Button 3 Binding - Done!
@echo off
timeout /t 2
goto rebindcontroller
:button4
ECHO                --- Bind Button 4 - Controller ---
ECHO Accelerate = 000	Brake = 001		Stop = 002
ECHO	Aceelerate Max = 003	Reverse Max = 004	Fire = 005
ECHO	Messages = 006		Navigation = 007	Flare = 008
ECHO	Chaff = 009		Starshell = 00a		Jettison Cargo = 00b
ECHO Drone = 00c		Next Weapon = 00d	Previous Weapon = 00e
ECHO God Hangar = 00f	Target = 010		Next Target = 011
ECHO Pan View Left = 012	Pan View Right = 013	Pan View Down = 014
ECHO	Pan View Up = 015	Zoom View In = 016	Zoom View Out = 017
ECHO	View Special = 018	Cockpit View = 019	External View = 01a
ECHO	Target View = 01b	Chase View = 01c	InvTarget View = 01d
ECHO	Padlock View = 01e	Nightscope = 01f	HUD Function = 020
ECHO	Console = 021		Chat = 022		Rankings (Network Only) = 023
ECHO	Left = 024		Right = 025		Up = 026
ECHO	Down = 027		Jink/Strafe = 028	Autopilot = 029
ECHO	Terminal = 02a		Unassigned = 123
ECHO --------------------------------------------------------------------------
set /p bt4="Type a 3 digit code above to bind it to Button 4: "
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Button5" /t REG_DWORD /d 0x00000%bt4% /f
ECHO Set Button 4 Binding - Done!
@echo off
timeout /t 2
goto rebindcontroller
:button5
ECHO                --- Bind Button 5 - Controller ---
ECHO Accelerate = 000	Brake = 001		Stop = 002
ECHO	Aceelerate Max = 003	Reverse Max = 004	Fire = 005
ECHO	Messages = 006		Navigation = 007	Flare = 008
ECHO	Chaff = 009		Starshell = 00a		Jettison Cargo = 00b
ECHO Drone = 00c		Next Weapon = 00d	Previous Weapon = 00e
ECHO God Hangar = 00f	Target = 010		Next Target = 011
ECHO Pan View Left = 012	Pan View Right = 013	Pan View Down = 014
ECHO	Pan View Up = 015	Zoom View In = 016	Zoom View Out = 017
ECHO	View Special = 018	Cockpit View = 019	External View = 01a
ECHO	Target View = 01b	Chase View = 01c	InvTarget View = 01d
ECHO	Padlock View = 01e	Nightscope = 01f	HUD Function = 020
ECHO	Console = 021		Chat = 022		Rankings (Network Only) = 023
ECHO	Left = 024		Right = 025		Up = 026
ECHO	Down = 027		Jink/Strafe = 028	Autopilot = 029
ECHO	Terminal = 02a		Unassigned = 123
ECHO --------------------------------------------------------------------------
set /p bt5="Type a 3 digit code above to bind it to Button 5: "
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Button6" /t REG_DWORD /d 0x00000%bt5% /f
ECHO Set Button 5 Binding - Done!
@echo off
timeout /t 2
goto rebindcontroller
:button6
ECHO                --- Bind Button 6 - Controller ---
ECHO Accelerate = 000	Brake = 001		Stop = 002
ECHO	Aceelerate Max = 003	Reverse Max = 004	Fire = 005
ECHO	Messages = 006		Navigation = 007	Flare = 008
ECHO	Chaff = 009		Starshell = 00a		Jettison Cargo = 00b
ECHO Drone = 00c		Next Weapon = 00d	Previous Weapon = 00e
ECHO God Hangar = 00f	Target = 010		Next Target = 011
ECHO Pan View Left = 012	Pan View Right = 013	Pan View Down = 014
ECHO	Pan View Up = 015	Zoom View In = 016	Zoom View Out = 017
ECHO	View Special = 018	Cockpit View = 019	External View = 01a
ECHO	Target View = 01b	Chase View = 01c	InvTarget View = 01d
ECHO	Padlock View = 01e	Nightscope = 01f	HUD Function = 020
ECHO	Console = 021		Chat = 022		Rankings (Network Only) = 023
ECHO	Left = 024		Right = 025		Up = 026
ECHO	Down = 027		Jink/Strafe = 028	Autopilot = 029
ECHO	Terminal = 02a		Unassigned = 123
ECHO --------------------------------------------------------------------------
set /p bt6="Type a 3 digit code above to bind it to Button 6: "
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Button7" /t REG_DWORD /d 0x00000%bt6% /f
ECHO Set Button 6 Binding - Done!
@echo off
timeout /t 2
goto rebindcontroller
:button7
ECHO                --- Bind Button 7 - Controller ---
ECHO Accelerate = 000	Brake = 001		Stop = 002
ECHO	Aceelerate Max = 003	Reverse Max = 004	Fire = 005
ECHO	Messages = 006		Navigation = 007	Flare = 008
ECHO	Chaff = 009		Starshell = 00a		Jettison Cargo = 00b
ECHO Drone = 00c		Next Weapon = 00d	Previous Weapon = 00e
ECHO God Hangar = 00f	Target = 010		Next Target = 011
ECHO Pan View Left = 012	Pan View Right = 013	Pan View Down = 014
ECHO	Pan View Up = 015	Zoom View In = 016	Zoom View Out = 017
ECHO	View Special = 018	Cockpit View = 019	External View = 01a
ECHO	Target View = 01b	Chase View = 01c	InvTarget View = 01d
ECHO	Padlock View = 01e	Nightscope = 01f	HUD Function = 020
ECHO	Console = 021		Chat = 022		Rankings (Network Only) = 023
ECHO	Left = 024		Right = 025		Up = 026
ECHO	Down = 027		Jink/Strafe = 028	Autopilot = 029
ECHO	Terminal = 02a		Unassigned = 123
ECHO --------------------------------------------------------------------------
set /p bt7="Type a 3 digit code above to bind it to Button 7: "
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Button8" /t REG_DWORD /d 0x00000%bt7% /f
ECHO Set Button 7 Binding - Done!
@echo off
timeout /t 2
goto rebindcontroller
:button8
ECHO                --- Bind Button 8 - Controller ---
ECHO Accelerate = 000	Brake = 001		Stop = 002
ECHO	Aceelerate Max = 003	Reverse Max = 004	Fire = 005
ECHO	Messages = 006		Navigation = 007	Flare = 008
ECHO	Chaff = 009		Starshell = 00a		Jettison Cargo = 00b
ECHO Drone = 00c		Next Weapon = 00d	Previous Weapon = 00e
ECHO God Hangar = 00f	Target = 010		Next Target = 011
ECHO Pan View Left = 012	Pan View Right = 013	Pan View Down = 014
ECHO	Pan View Up = 015	Zoom View In = 016	Zoom View Out = 017
ECHO	View Special = 018	Cockpit View = 019	External View = 01a
ECHO	Target View = 01b	Chase View = 01c	InvTarget View = 01d
ECHO	Padlock View = 01e	Nightscope = 01f	HUD Function = 020
ECHO	Console = 021		Chat = 022		Rankings (Network Only) = 023
ECHO	Left = 024		Right = 025		Up = 026
ECHO	Down = 027		Jink/Strafe = 028	Autopilot = 029
ECHO	Terminal = 02a		Unassigned = 123
ECHO --------------------------------------------------------------------------
set /p bt8="Type a 3 digit code above to bind it to Button 8: "
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Button9" /t REG_DWORD /d 0x00000%bt8% /f
ECHO Set Button 8 Binding - Done!
@echo off
timeout /t 2
goto rebindcontroller
:button9
ECHO                --- Bind Button 9 - Controller ---
ECHO Accelerate = 000	Brake = 001		Stop = 002
ECHO	Aceelerate Max = 003	Reverse Max = 004	Fire = 005
ECHO	Messages = 006		Navigation = 007	Flare = 008
ECHO	Chaff = 009		Starshell = 00a		Jettison Cargo = 00b
ECHO Drone = 00c		Next Weapon = 00d	Previous Weapon = 00e
ECHO God Hangar = 00f	Target = 010		Next Target = 011
ECHO Pan View Left = 012	Pan View Right = 013	Pan View Down = 014
ECHO	Pan View Up = 015	Zoom View In = 016	Zoom View Out = 017
ECHO	View Special = 018	Cockpit View = 019	External View = 01a
ECHO	Target View = 01b	Chase View = 01c	InvTarget View = 01d
ECHO	Padlock View = 01e	Nightscope = 01f	HUD Function = 020
ECHO	Console = 021		Chat = 022		Rankings (Network Only) = 023
ECHO	Left = 024		Right = 025		Up = 026
ECHO	Down = 027		Jink/Strafe = 028	Autopilot = 029
ECHO	Terminal = 02a		Unassigned = 123
ECHO --------------------------------------------------------------------------
set /p bt9="Type a 3 digit code above to bind it to Button 9: "
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Button10" /t REG_DWORD /d 0x00000%bt9% /f
ECHO Set Button 9 Binding - Done!
@echo off
timeout /t 2
goto rebindcontroller
:button10
ECHO                --- Bind Button 10 - Controller ---
ECHO Accelerate = 000	Brake = 001		Stop = 002
ECHO	Aceelerate Max = 003	Reverse Max = 004	Fire = 005
ECHO	Messages = 006		Navigation = 007	Flare = 008
ECHO	Chaff = 009		Starshell = 00a		Jettison Cargo = 00b
ECHO Drone = 00c		Next Weapon = 00d	Previous Weapon = 00e
ECHO God Hangar = 00f	Target = 010		Next Target = 011
ECHO Pan View Left = 012	Pan View Right = 013	Pan View Down = 014
ECHO	Pan View Up = 015	Zoom View In = 016	Zoom View Out = 017
ECHO	View Special = 018	Cockpit View = 019	External View = 01a
ECHO	Target View = 01b	Chase View = 01c	InvTarget View = 01d
ECHO	Padlock View = 01e	Nightscope = 01f	HUD Function = 020
ECHO	Console = 021		Chat = 022		Rankings (Network Only) = 023
ECHO	Left = 024		Right = 025		Up = 026
ECHO	Down = 027		Jink/Strafe = 028	Autopilot = 029
ECHO	Terminal = 02a		Unassigned = 123
ECHO --------------------------------------------------------------------------
set /p bt10="Type a 3 digit code above to bind it to Button 10: "
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Button11" /t REG_DWORD /d 0x00000%bt10% /f
ECHO Set Button 10 Binding - Done!
@echo off
timeout /t 2
goto rebindcontroller
:button11
ECHO                --- Bind Button 11 - Controller ---
ECHO Accelerate = 000	Brake = 001		Stop = 002
ECHO	Aceelerate Max = 003	Reverse Max = 004	Fire = 005
ECHO	Messages = 006		Navigation = 007	Flare = 008
ECHO	Chaff = 009		Starshell = 00a		Jettison Cargo = 00b
ECHO Drone = 00c		Next Weapon = 00d	Previous Weapon = 00e
ECHO God Hangar = 00f	Target = 010		Next Target = 011
ECHO Pan View Left = 012	Pan View Right = 013	Pan View Down = 014
ECHO	Pan View Up = 015	Zoom View In = 016	Zoom View Out = 017
ECHO	View Special = 018	Cockpit View = 019	External View = 01a
ECHO	Target View = 01b	Chase View = 01c	InvTarget View = 01d
ECHO	Padlock View = 01e	Nightscope = 01f	HUD Function = 020
ECHO	Console = 021		Chat = 022		Rankings (Network Only) = 023
ECHO	Left = 024		Right = 025		Up = 026
ECHO	Down = 027		Jink/Strafe = 028	Autopilot = 029
ECHO	Terminal = 02a		Unassigned = 123
ECHO --------------------------------------------------------------------------
set /p bt11="Type a 3 digit code above to bind it to Button 11: "
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Button12" /t REG_DWORD /d 0x00000%bt11% /f
ECHO Set Button 11 Binding - Done!
@echo off
timeout /t 2
goto rebindcontroller
:button12
ECHO                --- Bind Button 12 - Controller ---
ECHO Accelerate = 000	Brake = 001		Stop = 002
ECHO	Aceelerate Max = 003	Reverse Max = 004	Fire = 005
ECHO	Messages = 006		Navigation = 007	Flare = 008
ECHO	Chaff = 009		Starshell = 00a		Jettison Cargo = 00b
ECHO Drone = 00c		Next Weapon = 00d	Previous Weapon = 00e
ECHO God Hangar = 00f	Target = 010		Next Target = 011
ECHO Pan View Left = 012	Pan View Right = 013	Pan View Down = 014
ECHO	Pan View Up = 015	Zoom View In = 016	Zoom View Out = 017
ECHO	View Special = 018	Cockpit View = 019	External View = 01a
ECHO	Target View = 01b	Chase View = 01c	InvTarget View = 01d
ECHO	Padlock View = 01e	Nightscope = 01f	HUD Function = 020
ECHO	Console = 021		Chat = 022		Rankings (Network Only) = 023
ECHO	Left = 024		Right = 025		Up = 026
ECHO	Down = 027		Jink/Strafe = 028	Autopilot = 029
ECHO	Terminal = 02a		Unassigned = 123
ECHO --------------------------------------------------------------------------
set /p bt12="Type a 3 digit code above to bind it to Button 12: "
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Button13" /t REG_DWORD /d 0x00000%bt12% /f
ECHO Set Button 12 Binding - Done!
@echo off
timeout /t 2
goto rebindcontroller
:button13
ECHO                --- Bind Button 13 - Controller ---
ECHO Accelerate = 000	Brake = 001		Stop = 002
ECHO	Aceelerate Max = 003	Reverse Max = 004	Fire = 005
ECHO	Messages = 006		Navigation = 007	Flare = 008
ECHO	Chaff = 009		Starshell = 00a		Jettison Cargo = 00b
ECHO Drone = 00c		Next Weapon = 00d	Previous Weapon = 00e
ECHO God Hangar = 00f	Target = 010		Next Target = 011
ECHO Pan View Left = 012	Pan View Right = 013	Pan View Down = 014
ECHO	Pan View Up = 015	Zoom View In = 016	Zoom View Out = 017
ECHO	View Special = 018	Cockpit View = 019	External View = 01a
ECHO	Target View = 01b	Chase View = 01c	InvTarget View = 01d
ECHO	Padlock View = 01e	Nightscope = 01f	HUD Function = 020
ECHO	Console = 021		Chat = 022		Rankings (Network Only) = 023
ECHO	Left = 024		Right = 025		Up = 026
ECHO	Down = 027		Jink/Strafe = 028	Autopilot = 029
ECHO	Terminal = 02a		Unassigned = 123
ECHO --------------------------------------------------------------------------
set /p bt13="Type a 3 digit code above to bind it to Button 13: "
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Button14" /t REG_DWORD /d 0x00000%bt13% /f
ECHO Set Button 13 Binding - Done!
@echo off
timeout /t 2
goto rebindcontroller
:button14
ECHO                --- Bind Button 14 - Controller ---
ECHO Accelerate = 000	Brake = 001		Stop = 002
ECHO	Aceelerate Max = 003	Reverse Max = 004	Fire = 005
ECHO	Messages = 006		Navigation = 007	Flare = 008
ECHO	Chaff = 009		Starshell = 00a		Jettison Cargo = 00b
ECHO Drone = 00c		Next Weapon = 00d	Previous Weapon = 00e
ECHO God Hangar = 00f	Target = 010		Next Target = 011
ECHO Pan View Left = 012	Pan View Right = 013	Pan View Down = 014
ECHO	Pan View Up = 015	Zoom View In = 016	Zoom View Out = 017
ECHO	View Special = 018	Cockpit View = 019	External View = 01a
ECHO	Target View = 01b	Chase View = 01c	InvTarget View = 01d
ECHO	Padlock View = 01e	Nightscope = 01f	HUD Function = 020
ECHO	Console = 021		Chat = 022		Rankings (Network Only) = 023
ECHO	Left = 024		Right = 025		Up = 026
ECHO	Down = 027		Jink/Strafe = 028	Autopilot = 029
ECHO	Terminal = 02a		Unassigned = 123
ECHO --------------------------------------------------------------------------
set /p bt14="Type a 3 digit code above to bind it to Button 14: "
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Button15" /t REG_DWORD /d 0x00000%bt14% /f
ECHO Set Button 14 Binding - Done!
@echo off
timeout /t 2
goto rebindcontroller
:button15
ECHO                --- Bind Button 15 - Controller ---
ECHO Accelerate = 000	Brake = 001		Stop = 002
ECHO	Aceelerate Max = 003	Reverse Max = 004	Fire = 005
ECHO	Messages = 006		Navigation = 007	Flare = 008
ECHO	Chaff = 009		Starshell = 00a		Jettison Cargo = 00b
ECHO Drone = 00c		Next Weapon = 00d	Previous Weapon = 00e
ECHO God Hangar = 00f	Target = 010		Next Target = 011
ECHO Pan View Left = 012	Pan View Right = 013	Pan View Down = 014
ECHO	Pan View Up = 015	Zoom View In = 016	Zoom View Out = 017
ECHO	View Special = 018	Cockpit View = 019	External View = 01a
ECHO	Target View = 01b	Chase View = 01c	InvTarget View = 01d
ECHO	Padlock View = 01e	Nightscope = 01f	HUD Function = 020
ECHO	Console = 021		Chat = 022		Rankings (Network Only) = 023
ECHO	Left = 024		Right = 025		Up = 026
ECHO	Down = 027		Jink/Strafe = 028	Autopilot = 029
ECHO	Terminal = 02a		Unassigned = 123
ECHO --------------------------------------------------------------------------
set /p bt15="Type a 3 digit code above to bind it to Button 15: "
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Button16" /t REG_DWORD /d 0x00000%bt15% /f
ECHO Set Button 15 Binding - Done!
@echo off
timeout /t 2
goto rebindcontroller

REM --------------------Rebind Keyboard Controls Menu--------------------------------------------------------

:rebindkeyboard
cls
ECHO 		--- Rebind Keyboard Controls ---
ECHO ---------------------- Flight Controls ----------------------
ECHO 1.  Accelerate			7.  Autopilot
ECHO 2.  Accelerate to Max		8.  Up
ECHO 3.  Reverse to Max		9.  Down
ECHO 4.  Stop			10. Left
ECHO 5.  Brake			11. Right
ECHO 6.  Jink/Strafe
ECHO ---------------------- Combat/Scavenging Controls -----------
ECHO 12. Chaff			17.  Next Target
ECHO 13. Fire			18.  Next Weapon
ECHO 14. Flare			19.  Previous Weapon
ECHO 15. Starshell			20.  Drone
ECHO 16. Target			21.  Jettison Cargo
ECHO ---------------------- Chat/HUD Controls --------------------
ECHO 22. Chat			25.  Navigation
ECHO 23. Network Chat		26.  Nightscope (Night Vision)
ECHO 24. Messages			27.  Toggle HUD
ECHO ---------------------- View Controls ------------------------
ECHO 28. Chase View			35.  Pan View Up
ECHO 29. Cockpit View		36.  Pan View Down
ECHO 30. External View		37.  Pan View Left
ECHO 31. InvTarget View		38.  Pan View Right
ECHO 32. Padlock View		39.  Zoom View In
ECHO 33. Target View			40.  Zoom View Out
ECHO 34. View Special
ECHO ---------------------- Other Controls -----------------------
ECHO 41. Console (Terminal)		43.  Rankings (Network Only)
ECHO 42. God Hangar			44.  Back to Main Menu
ECHO --------------------------------------------------------------------------
SET /P rk=Type the number of your selection: 
REM ---------------------- Flight Controls -----------------------
if %rk%==1 goto accelerate
if %rk%==2 goto acceleratemax
if %rk%==3 goto reversemax
if %rk%==4 goto stop
if %rk%==5 goto brake
if %rk%==6 goto jinkstrafe
if %rk%==7 goto autopilot
if %rk%==8 goto up
if %rk%==9 goto down
if %rk%==10 goto left
if %rk%==11 goto right
REM ---------------------- Combat/Scavenging Controls ------------
if %rk%==12 goto chaff
if %rk%==13 goto fire
if %rk%==14 goto flare
if %rk%==15 goto starshell
if %rk%==16 goto target
if %rk%==17 goto nexttarget
if %rk%==18 goto nextweapon
if %rk%==19 goto previousweapon
if %rk%==20 goto drone
if %rk%==21 goto jettisoncargo
REM ---------------------- Chat/HUD Controls ---------------------
if %rk%==22 goto chat
if %rk%==23 goto netchat
if %rk%==24 goto messages
if %rk%==25 goto navigation
if %rk%==26 goto nightscope
if %rk%==27 goto togglehud
REM ---------------------- View Controls -------------------------
if %rk%==28 goto chaseview
if %rk%==29 goto cockpitview
if %rk%==30 goto externalview
if %rk%==31 goto invtargetview
if %rk%==32 goto padlockview
if %rk%==33 goto targetview
if %rk%==34 goto viewspecial
if %rk%==35 goto panviewup
if %rk%==36 goto panviewdown
if %rk%==37 goto panviewleft
if %rk%==38 goto panviewright
if %rk%==39 goto zoomviewin
if %rk%==40 goto zoomviewout
REM ---------------------- Other Controls ------------------------
if %rk%==41 goto console
if %rk%==42 goto godhangar
if %rk%==43 goto netrankings
if %rk%==44 goto main_menu
ECHO "%rk%" is invalid, choose something on the list!
goto main_menu

REM --------------------Rebind Controls Commands-------------------------------------------------------------
REM ---------------------- Flight Controls -----------------------
:accelerate
ECHO                     --- Bind Accelerate ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p accel="Input a key and press Enter to bind it to Accelerate: "
@echo off
if %accel%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000001e /f
if %accel%==a ECHO Set Accelerate keybind to A - Done!
if %accel%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000030 /f
if %accel%==b ECHO Set Accelerate keybind to B - Done!
if %accel%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000002e /f
if %accel%==c ECHO Set Accelerate keybind to C - Done!
if %accel%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000020 /f
if %accel%==d ECHO Set Accelerate keybind to D - Done!
if %accel%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000012 /f
if %accel%==e ECHO Set Accelerate keybind to E - Done!
if %accel%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000021 /f
if %accel%==f ECHO Set Accelerate keybind to F - Done!
if %accel%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000022 /f
if %accel%==g ECHO Set Accelerate keybind to G - Done!
if %accel%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000023 /f
if %accel%==h ECHO Set Accelerate keybind to H - Done!
if %accel%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000017 /f
if %accel%==i ECHO Set Accelerate keybind to I - Done!
if %accel%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000024 /f
if %accel%==j ECHO Set Accelerate keybind to J - Done!
if %accel%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000025 /f
if %accel%==k ECHO Set Accelerate keybind to K - Done!
if %accel%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000026 /f
if %accel%==l ECHO Set Accelerate keybind to L - Done!
if %accel%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000032 /f
if %accel%==m ECHO Set Accelerate keybind to M - Done!
if %accel%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000031 /f
if %accel%==n ECHO Set Accelerate keybind to N - Done!
if %accel%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000018 /f
if %accel%==o ECHO Set Accelerate keybind to O - Done!
if %accel%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000019 /f
if %accel%==p ECHO Set Accelerate keybind to P - Done!
if %accel%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000010 /f
if %accel%==q ECHO Set Accelerate keybind to Q - Done!
if %accel%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000013 /f
if %accel%==r ECHO Set Accelerate keybind to R - Done!
if %accel%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000001f /f
if %accel%==s ECHO Set Accelerate keybind to S - Done!
if %accel%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000014 /f
if %accel%==t ECHO Set Accelerate keybind to T - Done!
if %accel%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000016 /f
if %accel%==u ECHO Set Accelerate keybind to U - Done!
if %accel%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000002f /f
if %accel%==v ECHO Set Accelerate keybind to V - Done!
if %accel%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000011 /f
if %accel%==w ECHO Set Accelerate keybind to W - Done!
if %accel%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000002d /f
if %accel%==x ECHO Set Accelerate keybind to X - Done!
if %accel%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000015 /f
if %accel%==y ECHO Set Accelerate keybind to Y - Done!
if %accel%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000002c /f
if %accel%==z ECHO Set Accelerate keybind to Z - Done!
if %accel%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000029 /f
if %accel%==tilde ECHO Set Accelerate keybind to ~ - Done!
if %accel%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000000d /f
if %accel%==equal ECHO Set Accelerate keybind to = - Done!
if %accel%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000000c /f
if %accel%==minus ECHO Set Accelerate keybind to - - Done!
if %accel%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000001a /f
if %accel%==lbracket ECHO Set Accelerate keybind to [ - Done!
if %accel%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000001b /f
if %accel%==rbracket ECHO Set Accelerate keybind to ] - Done!
if %accel%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000035 /f
if %accel%==slash ECHO Set Accelerate keybind to / - Done!
if %accel%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000002b /f
if %accel%==bslash ECHO Set Accelerate keybind to \ - Done!
if %accel%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000027 /f
if %accel%==colon ECHO Set Accelerate keybind to ; - Done!
if %accel%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000028 /f
if %accel%==quote ECHO Set Accelerate keybind to ' - Done!
if %accel%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000033 /f
if %accel%==comma ECHO Set Accelerate keybind to , - Done!
if %accel%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000034 /f
if %accel%==period ECHO Set Accelerate keybind to . - Done!
if %accel%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000000e /f
if %accel%==bckspc ECHO Set Accelerate keybind to Backspace - Done!
if %accel%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000000f /f
if %accel%==tab ECHO Set Accelerate keybind to Tab - Done!
if %accel%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000001c /f
if %accel%==enter ECHO Set Accelerate keybind to Enter - Done!
if %accel%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000039 /f
if %accel%==space ECHO Set Accelerate keybind to Space Bar - Done!
if %accel%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000001 /f
if %accel%==esc ECHO Set Accelerate keybind to Escape - Done!
if %accel%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000052 /f
if %accel%==ins ECHO Set Accelerate keybind to Insert - Done!
if %accel%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000053 /f
if %accel%==del ECHO Set Accelerate keybind to Delete - Done!
if %accel%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000047 /f
if %accel%==home ECHO Set Accelerate keybind to Home - Done!
if %accel%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000004f /f
if %accel%==end ECHO Set Accelerate keybind to End - Done!
if %accel%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000049 /f
if %accel%==pgup ECHO Set Accelerate keybind to Page Up - Done!
if %accel%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000051 /f
if %accel%==pgdn ECHO Set Accelerate keybind to Page Down - Done!
if %accel%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000003b /f
if %accel%==f1 ECHO Set Accelerate keybind to F1 - Done!
if %accel%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000003c /f
if %accel%==f2 ECHO Set Accelerate keybind to F2 - Done!
if %accel%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000003d /f
if %accel%==f3 ECHO Set Accelerate keybind to F3 - Done!
if %accel%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000003e /f
if %accel%==f4 ECHO Set Accelerate keybind to F4 - Done!
if %accel%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000003f /f
if %accel%==f5 ECHO Set Accelerate keybind to F5 - Done!
if %accel%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000040 /f
if %accel%==f6 ECHO Set Accelerate keybind to F6 - Done!
if %accel%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000041 /f
if %accel%==f7 ECHO Set Accelerate keybind to F7 - Done!
if %accel%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000042 /f
if %accel%==f8 ECHO Set Accelerate keybind to F8 - Done!
if %accel%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000043 /f
if %accel%==f9 ECHO Set Accelerate keybind to F9 - Done!
if %accel%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000044 /f
if %accel%==f10 ECHO Set Accelerate keybind to F10 - Done!
if %accel%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000085 /f
if %accel%==f11 ECHO Set Accelerate keybind to F11 - Done!
if %accel%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000086 /f
if %accel%==f12 ECHO Set Accelerate keybind to F12 - Done!
if %accel%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000004f /f
if %accel%==num1 ECHO Set Accelerate keybind to Numpad 1 - Done!
if %accel%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000050 /f
if %accel%==num2 ECHO Set Accelerate keybind to Numpad 2 - Done!
if %accel%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000051 /f
if %accel%==num3 ECHO Set Accelerate keybind to Numpad 3 - Done!
if %accel%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000004b /f
if %accel%==num4 ECHO Set Accelerate keybind to Numpad 4 - Done!
if %accel%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000004c /f
if %accel%==num5 ECHO Set Accelerate keybind to Numpad 5 - Done!
if %accel%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000004d /f
if %accel%==num6 ECHO Set Accelerate keybind to Numpad 6 - Done!
if %accel%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000047 /f
if %accel%==num7 ECHO Set Accelerate keybind to Numpad 7 - Done!
if %accel%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000048 /f
if %accel%==num8 ECHO Set Accelerate keybind to Numpad 8 - Done!
if %accel%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000049 /f
if %accel%==num9 ECHO Set Accelerate keybind to Numpad 9 - Done!
if %accel%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000037 /f
if %accel%==numstar ECHO Set Accelerate keybind to Numpad * - Done!
if %accel%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000004a /f
if %accel%==numminus ECHO Set Accelerate keybind to Numpad - - Done!
if %accel%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000004e /f
if %accel%==numplus ECHO Set Accelerate keybind to Numpad + - Done!
if %accel%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000048 /f
if %accel%==up ECHO Set Accelerate keybind to Up Arrow - Done!
if %accel%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x00000050 /f
if %accel%==down ECHO Set Accelerate keybind to Down Arrow - Done!
if %accel%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000004b /f
if %accel%==left ECHO Set Accelerate keybind to Left Arrow - Done!
if %accel%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Accelerate" /t REG_DWORD /d 0x0000004d /f
if %accel%==right ECHO Set Accelerate keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:acceleratemax
ECHO                    --- Bind Accelerate to Max ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p accmax="Input a key and press Enter to bind it to Accelerate to Max: "
@echo off
if %accmax%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000001e /f
if %accmax%==a ECHO Set Accelerate to Max keybind to A - Done!
if %accmax%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000030 /f
if %accmax%==b ECHO Set Accelerate to Max keybind to B - Done!
if %accmax%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000002e /f
if %accmax%==c ECHO Set Accelerate to Max keybind to C - Done!
if %accmax%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000020 /f
if %accmax%==d ECHO Set Accelerate to Max keybind to D - Done!
if %accmax%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000012 /f
if %accmax%==e ECHO Set Accelerate to Max keybind to E - Done!
if %accmax%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000021 /f
if %accmax%==f ECHO Set Accelerate to Max keybind to F - Done!
if %accmax%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000022 /f
if %accmax%==g ECHO Set Accelerate to Max keybind to G - Done!
if %accmax%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000023 /f
if %accmax%==h ECHO Set Accelerate to Max keybind to H - Done!
if %accmax%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000017 /f
if %accmax%==i ECHO Set Accelerate to Max keybind to I - Done!
if %accmax%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000024 /f
if %accmax%==j ECHO Set Accelerate to Max keybind to J - Done!
if %accmax%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000025 /f
if %accmax%==k ECHO Set Accelerate to Max keybind to K - Done!
if %accmax%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000026 /f
if %accmax%==l ECHO Set Accelerate to Max keybind to L - Done!
if %accmax%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000032 /f
if %accmax%==m ECHO Set Accelerate to Max keybind to M - Done!
if %accmax%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000031 /f
if %accmax%==n ECHO Set Accelerate to Max keybind to N - Done!
if %accmax%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000018 /f
if %accmax%==o ECHO Set Accelerate to Max keybind to O - Done!
if %accmax%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000019 /f
if %accmax%==p ECHO Set Accelerate to Max keybind to P - Done!
if %accmax%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000010 /f
if %accmax%==q ECHO Set Accelerate to Max keybind to Q - Done!
if %accmax%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000013 /f
if %accmax%==r ECHO Set Accelerate to Max keybind to R - Done!
if %accmax%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000001f /f
if %accmax%==s ECHO Set Accelerate to Max keybind to S - Done!
if %accmax%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000014 /f
if %accmax%==t ECHO Set Accelerate to Max keybind to T - Done!
if %accmax%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000016 /f
if %accmax%==u ECHO Set Accelerate to Max keybind to U - Done!
if %accmax%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000002f /f
if %accmax%==v ECHO Set Accelerate to Max keybind to V - Done!
if %accmax%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000011 /f
if %accmax%==w ECHO Set Accelerate to Max keybind to W - Done!
if %accmax%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000002d /f
if %accmax%==x ECHO Set Accelerate to Max keybind to X - Done!
if %accmax%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000015 /f
if %accmax%==y ECHO Set Accelerate to Max keybind to Y - Done!
if %accmax%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000002c /f
if %accmax%==z ECHO Set Accelerate to Max keybind to Z - Done!
if %accmax%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000029 /f
if %accmax%==tilde ECHO Set Accelerate to Max keybind to ~ - Done!
if %accmax%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000000d /f
if %accmax%==equal ECHO Set Accelerate to Max keybind to = - Done!
if %accmax%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000000c /f
if %accmax%==minus ECHO Set Accelerate to Max keybind to - - Done!
if %accmax%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000001a /f
if %accmax%==lbracket ECHO Set Accelerate to Max keybind to [ - Done!
if %accmax%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000001b /f
if %accmax%==rbracket ECHO Set Accelerate to Max keybind to ] - Done!
if %accmax%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000035 /f
if %accmax%==slash ECHO Set Accelerate to Max keybind to / - Done!
if %accmax%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000002b /f
if %accmax%==bslash ECHO Set Accelerate to Max keybind to \ - Done!
if %accmax%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000027 /f
if %accmax%==colon ECHO Set Accelerate to Max keybind to ; - Done!
if %accmax%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000028 /f
if %accmax%==quote ECHO Set Accelerate to Max keybind to ' - Done!
if %accmax%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000033 /f
if %accmax%==comma ECHO Set Accelerate to Max keybind to , - Done!
if %accmax%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000034 /f
if %accmax%==period ECHO Set Accelerate to Max keybind to . - Done!
if %accmax%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000000e /f
if %accmax%==bckspc ECHO Set Accelerate to Max keybind to Backspace - Done!
if %accmax%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000000f /f
if %accmax%==tab ECHO Set Accelerate to Max keybind to Tab - Done!
if %accmax%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000001c /f
if %accmax%==enter ECHO Set Accelerate to Max keybind to Enter - Done!
if %accmax%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000039 /f
if %accmax%==space ECHO Set Accelerate to Max keybind to Space Bar - Done!
if %accmax%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000001 /f
if %accmax%==esc ECHO Set Accelerate to Max keybind to Escape - Done!
if %accmax%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000052 /f
if %accmax%==ins ECHO Set Accelerate to Max keybind to Insert - Done!
if %accmax%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000053 /f
if %accmax%==del ECHO Set Accelerate to Max keybind to Delete - Done!
if %accmax%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000047 /f
if %accmax%==home ECHO Set Accelerate to Max keybind to Home - Done!
if %accmax%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000004f /f
if %accmax%==end ECHO Set Accelerate to Max keybind to End - Done!
if %accmax%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000049 /f
if %accmax%==pgup ECHO Set Accelerate to Max keybind to Page Up - Done!
if %accmax%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000051 /f
if %accmax%==pgdn ECHO Set Accelerate to Max keybind to Page Down - Done!
if %accmax%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000003b /f
if %accmax%==f1 ECHO Set Accelerate to Max keybind to F1 - Done!
if %accmax%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000003c /f
if %accmax%==f2 ECHO Set Accelerate to Max keybind to F2 - Done!
if %accmax%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000003d /f
if %accmax%==f3 ECHO Set Accelerate to Max keybind to F3 - Done!
if %accmax%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000003e /f
if %accmax%==f4 ECHO Set Accelerate to Max keybind to F4 - Done!
if %accmax%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000003f /f
if %accmax%==f5 ECHO Set Accelerate to Max keybind to F5 - Done!
if %accmax%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000040 /f
if %accmax%==f6 ECHO Set Accelerate to Max keybind to F6 - Done!
if %accmax%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000041 /f
if %accmax%==f7 ECHO Set Accelerate to Max keybind to F7 - Done!
if %accmax%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000042 /f
if %accmax%==f8 ECHO Set Accelerate to Max keybind to F8 - Done!
if %accmax%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000043 /f
if %accmax%==f9 ECHO Set Accelerate to Max keybind to F9 - Done!
if %accmax%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000044 /f
if %accmax%==f10 ECHO Set Accelerate to Max keybind to F10 - Done!
if %accmax%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000085 /f
if %accmax%==f11 ECHO Set Accelerate to Max keybind to F11 - Done!
if %accmax%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000086 /f
if %accmax%==f12 ECHO Set Accelerate to Max keybind to F12 - Done!
if %accmax%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000004f /f
if %accmax%==num1 ECHO Set Accelerate to Max keybind to Numpad 1 - Done!
if %accmax%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000050 /f
if %accmax%==num2 ECHO Set Accelerate to Max keybind to Numpad 2 - Done!
if %accmax%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000051 /f
if %accmax%==num3 ECHO Set Accelerate to Max keybind to Numpad 3 - Done!
if %accmax%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000004b /f
if %accmax%==num4 ECHO Set Accelerate to Max keybind to Numpad 4 - Done!
if %accmax%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000004c /f
if %accmax%==num5 ECHO Set Accelerate to Max keybind to Numpad 5 - Done!
if %accmax%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000004d /f
if %accmax%==num6 ECHO Set Accelerate to Max keybind to Numpad 6 - Done!
if %accmax%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000047 /f
if %accmax%==num7 ECHO Set Accelerate to Max keybind to Numpad 7 - Done!
if %accmax%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000048 /f
if %accmax%==num8 ECHO Set Accelerate to Max keybind to Numpad 8 - Done!
if %accmax%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000049 /f
if %accmax%==num9 ECHO Set Accelerate to Max keybind to Numpad 9 - Done!
if %accmax%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000037 /f
if %accmax%==numstar ECHO Set Accelerate to Max keybind to Numpad * - Done!
if %accmax%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000004a /f
if %accmax%==numminus ECHO Set Accelerate to Max keybind to Numpad - - Done!
if %accmax%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000004e /f
if %accmax%==numplus ECHO Set Accelerate to Max keybind to Numpad + - Done!
if %accmax%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000048 /f
if %accmax%==up ECHO Set Accelerate to Max keybind to Up Arrow - Done!
if %accmax%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x00000050 /f
if %accmax%==down ECHO Set Accelerate to Max keybind to Down Arrow - Done!
if %accmax%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000004b /f
if %accmax%==left ECHO Set Accelerate to Max keybind to Left Arrow - Done!
if %accmax%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Ahead Max" /t REG_DWORD /d 0x0000004d /f
if %accmax%==right ECHO Set Accelerate to Max keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:reversemax
ECHO                      --- Bind Reverse to Max ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p reversemax="Input a key and press Enter to bind it to Reverse to Max: "
@echo off
if %reversemax%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000001e /f
if %reversemax%==a ECHO Set Reverse to Max keybind to A - Done!
if %reversemax%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000030 /f
if %reversemax%==b ECHO Set Reverse to Max keybind to B - Done!
if %reversemax%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000002e /f
if %reversemax%==c ECHO Set Reverse to Max keybind to C - Done!
if %reversemax%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000020 /f
if %reversemax%==d ECHO Set Reverse to Max keybind to D - Done!
if %reversemax%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000012 /f
if %reversemax%==e ECHO Set Reverse to Max keybind to E - Done!
if %reversemax%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000021 /f
if %reversemax%==f ECHO Set Reverse to Max keybind to F - Done!
if %reversemax%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000022 /f
if %reversemax%==g ECHO Set Reverse to Max keybind to G - Done!
if %reversemax%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000023 /f
if %reversemax%==h ECHO Set Reverse to Max keybind to H - Done!
if %reversemax%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000017 /f
if %reversemax%==i ECHO Set Reverse to Max keybind to I - Done!
if %reversemax%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000024 /f
if %reversemax%==j ECHO Set Reverse to Max keybind to J - Done!
if %reversemax%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000025 /f
if %reversemax%==k ECHO Set Reverse to Max keybind to K - Done!
if %reversemax%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000026 /f
if %reversemax%==l ECHO Set Reverse to Max keybind to L - Done!
if %reversemax%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000032 /f
if %reversemax%==m ECHO Set Reverse to Max keybind to M - Done!
if %reversemax%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000031 /f
if %reversemax%==n ECHO Set Reverse to Max keybind to N - Done!
if %reversemax%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000018 /f
if %reversemax%==o ECHO Set Reverse to Max keybind to O - Done!
if %reversemax%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000019 /f
if %reversemax%==p ECHO Set Reverse to Max keybind to P - Done!
if %reversemax%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000010 /f
if %reversemax%==q ECHO Set Reverse to Max keybind to Q - Done!
if %reversemax%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000013 /f
if %reversemax%==r ECHO Set Reverse to Max keybind to R - Done!
if %reversemax%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000001f /f
if %reversemax%==s ECHO Set Reverse to Max keybind to S - Done!
if %reversemax%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000014 /f
if %reversemax%==t ECHO Set Reverse to Max keybind to T - Done!
if %reversemax%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000016 /f
if %reversemax%==u ECHO Set Reverse to Max keybind to U - Done!
if %reversemax%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000002f /f
if %reversemax%==v ECHO Set Reverse to Max keybind to V - Done!
if %reversemax%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000011 /f
if %reversemax%==w ECHO Set Reverse to Max keybind to W - Done!
if %reversemax%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000002d /f
if %reversemax%==x ECHO Set Reverse to Max keybind to X - Done!
if %reversemax%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000015 /f
if %reversemax%==y ECHO Set Reverse to Max keybind to Y - Done!
if %reversemax%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000002c /f
if %reversemax%==z ECHO Set Reverse to Max keybind to Z - Done!
if %reversemax%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000029 /f
if %reversemax%==tilde ECHO Set Reverse to Max keybind to ~ - Done!
if %reversemax%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000000d /f
if %reversemax%==equal ECHO Set Reverse to Max keybind to = - Done!
if %reversemax%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000000c /f
if %reversemax%==minus ECHO Set Reverse to Max keybind to - - Done!
if %reversemax%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000001a /f
if %reversemax%==lbracket ECHO Set Reverse to Max keybind to [ - Done!
if %reversemax%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000001b /f
if %reversemax%==rbracket ECHO Set Reverse to Max keybind to ] - Done!
if %reversemax%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000035 /f
if %reversemax%==slash ECHO Set Reverse to Max keybind to / - Done!
if %reversemax%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000002b /f
if %reversemax%==bslash ECHO Set Reverse to Max keybind to \ - Done!
if %reversemax%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000027 /f
if %reversemax%==colon ECHO Set Reverse to Max keybind to ; - Done!
if %reversemax%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000028 /f
if %reversemax%==quote ECHO Set Reverse to Max keybind to ' - Done!
if %reversemax%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000033 /f
if %reversemax%==comma ECHO Set Reverse to Max keybind to , - Done!
if %reversemax%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000034 /f
if %reversemax%==period ECHO Set Reverse to Max keybind to . - Done!
if %reversemax%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000000e /f
if %reversemax%==bckspc ECHO Set Reverse to Max keybind to Backspace - Done!
if %reversemax%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000000f /f
if %reversemax%==tab ECHO Set Reverse to Max keybind to Tab - Done!
if %reversemax%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000001c /f
if %reversemax%==enter ECHO Set Reverse to Max keybind to Enter - Done!
if %reversemax%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000039 /f
if %reversemax%==space ECHO Set Reverse to Max keybind to Space Bar - Done!
if %reversemax%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000001 /f
if %reversemax%==esc ECHO Set Reverse to Max keybind to Escape - Done!
if %reversemax%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000052 /f
if %reversemax%==ins ECHO Set Reverse to Max keybind to Insert - Done!
if %reversemax%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000053 /f
if %reversemax%==del ECHO Set Reverse to Max keybind to Delete - Done!
if %reversemax%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000047 /f
if %reversemax%==home ECHO Set Reverse to Max keybind to Home - Done!
if %reversemax%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000004f /f
if %reversemax%==end ECHO Set Reverse to Max keybind to End - Done!
if %reversemax%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000049 /f
if %reversemax%==pgup ECHO Set Reverse to Max keybind to Page Up - Done!
if %reversemax%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000051 /f
if %reversemax%==pgdn ECHO Set Reverse to Max keybind to Page Down - Done!
if %reversemax%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000003b /f
if %reversemax%==f1 ECHO Set Reverse to Max keybind to F1 - Done!
if %reversemax%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000003c /f
if %reversemax%==f2 ECHO Set Reverse to Max keybind to F2 - Done!
if %reversemax%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000003d /f
if %reversemax%==f3 ECHO Set Reverse to Max keybind to F3 - Done!
if %reversemax%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000003e /f
if %reversemax%==f4 ECHO Set Reverse to Max keybind to F4 - Done!
if %reversemax%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000003f /f
if %reversemax%==f5 ECHO Set Reverse to Max keybind to F5 - Done!
if %reversemax%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000040 /f
if %reversemax%==f6 ECHO Set Reverse to Max keybind to F6 - Done!
if %reversemax%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000041 /f
if %reversemax%==f7 ECHO Set Reverse to Max keybind to F7 - Done!
if %reversemax%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000042 /f
if %reversemax%==f8 ECHO Set Reverse to Max keybind to F8 - Done!
if %reversemax%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000043 /f
if %reversemax%==f9 ECHO Set Reverse to Max keybind to F9 - Done!
if %reversemax%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000044 /f
if %reversemax%==f10 ECHO Set Reverse to Max keybind to F10 - Done!
if %reversemax%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000085 /f
if %reversemax%==f11 ECHO Set Reverse to Max keybind to F11 - Done!
if %reversemax%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000086 /f
if %reversemax%==f12 ECHO Set Reverse to Max keybind to F12 - Done!
if %reversemax%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000004f /f
if %reversemax%==num1 ECHO Set Reverse to Max keybind to Numpad 1 - Done!
if %reversemax%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000050 /f
if %reversemax%==num2 ECHO Set Reverse to Max keybind to Numpad 2 - Done!
if %reversemax%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000051 /f
if %reversemax%==num3 ECHO Set Reverse to Max keybind to Numpad 3 - Done!
if %reversemax%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000004b /f
if %reversemax%==num4 ECHO Set Reverse to Max keybind to Numpad 4 - Done!
if %reversemax%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000004c /f
if %reversemax%==num5 ECHO Set Reverse to Max keybind to Numpad 5 - Done!
if %reversemax%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000004d /f
if %reversemax%==num6 ECHO Set Reverse to Max keybind to Numpad 6 - Done!
if %reversemax%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000047 /f
if %reversemax%==num7 ECHO Set Reverse to Max keybind to Numpad 7 - Done!
if %reversemax%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000048 /f
if %reversemax%==num8 ECHO Set Reverse to Max keybind to Numpad 8 - Done!
if %reversemax%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000049 /f
if %reversemax%==num9 ECHO Set Reverse to Max keybind to Numpad 9 - Done!
if %reversemax%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000037 /f
if %reversemax%==numstar ECHO Set Reverse to Max keybind to Numpad * - Done!
if %reversemax%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000004a /f
if %reversemax%==numminus ECHO Set Reverse to Max keybind to Numpad - - Done!
if %reversemax%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000004e /f
if %reversemax%==numplus ECHO Set Reverse to Max keybind to Numpad + - Done!
if %reversemax%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000048 /f
if %reversemax%==up ECHO Set Reverse to Max keybind to Up Arrow - Done!
if %reversemax%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x00000050 /f
if %reversemax%==down ECHO Set Reverse to Max keybind to Down Arrow - Done!
if %reversemax%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000004b /f
if %reversemax%==left ECHO Set Reverse to Max keybind to Left Arrow - Done!
if %reversemax%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Reverse Max" /t REG_DWORD /d 0x0000004d /f
if %reversemax%==right ECHO Set Reverse to Max keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:stop
ECHO                      --- Bind Stop ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p stop="Input a key and press Enter to bind it to Stop: "
@echo off
if %stop%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000001e /f
if %stop%==a ECHO Set Stop keybind to A - Done!
if %stop%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000030 /f
if %stop%==b ECHO Set Stop keybind to B - Done!
if %stop%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000002e /f
if %stop%==c ECHO Set Stop keybind to C - Done!
if %stop%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000020 /f
if %stop%==d ECHO Set Stop keybind to D - Done!
if %stop%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000012 /f
if %stop%==e ECHO Set Stop keybind to E - Done!
if %stop%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000021 /f
if %stop%==f ECHO Set Stop keybind to F - Done!
if %stop%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000022 /f
if %stop%==g ECHO Set Stop keybind to G - Done!
if %stop%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000023 /f
if %stop%==h ECHO Set Stop keybind to H - Done!
if %stop%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000017 /f
if %stop%==i ECHO Set Stop keybind to I - Done!
if %stop%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000024 /f
if %stop%==j ECHO Set Stop keybind to J - Done!
if %stop%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000025 /f
if %stop%==k ECHO Set Stop keybind to K - Done!
if %stop%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000026 /f
if %stop%==l ECHO Set Stop keybind to L - Done!
if %stop%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000032 /f
if %stop%==m ECHO Set Stop keybind to M - Done!
if %stop%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000031 /f
if %stop%==n ECHO Set Stop keybind to N - Done!
if %stop%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000018 /f
if %stop%==o ECHO Set Stop keybind to O - Done!
if %stop%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000019 /f
if %stop%==p ECHO Set Stop keybind to P - Done!
if %stop%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000010 /f
if %stop%==q ECHO Set Stop keybind to Q - Done!
if %stop%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000013 /f
if %stop%==r ECHO Set Stop keybind to R - Done!
if %stop%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000001f /f
if %stop%==s ECHO Set Stop keybind to S - Done!
if %stop%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000014 /f
if %stop%==t ECHO Set Stop keybind to T - Done!
if %stop%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000016 /f
if %stop%==u ECHO Set Stop keybind to U - Done!
if %stop%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000002f /f
if %stop%==v ECHO Set Stop keybind to V - Done!
if %stop%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000011 /f
if %stop%==w ECHO Set Stop keybind to W - Done!
if %stop%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000002d /f
if %stop%==x ECHO Set Stop keybind to X - Done!
if %stop%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000015 /f
if %stop%==y ECHO Set Stop keybind to Y - Done!
if %stop%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000002c /f
if %stop%==z ECHO Set Stop keybind to Z - Done!
if %stop%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000029 /f
if %stop%==tilde ECHO Set Stop keybind to ~ - Done!
if %stop%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000000d /f
if %stop%==equal ECHO Set Stop keybind to = - Done!
if %stop%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000000c /f
if %stop%==minus ECHO Set Stop keybind to - - Done!
if %stop%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000001a /f
if %stop%==lbracket ECHO Set Stop keybind to [ - Done!
if %stop%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000001b /f
if %stop%==rbracket ECHO Set Stop keybind to ] - Done!
if %stop%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000035 /f
if %stop%==slash ECHO Set Stop keybind to / - Done!
if %stop%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000002b /f
if %stop%==bslash ECHO Set Stop keybind to \ - Done!
if %stop%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000027 /f
if %stop%==colon ECHO Set Stop keybind to ; - Done!
if %stop%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000028 /f
if %stop%==quote ECHO Set Stop keybind to ' - Done!
if %stop%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000033 /f
if %stop%==comma ECHO Set Stop keybind to , - Done!
if %stop%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000034 /f
if %stop%==period ECHO Set Stop keybind to . - Done!
if %stop%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000000e /f
if %stop%==bckspc ECHO Set Stop keybind to Backspace - Done!
if %stop%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000000f /f
if %stop%==tab ECHO Set Stop keybind to Tab - Done!
if %stop%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000001c /f
if %stop%==enter ECHO Set Stop keybind to Enter - Done!
if %stop%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000039 /f
if %stop%==space ECHO Set Stop keybind to Space Bar - Done!
if %stop%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000001 /f
if %stop%==esc ECHO Set Stop keybind to Escape - Done!
if %stop%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000052 /f
if %stop%==ins ECHO Set Stop keybind to Insert - Done!
if %stop%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000053 /f
if %stop%==del ECHO Set Stop keybind to Delete - Done!
if %stop%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000047 /f
if %stop%==home ECHO Set Stop keybind to Home - Done!
if %stop%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000004f /f
if %stop%==end ECHO Set Stop keybind to End - Done!
if %stop%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000049 /f
if %stop%==pgup ECHO Set Stop keybind to Page Up - Done!
if %stop%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000051 /f
if %stop%==pgdn ECHO Set Stop keybind to Page Down - Done!
if %stop%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000003b /f
if %stop%==f1 ECHO Set Stop keybind to F1 - Done!
if %stop%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000003c /f
if %stop%==f2 ECHO Set Stop keybind to F2 - Done!
if %stop%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000003d /f
if %stop%==f3 ECHO Set Stop keybind to F3 - Done!
if %stop%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000003e /f
if %stop%==f4 ECHO Set Stop keybind to F4 - Done!
if %stop%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000003f /f
if %stop%==f5 ECHO Set Stop keybind to F5 - Done!
if %stop%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000040 /f
if %stop%==f6 ECHO Set Stop keybind to F6 - Done!
if %stop%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000041 /f
if %stop%==f7 ECHO Set Stop keybind to F7 - Done!
if %stop%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000042 /f
if %stop%==f8 ECHO Set Stop keybind to F8 - Done!
if %stop%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000043 /f
if %stop%==f9 ECHO Set Stop keybind to F9 - Done!
if %stop%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000044 /f
if %stop%==f10 ECHO Set Stop keybind to F10 - Done!
if %stop%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000085 /f
if %stop%==f11 ECHO Set Stop keybind to F11 - Done!
if %stop%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000086 /f
if %stop%==f12 ECHO Set Stop keybind to F12 - Done!
if %stop%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000004f /f
if %stop%==num1 ECHO Set Stop keybind to Numpad 1 - Done!
if %stop%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000050 /f
if %stop%==num2 ECHO Set Stop keybind to Numpad 2 - Done!
if %stop%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000051 /f
if %stop%==num3 ECHO Set Stop keybind to Numpad 3 - Done!
if %stop%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000004b /f
if %stop%==num4 ECHO Set Stop keybind to Numpad 4 - Done!
if %stop%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000004c /f
if %stop%==num5 ECHO Set Stop keybind to Numpad 5 - Done!
if %stop%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000004d /f
if %stop%==num6 ECHO Set Stop keybind to Numpad 6 - Done!
if %stop%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000047 /f
if %stop%==num7 ECHO Set Stop keybind to Numpad 7 - Done!
if %stop%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000048 /f
if %stop%==num8 ECHO Set Stop keybind to Numpad 8 - Done!
if %stop%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000049 /f
if %stop%==num9 ECHO Set Stop keybind to Numpad 9 - Done!
if %stop%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000037 /f
if %stop%==numstar ECHO Set Stop keybind to Numpad * - Done!
if %stop%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000004a /f
if %stop%==numminus ECHO Set Stop keybind to Numpad - - Done!
if %stop%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000004e /f
if %stop%==numplus ECHO Set Stop keybind to Numpad + - Done!
if %stop%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000048 /f
if %stop%==up ECHO Set Stop keybind to Up Arrow - Done!
if %stop%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x00000050 /f
if %stop%==down ECHO Set Stop keybind to Down Arrow - Done!
if %stop%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000004b /f
if %stop%==left ECHO Set Stop keybind to Left Arrow - Done!
if %stop%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Stop" /t REG_DWORD /d 0x0000004d /f
if %stop%==right ECHO Set Stop keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:brake
ECHO                      --- Bind Brake ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p brake="Input a key and press Enter to bind it to Brake: "
@echo off
if %brake%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000001e /f
if %brake%==a ECHO Set Brake keybind to A - Done!
if %brake%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000030 /f
if %brake%==b ECHO Set Brake keybind to B - Done!
if %brake%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000002e /f
if %brake%==c ECHO Set Brake keybind to C - Done!
if %brake%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000020 /f
if %brake%==d ECHO Set Brake keybind to D - Done!
if %brake%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000012 /f
if %brake%==e ECHO Set Brake keybind to E - Done!
if %brake%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000021 /f
if %brake%==f ECHO Set Brake keybind to F - Done!
if %brake%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000022 /f
if %brake%==g ECHO Set Brake keybind to G - Done!
if %brake%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000023 /f
if %brake%==h ECHO Set Brake keybind to H - Done!
if %brake%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000017 /f
if %brake%==i ECHO Set Brake keybind to I - Done!
if %brake%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000024 /f
if %brake%==j ECHO Set Brake keybind to J - Done!
if %brake%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000025 /f
if %brake%==k ECHO Set Brake keybind to K - Done!
if %brake%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000026 /f
if %brake%==l ECHO Set Brake keybind to L - Done!
if %brake%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000032 /f
if %brake%==m ECHO Set Brake keybind to M - Done!
if %brake%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000031 /f
if %brake%==n ECHO Set Brake keybind to N - Done!
if %brake%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000018 /f
if %brake%==o ECHO Set Brake keybind to O - Done!
if %brake%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000019 /f
if %brake%==p ECHO Set Brake keybind to P - Done!
if %brake%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000010 /f
if %brake%==q ECHO Set Brake keybind to Q - Done!
if %brake%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000013 /f
if %brake%==r ECHO Set Brake keybind to R - Done!
if %brake%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000001f /f
if %brake%==s ECHO Set Brake keybind to S - Done!
if %brake%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000014 /f
if %brake%==t ECHO Set Brake keybind to T - Done!
if %brake%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000016 /f
if %brake%==u ECHO Set Brake keybind to U - Done!
if %brake%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000002f /f
if %brake%==v ECHO Set Brake keybind to V - Done!
if %brake%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000011 /f
if %brake%==w ECHO Set Brake keybind to W - Done!
if %brake%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000002d /f
if %brake%==x ECHO Set Brake keybind to X - Done!
if %brake%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000015 /f
if %brake%==y ECHO Set Brake keybind to Y - Done!
if %brake%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000002c /f
if %brake%==z ECHO Set Brake keybind to Z - Done!
if %brake%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000029 /f
if %brake%==tilde ECHO Set Brake keybind to ~ - Done!
if %brake%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000000d /f
if %brake%==equal ECHO Set Brake keybind to = - Done!
if %brake%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000000c /f
if %brake%==minus ECHO Set Brake keybind to - - Done!
if %brake%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000001a /f
if %brake%==lbracket ECHO Set Brake keybind to [ - Done!
if %brake%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000001b /f
if %brake%==rbracket ECHO Set Brake keybind to ] - Done!
if %brake%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000035 /f
if %brake%==slash ECHO Set Brake keybind to / - Done!
if %brake%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000002b /f
if %brake%==bslash ECHO Set Brake keybind to \ - Done!
if %brake%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000027 /f
if %brake%==colon ECHO Set Brake keybind to ; - Done!
if %brake%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000028 /f
if %brake%==quote ECHO Set Brake keybind to ' - Done!
if %brake%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000033 /f
if %brake%==comma ECHO Set Brake keybind to , - Done!
if %brake%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000034 /f
if %brake%==period ECHO Set Brake keybind to . - Done!
if %brake%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000000e /f
if %brake%==bckspc ECHO Set Brake keybind to Backspace - Done!
if %brake%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000000f /f
if %brake%==tab ECHO Set Brake keybind to Tab - Done!
if %brake%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000001c /f
if %brake%==enter ECHO Set Brake keybind to Enter - Done!
if %brake%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000039 /f
if %brake%==space ECHO Set Brake keybind to Space Bar - Done!
if %brake%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000001 /f
if %brake%==esc ECHO Set Brake keybind to Escape - Done!
if %brake%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000052 /f
if %brake%==ins ECHO Set Brake keybind to Insert - Done!
if %brake%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000053 /f
if %brake%==del ECHO Set Brake keybind to Delete - Done!
if %brake%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000047 /f
if %brake%==home ECHO Set Brake keybind to Home - Done!
if %brake%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000004f /f
if %brake%==end ECHO Set Brake keybind to End - Done!
if %brake%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000049 /f
if %brake%==pgup ECHO Set Brake keybind to Page Up - Done!
if %brake%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000051 /f
if %brake%==pgdn ECHO Set Brake keybind to Page Down - Done!
if %brake%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000003b /f
if %brake%==f1 ECHO Set Brake keybind to F1 - Done!
if %brake%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000003c /f
if %brake%==f2 ECHO Set Brake keybind to F2 - Done!
if %brake%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000003d /f
if %brake%==f3 ECHO Set Brake keybind to F3 - Done!
if %brake%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000003e /f
if %brake%==f4 ECHO Set Brake keybind to F4 - Done!
if %brake%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000003f /f
if %brake%==f5 ECHO Set Brake keybind to F5 - Done!
if %brake%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000040 /f
if %brake%==f6 ECHO Set Brake keybind to F6 - Done!
if %brake%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000041 /f
if %brake%==f7 ECHO Set Brake keybind to F7 - Done!
if %brake%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000042 /f
if %brake%==f8 ECHO Set Brake keybind to F8 - Done!
if %brake%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000043 /f
if %brake%==f9 ECHO Set Brake keybind to F9 - Done!
if %brake%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000044 /f
if %brake%==f10 ECHO Set Brake keybind to F10 - Done!
if %brake%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000085 /f
if %brake%==f11 ECHO Set Brake keybind to F11 - Done!
if %brake%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000086 /f
if %brake%==f12 ECHO Set Brake keybind to F12 - Done!
if %brake%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000004f /f
if %brake%==num1 ECHO Set Brake keybind to Numpad 1 - Done!
if %brake%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000050 /f
if %brake%==num2 ECHO Set Brake keybind to Numpad 2 - Done!
if %brake%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000051 /f
if %brake%==num3 ECHO Set Brake keybind to Numpad 3 - Done!
if %brake%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000004b /f
if %brake%==num4 ECHO Set Brake keybind to Numpad 4 - Done!
if %brake%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000004c /f
if %brake%==num5 ECHO Set Brake keybind to Numpad 5 - Done!
if %brake%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000004d /f
if %brake%==num6 ECHO Set Brake keybind to Numpad 6 - Done!
if %brake%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000047 /f
if %brake%==num7 ECHO Set Brake keybind to Numpad 7 - Done!
if %brake%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000048 /f
if %brake%==num8 ECHO Set Brake keybind to Numpad 8 - Done!
if %brake%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000049 /f
if %brake%==num9 ECHO Set Brake keybind to Numpad 9 - Done!
if %brake%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000037 /f
if %brake%==numstar ECHO Set Brake keybind to Numpad * - Done!
if %brake%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000004a /f
if %brake%==numminus ECHO Set Brake keybind to Numpad - - Done!
if %brake%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000004e /f
if %brake%==numplus ECHO Set Brake keybind to Numpad + - Done!
if %brake%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000048 /f
if %brake%==up ECHO Set Brake keybind to Up Arrow - Done!
if %brake%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x00000050 /f
if %brake%==down ECHO Set Brake keybind to Down Arrow - Done!
if %brake%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000004b /f
if %brake%==left ECHO Set Brake keybind to Left Arrow - Done!
if %brake%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Brake" /t REG_DWORD /d 0x0000004d /f
if %brake%==right ECHO Set Brake keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:jinkstrafe
ECHO                      --- Bind Jink/Strafe ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p jinkstrafe="Input a key and press Enter to bind it to Jink/Strafe: "
@echo off
if %jinkstrafe%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000001e /f
if %jinkstrafe%==a ECHO Set Jink/Strafe keybind to A - Done!
if %jinkstrafe%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000030 /f
if %jinkstrafe%==b ECHO Set Jink/Strafe keybind to B - Done!
if %jinkstrafe%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000002e /f
if %jinkstrafe%==c ECHO Set Jink/Strafe keybind to C - Done!
if %jinkstrafe%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000020 /f
if %jinkstrafe%==d ECHO Set Jink/Strafe keybind to D - Done!
if %jinkstrafe%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000012 /f
if %jinkstrafe%==e ECHO Set Jink/Strafe keybind to E - Done!
if %jinkstrafe%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000021 /f
if %jinkstrafe%==f ECHO Set Jink/Strafe keybind to F - Done!
if %jinkstrafe%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000022 /f
if %jinkstrafe%==g ECHO Set Jink/Strafe keybind to G - Done!
if %jinkstrafe%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000023 /f
if %jinkstrafe%==h ECHO Set Jink/Strafe keybind to H - Done!
if %jinkstrafe%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000017 /f
if %jinkstrafe%==i ECHO Set Jink/Strafe keybind to I - Done!
if %jinkstrafe%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000024 /f
if %jinkstrafe%==j ECHO Set Jink/Strafe keybind to J - Done!
if %jinkstrafe%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000025 /f
if %jinkstrafe%==k ECHO Set Jink/Strafe keybind to K - Done!
if %jinkstrafe%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000026 /f
if %jinkstrafe%==l ECHO Set Jink/Strafe keybind to L - Done!
if %jinkstrafe%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000032 /f
if %jinkstrafe%==m ECHO Set Jink/Strafe keybind to M - Done!
if %jinkstrafe%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000031 /f
if %jinkstrafe%==n ECHO Set Jink/Strafe keybind to N - Done!
if %jinkstrafe%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000018 /f
if %jinkstrafe%==o ECHO Set Jink/Strafe keybind to O - Done!
if %jinkstrafe%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000019 /f
if %jinkstrafe%==p ECHO Set Jink/Strafe keybind to P - Done!
if %jinkstrafe%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000010 /f
if %jinkstrafe%==q ECHO Set Jink/Strafe keybind to Q - Done!
if %jinkstrafe%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000013 /f
if %jinkstrafe%==r ECHO Set Jink/Strafe keybind to R - Done!
if %jinkstrafe%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000001f /f
if %jinkstrafe%==s ECHO Set Jink/Strafe keybind to S - Done!
if %jinkstrafe%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000014 /f
if %jinkstrafe%==t ECHO Set Jink/Strafe keybind to T - Done!
if %jinkstrafe%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000016 /f
if %jinkstrafe%==u ECHO Set Jink/Strafe keybind to U - Done!
if %jinkstrafe%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000002f /f
if %jinkstrafe%==v ECHO Set Jink/Strafe keybind to V - Done!
if %jinkstrafe%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000011 /f
if %jinkstrafe%==w ECHO Set Jink/Strafe keybind to W - Done!
if %jinkstrafe%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000002d /f
if %jinkstrafe%==x ECHO Set Jink/Strafe keybind to X - Done!
if %jinkstrafe%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000015 /f
if %jinkstrafe%==y ECHO Set Jink/Strafe keybind to Y - Done!
if %jinkstrafe%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000002c /f
if %jinkstrafe%==z ECHO Set Jink/Strafe keybind to Z - Done!
if %jinkstrafe%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000029 /f
if %jinkstrafe%==tilde ECHO Set Jink/Strafe keybind to ~ - Done!
if %jinkstrafe%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000000d /f
if %jinkstrafe%==equal ECHO Set Jink/Strafe keybind to = - Done!
if %jinkstrafe%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000000c /f
if %jinkstrafe%==minus ECHO Set Jink/Strafe keybind to - - Done!
if %jinkstrafe%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000001a /f
if %jinkstrafe%==lbracket ECHO Set Jink/Strafe keybind to [ - Done!
if %jinkstrafe%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000001b /f
if %jinkstrafe%==rbracket ECHO Set Jink/Strafe keybind to ] - Done!
if %jinkstrafe%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000035 /f
if %jinkstrafe%==slash ECHO Set Jink/Strafe keybind to / - Done!
if %jinkstrafe%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000002b /f
if %jinkstrafe%==bslash ECHO Set Jink/Strafe keybind to \ - Done!
if %jinkstrafe%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000027 /f
if %jinkstrafe%==colon ECHO Set Jink/Strafe keybind to ; - Done!
if %jinkstrafe%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000028 /f
if %jinkstrafe%==quote ECHO Set Jink/Strafe keybind to ' - Done!
if %jinkstrafe%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000033 /f
if %jinkstrafe%==comma ECHO Set Jink/Strafe keybind to , - Done!
if %jinkstrafe%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000034 /f
if %jinkstrafe%==period ECHO Set Jink/Strafe keybind to . - Done!
if %jinkstrafe%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000000e /f
if %jinkstrafe%==bckspc ECHO Set Jink/Strafe keybind to Backspace - Done!
if %jinkstrafe%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000000f /f
if %jinkstrafe%==tab ECHO Set Jink/Strafe keybind to Tab - Done!
if %jinkstrafe%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000001c /f
if %jinkstrafe%==enter ECHO Set Jink/Strafe keybind to Enter - Done!
if %jinkstrafe%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000039 /f
if %jinkstrafe%==space ECHO Set Jink/Strafe keybind to Space Bar - Done!
if %jinkstrafe%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000001 /f
if %jinkstrafe%==esc ECHO Set Jink/Strafe keybind to Escape - Done!
if %jinkstrafe%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000052 /f
if %jinkstrafe%==ins ECHO Set Jink/Strafe keybind to Insert - Done!
if %jinkstrafe%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000053 /f
if %jinkstrafe%==del ECHO Set Jink/Strafe keybind to Delete - Done!
if %jinkstrafe%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000047 /f
if %jinkstrafe%==home ECHO Set Jink/Strafe keybind to Home - Done!
if %jinkstrafe%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000004f /f
if %jinkstrafe%==end ECHO Set Jink/Strafe keybind to End - Done!
if %jinkstrafe%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000049 /f
if %jinkstrafe%==pgup ECHO Set Jink/Strafe keybind to Page Up - Done!
if %jinkstrafe%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000051 /f
if %jinkstrafe%==pgdn ECHO Set Jink/Strafe keybind to Page Down - Done!
if %jinkstrafe%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000003b /f
if %jinkstrafe%==f1 ECHO Set Jink/Strafe keybind to F1 - Done!
if %jinkstrafe%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000003c /f
if %jinkstrafe%==f2 ECHO Set Jink/Strafe keybind to F2 - Done!
if %jinkstrafe%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000003d /f
if %jinkstrafe%==f3 ECHO Set Jink/Strafe keybind to F3 - Done!
if %jinkstrafe%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000003e /f
if %jinkstrafe%==f4 ECHO Set Jink/Strafe keybind to F4 - Done!
if %jinkstrafe%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000003f /f
if %jinkstrafe%==f5 ECHO Set Jink/Strafe keybind to F5 - Done!
if %jinkstrafe%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000040 /f
if %jinkstrafe%==f6 ECHO Set Jink/Strafe keybind to F6 - Done!
if %jinkstrafe%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000041 /f
if %jinkstrafe%==f7 ECHO Set Jink/Strafe keybind to F7 - Done!
if %jinkstrafe%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000042 /f
if %jinkstrafe%==f8 ECHO Set Jink/Strafe keybind to F8 - Done!
if %jinkstrafe%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000043 /f
if %jinkstrafe%==f9 ECHO Set Jink/Strafe keybind to F9 - Done!
if %jinkstrafe%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000044 /f
if %jinkstrafe%==f10 ECHO Set Jink/Strafe keybind to F10 - Done!
if %jinkstrafe%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000085 /f
if %jinkstrafe%==f11 ECHO Set Jink/Strafe keybind to F11 - Done!
if %jinkstrafe%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000086 /f
if %jinkstrafe%==f12 ECHO Set Jink/Strafe keybind to F12 - Done!
if %jinkstrafe%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000004f /f
if %jinkstrafe%==num1 ECHO Set Jink/Strafe keybind to Numpad 1 - Done!
if %jinkstrafe%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000050 /f
if %jinkstrafe%==num2 ECHO Set Jink/Strafe keybind to Numpad 2 - Done!
if %jinkstrafe%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000051 /f
if %jinkstrafe%==num3 ECHO Set Jink/Strafe keybind to Numpad 3 - Done!
if %jinkstrafe%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000004b /f
if %jinkstrafe%==num4 ECHO Set Jink/Strafe keybind to Numpad 4 - Done!
if %jinkstrafe%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000004c /f
if %jinkstrafe%==num5 ECHO Set Jink/Strafe keybind to Numpad 5 - Done!
if %jinkstrafe%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000004d /f
if %jinkstrafe%==num6 ECHO Set Jink/Strafe keybind to Numpad 6 - Done!
if %jinkstrafe%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000047 /f
if %jinkstrafe%==num7 ECHO Set Jink/Strafe keybind to Numpad 7 - Done!
if %jinkstrafe%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000048 /f
if %jinkstrafe%==num8 ECHO Set Jink/Strafe keybind to Numpad 8 - Done!
if %jinkstrafe%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000049 /f
if %jinkstrafe%==num9 ECHO Set Jink/Strafe keybind to Numpad 9 - Done!
if %jinkstrafe%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000037 /f
if %jinkstrafe%==numstar ECHO Set Jink/Strafe keybind to Numpad * - Done!
if %jinkstrafe%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000004a /f
if %jinkstrafe%==numminus ECHO Set Jink/Strafe keybind to Numpad - - Done!
if %jinkstrafe%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000004e /f
if %jinkstrafe%==numplus ECHO Set Jink/Strafe keybind to Numpad + - Done!
if %jinkstrafe%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000048 /f
if %jinkstrafe%==up ECHO Set Jink/Strafe keybind to Up Arrow - Done!
if %jinkstrafe%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x00000050 /f
if %jinkstrafe%==down ECHO Set Jink/Strafe keybind to Down Arrow - Done!
if %jinkstrafe%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000004b /f
if %jinkstrafe%==left ECHO Set Jink/Strafe keybind to Left Arrow - Done!
if %jinkstrafe%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Jink/Strafe" /t REG_DWORD /d 0x0000004d /f
if %jinkstrafe%==right ECHO Set Jink/Strafe keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:autopilot
ECHO                      --- Bind Autopilot ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p apilot="Input a key and press Enter to bind it to Autopilot: "
@echo off
if %apilot%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000001e /f
if %apilot%==a ECHO Set Autopilot keybind to A - Done!
if %apilot%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000030 /f
if %apilot%==b ECHO Set Autopilot keybind to B - Done!
if %apilot%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000002e /f
if %apilot%==c ECHO Set Autopilot keybind to C - Done!
if %apilot%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000020 /f
if %apilot%==d ECHO Set Autopilot keybind to D - Done!
if %apilot%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000012 /f
if %apilot%==e ECHO Set Autopilot keybind to E - Done!
if %apilot%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000021 /f
if %apilot%==f ECHO Set Autopilot keybind to F - Done!
if %apilot%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000022 /f
if %apilot%==g ECHO Set Autopilot keybind to G - Done!
if %apilot%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000023 /f
if %apilot%==h ECHO Set Autopilot keybind to H - Done!
if %apilot%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000017 /f
if %apilot%==i ECHO Set Autopilot keybind to I - Done!
if %apilot%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000024 /f
if %apilot%==j ECHO Set Autopilot keybind to J - Done!
if %apilot%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000025 /f
if %apilot%==k ECHO Set Autopilot keybind to K - Done!
if %apilot%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000026 /f
if %apilot%==l ECHO Set Autopilot keybind to L - Done!
if %apilot%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000032 /f
if %apilot%==m ECHO Set Autopilot keybind to M - Done!
if %apilot%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000031 /f
if %apilot%==n ECHO Set Autopilot keybind to N - Done!
if %apilot%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000018 /f
if %apilot%==o ECHO Set Autopilot keybind to O - Done!
if %apilot%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000019 /f
if %apilot%==p ECHO Set Autopilot keybind to P - Done!
if %apilot%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000010 /f
if %apilot%==q ECHO Set Autopilot keybind to Q - Done!
if %apilot%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000013 /f
if %apilot%==r ECHO Set Autopilot keybind to R - Done!
if %apilot%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000001f /f
if %apilot%==s ECHO Set Autopilot keybind to S - Done!
if %apilot%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000014 /f
if %apilot%==t ECHO Set Autopilot keybind to T - Done!
if %apilot%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000016 /f
if %apilot%==u ECHO Set Autopilot keybind to U - Done!
if %apilot%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000002f /f
if %apilot%==v ECHO Set Autopilot keybind to V - Done!
if %apilot%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000011 /f
if %apilot%==w ECHO Set Autopilot keybind to W - Done!
if %apilot%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000002d /f
if %apilot%==x ECHO Set Autopilot keybind to X - Done!
if %apilot%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000015 /f
if %apilot%==y ECHO Set Autopilot keybind to Y - Done!
if %apilot%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000002c /f
if %apilot%==z ECHO Set Autopilot keybind to Z - Done!
if %apilot%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000029 /f
if %apilot%==tilde ECHO Set Autopilot keybind to ~ - Done!
if %apilot%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000000d /f
if %apilot%==equal ECHO Set Autopilot keybind to = - Done!
if %apilot%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000000c /f
if %apilot%==minus ECHO Set Autopilot keybind to - - Done!
if %apilot%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000001a /f
if %apilot%==lbracket ECHO Set Autopilot keybind to [ - Done!
if %apilot%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000001b /f
if %apilot%==rbracket ECHO Set Autopilot keybind to ] - Done!
if %apilot%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000035 /f
if %apilot%==slash ECHO Set Autopilot keybind to / - Done!
if %apilot%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000002b /f
if %apilot%==bslash ECHO Set Autopilot keybind to \ - Done!
if %apilot%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000027 /f
if %apilot%==colon ECHO Set Autopilot keybind to ; - Done!
if %apilot%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000028 /f
if %apilot%==quote ECHO Set Autopilot keybind to ' - Done!
if %apilot%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000033 /f
if %apilot%==comma ECHO Set Autopilot keybind to , - Done!
if %apilot%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000034 /f
if %apilot%==period ECHO Set Autopilot keybind to . - Done!
if %apilot%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000000e /f
if %apilot%==bckspc ECHO Set Autopilot keybind to Backspace - Done!
if %apilot%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000000f /f
if %apilot%==tab ECHO Set Autopilot keybind to Tab - Done!
if %apilot%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000001c /f
if %apilot%==enter ECHO Set Autopilot keybind to Enter - Done!
if %apilot%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000039 /f
if %apilot%==space ECHO Set Autopilot keybind to Space Bar - Done!
if %apilot%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000001 /f
if %apilot%==esc ECHO Set Autopilot keybind to Escape - Done!
if %apilot%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000052 /f
if %apilot%==ins ECHO Set Autopilot keybind to Insert - Done!
if %apilot%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000053 /f
if %apilot%==del ECHO Set Autopilot keybind to Delete - Done!
if %apilot%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000047 /f
if %apilot%==home ECHO Set Autopilot keybind to Home - Done!
if %apilot%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000004f /f
if %apilot%==end ECHO Set Autopilot keybind to End - Done!
if %apilot%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000049 /f
if %apilot%==pgup ECHO Set Autopilot keybind to Page Up - Done!
if %apilot%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000051 /f
if %apilot%==pgdn ECHO Set Autopilot keybind to Page Down - Done!
if %apilot%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000003b /f
if %apilot%==f1 ECHO Set Autopilot keybind to F1 - Done!
if %apilot%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000003c /f
if %apilot%==f2 ECHO Set Autopilot keybind to F2 - Done!
if %apilot%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000003d /f
if %apilot%==f3 ECHO Set Autopilot keybind to F3 - Done!
if %apilot%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000003e /f
if %apilot%==f4 ECHO Set Autopilot keybind to F4 - Done!
if %apilot%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000003f /f
if %apilot%==f5 ECHO Set Autopilot keybind to F5 - Done!
if %apilot%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000040 /f
if %apilot%==f6 ECHO Set Autopilot keybind to F6 - Done!
if %apilot%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000041 /f
if %apilot%==f7 ECHO Set Autopilot keybind to F7 - Done!
if %apilot%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000042 /f
if %apilot%==f8 ECHO Set Autopilot keybind to F8 - Done!
if %apilot%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000043 /f
if %apilot%==f9 ECHO Set Autopilot keybind to F9 - Done!
if %apilot%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000044 /f
if %apilot%==f10 ECHO Set Autopilot keybind to F10 - Done!
if %apilot%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000085 /f
if %apilot%==f11 ECHO Set Autopilot keybind to F11 - Done!
if %apilot%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000086 /f
if %apilot%==f12 ECHO Set Autopilot keybind to F12 - Done!
if %apilot%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000004f /f
if %apilot%==num1 ECHO Set Autopilot keybind to Numpad 1 - Done!
if %apilot%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000050 /f
if %apilot%==num2 ECHO Set Autopilot keybind to Numpad 2 - Done!
if %apilot%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000051 /f
if %apilot%==num3 ECHO Set Autopilot keybind to Numpad 3 - Done!
if %apilot%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000004b /f
if %apilot%==num4 ECHO Set Autopilot keybind to Numpad 4 - Done!
if %apilot%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000004c /f
if %apilot%==num5 ECHO Set Autopilot keybind to Numpad 5 - Done!
if %apilot%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000004d /f
if %apilot%==num6 ECHO Set Autopilot keybind to Numpad 6 - Done!
if %apilot%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000047 /f
if %apilot%==num7 ECHO Set Autopilot keybind to Numpad 7 - Done!
if %apilot%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000048 /f
if %apilot%==num8 ECHO Set Autopilot keybind to Numpad 8 - Done!
if %apilot%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000049 /f
if %apilot%==num9 ECHO Set Autopilot keybind to Numpad 9 - Done!
if %apilot%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000037 /f
if %apilot%==numstar ECHO Set Autopilot keybind to Numpad * - Done!
if %apilot%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000004a /f
if %apilot%==numminus ECHO Set Autopilot keybind to Numpad - - Done!
if %apilot%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000004e /f
if %apilot%==numplus ECHO Set Autopilot keybind to Numpad + - Done!
if %apilot%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000048 /f
if %apilot%==up ECHO Set Autopilot keybind to Up Arrow - Done!
if %apilot%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x00000050 /f
if %apilot%==down ECHO Set Autopilot keybind to Down Arrow - Done!
if %apilot%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000004b /f
if %apilot%==left ECHO Set Autopilot keybind to Left Arrow - Done!
if %apilot%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Autopilot" /t REG_DWORD /d 0x0000004d /f
if %apilot%==right ECHO Set Autopilot keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:up
ECHO                      --- Bind Up ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p up="Input a key and press Enter to bind it to Up: "
@echo off
if %up%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000001e /f
if %up%==a ECHO Set Up keybind to A - Done!
if %up%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000030 /f
if %up%==b ECHO Set Up keybind to B - Done!
if %up%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000002e /f
if %up%==c ECHO Set Up keybind to C - Done!
if %up%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000020 /f
if %up%==d ECHO Set Up keybind to D - Done!
if %up%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000012 /f
if %up%==e ECHO Set Up keybind to E - Done!
if %up%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000021 /f
if %up%==f ECHO Set Up keybind to F - Done!
if %up%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000022 /f
if %up%==g ECHO Set Up keybind to G - Done!
if %up%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000023 /f
if %up%==h ECHO Set Up keybind to H - Done!
if %up%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000017 /f
if %up%==i ECHO Set Up keybind to I - Done!
if %up%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000024 /f
if %up%==j ECHO Set Up keybind to J - Done!
if %up%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000025 /f
if %up%==k ECHO Set Up keybind to K - Done!
if %up%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000026 /f
if %up%==l ECHO Set Up keybind to L - Done!
if %up%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000032 /f
if %up%==m ECHO Set Up keybind to M - Done!
if %up%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000031 /f
if %up%==n ECHO Set Up keybind to N - Done!
if %up%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000018 /f
if %up%==o ECHO Set Up keybind to O - Done!
if %up%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000019 /f
if %up%==p ECHO Set Up keybind to P - Done!
if %up%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000010 /f
if %up%==q ECHO Set Up keybind to Q - Done!
if %up%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000013 /f
if %up%==r ECHO Set Up keybind to R - Done!
if %up%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000001f /f
if %up%==s ECHO Set Up keybind to S - Done!
if %up%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000014 /f
if %up%==t ECHO Set Up keybind to T - Done!
if %up%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000016 /f
if %up%==u ECHO Set Up keybind to U - Done!
if %up%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000002f /f
if %up%==v ECHO Set Up keybind to V - Done!
if %up%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000011 /f
if %up%==w ECHO Set Up keybind to W - Done!
if %up%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000002d /f
if %up%==x ECHO Set Up keybind to X - Done!
if %up%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000015 /f
if %up%==y ECHO Set Up keybind to Y - Done!
if %up%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000002c /f
if %up%==z ECHO Set Up keybind to Z - Done!
if %up%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000029 /f
if %up%==tilde ECHO Set Up keybind to ~ - Done!
if %up%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000000d /f
if %up%==equal ECHO Set Up keybind to = - Done!
if %up%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000000c /f
if %up%==minus ECHO Set Up keybind to - - Done!
if %up%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000001a /f
if %up%==lbracket ECHO Set Up keybind to [ - Done!
if %up%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000001b /f
if %up%==rbracket ECHO Set Up keybind to ] - Done!
if %up%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000035 /f
if %up%==slash ECHO Set Up keybind to / - Done!
if %up%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000002b /f
if %up%==bslash ECHO Set Up keybind to \ - Done!
if %up%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000027 /f
if %up%==colon ECHO Set Up keybind to ; - Done!
if %up%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000028 /f
if %up%==quote ECHO Set Up keybind to ' - Done!
if %up%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000033 /f
if %up%==comma ECHO Set Up keybind to , - Done!
if %up%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000034 /f
if %up%==period ECHO Set Up keybind to . - Done!
if %up%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000000e /f
if %up%==bckspc ECHO Set Up keybind to Backspace - Done!
if %up%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000000f /f
if %up%==tab ECHO Set Up keybind to Tab - Done!
if %up%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000001c /f
if %up%==enter ECHO Set Up keybind to Enter - Done!
if %up%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000039 /f
if %up%==space ECHO Set Up keybind to Space Bar - Done!
if %up%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000001 /f
if %up%==esc ECHO Set Up keybind to Escape - Done!
if %up%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000052 /f
if %up%==ins ECHO Set Up keybind to Insert - Done!
if %up%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000053 /f
if %up%==del ECHO Set Up keybind to Delete - Done!
if %up%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000047 /f
if %up%==home ECHO Set Up keybind to Home - Done!
if %up%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000004f /f
if %up%==end ECHO Set Up keybind to End - Done!
if %up%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000049 /f
if %up%==pgup ECHO Set Up keybind to Page Up - Done!
if %up%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000051 /f
if %up%==pgdn ECHO Set Up keybind to Page Down - Done!
if %up%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000003b /f
if %up%==f1 ECHO Set Up keybind to F1 - Done!
if %up%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000003c /f
if %up%==f2 ECHO Set Up keybind to F2 - Done!
if %up%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000003d /f
if %up%==f3 ECHO Set Up keybind to F3 - Done!
if %up%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000003e /f
if %up%==f4 ECHO Set Up keybind to F4 - Done!
if %up%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000003f /f
if %up%==f5 ECHO Set Up keybind to F5 - Done!
if %up%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000040 /f
if %up%==f6 ECHO Set Up keybind to F6 - Done!
if %up%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000041 /f
if %up%==f7 ECHO Set Up keybind to F7 - Done!
if %up%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000042 /f
if %up%==f8 ECHO Set Up keybind to F8 - Done!
if %up%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000043 /f
if %up%==f9 ECHO Set Up keybind to F9 - Done!
if %up%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000044 /f
if %up%==f10 ECHO Set Up keybind to F10 - Done!
if %up%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000085 /f
if %up%==f11 ECHO Set Up keybind to F11 - Done!
if %up%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000086 /f
if %up%==f12 ECHO Set Up keybind to F12 - Done!
if %up%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000004f /f
if %up%==num1 ECHO Set Up keybind to Numpad 1 - Done!
if %up%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000050 /f
if %up%==num2 ECHO Set Up keybind to Numpad 2 - Done!
if %up%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000051 /f
if %up%==num3 ECHO Set Up keybind to Numpad 3 - Done!
if %up%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000004b /f
if %up%==num4 ECHO Set Up keybind to Numpad 4 - Done!
if %up%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000004c /f
if %up%==num5 ECHO Set Up keybind to Numpad 5 - Done!
if %up%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000004d /f
if %up%==num6 ECHO Set Up keybind to Numpad 6 - Done!
if %up%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000047 /f
if %up%==num7 ECHO Set Up keybind to Numpad 7 - Done!
if %up%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000048 /f
if %up%==num8 ECHO Set Up keybind to Numpad 8 - Done!
if %up%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000049 /f
if %up%==num9 ECHO Set Up keybind to Numpad 9 - Done!
if %up%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000037 /f
if %up%==numstar ECHO Set Up keybind to Numpad * - Done!
if %up%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000004a /f
if %up%==numminus ECHO Set Up keybind to Numpad - - Done!
if %up%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000004e /f
if %up%==numplus ECHO Set Up keybind to Numpad + - Done!
if %up%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000048 /f
if %up%==up ECHO Set Up keybind to Up Arrow - Done!
if %up%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x00000050 /f
if %up%==down ECHO Set Up keybind to Down Arrow - Done!
if %up%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000004b /f
if %up%==left ECHO Set Up keybind to Left Arrow - Done!
if %up%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Up" /t REG_DWORD /d 0x0000004d /f
if %up%==right ECHO Set Up keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:down
ECHO                      --- Bind Down ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p down="Input a key and press Enter to bind it to Down: "
@echo off
if %down%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000001e /f
if %down%==a ECHO Set Down keybind to A - Done!
if %down%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000030 /f
if %down%==b ECHO Set Down keybind to B - Done!
if %down%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000002e /f
if %down%==c ECHO Set Down keybind to C - Done!
if %down%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000020 /f
if %down%==d ECHO Set Down keybind to D - Done!
if %down%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000012 /f
if %down%==e ECHO Set Down keybind to E - Done!
if %down%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000021 /f
if %down%==f ECHO Set Down keybind to F - Done!
if %down%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000022 /f
if %down%==g ECHO Set Down keybind to G - Done!
if %down%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000023 /f
if %down%==h ECHO Set Down keybind to H - Done!
if %down%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000017 /f
if %down%==i ECHO Set Down keybind to I - Done!
if %down%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000024 /f
if %down%==j ECHO Set Down keybind to J - Done!
if %down%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000025 /f
if %down%==k ECHO Set Down keybind to K - Done!
if %down%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000026 /f
if %down%==l ECHO Set Down keybind to L - Done!
if %down%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000032 /f
if %down%==m ECHO Set Down keybind to M - Done!
if %down%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000031 /f
if %down%==n ECHO Set Down keybind to N - Done!
if %down%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000018 /f
if %down%==o ECHO Set Down keybind to O - Done!
if %down%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000019 /f
if %down%==p ECHO Set Down keybind to P - Done!
if %down%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000010 /f
if %down%==q ECHO Set Down keybind to Q - Done!
if %down%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000013 /f
if %down%==r ECHO Set Down keybind to R - Done!
if %down%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000001f /f
if %down%==s ECHO Set Down keybind to S - Done!
if %down%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000014 /f
if %down%==t ECHO Set Down keybind to T - Done!
if %down%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000016 /f
if %down%==u ECHO Set Down keybind to U - Done!
if %down%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000002f /f
if %down%==v ECHO Set Down keybind to V - Done!
if %down%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000011 /f
if %down%==w ECHO Set Down keybind to W - Done!
if %down%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000002d /f
if %down%==x ECHO Set Down keybind to X - Done!
if %down%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000015 /f
if %down%==y ECHO Set Down keybind to Y - Done!
if %down%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000002c /f
if %down%==z ECHO Set Down keybind to Z - Done!
if %down%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000029 /f
if %down%==tilde ECHO Set Down keybind to ~ - Done!
if %down%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000000d /f
if %down%==equal ECHO Set Down keybind to = - Done!
if %down%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000000c /f
if %down%==minus ECHO Set Down keybind to - - Done!
if %down%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000001a /f
if %down%==lbracket ECHO Set Down keybind to [ - Done!
if %down%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000001b /f
if %down%==rbracket ECHO Set Down keybind to ] - Done!
if %down%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000035 /f
if %down%==slash ECHO Set Down keybind to / - Done!
if %down%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000002b /f
if %down%==bslash ECHO Set Down keybind to \ - Done!
if %down%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000027 /f
if %down%==colon ECHO Set Down keybind to ; - Done!
if %down%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000028 /f
if %down%==quote ECHO Set Down keybind to ' - Done!
if %down%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000033 /f
if %down%==comma ECHO Set Down keybind to , - Done!
if %down%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000034 /f
if %down%==period ECHO Set Down keybind to . - Done!
if %down%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000000e /f
if %down%==bckspc ECHO Set Down keybind to Backspace - Done!
if %down%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000000f /f
if %down%==tab ECHO Set Down keybind to Tab - Done!
if %down%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000001c /f
if %down%==enter ECHO Set Down keybind to Enter - Done!
if %down%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000039 /f
if %down%==space ECHO Set Down keybind to Space Bar - Done!
if %down%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000001 /f
if %down%==esc ECHO Set Down keybind to Escape - Done!
if %down%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000052 /f
if %down%==ins ECHO Set Down keybind to Insert - Done!
if %down%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000053 /f
if %down%==del ECHO Set Down keybind to Delete - Done!
if %down%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000047 /f
if %down%==home ECHO Set Down keybind to Home - Done!
if %down%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000004f /f
if %down%==end ECHO Set Down keybind to End - Done!
if %down%==pgdown REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000049 /f
if %down%==pgdown ECHO Set Down keybind to Page Down - Done!
if %down%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000051 /f
if %down%==pgdn ECHO Set Down keybind to Page Down - Done!
if %down%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000003b /f
if %down%==f1 ECHO Set Down keybind to F1 - Done!
if %down%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000003c /f
if %down%==f2 ECHO Set Down keybind to F2 - Done!
if %down%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000003d /f
if %down%==f3 ECHO Set Down keybind to F3 - Done!
if %down%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000003e /f
if %down%==f4 ECHO Set Down keybind to F4 - Done!
if %down%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000003f /f
if %down%==f5 ECHO Set Down keybind to F5 - Done!
if %down%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000040 /f
if %down%==f6 ECHO Set Down keybind to F6 - Done!
if %down%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000041 /f
if %down%==f7 ECHO Set Down keybind to F7 - Done!
if %down%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000042 /f
if %down%==f8 ECHO Set Down keybind to F8 - Done!
if %down%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000043 /f
if %down%==f9 ECHO Set Down keybind to F9 - Done!
if %down%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000044 /f
if %down%==f10 ECHO Set Down keybind to F10 - Done!
if %down%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000085 /f
if %down%==f11 ECHO Set Down keybind to F11 - Done!
if %down%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000086 /f
if %down%==f12 ECHO Set Down keybind to F12 - Done!
if %down%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000004f /f
if %down%==num1 ECHO Set Down keybind to Numpad 1 - Done!
if %down%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000050 /f
if %down%==num2 ECHO Set Down keybind to Numpad 2 - Done!
if %down%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000051 /f
if %down%==num3 ECHO Set Down keybind to Numpad 3 - Done!
if %down%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000004b /f
if %down%==num4 ECHO Set Down keybind to Numpad 4 - Done!
if %down%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000004c /f
if %down%==num5 ECHO Set Down keybind to Numpad 5 - Done!
if %down%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000004d /f
if %down%==num6 ECHO Set Down keybind to Numpad 6 - Done!
if %down%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000047 /f
if %down%==num7 ECHO Set Down keybind to Numpad 7 - Done!
if %down%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000048 /f
if %down%==num8 ECHO Set Down keybind to Numpad 8 - Done!
if %down%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000049 /f
if %down%==num9 ECHO Set Down keybind to Numpad 9 - Done!
if %down%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000037 /f
if %down%==numstar ECHO Set Down keybind to Numpad * - Done!
if %down%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000004a /f
if %down%==numminus ECHO Set Down keybind to Numpad - - Done!
if %down%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000004e /f
if %down%==numplus ECHO Set Down keybind to Numpad + - Done!
if %down%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000048 /f
if %down%==down ECHO Set Down keybind to Down Arrow - Done!
if %down%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x00000050 /f
if %down%==down ECHO Set Down keybind to Down Arrow - Done!
if %down%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000004b /f
if %down%==left ECHO Set Down keybind to Left Arrow - Done!
if %down%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Down" /t REG_DWORD /d 0x0000004d /f
if %down%==right ECHO Set Down keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:left
ECHO                      --- Bind Left ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p left="Input a key and press Enter to bind it to Left: "
@echo off
if %left%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000001e /f
if %left%==a ECHO Set Left keybind to A - Done!
if %left%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000030 /f
if %left%==b ECHO Set Left keybind to B - Done!
if %left%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000002e /f
if %left%==c ECHO Set Left keybind to C - Done!
if %left%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000020 /f
if %left%==d ECHO Set Left keybind to D - Done!
if %left%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000012 /f
if %left%==e ECHO Set Left keybind to E - Done!
if %left%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000021 /f
if %left%==f ECHO Set Left keybind to F - Done!
if %left%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000022 /f
if %left%==g ECHO Set Left keybind to G - Done!
if %left%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000023 /f
if %left%==h ECHO Set Left keybind to H - Done!
if %left%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000017 /f
if %left%==i ECHO Set Left keybind to I - Done!
if %left%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000024 /f
if %left%==j ECHO Set Left keybind to J - Done!
if %left%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000025 /f
if %left%==k ECHO Set Left keybind to K - Done!
if %left%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000026 /f
if %left%==l ECHO Set Left keybind to L - Done!
if %left%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000032 /f
if %left%==m ECHO Set Left keybind to M - Done!
if %left%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000031 /f
if %left%==n ECHO Set Left keybind to N - Done!
if %left%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000018 /f
if %left%==o ECHO Set Left keybind to O - Done!
if %left%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000019 /f
if %left%==p ECHO Set Left keybind to P - Done!
if %left%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000010 /f
if %left%==q ECHO Set Left keybind to Q - Done!
if %left%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000013 /f
if %left%==r ECHO Set Left keybind to R - Done!
if %left%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000001f /f
if %left%==s ECHO Set Left keybind to S - Done!
if %left%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000014 /f
if %left%==t ECHO Set Left keybind to T - Done!
if %left%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000016 /f
if %left%==u ECHO Set Left keybind to U - Done!
if %left%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000002f /f
if %left%==v ECHO Set Left keybind to V - Done!
if %left%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000011 /f
if %left%==w ECHO Set Left keybind to W - Done!
if %left%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000002d /f
if %left%==x ECHO Set Left keybind to X - Done!
if %left%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000015 /f
if %left%==y ECHO Set Left keybind to Y - Done!
if %left%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000002c /f
if %left%==z ECHO Set Left keybind to Z - Done!
if %left%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000029 /f
if %left%==tilde ECHO Set Left keybind to ~ - Done!
if %left%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000000d /f
if %left%==equal ECHO Set Left keybind to = - Done!
if %left%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000000c /f
if %left%==minus ECHO Set Left keybind to - - Done!
if %left%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000001a /f
if %left%==lbracket ECHO Set Left keybind to [ - Done!
if %left%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000001b /f
if %left%==rbracket ECHO Set Left keybind to ] - Done!
if %left%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000035 /f
if %left%==slash ECHO Set Left keybind to / - Done!
if %left%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000002b /f
if %left%==bslash ECHO Set Left keybind to \ - Done!
if %left%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000027 /f
if %left%==colon ECHO Set Left keybind to ; - Done!
if %left%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000028 /f
if %left%==quote ECHO Set Left keybind to ' - Done!
if %left%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000033 /f
if %left%==comma ECHO Set Left keybind to , - Done!
if %left%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000034 /f
if %left%==period ECHO Set Left keybind to . - Done!
if %left%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000000e /f
if %left%==bckspc ECHO Set Left keybind to Backspace - Done!
if %left%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000000f /f
if %left%==tab ECHO Set Left keybind to Tab - Done!
if %left%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000001c /f
if %left%==enter ECHO Set Left keybind to Enter - Done!
if %left%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000039 /f
if %left%==space ECHO Set Left keybind to Space Bar - Done!
if %left%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000001 /f
if %left%==esc ECHO Set Left keybind to Escape - Done!
if %left%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000052 /f
if %left%==ins ECHO Set Left keybind to Insert - Done!
if %left%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000053 /f
if %left%==del ECHO Set Left keybind to Delete - Done!
if %left%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000047 /f
if %left%==home ECHO Set Left keybind to Home - Done!
if %left%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000004f /f
if %left%==end ECHO Set Left keybind to End - Done!
if %left%==pgleft REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000049 /f
if %left%==pgleft ECHO Set Left keybind to Page Left - Done!
if %left%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000051 /f
if %left%==pgdn ECHO Set Left keybind to Page Left - Done!
if %left%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000003b /f
if %left%==f1 ECHO Set Left keybind to F1 - Done!
if %left%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000003c /f
if %left%==f2 ECHO Set Left keybind to F2 - Done!
if %left%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000003d /f
if %left%==f3 ECHO Set Left keybind to F3 - Done!
if %left%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000003e /f
if %left%==f4 ECHO Set Left keybind to F4 - Done!
if %left%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000003f /f
if %left%==f5 ECHO Set Left keybind to F5 - Done!
if %left%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000040 /f
if %left%==f6 ECHO Set Left keybind to F6 - Done!
if %left%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000041 /f
if %left%==f7 ECHO Set Left keybind to F7 - Done!
if %left%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000042 /f
if %left%==f8 ECHO Set Left keybind to F8 - Done!
if %left%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000043 /f
if %left%==f9 ECHO Set Left keybind to F9 - Done!
if %left%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000044 /f
if %left%==f10 ECHO Set Left keybind to F10 - Done!
if %left%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000085 /f
if %left%==f11 ECHO Set Left keybind to F11 - Done!
if %left%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000086 /f
if %left%==f12 ECHO Set Left keybind to F12 - Done!
if %left%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000004f /f
if %left%==num1 ECHO Set Left keybind to Numpad 1 - Done!
if %left%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000050 /f
if %left%==num2 ECHO Set Left keybind to Numpad 2 - Done!
if %left%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000051 /f
if %left%==num3 ECHO Set Left keybind to Numpad 3 - Done!
if %left%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000004b /f
if %left%==num4 ECHO Set Left keybind to Numpad 4 - Done!
if %left%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000004c /f
if %left%==num5 ECHO Set Left keybind to Numpad 5 - Done!
if %left%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000004d /f
if %left%==num6 ECHO Set Left keybind to Numpad 6 - Done!
if %left%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000047 /f
if %left%==num7 ECHO Set Left keybind to Numpad 7 - Done!
if %left%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000048 /f
if %left%==num8 ECHO Set Left keybind to Numpad 8 - Done!
if %left%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000049 /f
if %left%==num9 ECHO Set Left keybind to Numpad 9 - Done!
if %left%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000037 /f
if %left%==numstar ECHO Set Left keybind to Numpad * - Done!
if %left%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000004a /f
if %left%==numminus ECHO Set Left keybind to Numpad - - Done!
if %left%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000004e /f
if %left%==numplus ECHO Set Left keybind to Numpad + - Done!
if %left%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000048 /f
if %left%==left ECHO Set Left keybind to Left Arrow - Done!
if %left%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x00000050 /f
if %left%==left ECHO Set Left keybind to Left Arrow - Done!
if %left%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000004b /f
if %left%==left ECHO Set Left keybind to Left Arrow - Done!
if %left%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Left" /t REG_DWORD /d 0x0000004d /f
if %left%==right ECHO Set Left keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:right
ECHO                      --- Bind Right ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p right="Input a key and press Enter to bind it to Right: "
@echo off
if %right%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000001e /f
if %right%==a ECHO Set Right keybind to A - Done!
if %right%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000030 /f
if %right%==b ECHO Set Right keybind to B - Done!
if %right%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000002e /f
if %right%==c ECHO Set Right keybind to C - Done!
if %right%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000020 /f
if %right%==d ECHO Set Right keybind to D - Done!
if %right%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000012 /f
if %right%==e ECHO Set Right keybind to E - Done!
if %right%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000021 /f
if %right%==f ECHO Set Right keybind to F - Done!
if %right%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000022 /f
if %right%==g ECHO Set Right keybind to G - Done!
if %right%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000023 /f
if %right%==h ECHO Set Right keybind to H - Done!
if %right%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000017 /f
if %right%==i ECHO Set Right keybind to I - Done!
if %right%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000024 /f
if %right%==j ECHO Set Right keybind to J - Done!
if %right%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000025 /f
if %right%==k ECHO Set Right keybind to K - Done!
if %right%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000026 /f
if %right%==l ECHO Set Right keybind to L - Done!
if %right%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000032 /f
if %right%==m ECHO Set Right keybind to M - Done!
if %right%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000031 /f
if %right%==n ECHO Set Right keybind to N - Done!
if %right%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000018 /f
if %right%==o ECHO Set Right keybind to O - Done!
if %right%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000019 /f
if %right%==p ECHO Set Right keybind to P - Done!
if %right%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000010 /f
if %right%==q ECHO Set Right keybind to Q - Done!
if %right%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000013 /f
if %right%==r ECHO Set Right keybind to R - Done!
if %right%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000001f /f
if %right%==s ECHO Set Right keybind to S - Done!
if %right%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000014 /f
if %right%==t ECHO Set Right keybind to T - Done!
if %right%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000016 /f
if %right%==u ECHO Set Right keybind to U - Done!
if %right%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000002f /f
if %right%==v ECHO Set Right keybind to V - Done!
if %right%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000011 /f
if %right%==w ECHO Set Right keybind to W - Done!
if %right%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000002d /f
if %right%==x ECHO Set Right keybind to X - Done!
if %right%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000015 /f
if %right%==y ECHO Set Right keybind to Y - Done!
if %right%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000002c /f
if %right%==z ECHO Set Right keybind to Z - Done!
if %right%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000029 /f
if %right%==tilde ECHO Set Right keybind to ~ - Done!
if %right%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000000d /f
if %right%==equal ECHO Set Right keybind to = - Done!
if %right%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000000c /f
if %right%==minus ECHO Set Right keybind to - - Done!
if %right%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000001a /f
if %right%==lbracket ECHO Set Right keybind to [ - Done!
if %right%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000001b /f
if %right%==rbracket ECHO Set Right keybind to ] - Done!
if %right%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000035 /f
if %right%==slash ECHO Set Right keybind to / - Done!
if %right%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000002b /f
if %right%==bslash ECHO Set Right keybind to \ - Done!
if %right%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000027 /f
if %right%==colon ECHO Set Right keybind to ; - Done!
if %right%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000028 /f
if %right%==quote ECHO Set Right keybind to ' - Done!
if %right%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000033 /f
if %right%==comma ECHO Set Right keybind to , - Done!
if %right%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000034 /f
if %right%==period ECHO Set Right keybind to . - Done!
if %right%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000000e /f
if %right%==bckspc ECHO Set Right keybind to Backspace - Done!
if %right%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000000f /f
if %right%==tab ECHO Set Right keybind to Tab - Done!
if %right%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000001c /f
if %right%==enter ECHO Set Right keybind to Enter - Done!
if %right%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000039 /f
if %right%==space ECHO Set Right keybind to Space Bar - Done!
if %right%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000001 /f
if %right%==esc ECHO Set Right keybind to Escape - Done!
if %right%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000052 /f
if %right%==ins ECHO Set Right keybind to Insert - Done!
if %right%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000053 /f
if %right%==del ECHO Set Right keybind to Delete - Done!
if %right%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000047 /f
if %right%==home ECHO Set Right keybind to Home - Done!
if %right%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000004f /f
if %right%==end ECHO Set Right keybind to End - Done!
if %right%==pgright REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000049 /f
if %right%==pgright ECHO Set Right keybind to Page Right - Done!
if %right%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000051 /f
if %right%==pgdn ECHO Set Right keybind to Page Right - Done!
if %right%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000003b /f
if %right%==f1 ECHO Set Right keybind to F1 - Done!
if %right%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000003c /f
if %right%==f2 ECHO Set Right keybind to F2 - Done!
if %right%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000003d /f
if %right%==f3 ECHO Set Right keybind to F3 - Done!
if %right%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000003e /f
if %right%==f4 ECHO Set Right keybind to F4 - Done!
if %right%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000003f /f
if %right%==f5 ECHO Set Right keybind to F5 - Done!
if %right%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000040 /f
if %right%==f6 ECHO Set Right keybind to F6 - Done!
if %right%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000041 /f
if %right%==f7 ECHO Set Right keybind to F7 - Done!
if %right%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000042 /f
if %right%==f8 ECHO Set Right keybind to F8 - Done!
if %right%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000043 /f
if %right%==f9 ECHO Set Right keybind to F9 - Done!
if %right%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000044 /f
if %right%==f10 ECHO Set Right keybind to F10 - Done!
if %right%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000085 /f
if %right%==f11 ECHO Set Right keybind to F11 - Done!
if %right%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000086 /f
if %right%==f12 ECHO Set Right keybind to F12 - Done!
if %right%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000004f /f
if %right%==num1 ECHO Set Right keybind to Numpad 1 - Done!
if %right%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000050 /f
if %right%==num2 ECHO Set Right keybind to Numpad 2 - Done!
if %right%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000051 /f
if %right%==num3 ECHO Set Right keybind to Numpad 3 - Done!
if %right%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000004b /f
if %right%==num4 ECHO Set Right keybind to Numpad 4 - Done!
if %right%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000004c /f
if %right%==num5 ECHO Set Right keybind to Numpad 5 - Done!
if %right%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000004d /f
if %right%==num6 ECHO Set Right keybind to Numpad 6 - Done!
if %right%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000047 /f
if %right%==num7 ECHO Set Right keybind to Numpad 7 - Done!
if %right%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000048 /f
if %right%==num8 ECHO Set Right keybind to Numpad 8 - Done!
if %right%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000049 /f
if %right%==num9 ECHO Set Right keybind to Numpad 9 - Done!
if %right%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000037 /f
if %right%==numstar ECHO Set Right keybind to Numpad * - Done!
if %right%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000004a /f
if %right%==numminus ECHO Set Right keybind to Numpad - - Done!
if %right%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000004e /f
if %right%==numplus ECHO Set Right keybind to Numpad + - Done!
if %right%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000048 /f
if %right%==right ECHO Set Right keybind to Right Arrow - Done!
if %right%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x00000050 /f
if %right%==right ECHO Set Right keybind to Right Arrow - Done!
if %right%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000004b /f
if %right%==right ECHO Set Right keybind to Right Arrow - Done!
if %right%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Right" /t REG_DWORD /d 0x0000004d /f
if %right%==right ECHO Set Right keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
REM ---------------------- Combat/Scavenging Controls ------------
REM --------------------------------------------------------------------------
:fire
ECHO                      --- Bind Fire ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p fire="Input a key and press Enter to bind it to Fire: "
@echo off
if %fire%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000001e /f
if %fire%==a ECHO Set Fire keybind to A - Done!
if %fire%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000030 /f
if %fire%==b ECHO Set Fire keybind to B - Done!
if %fire%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000002e /f
if %fire%==c ECHO Set Fire keybind to C - Done!
if %fire%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000020 /f
if %fire%==d ECHO Set Fire keybind to D - Done!
if %fire%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000012 /f
if %fire%==e ECHO Set Fire keybind to E - Done!
if %fire%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000021 /f
if %fire%==f ECHO Set Fire keybind to F - Done!
if %fire%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000022 /f
if %fire%==g ECHO Set Fire keybind to G - Done!
if %fire%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000023 /f
if %fire%==h ECHO Set Fire keybind to H - Done!
if %fire%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000017 /f
if %fire%==i ECHO Set Fire keybind to I - Done!
if %fire%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000024 /f
if %fire%==j ECHO Set Fire keybind to J - Done!
if %fire%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000025 /f
if %fire%==k ECHO Set Fire keybind to K - Done!
if %fire%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000026 /f
if %fire%==l ECHO Set Fire keybind to L - Done!
if %fire%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000032 /f
if %fire%==m ECHO Set Fire keybind to M - Done!
if %fire%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000031 /f
if %fire%==n ECHO Set Fire keybind to N - Done!
if %fire%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000018 /f
if %fire%==o ECHO Set Fire keybind to O - Done!
if %fire%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000019 /f
if %fire%==p ECHO Set Fire keybind to P - Done!
if %fire%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000010 /f
if %fire%==q ECHO Set Fire keybind to Q - Done!
if %fire%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000013 /f
if %fire%==r ECHO Set Fire keybind to R - Done!
if %fire%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000001f /f
if %fire%==s ECHO Set Fire keybind to S - Done!
if %fire%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000014 /f
if %fire%==t ECHO Set Fire keybind to T - Done!
if %fire%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000016 /f
if %fire%==u ECHO Set Fire keybind to U - Done!
if %fire%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000002f /f
if %fire%==v ECHO Set Fire keybind to V - Done!
if %fire%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000011 /f
if %fire%==w ECHO Set Fire keybind to W - Done!
if %fire%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000002d /f
if %fire%==x ECHO Set Fire keybind to X - Done!
if %fire%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000015 /f
if %fire%==y ECHO Set Fire keybind to Y - Done!
if %fire%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000002c /f
if %fire%==z ECHO Set Fire keybind to Z - Done!
if %fire%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000029 /f
if %fire%==tilde ECHO Set Fire keybind to ~ - Done!
if %fire%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000000d /f
if %fire%==equal ECHO Set Fire keybind to = - Done!
if %fire%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000000c /f
if %fire%==minus ECHO Set Fire keybind to - - Done!
if %fire%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000001a /f
if %fire%==lbracket ECHO Set Fire keybind to [ - Done!
if %fire%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000001b /f
if %fire%==rbracket ECHO Set Fire keybind to ] - Done!
if %fire%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000035 /f
if %fire%==slash ECHO Set Fire keybind to / - Done!
if %fire%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000002b /f
if %fire%==bslash ECHO Set Fire keybind to \ - Done!
if %fire%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000027 /f
if %fire%==colon ECHO Set Fire keybind to ; - Done!
if %fire%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000028 /f
if %fire%==quote ECHO Set Fire keybind to ' - Done!
if %fire%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000033 /f
if %fire%==comma ECHO Set Fire keybind to , - Done!
if %fire%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000034 /f
if %fire%==period ECHO Set Fire keybind to . - Done!
if %fire%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000000e /f
if %fire%==bckspc ECHO Set Fire keybind to Backspace - Done!
if %fire%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000000f /f
if %fire%==tab ECHO Set Fire keybind to Tab - Done!
if %fire%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000001c /f
if %fire%==enter ECHO Set Fire keybind to Enter - Done!
if %fire%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000039 /f
if %fire%==space ECHO Set Fire keybind to Space Bar - Done!
if %fire%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000001 /f
if %fire%==esc ECHO Set Fire keybind to Escape - Done!
if %fire%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000052 /f
if %fire%==ins ECHO Set Fire keybind to Insert - Done!
if %fire%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000053 /f
if %fire%==del ECHO Set Fire keybind to Delete - Done!
if %fire%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000047 /f
if %fire%==home ECHO Set Fire keybind to Home - Done!
if %fire%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000004f /f
if %fire%==end ECHO Set Fire keybind to End - Done!
if %fire%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000049 /f
if %fire%==pgup ECHO Set Fire keybind to Page Up - Done!
if %fire%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000051 /f
if %fire%==pgdn ECHO Set Fire keybind to Page Down - Done!
if %fire%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000003b /f
if %fire%==f1 ECHO Set Fire keybind to F1 - Done!
if %fire%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000003c /f
if %fire%==f2 ECHO Set Fire keybind to F2 - Done!
if %fire%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000003d /f
if %fire%==f3 ECHO Set Fire keybind to F3 - Done!
if %fire%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000003e /f
if %fire%==f4 ECHO Set Fire keybind to F4 - Done!
if %fire%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000003f /f
if %fire%==f5 ECHO Set Fire keybind to F5 - Done!
if %fire%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000040 /f
if %fire%==f6 ECHO Set Fire keybind to F6 - Done!
if %fire%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000041 /f
if %fire%==f7 ECHO Set Fire keybind to F7 - Done!
if %fire%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000042 /f
if %fire%==f8 ECHO Set Fire keybind to F8 - Done!
if %fire%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000043 /f
if %fire%==f9 ECHO Set Fire keybind to F9 - Done!
if %fire%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000044 /f
if %fire%==f10 ECHO Set Fire keybind to F10 - Done!
if %fire%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000085 /f
if %fire%==f11 ECHO Set Fire keybind to F11 - Done!
if %fire%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000086 /f
if %fire%==f12 ECHO Set Fire keybind to F12 - Done!
if %fire%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000004f /f
if %fire%==num1 ECHO Set Fire keybind to Numpad 1 - Done!
if %fire%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000050 /f
if %fire%==num2 ECHO Set Fire keybind to Numpad 2 - Done!
if %fire%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000051 /f
if %fire%==num3 ECHO Set Fire keybind to Numpad 3 - Done!
if %fire%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000004b /f
if %fire%==num4 ECHO Set Fire keybind to Numpad 4 - Done!
if %fire%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000004c /f
if %fire%==num5 ECHO Set Fire keybind to Numpad 5 - Done!
if %fire%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000004d /f
if %fire%==num6 ECHO Set Fire keybind to Numpad 6 - Done!
if %fire%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000047 /f
if %fire%==num7 ECHO Set Fire keybind to Numpad 7 - Done!
if %fire%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000048 /f
if %fire%==num8 ECHO Set Fire keybind to Numpad 8 - Done!
if %fire%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000049 /f
if %fire%==num9 ECHO Set Fire keybind to Numpad 9 - Done!
if %fire%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000037 /f
if %fire%==numstar ECHO Set Fire keybind to Numpad * - Done!
if %fire%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000004a /f
if %fire%==numminus ECHO Set Fire keybind to Numpad - - Done!
if %fire%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000004e /f
if %fire%==numplus ECHO Set Fire keybind to Numpad + - Done!
if %fire%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000048 /f
if %fire%==up ECHO Set Fire keybind to Up Arrow - Done!
if %fire%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x00000050 /f
if %fire%==down ECHO Set Fire keybind to Down Arrow - Done!
if %fire%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000004b /f
if %fire%==left ECHO Set Fire keybind to Left Arrow - Done!
if %fire%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Fire" /t REG_DWORD /d 0x0000004d /f
if %fire%==right ECHO Set Fire keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:chaff
ECHO                      --- Bind Chaff ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p chaff="Input a key and press Enter to bind it to Chaff: "
@echo off
if %chaff%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000001e /f
if %chaff%==a ECHO Set Chaff keybind to A - Done!
if %chaff%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000030 /f
if %chaff%==b ECHO Set Chaff keybind to B - Done!
if %chaff%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000002e /f
if %chaff%==c ECHO Set Chaff keybind to C - Done!
if %chaff%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000020 /f
if %chaff%==d ECHO Set Chaff keybind to D - Done!
if %chaff%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000012 /f
if %chaff%==e ECHO Set Chaff keybind to E - Done!
if %chaff%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000021 /f
if %chaff%==f ECHO Set Chaff keybind to F - Done!
if %chaff%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000022 /f
if %chaff%==g ECHO Set Chaff keybind to G - Done!
if %chaff%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000023 /f
if %chaff%==h ECHO Set Chaff keybind to H - Done!
if %chaff%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000017 /f
if %chaff%==i ECHO Set Chaff keybind to I - Done!
if %chaff%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000024 /f
if %chaff%==j ECHO Set Chaff keybind to J - Done!
if %chaff%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000025 /f
if %chaff%==k ECHO Set Chaff keybind to K - Done!
if %chaff%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000026 /f
if %chaff%==l ECHO Set Chaff keybind to L - Done!
if %chaff%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000032 /f
if %chaff%==m ECHO Set Chaff keybind to M - Done!
if %chaff%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000031 /f
if %chaff%==n ECHO Set Chaff keybind to N - Done!
if %chaff%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000018 /f
if %chaff%==o ECHO Set Chaff keybind to O - Done!
if %chaff%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000019 /f
if %chaff%==p ECHO Set Chaff keybind to P - Done!
if %chaff%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000010 /f
if %chaff%==q ECHO Set Chaff keybind to Q - Done!
if %chaff%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000013 /f
if %chaff%==r ECHO Set Chaff keybind to R - Done!
if %chaff%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000001f /f
if %chaff%==s ECHO Set Chaff keybind to S - Done!
if %chaff%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000014 /f
if %chaff%==t ECHO Set Chaff keybind to T - Done!
if %chaff%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000016 /f
if %chaff%==u ECHO Set Chaff keybind to U - Done!
if %chaff%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000002f /f
if %chaff%==v ECHO Set Chaff keybind to V - Done!
if %chaff%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000011 /f
if %chaff%==w ECHO Set Chaff keybind to W - Done!
if %chaff%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000002d /f
if %chaff%==x ECHO Set Chaff keybind to X - Done!
if %chaff%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000015 /f
if %chaff%==y ECHO Set Chaff keybind to Y - Done!
if %chaff%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000002c /f
if %chaff%==z ECHO Set Chaff keybind to Z - Done!
if %chaff%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000029 /f
if %chaff%==tilde ECHO Set Chaff keybind to ~ - Done!
if %chaff%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000000d /f
if %chaff%==equal ECHO Set Chaff keybind to = - Done!
if %chaff%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000000c /f
if %chaff%==minus ECHO Set Chaff keybind to - - Done!
if %chaff%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000001a /f
if %chaff%==lbracket ECHO Set Chaff keybind to [ - Done!
if %chaff%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000001b /f
if %chaff%==rbracket ECHO Set Chaff keybind to ] - Done!
if %chaff%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000035 /f
if %chaff%==slash ECHO Set Chaff keybind to / - Done!
if %chaff%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000002b /f
if %chaff%==bslash ECHO Set Chaff keybind to \ - Done!
if %chaff%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000027 /f
if %chaff%==colon ECHO Set Chaff keybind to ; - Done!
if %chaff%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000028 /f
if %chaff%==quote ECHO Set Chaff keybind to ' - Done!
if %chaff%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000033 /f
if %chaff%==comma ECHO Set Chaff keybind to , - Done!
if %chaff%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000034 /f
if %chaff%==period ECHO Set Chaff keybind to . - Done!
if %chaff%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000000e /f
if %chaff%==bckspc ECHO Set Chaff keybind to Backspace - Done!
if %chaff%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000000f /f
if %chaff%==tab ECHO Set Chaff keybind to Tab - Done!
if %chaff%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000001c /f
if %chaff%==enter ECHO Set Chaff keybind to Enter - Done!
if %chaff%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000039 /f
if %chaff%==space ECHO Set Chaff keybind to Space Bar - Done!
if %chaff%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000001 /f
if %chaff%==esc ECHO Set Chaff keybind to Escape - Done!
if %chaff%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000052 /f
if %chaff%==ins ECHO Set Chaff keybind to Insert - Done!
if %chaff%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000053 /f
if %chaff%==del ECHO Set Chaff keybind to Delete - Done!
if %chaff%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000047 /f
if %chaff%==home ECHO Set Chaff keybind to Home - Done!
if %chaff%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000004f /f
if %chaff%==end ECHO Set Chaff keybind to End - Done!
if %chaff%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000049 /f
if %chaff%==pgup ECHO Set Chaff keybind to Page Up - Done!
if %chaff%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000051 /f
if %chaff%==pgdn ECHO Set Chaff keybind to Page Down - Done!
if %chaff%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000003b /f
if %chaff%==f1 ECHO Set Chaff keybind to F1 - Done!
if %chaff%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000003c /f
if %chaff%==f2 ECHO Set Chaff keybind to F2 - Done!
if %chaff%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000003d /f
if %chaff%==f3 ECHO Set Chaff keybind to F3 - Done!
if %chaff%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000003e /f
if %chaff%==f4 ECHO Set Chaff keybind to F4 - Done!
if %chaff%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000003f /f
if %chaff%==f5 ECHO Set Chaff keybind to F5 - Done!
if %chaff%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000040 /f
if %chaff%==f6 ECHO Set Chaff keybind to F6 - Done!
if %chaff%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000041 /f
if %chaff%==f7 ECHO Set Chaff keybind to F7 - Done!
if %chaff%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000042 /f
if %chaff%==f8 ECHO Set Chaff keybind to F8 - Done!
if %chaff%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000043 /f
if %chaff%==f9 ECHO Set Chaff keybind to F9 - Done!
if %chaff%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000044 /f
if %chaff%==f10 ECHO Set Chaff keybind to F10 - Done!
if %chaff%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000085 /f
if %chaff%==f11 ECHO Set Chaff keybind to F11 - Done!
if %chaff%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000086 /f
if %chaff%==f12 ECHO Set Chaff keybind to F12 - Done!
if %chaff%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000004f /f
if %chaff%==num1 ECHO Set Chaff keybind to Numpad 1 - Done!
if %chaff%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000050 /f
if %chaff%==num2 ECHO Set Chaff keybind to Numpad 2 - Done!
if %chaff%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000051 /f
if %chaff%==num3 ECHO Set Chaff keybind to Numpad 3 - Done!
if %chaff%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000004b /f
if %chaff%==num4 ECHO Set Chaff keybind to Numpad 4 - Done!
if %chaff%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000004c /f
if %chaff%==num5 ECHO Set Chaff keybind to Numpad 5 - Done!
if %chaff%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000004d /f
if %chaff%==num6 ECHO Set Chaff keybind to Numpad 6 - Done!
if %chaff%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000047 /f
if %chaff%==num7 ECHO Set Chaff keybind to Numpad 7 - Done!
if %chaff%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000048 /f
if %chaff%==num8 ECHO Set Chaff keybind to Numpad 8 - Done!
if %chaff%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000049 /f
if %chaff%==num9 ECHO Set Chaff keybind to Numpad 9 - Done!
if %chaff%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000037 /f
if %chaff%==numstar ECHO Set Chaff keybind to Numpad * - Done!
if %chaff%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000004a /f
if %chaff%==numminus ECHO Set Chaff keybind to Numpad - - Done!
if %chaff%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000004e /f
if %chaff%==numplus ECHO Set Chaff keybind to Numpad + - Done!
if %chaff%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000048 /f
if %chaff%==up ECHO Set Chaff keybind to Up Arrow - Done!
if %chaff%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x00000050 /f
if %chaff%==down ECHO Set Chaff keybind to Down Arrow - Done!
if %chaff%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000004b /f
if %chaff%==left ECHO Set Chaff keybind to Left Arrow - Done!
if %chaff%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chaff" /t REG_DWORD /d 0x0000004d /f
if %chaff%==right ECHO Set Chaff keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:flare
ECHO                      --- Bind Flare ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p flare="Input a key and press Enter to bind it to Flare: "
@echo off
if %flare%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000001e /f
if %flare%==a ECHO Set Flare keybind to A - Done!
if %flare%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000030 /f
if %flare%==b ECHO Set Flare keybind to B - Done!
if %flare%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000002e /f
if %flare%==c ECHO Set Flare keybind to C - Done!
if %flare%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000020 /f
if %flare%==d ECHO Set Flare keybind to D - Done!
if %flare%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000012 /f
if %flare%==e ECHO Set Flare keybind to E - Done!
if %flare%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000021 /f
if %flare%==f ECHO Set Flare keybind to F - Done!
if %flare%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000022 /f
if %flare%==g ECHO Set Flare keybind to G - Done!
if %flare%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000023 /f
if %flare%==h ECHO Set Flare keybind to H - Done!
if %flare%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000017 /f
if %flare%==i ECHO Set Flare keybind to I - Done!
if %flare%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000024 /f
if %flare%==j ECHO Set Flare keybind to J - Done!
if %flare%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000025 /f
if %flare%==k ECHO Set Flare keybind to K - Done!
if %flare%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000026 /f
if %flare%==l ECHO Set Flare keybind to L - Done!
if %flare%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000032 /f
if %flare%==m ECHO Set Flare keybind to M - Done!
if %flare%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000031 /f
if %flare%==n ECHO Set Flare keybind to N - Done!
if %flare%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000018 /f
if %flare%==o ECHO Set Flare keybind to O - Done!
if %flare%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000019 /f
if %flare%==p ECHO Set Flare keybind to P - Done!
if %flare%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000010 /f
if %flare%==q ECHO Set Flare keybind to Q - Done!
if %flare%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000013 /f
if %flare%==r ECHO Set Flare keybind to R - Done!
if %flare%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000001f /f
if %flare%==s ECHO Set Flare keybind to S - Done!
if %flare%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000014 /f
if %flare%==t ECHO Set Flare keybind to T - Done!
if %flare%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000016 /f
if %flare%==u ECHO Set Flare keybind to U - Done!
if %flare%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000002f /f
if %flare%==v ECHO Set Flare keybind to V - Done!
if %flare%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000011 /f
if %flare%==w ECHO Set Flare keybind to W - Done!
if %flare%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000002d /f
if %flare%==x ECHO Set Flare keybind to X - Done!
if %flare%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000015 /f
if %flare%==y ECHO Set Flare keybind to Y - Done!
if %flare%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000002c /f
if %flare%==z ECHO Set Flare keybind to Z - Done!
if %flare%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000029 /f
if %flare%==tilde ECHO Set Flare keybind to ~ - Done!
if %flare%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000000d /f
if %flare%==equal ECHO Set Flare keybind to = - Done!
if %flare%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000000c /f
if %flare%==minus ECHO Set Flare keybind to - - Done!
if %flare%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000001a /f
if %flare%==lbracket ECHO Set Flare keybind to [ - Done!
if %flare%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000001b /f
if %flare%==rbracket ECHO Set Flare keybind to ] - Done!
if %flare%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000035 /f
if %flare%==slash ECHO Set Flare keybind to / - Done!
if %flare%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000002b /f
if %flare%==bslash ECHO Set Flare keybind to \ - Done!
if %flare%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000027 /f
if %flare%==colon ECHO Set Flare keybind to ; - Done!
if %flare%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000028 /f
if %flare%==quote ECHO Set Flare keybind to ' - Done!
if %flare%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000033 /f
if %flare%==comma ECHO Set Flare keybind to , - Done!
if %flare%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000034 /f
if %flare%==period ECHO Set Flare keybind to . - Done!
if %flare%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000000e /f
if %flare%==bckspc ECHO Set Flare keybind to Backspace - Done!
if %flare%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000000f /f
if %flare%==tab ECHO Set Flare keybind to Tab - Done!
if %flare%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000001c /f
if %flare%==enter ECHO Set Flare keybind to Enter - Done!
if %flare%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000039 /f
if %flare%==space ECHO Set Flare keybind to Space Bar - Done!
if %flare%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000001 /f
if %flare%==esc ECHO Set Flare keybind to Escape - Done!
if %flare%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000052 /f
if %flare%==ins ECHO Set Flare keybind to Insert - Done!
if %flare%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000053 /f
if %flare%==del ECHO Set Flare keybind to Delete - Done!
if %flare%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000047 /f
if %flare%==home ECHO Set Flare keybind to Home - Done!
if %flare%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000004f /f
if %flare%==end ECHO Set Flare keybind to End - Done!
if %flare%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000049 /f
if %flare%==pgup ECHO Set Flare keybind to Page Up - Done!
if %flare%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000051 /f
if %flare%==pgdn ECHO Set Flare keybind to Page Down - Done!
if %flare%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000003b /f
if %flare%==f1 ECHO Set Flare keybind to F1 - Done!
if %flare%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000003c /f
if %flare%==f2 ECHO Set Flare keybind to F2 - Done!
if %flare%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000003d /f
if %flare%==f3 ECHO Set Flare keybind to F3 - Done!
if %flare%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000003e /f
if %flare%==f4 ECHO Set Flare keybind to F4 - Done!
if %flare%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000003f /f
if %flare%==f5 ECHO Set Flare keybind to F5 - Done!
if %flare%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000040 /f
if %flare%==f6 ECHO Set Flare keybind to F6 - Done!
if %flare%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000041 /f
if %flare%==f7 ECHO Set Flare keybind to F7 - Done!
if %flare%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000042 /f
if %flare%==f8 ECHO Set Flare keybind to F8 - Done!
if %flare%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000043 /f
if %flare%==f9 ECHO Set Flare keybind to F9 - Done!
if %flare%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000044 /f
if %flare%==f10 ECHO Set Flare keybind to F10 - Done!
if %flare%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000085 /f
if %flare%==f11 ECHO Set Flare keybind to F11 - Done!
if %flare%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000086 /f
if %flare%==f12 ECHO Set Flare keybind to F12 - Done!
if %flare%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000004f /f
if %flare%==num1 ECHO Set Flare keybind to Numpad 1 - Done!
if %flare%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000050 /f
if %flare%==num2 ECHO Set Flare keybind to Numpad 2 - Done!
if %flare%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000051 /f
if %flare%==num3 ECHO Set Flare keybind to Numpad 3 - Done!
if %flare%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000004b /f
if %flare%==num4 ECHO Set Flare keybind to Numpad 4 - Done!
if %flare%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000004c /f
if %flare%==num5 ECHO Set Flare keybind to Numpad 5 - Done!
if %flare%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000004d /f
if %flare%==num6 ECHO Set Flare keybind to Numpad 6 - Done!
if %flare%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000047 /f
if %flare%==num7 ECHO Set Flare keybind to Numpad 7 - Done!
if %flare%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000048 /f
if %flare%==num8 ECHO Set Flare keybind to Numpad 8 - Done!
if %flare%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000049 /f
if %flare%==num9 ECHO Set Flare keybind to Numpad 9 - Done!
if %flare%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000037 /f
if %flare%==numstar ECHO Set Flare keybind to Numpad * - Done!
if %flare%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000004a /f
if %flare%==numminus ECHO Set Flare keybind to Numpad - - Done!
if %flare%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000004e /f
if %flare%==numplus ECHO Set Flare keybind to Numpad + - Done!
if %flare%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000048 /f
if %flare%==up ECHO Set Flare keybind to Up Arrow - Done!
if %flare%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x00000050 /f
if %flare%==down ECHO Set Flare keybind to Down Arrow - Done!
if %flare%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000004b /f
if %flare%==left ECHO Set Flare keybind to Left Arrow - Done!
if %flare%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Flare" /t REG_DWORD /d 0x0000004d /f
if %flare%==right ECHO Set Flare keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:starshell
ECHO                      --- Bind Starshell ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p starshell="Input a key and press Enter to bind it to Starshell: "
@echo off
if %starshell%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000001e /f
if %starshell%==a ECHO Set Starshell keybind to A - Done!
if %starshell%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000030 /f
if %starshell%==b ECHO Set Starshell keybind to B - Done!
if %starshell%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000002e /f
if %starshell%==c ECHO Set Starshell keybind to C - Done!
if %starshell%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000020 /f
if %starshell%==d ECHO Set Starshell keybind to D - Done!
if %starshell%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000012 /f
if %starshell%==e ECHO Set Starshell keybind to E - Done!
if %starshell%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000021 /f
if %starshell%==f ECHO Set Starshell keybind to F - Done!
if %starshell%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000022 /f
if %starshell%==g ECHO Set Starshell keybind to G - Done!
if %starshell%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000023 /f
if %starshell%==h ECHO Set Starshell keybind to H - Done!
if %starshell%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000017 /f
if %starshell%==i ECHO Set Starshell keybind to I - Done!
if %starshell%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000024 /f
if %starshell%==j ECHO Set Starshell keybind to J - Done!
if %starshell%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000025 /f
if %starshell%==k ECHO Set Starshell keybind to K - Done!
if %starshell%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000026 /f
if %starshell%==l ECHO Set Starshell keybind to L - Done!
if %starshell%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000032 /f
if %starshell%==m ECHO Set Starshell keybind to M - Done!
if %starshell%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000031 /f
if %starshell%==n ECHO Set Starshell keybind to N - Done!
if %starshell%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000018 /f
if %starshell%==o ECHO Set Starshell keybind to O - Done!
if %starshell%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000019 /f
if %starshell%==p ECHO Set Starshell keybind to P - Done!
if %starshell%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000010 /f
if %starshell%==q ECHO Set Starshell keybind to Q - Done!
if %starshell%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000013 /f
if %starshell%==r ECHO Set Starshell keybind to R - Done!
if %starshell%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000001f /f
if %starshell%==s ECHO Set Starshell keybind to S - Done!
if %starshell%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000014 /f
if %starshell%==t ECHO Set Starshell keybind to T - Done!
if %starshell%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000016 /f
if %starshell%==u ECHO Set Starshell keybind to U - Done!
if %starshell%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000002f /f
if %starshell%==v ECHO Set Starshell keybind to V - Done!
if %starshell%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000011 /f
if %starshell%==w ECHO Set Starshell keybind to W - Done!
if %starshell%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000002d /f
if %starshell%==x ECHO Set Starshell keybind to X - Done!
if %starshell%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000015 /f
if %starshell%==y ECHO Set Starshell keybind to Y - Done!
if %starshell%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000002c /f
if %starshell%==z ECHO Set Starshell keybind to Z - Done!
if %starshell%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000029 /f
if %starshell%==tilde ECHO Set Starshell keybind to ~ - Done!
if %starshell%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000000d /f
if %starshell%==equal ECHO Set Starshell keybind to = - Done!
if %starshell%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000000c /f
if %starshell%==minus ECHO Set Starshell keybind to - - Done!
if %starshell%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000001a /f
if %starshell%==lbracket ECHO Set Starshell keybind to [ - Done!
if %starshell%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000001b /f
if %starshell%==rbracket ECHO Set Starshell keybind to ] - Done!
if %starshell%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000035 /f
if %starshell%==slash ECHO Set Starshell keybind to / - Done!
if %starshell%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000002b /f
if %starshell%==bslash ECHO Set Starshell keybind to \ - Done!
if %starshell%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000027 /f
if %starshell%==colon ECHO Set Starshell keybind to ; - Done!
if %starshell%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000028 /f
if %starshell%==quote ECHO Set Starshell keybind to ' - Done!
if %starshell%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000033 /f
if %starshell%==comma ECHO Set Starshell keybind to , - Done!
if %starshell%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000034 /f
if %starshell%==period ECHO Set Starshell keybind to . - Done!
if %starshell%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000000e /f
if %starshell%==bckspc ECHO Set Starshell keybind to Backspace - Done!
if %starshell%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000000f /f
if %starshell%==tab ECHO Set Starshell keybind to Tab - Done!
if %starshell%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000001c /f
if %starshell%==enter ECHO Set Starshell keybind to Enter - Done!
if %starshell%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000039 /f
if %starshell%==space ECHO Set Starshell keybind to Space Bar - Done!
if %starshell%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000001 /f
if %starshell%==esc ECHO Set Starshell keybind to Escape - Done!
if %starshell%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000052 /f
if %starshell%==ins ECHO Set Starshell keybind to Insert - Done!
if %starshell%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000053 /f
if %starshell%==del ECHO Set Starshell keybind to Delete - Done!
if %starshell%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000047 /f
if %starshell%==home ECHO Set Starshell keybind to Home - Done!
if %starshell%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000004f /f
if %starshell%==end ECHO Set Starshell keybind to End - Done!
if %starshell%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000049 /f
if %starshell%==pgup ECHO Set Starshell keybind to Page Up - Done!
if %starshell%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000051 /f
if %starshell%==pgdn ECHO Set Starshell keybind to Page Down - Done!
if %starshell%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000003b /f
if %starshell%==f1 ECHO Set Starshell keybind to F1 - Done!
if %starshell%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000003c /f
if %starshell%==f2 ECHO Set Starshell keybind to F2 - Done!
if %starshell%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000003d /f
if %starshell%==f3 ECHO Set Starshell keybind to F3 - Done!
if %starshell%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000003e /f
if %starshell%==f4 ECHO Set Starshell keybind to F4 - Done!
if %starshell%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000003f /f
if %starshell%==f5 ECHO Set Starshell keybind to F5 - Done!
if %starshell%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000040 /f
if %starshell%==f6 ECHO Set Starshell keybind to F6 - Done!
if %starshell%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000041 /f
if %starshell%==f7 ECHO Set Starshell keybind to F7 - Done!
if %starshell%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000042 /f
if %starshell%==f8 ECHO Set Starshell keybind to F8 - Done!
if %starshell%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000043 /f
if %starshell%==f9 ECHO Set Starshell keybind to F9 - Done!
if %starshell%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000044 /f
if %starshell%==f10 ECHO Set Starshell keybind to F10 - Done!
if %starshell%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000085 /f
if %starshell%==f11 ECHO Set Starshell keybind to F11 - Done!
if %starshell%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000086 /f
if %starshell%==f12 ECHO Set Starshell keybind to F12 - Done!
if %starshell%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000004f /f
if %starshell%==num1 ECHO Set Starshell keybind to Numpad 1 - Done!
if %starshell%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000050 /f
if %starshell%==num2 ECHO Set Starshell keybind to Numpad 2 - Done!
if %starshell%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000051 /f
if %starshell%==num3 ECHO Set Starshell keybind to Numpad 3 - Done!
if %starshell%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000004b /f
if %starshell%==num4 ECHO Set Starshell keybind to Numpad 4 - Done!
if %starshell%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000004c /f
if %starshell%==num5 ECHO Set Starshell keybind to Numpad 5 - Done!
if %starshell%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000004d /f
if %starshell%==num6 ECHO Set Starshell keybind to Numpad 6 - Done!
if %starshell%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000047 /f
if %starshell%==num7 ECHO Set Starshell keybind to Numpad 7 - Done!
if %starshell%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000048 /f
if %starshell%==num8 ECHO Set Starshell keybind to Numpad 8 - Done!
if %starshell%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000049 /f
if %starshell%==num9 ECHO Set Starshell keybind to Numpad 9 - Done!
if %starshell%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000037 /f
if %starshell%==numstar ECHO Set Starshell keybind to Numpad * - Done!
if %starshell%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000004a /f
if %starshell%==numminus ECHO Set Starshell keybind to Numpad - - Done!
if %starshell%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000004e /f
if %starshell%==numplus ECHO Set Starshell keybind to Numpad + - Done!
if %starshell%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000048 /f
if %starshell%==up ECHO Set Starshell keybind to Up Arrow - Done!
if %starshell%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x00000050 /f
if %starshell%==down ECHO Set Starshell keybind to Down Arrow - Done!
if %starshell%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000004b /f
if %starshell%==left ECHO Set Starshell keybind to Left Arrow - Done!
if %starshell%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Starshell" /t REG_DWORD /d 0x0000004d /f
if %starshell%==right ECHO Set Starshell keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:target
ECHO                      --- Bind Target ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p target="Input a key and press Enter to bind it to Target: "
@echo off
if %target%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000001e /f
if %target%==a ECHO Set Target keybind to A - Done!
if %target%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000030 /f
if %target%==b ECHO Set Target keybind to B - Done!
if %target%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000002e /f
if %target%==c ECHO Set Target keybind to C - Done!
if %target%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000020 /f
if %target%==d ECHO Set Target keybind to D - Done!
if %target%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000012 /f
if %target%==e ECHO Set Target keybind to E - Done!
if %target%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000021 /f
if %target%==f ECHO Set Target keybind to F - Done!
if %target%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000022 /f
if %target%==g ECHO Set Target keybind to G - Done!
if %target%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000023 /f
if %target%==h ECHO Set Target keybind to H - Done!
if %target%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000017 /f
if %target%==i ECHO Set Target keybind to I - Done!
if %target%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000024 /f
if %target%==j ECHO Set Target keybind to J - Done!
if %target%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000025 /f
if %target%==k ECHO Set Target keybind to K - Done!
if %target%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000026 /f
if %target%==l ECHO Set Target keybind to L - Done!
if %target%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000032 /f
if %target%==m ECHO Set Target keybind to M - Done!
if %target%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000031 /f
if %target%==n ECHO Set Target keybind to N - Done!
if %target%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000018 /f
if %target%==o ECHO Set Target keybind to O - Done!
if %target%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000019 /f
if %target%==p ECHO Set Target keybind to P - Done!
if %target%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000010 /f
if %target%==q ECHO Set Target keybind to Q - Done!
if %target%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000013 /f
if %target%==r ECHO Set Target keybind to R - Done!
if %target%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000001f /f
if %target%==s ECHO Set Target keybind to S - Done!
if %target%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000014 /f
if %target%==t ECHO Set Target keybind to T - Done!
if %target%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000016 /f
if %target%==u ECHO Set Target keybind to U - Done!
if %target%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000002f /f
if %target%==v ECHO Set Target keybind to V - Done!
if %target%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000011 /f
if %target%==w ECHO Set Target keybind to W - Done!
if %target%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000002d /f
if %target%==x ECHO Set Target keybind to X - Done!
if %target%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000015 /f
if %target%==y ECHO Set Target keybind to Y - Done!
if %target%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000002c /f
if %target%==z ECHO Set Target keybind to Z - Done!
if %target%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000029 /f
if %target%==tilde ECHO Set Target keybind to ~ - Done!
if %target%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000000d /f
if %target%==equal ECHO Set Target keybind to = - Done!
if %target%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000000c /f
if %target%==minus ECHO Set Target keybind to - - Done!
if %target%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000001a /f
if %target%==lbracket ECHO Set Target keybind to [ - Done!
if %target%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000001b /f
if %target%==rbracket ECHO Set Target keybind to ] - Done!
if %target%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000035 /f
if %target%==slash ECHO Set Target keybind to / - Done!
if %target%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000002b /f
if %target%==bslash ECHO Set Target keybind to \ - Done!
if %target%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000027 /f
if %target%==colon ECHO Set Target keybind to ; - Done!
if %target%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000028 /f
if %target%==quote ECHO Set Target keybind to ' - Done!
if %target%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000033 /f
if %target%==comma ECHO Set Target keybind to , - Done!
if %target%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000034 /f
if %target%==period ECHO Set Target keybind to . - Done!
if %target%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000000e /f
if %target%==bckspc ECHO Set Target keybind to Backspace - Done!
if %target%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000000f /f
if %target%==tab ECHO Set Target keybind to Tab - Done!
if %target%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000001c /f
if %target%==enter ECHO Set Target keybind to Enter - Done!
if %target%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000039 /f
if %target%==space ECHO Set Target keybind to Space Bar - Done!
if %target%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000001 /f
if %target%==esc ECHO Set Target keybind to Escape - Done!
if %target%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000052 /f
if %target%==ins ECHO Set Target keybind to Insert - Done!
if %target%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000053 /f
if %target%==del ECHO Set Target keybind to Delete - Done!
if %target%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000047 /f
if %target%==home ECHO Set Target keybind to Home - Done!
if %target%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000004f /f
if %target%==end ECHO Set Target keybind to End - Done!
if %target%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000049 /f
if %target%==pgup ECHO Set Target keybind to Page Up - Done!
if %target%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000051 /f
if %target%==pgdn ECHO Set Target keybind to Page Down - Done!
if %target%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000003b /f
if %target%==f1 ECHO Set Target keybind to F1 - Done!
if %target%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000003c /f
if %target%==f2 ECHO Set Target keybind to F2 - Done!
if %target%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000003d /f
if %target%==f3 ECHO Set Target keybind to F3 - Done!
if %target%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000003e /f
if %target%==f4 ECHO Set Target keybind to F4 - Done!
if %target%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000003f /f
if %target%==f5 ECHO Set Target keybind to F5 - Done!
if %target%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000040 /f
if %target%==f6 ECHO Set Target keybind to F6 - Done!
if %target%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000041 /f
if %target%==f7 ECHO Set Target keybind to F7 - Done!
if %target%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000042 /f
if %target%==f8 ECHO Set Target keybind to F8 - Done!
if %target%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000043 /f
if %target%==f9 ECHO Set Target keybind to F9 - Done!
if %target%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000044 /f
if %target%==f10 ECHO Set Target keybind to F10 - Done!
if %target%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000085 /f
if %target%==f11 ECHO Set Target keybind to F11 - Done!
if %target%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000086 /f
if %target%==f12 ECHO Set Target keybind to F12 - Done!
if %target%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000004f /f
if %target%==num1 ECHO Set Target keybind to Numpad 1 - Done!
if %target%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000050 /f
if %target%==num2 ECHO Set Target keybind to Numpad 2 - Done!
if %target%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000051 /f
if %target%==num3 ECHO Set Target keybind to Numpad 3 - Done!
if %target%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000004b /f
if %target%==num4 ECHO Set Target keybind to Numpad 4 - Done!
if %target%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000004c /f
if %target%==num5 ECHO Set Target keybind to Numpad 5 - Done!
if %target%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000004d /f
if %target%==num6 ECHO Set Target keybind to Numpad 6 - Done!
if %target%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000047 /f
if %target%==num7 ECHO Set Target keybind to Numpad 7 - Done!
if %target%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000048 /f
if %target%==num8 ECHO Set Target keybind to Numpad 8 - Done!
if %target%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000049 /f
if %target%==num9 ECHO Set Target keybind to Numpad 9 - Done!
if %target%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000037 /f
if %target%==numstar ECHO Set Target keybind to Numpad * - Done!
if %target%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000004a /f
if %target%==numminus ECHO Set Target keybind to Numpad - - Done!
if %target%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000004e /f
if %target%==numplus ECHO Set Target keybind to Numpad + - Done!
if %target%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000048 /f
if %target%==up ECHO Set Target keybind to Up Arrow - Done!
if %target%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x00000050 /f
if %target%==down ECHO Set Target keybind to Down Arrow - Done!
if %target%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000004b /f
if %target%==left ECHO Set Target keybind to Left Arrow - Done!
if %target%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target" /t REG_DWORD /d 0x0000004d /f
if %target%==right ECHO Set Target keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:nexttarget
ECHO                      --- Bind Next Target ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p nexttarget="Input a key and press Enter to bind it to Target: "
@echo off
if %nexttarget%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000001e /f
if %nexttarget%==a ECHO Set Next Target keybind to A - Done!
if %nexttarget%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000030 /f
if %nexttarget%==b ECHO Set Next Target keybind to B - Done!
if %nexttarget%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000002e /f
if %nexttarget%==c ECHO Set Next Target keybind to C - Done!
if %nexttarget%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000020 /f
if %nexttarget%==d ECHO Set Next Target keybind to D - Done!
if %nexttarget%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000012 /f
if %nexttarget%==e ECHO Set Next Target keybind to E - Done!
if %nexttarget%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000021 /f
if %nexttarget%==f ECHO Set Next Target keybind to F - Done!
if %nexttarget%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000022 /f
if %nexttarget%==g ECHO Set Next Target keybind to G - Done!
if %nexttarget%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000023 /f
if %nexttarget%==h ECHO Set Next Target keybind to H - Done!
if %nexttarget%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000017 /f
if %nexttarget%==i ECHO Set Next Target keybind to I - Done!
if %nexttarget%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000024 /f
if %nexttarget%==j ECHO Set Next Target keybind to J - Done!
if %nexttarget%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000025 /f
if %nexttarget%==k ECHO Set Next Target keybind to K - Done!
if %nexttarget%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000026 /f
if %nexttarget%==l ECHO Set Next Target keybind to L - Done!
if %nexttarget%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000032 /f
if %nexttarget%==m ECHO Set Next Target keybind to M - Done!
if %nexttarget%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000031 /f
if %nexttarget%==n ECHO Set Next Target keybind to N - Done!
if %nexttarget%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000018 /f
if %nexttarget%==o ECHO Set Next Target keybind to O - Done!
if %nexttarget%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000019 /f
if %nexttarget%==p ECHO Set Next Target keybind to P - Done!
if %nexttarget%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000010 /f
if %nexttarget%==q ECHO Set Next Target keybind to Q - Done!
if %nexttarget%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000013 /f
if %nexttarget%==r ECHO Set Next Target keybind to R - Done!
if %nexttarget%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000001f /f
if %nexttarget%==s ECHO Set Next Target keybind to S - Done!
if %nexttarget%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000014 /f
if %nexttarget%==t ECHO Set Next Target keybind to T - Done!
if %nexttarget%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000016 /f
if %nexttarget%==u ECHO Set Next Target keybind to U - Done!
if %nexttarget%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000002f /f
if %nexttarget%==v ECHO Set Next Target keybind to V - Done!
if %nexttarget%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000011 /f
if %nexttarget%==w ECHO Set Next Target keybind to W - Done!
if %nexttarget%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000002d /f
if %nexttarget%==x ECHO Set Next Target keybind to X - Done!
if %nexttarget%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000015 /f
if %nexttarget%==y ECHO Set Next Target keybind to Y - Done!
if %nexttarget%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000002c /f
if %nexttarget%==z ECHO Set Next Target keybind to Z - Done!
if %nexttarget%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000029 /f
if %nexttarget%==tilde ECHO Set Next Target keybind to ~ - Done!
if %nexttarget%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000000d /f
if %nexttarget%==equal ECHO Set Next Target keybind to = - Done!
if %nexttarget%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000000c /f
if %nexttarget%==minus ECHO Set Next Target keybind to - - Done!
if %nexttarget%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000001a /f
if %nexttarget%==lbracket ECHO Set Next Target keybind to [ - Done!
if %nexttarget%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000001b /f
if %nexttarget%==rbracket ECHO Set Next Target keybind to ] - Done!
if %nexttarget%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000035 /f
if %nexttarget%==slash ECHO Set Next Target keybind to / - Done!
if %nexttarget%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000002b /f
if %nexttarget%==bslash ECHO Set Next Target keybind to \ - Done!
if %nexttarget%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000027 /f
if %nexttarget%==colon ECHO Set Next Target keybind to ; - Done!
if %nexttarget%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000028 /f
if %nexttarget%==quote ECHO Set Next Target keybind to ' - Done!
if %nexttarget%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000033 /f
if %nexttarget%==comma ECHO Set Next Target keybind to , - Done!
if %nexttarget%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000034 /f
if %nexttarget%==period ECHO Set Next Target keybind to . - Done!
if %nexttarget%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000000e /f
if %nexttarget%==bckspc ECHO Set Next Target keybind to Backspace - Done!
if %nexttarget%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000000f /f
if %nexttarget%==tab ECHO Set Next Target keybind to Tab - Done!
if %nexttarget%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000001c /f
if %nexttarget%==enter ECHO Set Next Target keybind to Enter - Done!
if %nexttarget%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000039 /f
if %nexttarget%==space ECHO Set Next Target keybind to Space Bar - Done!
if %nexttarget%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000001 /f
if %nexttarget%==esc ECHO Set Next Target keybind to Escape - Done!
if %nexttarget%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000052 /f
if %nexttarget%==ins ECHO Set Next Target keybind to Insert - Done!
if %nexttarget%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000053 /f
if %nexttarget%==del ECHO Set Next Target keybind to Delete - Done!
if %nexttarget%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000047 /f
if %nexttarget%==home ECHO Set Next Target keybind to Home - Done!
if %nexttarget%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000004f /f
if %nexttarget%==end ECHO Set Next Target keybind to End - Done!
if %nexttarget%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000049 /f
if %nexttarget%==pgup ECHO Set Next Target keybind to Page Up - Done!
if %nexttarget%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000051 /f
if %nexttarget%==pgdn ECHO Set Next Target keybind to Page Down - Done!
if %nexttarget%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000003b /f
if %nexttarget%==f1 ECHO Set Next Target keybind to F1 - Done!
if %nexttarget%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000003c /f
if %nexttarget%==f2 ECHO Set Next Target keybind to F2 - Done!
if %nexttarget%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000003d /f
if %nexttarget%==f3 ECHO Set Next Target keybind to F3 - Done!
if %nexttarget%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000003e /f
if %nexttarget%==f4 ECHO Set Next Target keybind to F4 - Done!
if %nexttarget%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000003f /f
if %nexttarget%==f5 ECHO Set Next Target keybind to F5 - Done!
if %nexttarget%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000040 /f
if %nexttarget%==f6 ECHO Set Next Target keybind to F6 - Done!
if %nexttarget%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000041 /f
if %nexttarget%==f7 ECHO Set Next Target keybind to F7 - Done!
if %nexttarget%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000042 /f
if %nexttarget%==f8 ECHO Set Next Target keybind to F8 - Done!
if %nexttarget%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000043 /f
if %nexttarget%==f9 ECHO Set Next Target keybind to F9 - Done!
if %nexttarget%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000044 /f
if %nexttarget%==f10 ECHO Set Next Target keybind to F10 - Done!
if %nexttarget%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000085 /f
if %nexttarget%==f11 ECHO Set Next Target keybind to F11 - Done!
if %nexttarget%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000086 /f
if %nexttarget%==f12 ECHO Set Next Target keybind to F12 - Done!
if %nexttarget%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000004f /f
if %nexttarget%==num1 ECHO Set Next Target keybind to Numpad 1 - Done!
if %nexttarget%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000050 /f
if %nexttarget%==num2 ECHO Set Next Target keybind to Numpad 2 - Done!
if %nexttarget%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000051 /f
if %nexttarget%==num3 ECHO Set Next Target keybind to Numpad 3 - Done!
if %nexttarget%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000004b /f
if %nexttarget%==num4 ECHO Set Next Target keybind to Numpad 4 - Done!
if %nexttarget%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000004c /f
if %nexttarget%==num5 ECHO Set Next Target keybind to Numpad 5 - Done!
if %nexttarget%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000004d /f
if %nexttarget%==num6 ECHO Set Next Target keybind to Numpad 6 - Done!
if %nexttarget%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000047 /f
if %nexttarget%==num7 ECHO Set Next Target keybind to Numpad 7 - Done!
if %nexttarget%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000048 /f
if %nexttarget%==num8 ECHO Set Next Target keybind to Numpad 8 - Done!
if %nexttarget%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000049 /f
if %nexttarget%==num9 ECHO Set Next Target keybind to Numpad 9 - Done!
if %nexttarget%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000037 /f
if %nexttarget%==numstar ECHO Set Next Target keybind to Numpad * - Done!
if %nexttarget%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000004a /f
if %nexttarget%==numminus ECHO Set Next Target keybind to Numpad - - Done!
if %nexttarget%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000004e /f
if %nexttarget%==numplus ECHO Set Next Target keybind to Numpad + - Done!
if %nexttarget%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000048 /f
if %nexttarget%==up ECHO Set Next Target keybind to Up Arrow - Done!
if %nexttarget%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x00000050 /f
if %nexttarget%==down ECHO Set Next Target keybind to Down Arrow - Done!
if %nexttarget%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000004b /f
if %nexttarget%==left ECHO Set Next Target keybind to Left Arrow - Done!
if %nexttarget%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Target" /t REG_DWORD /d 0x0000004d /f
if %nexttarget%==right ECHO Set Next Target keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:nextweapon
ECHO                      --- Bind Next Weapon ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p nextweapon="Input a key and press Enter to bind it to Weapon: "
@echo off
if %nextweapon%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000001e /f
if %nextweapon%==a ECHO Set Next Weapon keybind to A - Done!
if %nextweapon%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000030 /f
if %nextweapon%==b ECHO Set Next Weapon keybind to B - Done!
if %nextweapon%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000002e /f
if %nextweapon%==c ECHO Set Next Weapon keybind to C - Done!
if %nextweapon%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000020 /f
if %nextweapon%==d ECHO Set Next Weapon keybind to D - Done!
if %nextweapon%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000012 /f
if %nextweapon%==e ECHO Set Next Weapon keybind to E - Done!
if %nextweapon%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000021 /f
if %nextweapon%==f ECHO Set Next Weapon keybind to F - Done!
if %nextweapon%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000022 /f
if %nextweapon%==g ECHO Set Next Weapon keybind to G - Done!
if %nextweapon%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000023 /f
if %nextweapon%==h ECHO Set Next Weapon keybind to H - Done!
if %nextweapon%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000017 /f
if %nextweapon%==i ECHO Set Next Weapon keybind to I - Done!
if %nextweapon%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000024 /f
if %nextweapon%==j ECHO Set Next Weapon keybind to J - Done!
if %nextweapon%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000025 /f
if %nextweapon%==k ECHO Set Next Weapon keybind to K - Done!
if %nextweapon%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000026 /f
if %nextweapon%==l ECHO Set Next Weapon keybind to L - Done!
if %nextweapon%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000032 /f
if %nextweapon%==m ECHO Set Next Weapon keybind to M - Done!
if %nextweapon%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000031 /f
if %nextweapon%==n ECHO Set Next Weapon keybind to N - Done!
if %nextweapon%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000018 /f
if %nextweapon%==o ECHO Set Next Weapon keybind to O - Done!
if %nextweapon%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000019 /f
if %nextweapon%==p ECHO Set Next Weapon keybind to P - Done!
if %nextweapon%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000010 /f
if %nextweapon%==q ECHO Set Next Weapon keybind to Q - Done!
if %nextweapon%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000013 /f
if %nextweapon%==r ECHO Set Next Weapon keybind to R - Done!
if %nextweapon%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000001f /f
if %nextweapon%==s ECHO Set Next Weapon keybind to S - Done!
if %nextweapon%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000014 /f
if %nextweapon%==t ECHO Set Next Weapon keybind to T - Done!
if %nextweapon%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000016 /f
if %nextweapon%==u ECHO Set Next Weapon keybind to U - Done!
if %nextweapon%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000002f /f
if %nextweapon%==v ECHO Set Next Weapon keybind to V - Done!
if %nextweapon%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000011 /f
if %nextweapon%==w ECHO Set Next Weapon keybind to W - Done!
if %nextweapon%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000002d /f
if %nextweapon%==x ECHO Set Next Weapon keybind to X - Done!
if %nextweapon%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000015 /f
if %nextweapon%==y ECHO Set Next Weapon keybind to Y - Done!
if %nextweapon%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000002c /f
if %nextweapon%==z ECHO Set Next Weapon keybind to Z - Done!
if %nextweapon%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000029 /f
if %nextweapon%==tilde ECHO Set Next Weapon keybind to ~ - Done!
if %nextweapon%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000000d /f
if %nextweapon%==equal ECHO Set Next Weapon keybind to = - Done!
if %nextweapon%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000000c /f
if %nextweapon%==minus ECHO Set Next Weapon keybind to - - Done!
if %nextweapon%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000001a /f
if %nextweapon%==lbracket ECHO Set Next Weapon keybind to [ - Done!
if %nextweapon%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000001b /f
if %nextweapon%==rbracket ECHO Set Next Weapon keybind to ] - Done!
if %nextweapon%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000035 /f
if %nextweapon%==slash ECHO Set Next Weapon keybind to / - Done!
if %nextweapon%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000002b /f
if %nextweapon%==bslash ECHO Set Next Weapon keybind to \ - Done!
if %nextweapon%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000027 /f
if %nextweapon%==colon ECHO Set Next Weapon keybind to ; - Done!
if %nextweapon%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000028 /f
if %nextweapon%==quote ECHO Set Next Weapon keybind to ' - Done!
if %nextweapon%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000033 /f
if %nextweapon%==comma ECHO Set Next Weapon keybind to , - Done!
if %nextweapon%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000034 /f
if %nextweapon%==period ECHO Set Next Weapon keybind to . - Done!
if %nextweapon%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000000e /f
if %nextweapon%==bckspc ECHO Set Next Weapon keybind to Backspace - Done!
if %nextweapon%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000000f /f
if %nextweapon%==tab ECHO Set Next Weapon keybind to Tab - Done!
if %nextweapon%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000001c /f
if %nextweapon%==enter ECHO Set Next Weapon keybind to Enter - Done!
if %nextweapon%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000039 /f
if %nextweapon%==space ECHO Set Next Weapon keybind to Space Bar - Done!
if %nextweapon%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000001 /f
if %nextweapon%==esc ECHO Set Next Weapon keybind to Escape - Done!
if %nextweapon%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000052 /f
if %nextweapon%==ins ECHO Set Next Weapon keybind to Insert - Done!
if %nextweapon%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000053 /f
if %nextweapon%==del ECHO Set Next Weapon keybind to Delete - Done!
if %nextweapon%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000047 /f
if %nextweapon%==home ECHO Set Next Weapon keybind to Home - Done!
if %nextweapon%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000004f /f
if %nextweapon%==end ECHO Set Next Weapon keybind to End - Done!
if %nextweapon%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000049 /f
if %nextweapon%==pgup ECHO Set Next Weapon keybind to Page Up - Done!
if %nextweapon%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000051 /f
if %nextweapon%==pgdn ECHO Set Next Weapon keybind to Page Down - Done!
if %nextweapon%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000003b /f
if %nextweapon%==f1 ECHO Set Next Weapon keybind to F1 - Done!
if %nextweapon%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000003c /f
if %nextweapon%==f2 ECHO Set Next Weapon keybind to F2 - Done!
if %nextweapon%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000003d /f
if %nextweapon%==f3 ECHO Set Next Weapon keybind to F3 - Done!
if %nextweapon%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000003e /f
if %nextweapon%==f4 ECHO Set Next Weapon keybind to F4 - Done!
if %nextweapon%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000003f /f
if %nextweapon%==f5 ECHO Set Next Weapon keybind to F5 - Done!
if %nextweapon%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000040 /f
if %nextweapon%==f6 ECHO Set Next Weapon keybind to F6 - Done!
if %nextweapon%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000041 /f
if %nextweapon%==f7 ECHO Set Next Weapon keybind to F7 - Done!
if %nextweapon%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000042 /f
if %nextweapon%==f8 ECHO Set Next Weapon keybind to F8 - Done!
if %nextweapon%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000043 /f
if %nextweapon%==f9 ECHO Set Next Weapon keybind to F9 - Done!
if %nextweapon%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000044 /f
if %nextweapon%==f10 ECHO Set Next Weapon keybind to F10 - Done!
if %nextweapon%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000085 /f
if %nextweapon%==f11 ECHO Set Next Weapon keybind to F11 - Done!
if %nextweapon%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000086 /f
if %nextweapon%==f12 ECHO Set Next Weapon keybind to F12 - Done!
if %nextweapon%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000004f /f
if %nextweapon%==num1 ECHO Set Next Weapon keybind to Numpad 1 - Done!
if %nextweapon%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000050 /f
if %nextweapon%==num2 ECHO Set Next Weapon keybind to Numpad 2 - Done!
if %nextweapon%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000051 /f
if %nextweapon%==num3 ECHO Set Next Weapon keybind to Numpad 3 - Done!
if %nextweapon%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000004b /f
if %nextweapon%==num4 ECHO Set Next Weapon keybind to Numpad 4 - Done!
if %nextweapon%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000004c /f
if %nextweapon%==num5 ECHO Set Next Weapon keybind to Numpad 5 - Done!
if %nextweapon%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000004d /f
if %nextweapon%==num6 ECHO Set Next Weapon keybind to Numpad 6 - Done!
if %nextweapon%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000047 /f
if %nextweapon%==num7 ECHO Set Next Weapon keybind to Numpad 7 - Done!
if %nextweapon%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000048 /f
if %nextweapon%==num8 ECHO Set Next Weapon keybind to Numpad 8 - Done!
if %nextweapon%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000049 /f
if %nextweapon%==num9 ECHO Set Next Weapon keybind to Numpad 9 - Done!
if %nextweapon%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000037 /f
if %nextweapon%==numstar ECHO Set Next Weapon keybind to Numpad * - Done!
if %nextweapon%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000004a /f
if %nextweapon%==numminus ECHO Set Next Weapon keybind to Numpad - - Done!
if %nextweapon%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000004e /f
if %nextweapon%==numplus ECHO Set Next Weapon keybind to Numpad + - Done!
if %nextweapon%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000048 /f
if %nextweapon%==up ECHO Set Next Weapon keybind to Up Arrow - Done!
if %nextweapon%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x00000050 /f
if %nextweapon%==down ECHO Set Next Weapon keybind to Down Arrow - Done!
if %nextweapon%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000004b /f
if %nextweapon%==left ECHO Set Next Weapon keybind to Left Arrow - Done!
if %nextweapon%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Next Weapon" /t REG_DWORD /d 0x0000004d /f
if %nextweapon%==right ECHO Set Next Weapon keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:previousweapon
ECHO                      --- Bind Previous Weapon ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p previousweapon="Input a key and press Enter to bind it to Weapon: "
@echo off
if %previousweapon%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000001e /f
if %previousweapon%==a ECHO Set Previous Weapon keybind to A - Done!
if %previousweapon%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000030 /f
if %previousweapon%==b ECHO Set Previous Weapon keybind to B - Done!
if %previousweapon%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000002e /f
if %previousweapon%==c ECHO Set Previous Weapon keybind to C - Done!
if %previousweapon%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000020 /f
if %previousweapon%==d ECHO Set Previous Weapon keybind to D - Done!
if %previousweapon%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000012 /f
if %previousweapon%==e ECHO Set Previous Weapon keybind to E - Done!
if %previousweapon%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000021 /f
if %previousweapon%==f ECHO Set Previous Weapon keybind to F - Done!
if %previousweapon%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000022 /f
if %previousweapon%==g ECHO Set Previous Weapon keybind to G - Done!
if %previousweapon%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000023 /f
if %previousweapon%==h ECHO Set Previous Weapon keybind to H - Done!
if %previousweapon%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000017 /f
if %previousweapon%==i ECHO Set Previous Weapon keybind to I - Done!
if %previousweapon%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000024 /f
if %previousweapon%==j ECHO Set Previous Weapon keybind to J - Done!
if %previousweapon%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000025 /f
if %previousweapon%==k ECHO Set Previous Weapon keybind to K - Done!
if %previousweapon%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000026 /f
if %previousweapon%==l ECHO Set Previous Weapon keybind to L - Done!
if %previousweapon%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000032 /f
if %previousweapon%==m ECHO Set Previous Weapon keybind to M - Done!
if %previousweapon%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000031 /f
if %previousweapon%==n ECHO Set Previous Weapon keybind to N - Done!
if %previousweapon%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000018 /f
if %previousweapon%==o ECHO Set Previous Weapon keybind to O - Done!
if %previousweapon%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000019 /f
if %previousweapon%==p ECHO Set Previous Weapon keybind to P - Done!
if %previousweapon%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000010 /f
if %previousweapon%==q ECHO Set Previous Weapon keybind to Q - Done!
if %previousweapon%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000013 /f
if %previousweapon%==r ECHO Set Previous Weapon keybind to R - Done!
if %previousweapon%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000001f /f
if %previousweapon%==s ECHO Set Previous Weapon keybind to S - Done!
if %previousweapon%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000014 /f
if %previousweapon%==t ECHO Set Previous Weapon keybind to T - Done!
if %previousweapon%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000016 /f
if %previousweapon%==u ECHO Set Previous Weapon keybind to U - Done!
if %previousweapon%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000002f /f
if %previousweapon%==v ECHO Set Previous Weapon keybind to V - Done!
if %previousweapon%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000011 /f
if %previousweapon%==w ECHO Set Previous Weapon keybind to W - Done!
if %previousweapon%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000002d /f
if %previousweapon%==x ECHO Set Previous Weapon keybind to X - Done!
if %previousweapon%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000015 /f
if %previousweapon%==y ECHO Set Previous Weapon keybind to Y - Done!
if %previousweapon%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000002c /f
if %previousweapon%==z ECHO Set Previous Weapon keybind to Z - Done!
if %previousweapon%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000029 /f
if %previousweapon%==tilde ECHO Set Previous Weapon keybind to ~ - Done!
if %previousweapon%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000000d /f
if %previousweapon%==equal ECHO Set Previous Weapon keybind to = - Done!
if %previousweapon%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000000c /f
if %previousweapon%==minus ECHO Set Previous Weapon keybind to - - Done!
if %previousweapon%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000001a /f
if %previousweapon%==lbracket ECHO Set Previous Weapon keybind to [ - Done!
if %previousweapon%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000001b /f
if %previousweapon%==rbracket ECHO Set Previous Weapon keybind to ] - Done!
if %previousweapon%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000035 /f
if %previousweapon%==slash ECHO Set Previous Weapon keybind to / - Done!
if %previousweapon%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000002b /f
if %previousweapon%==bslash ECHO Set Previous Weapon keybind to \ - Done!
if %previousweapon%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000027 /f
if %previousweapon%==colon ECHO Set Previous Weapon keybind to ; - Done!
if %previousweapon%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000028 /f
if %previousweapon%==quote ECHO Set Previous Weapon keybind to ' - Done!
if %previousweapon%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000033 /f
if %previousweapon%==comma ECHO Set Previous Weapon keybind to , - Done!
if %previousweapon%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000034 /f
if %previousweapon%==period ECHO Set Previous Weapon keybind to . - Done!
if %previousweapon%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000000e /f
if %previousweapon%==bckspc ECHO Set Previous Weapon keybind to Backspace - Done!
if %previousweapon%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000000f /f
if %previousweapon%==tab ECHO Set Previous Weapon keybind to Tab - Done!
if %previousweapon%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000001c /f
if %previousweapon%==enter ECHO Set Previous Weapon keybind to Enter - Done!
if %previousweapon%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000039 /f
if %previousweapon%==space ECHO Set Previous Weapon keybind to Space Bar - Done!
if %previousweapon%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000001 /f
if %previousweapon%==esc ECHO Set Previous Weapon keybind to Escape - Done!
if %previousweapon%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000052 /f
if %previousweapon%==ins ECHO Set Previous Weapon keybind to Insert - Done!
if %previousweapon%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000053 /f
if %previousweapon%==del ECHO Set Previous Weapon keybind to Delete - Done!
if %previousweapon%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000047 /f
if %previousweapon%==home ECHO Set Previous Weapon keybind to Home - Done!
if %previousweapon%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000004f /f
if %previousweapon%==end ECHO Set Previous Weapon keybind to End - Done!
if %previousweapon%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000049 /f
if %previousweapon%==pgup ECHO Set Previous Weapon keybind to Page Up - Done!
if %previousweapon%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000051 /f
if %previousweapon%==pgdn ECHO Set Previous Weapon keybind to Page Down - Done!
if %previousweapon%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000003b /f
if %previousweapon%==f1 ECHO Set Previous Weapon keybind to F1 - Done!
if %previousweapon%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000003c /f
if %previousweapon%==f2 ECHO Set Previous Weapon keybind to F2 - Done!
if %previousweapon%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000003d /f
if %previousweapon%==f3 ECHO Set Previous Weapon keybind to F3 - Done!
if %previousweapon%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000003e /f
if %previousweapon%==f4 ECHO Set Previous Weapon keybind to F4 - Done!
if %previousweapon%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000003f /f
if %previousweapon%==f5 ECHO Set Previous Weapon keybind to F5 - Done!
if %previousweapon%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000040 /f
if %previousweapon%==f6 ECHO Set Previous Weapon keybind to F6 - Done!
if %previousweapon%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000041 /f
if %previousweapon%==f7 ECHO Set Previous Weapon keybind to F7 - Done!
if %previousweapon%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000042 /f
if %previousweapon%==f8 ECHO Set Previous Weapon keybind to F8 - Done!
if %previousweapon%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000043 /f
if %previousweapon%==f9 ECHO Set Previous Weapon keybind to F9 - Done!
if %previousweapon%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000044 /f
if %previousweapon%==f10 ECHO Set Previous Weapon keybind to F10 - Done!
if %previousweapon%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000085 /f
if %previousweapon%==f11 ECHO Set Previous Weapon keybind to F11 - Done!
if %previousweapon%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000086 /f
if %previousweapon%==f12 ECHO Set Previous Weapon keybind to F12 - Done!
if %previousweapon%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000004f /f
if %previousweapon%==num1 ECHO Set Previous Weapon keybind to Numpad 1 - Done!
if %previousweapon%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000050 /f
if %previousweapon%==num2 ECHO Set Previous Weapon keybind to Numpad 2 - Done!
if %previousweapon%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000051 /f
if %previousweapon%==num3 ECHO Set Previous Weapon keybind to Numpad 3 - Done!
if %previousweapon%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000004b /f
if %previousweapon%==num4 ECHO Set Previous Weapon keybind to Numpad 4 - Done!
if %previousweapon%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000004c /f
if %previousweapon%==num5 ECHO Set Previous Weapon keybind to Numpad 5 - Done!
if %previousweapon%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000004d /f
if %previousweapon%==num6 ECHO Set Previous Weapon keybind to Numpad 6 - Done!
if %previousweapon%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000047 /f
if %previousweapon%==num7 ECHO Set Previous Weapon keybind to Numpad 7 - Done!
if %previousweapon%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000048 /f
if %previousweapon%==num8 ECHO Set Previous Weapon keybind to Numpad 8 - Done!
if %previousweapon%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000049 /f
if %previousweapon%==num9 ECHO Set Previous Weapon keybind to Numpad 9 - Done!
if %previousweapon%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000037 /f
if %previousweapon%==numstar ECHO Set Previous Weapon keybind to Numpad * - Done!
if %previousweapon%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000004a /f
if %previousweapon%==numminus ECHO Set Previous Weapon keybind to Numpad - - Done!
if %previousweapon%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000004e /f
if %previousweapon%==numplus ECHO Set Previous Weapon keybind to Numpad + - Done!
if %previousweapon%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000048 /f
if %previousweapon%==up ECHO Set Previous Weapon keybind to Up Arrow - Done!
if %previousweapon%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x00000050 /f
if %previousweapon%==down ECHO Set Previous Weapon keybind to Down Arrow - Done!
if %previousweapon%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000004b /f
if %previousweapon%==left ECHO Set Previous Weapon keybind to Left Arrow - Done!
if %previousweapon%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Previous Weapon" /t REG_DWORD /d 0x0000004d /f
if %previousweapon%==right ECHO Set Previous Weapon keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:drone
ECHO                      --- Bind Drone ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p drone="Input a key and press Enter to bind it to Weapon: "
@echo off
if %drone%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000001e /f
if %drone%==a ECHO Set Drone keybind to A - Done!
if %drone%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000030 /f
if %drone%==b ECHO Set Drone keybind to B - Done!
if %drone%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000002e /f
if %drone%==c ECHO Set Drone keybind to C - Done!
if %drone%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000020 /f
if %drone%==d ECHO Set Drone keybind to D - Done!
if %drone%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000012 /f
if %drone%==e ECHO Set Drone keybind to E - Done!
if %drone%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000021 /f
if %drone%==f ECHO Set Drone keybind to F - Done!
if %drone%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000022 /f
if %drone%==g ECHO Set Drone keybind to G - Done!
if %drone%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000023 /f
if %drone%==h ECHO Set Drone keybind to H - Done!
if %drone%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000017 /f
if %drone%==i ECHO Set Drone keybind to I - Done!
if %drone%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000024 /f
if %drone%==j ECHO Set Drone keybind to J - Done!
if %drone%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000025 /f
if %drone%==k ECHO Set Drone keybind to K - Done!
if %drone%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000026 /f
if %drone%==l ECHO Set Drone keybind to L - Done!
if %drone%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000032 /f
if %drone%==m ECHO Set Drone keybind to M - Done!
if %drone%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000031 /f
if %drone%==n ECHO Set Drone keybind to N - Done!
if %drone%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000018 /f
if %drone%==o ECHO Set Drone keybind to O - Done!
if %drone%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000019 /f
if %drone%==p ECHO Set Drone keybind to P - Done!
if %drone%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000010 /f
if %drone%==q ECHO Set Drone keybind to Q - Done!
if %drone%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000013 /f
if %drone%==r ECHO Set Drone keybind to R - Done!
if %drone%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000001f /f
if %drone%==s ECHO Set Drone keybind to S - Done!
if %drone%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000014 /f
if %drone%==t ECHO Set Drone keybind to T - Done!
if %drone%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000016 /f
if %drone%==u ECHO Set Drone keybind to U - Done!
if %drone%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000002f /f
if %drone%==v ECHO Set Drone keybind to V - Done!
if %drone%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000011 /f
if %drone%==w ECHO Set Drone keybind to W - Done!
if %drone%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000002d /f
if %drone%==x ECHO Set Drone keybind to X - Done!
if %drone%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000015 /f
if %drone%==y ECHO Set Drone keybind to Y - Done!
if %drone%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000002c /f
if %drone%==z ECHO Set Drone keybind to Z - Done!
if %drone%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000029 /f
if %drone%==tilde ECHO Set Drone keybind to ~ - Done!
if %drone%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000000d /f
if %drone%==equal ECHO Set Drone keybind to = - Done!
if %drone%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000000c /f
if %drone%==minus ECHO Set Drone keybind to - - Done!
if %drone%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000001a /f
if %drone%==lbracket ECHO Set Drone keybind to [ - Done!
if %drone%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000001b /f
if %drone%==rbracket ECHO Set Drone keybind to ] - Done!
if %drone%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000035 /f
if %drone%==slash ECHO Set Drone keybind to / - Done!
if %drone%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000002b /f
if %drone%==bslash ECHO Set Drone keybind to \ - Done!
if %drone%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000027 /f
if %drone%==colon ECHO Set Drone keybind to ; - Done!
if %drone%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000028 /f
if %drone%==quote ECHO Set Drone keybind to ' - Done!
if %drone%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000033 /f
if %drone%==comma ECHO Set Drone keybind to , - Done!
if %drone%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000034 /f
if %drone%==period ECHO Set Drone keybind to . - Done!
if %drone%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000000e /f
if %drone%==bckspc ECHO Set Drone keybind to Backspace - Done!
if %drone%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000000f /f
if %drone%==tab ECHO Set Drone keybind to Tab - Done!
if %drone%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000001c /f
if %drone%==enter ECHO Set Drone keybind to Enter - Done!
if %drone%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000039 /f
if %drone%==space ECHO Set Drone keybind to Space Bar - Done!
if %drone%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000001 /f
if %drone%==esc ECHO Set Drone keybind to Escape - Done!
if %drone%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000052 /f
if %drone%==ins ECHO Set Drone keybind to Insert - Done!
if %drone%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000053 /f
if %drone%==del ECHO Set Drone keybind to Delete - Done!
if %drone%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000047 /f
if %drone%==home ECHO Set Drone keybind to Home - Done!
if %drone%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000004f /f
if %drone%==end ECHO Set Drone keybind to End - Done!
if %drone%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000049 /f
if %drone%==pgup ECHO Set Drone keybind to Page Up - Done!
if %drone%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000051 /f
if %drone%==pgdn ECHO Set Drone keybind to Page Down - Done!
if %drone%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000003b /f
if %drone%==f1 ECHO Set Drone keybind to F1 - Done!
if %drone%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000003c /f
if %drone%==f2 ECHO Set Drone keybind to F2 - Done!
if %drone%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000003d /f
if %drone%==f3 ECHO Set Drone keybind to F3 - Done!
if %drone%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000003e /f
if %drone%==f4 ECHO Set Drone keybind to F4 - Done!
if %drone%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000003f /f
if %drone%==f5 ECHO Set Drone keybind to F5 - Done!
if %drone%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000040 /f
if %drone%==f6 ECHO Set Drone keybind to F6 - Done!
if %drone%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000041 /f
if %drone%==f7 ECHO Set Drone keybind to F7 - Done!
if %drone%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000042 /f
if %drone%==f8 ECHO Set Drone keybind to F8 - Done!
if %drone%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000043 /f
if %drone%==f9 ECHO Set Drone keybind to F9 - Done!
if %drone%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000044 /f
if %drone%==f10 ECHO Set Drone keybind to F10 - Done!
if %drone%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000085 /f
if %drone%==f11 ECHO Set Drone keybind to F11 - Done!
if %drone%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000086 /f
if %drone%==f12 ECHO Set Drone keybind to F12 - Done!
if %drone%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000004f /f
if %drone%==num1 ECHO Set Drone keybind to Numpad 1 - Done!
if %drone%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000050 /f
if %drone%==num2 ECHO Set Drone keybind to Numpad 2 - Done!
if %drone%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000051 /f
if %drone%==num3 ECHO Set Drone keybind to Numpad 3 - Done!
if %drone%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000004b /f
if %drone%==num4 ECHO Set Drone keybind to Numpad 4 - Done!
if %drone%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000004c /f
if %drone%==num5 ECHO Set Drone keybind to Numpad 5 - Done!
if %drone%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000004d /f
if %drone%==num6 ECHO Set Drone keybind to Numpad 6 - Done!
if %drone%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000047 /f
if %drone%==num7 ECHO Set Drone keybind to Numpad 7 - Done!
if %drone%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000048 /f
if %drone%==num8 ECHO Set Drone keybind to Numpad 8 - Done!
if %drone%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000049 /f
if %drone%==num9 ECHO Set Drone keybind to Numpad 9 - Done!
if %drone%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000037 /f
if %drone%==numstar ECHO Set Drone keybind to Numpad * - Done!
if %drone%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000004a /f
if %drone%==numminus ECHO Set Drone keybind to Numpad - - Done!
if %drone%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000004e /f
if %drone%==numplus ECHO Set Drone keybind to Numpad + - Done!
if %drone%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000048 /f
if %drone%==up ECHO Set Drone keybind to Up Arrow - Done!
if %drone%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x00000050 /f
if %drone%==down ECHO Set Drone keybind to Down Arrow - Done!
if %drone%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000004b /f
if %drone%==left ECHO Set Drone keybind to Left Arrow - Done!
if %drone%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Drone" /t REG_DWORD /d 0x0000004d /f
if %drone%==right ECHO Set Drone keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
REM ---------------------- Chat/HUD Controls ---------------------
REM --------------------------------------------------------------------------
:chat
ECHO                      --- Bind Chat ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p chat="Input a key and press Enter to bind it to Weapon: "
@echo off
if %chat%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000001e /f
if %chat%==a ECHO Set Chat keybind to A - Done!
if %chat%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000030 /f
if %chat%==b ECHO Set Chat keybind to B - Done!
if %chat%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000002e /f
if %chat%==c ECHO Set Chat keybind to C - Done!
if %chat%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000020 /f
if %chat%==d ECHO Set Chat keybind to D - Done!
if %chat%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000012 /f
if %chat%==e ECHO Set Chat keybind to E - Done!
if %chat%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000021 /f
if %chat%==f ECHO Set Chat keybind to F - Done!
if %chat%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000022 /f
if %chat%==g ECHO Set Chat keybind to G - Done!
if %chat%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000023 /f
if %chat%==h ECHO Set Chat keybind to H - Done!
if %chat%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000017 /f
if %chat%==i ECHO Set Chat keybind to I - Done!
if %chat%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000024 /f
if %chat%==j ECHO Set Chat keybind to J - Done!
if %chat%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000025 /f
if %chat%==k ECHO Set Chat keybind to K - Done!
if %chat%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000026 /f
if %chat%==l ECHO Set Chat keybind to L - Done!
if %chat%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000032 /f
if %chat%==m ECHO Set Chat keybind to M - Done!
if %chat%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000031 /f
if %chat%==n ECHO Set Chat keybind to N - Done!
if %chat%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000018 /f
if %chat%==o ECHO Set Chat keybind to O - Done!
if %chat%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000019 /f
if %chat%==p ECHO Set Chat keybind to P - Done!
if %chat%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000010 /f
if %chat%==q ECHO Set Chat keybind to Q - Done!
if %chat%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000013 /f
if %chat%==r ECHO Set Chat keybind to R - Done!
if %chat%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000001f /f
if %chat%==s ECHO Set Chat keybind to S - Done!
if %chat%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000014 /f
if %chat%==t ECHO Set Chat keybind to T - Done!
if %chat%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000016 /f
if %chat%==u ECHO Set Chat keybind to U - Done!
if %chat%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000002f /f
if %chat%==v ECHO Set Chat keybind to V - Done!
if %chat%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000011 /f
if %chat%==w ECHO Set Chat keybind to W - Done!
if %chat%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000002d /f
if %chat%==x ECHO Set Chat keybind to X - Done!
if %chat%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000015 /f
if %chat%==y ECHO Set Chat keybind to Y - Done!
if %chat%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000002c /f
if %chat%==z ECHO Set Chat keybind to Z - Done!
if %chat%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000029 /f
if %chat%==tilde ECHO Set Chat keybind to ~ - Done!
if %chat%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000000d /f
if %chat%==equal ECHO Set Chat keybind to = - Done!
if %chat%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000000c /f
if %chat%==minus ECHO Set Chat keybind to - - Done!
if %chat%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000001a /f
if %chat%==lbracket ECHO Set Chat keybind to [ - Done!
if %chat%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000001b /f
if %chat%==rbracket ECHO Set Chat keybind to ] - Done!
if %chat%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000035 /f
if %chat%==slash ECHO Set Chat keybind to / - Done!
if %chat%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000002b /f
if %chat%==bslash ECHO Set Chat keybind to \ - Done!
if %chat%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000027 /f
if %chat%==colon ECHO Set Chat keybind to ; - Done!
if %chat%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000028 /f
if %chat%==quote ECHO Set Chat keybind to ' - Done!
if %chat%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000033 /f
if %chat%==comma ECHO Set Chat keybind to , - Done!
if %chat%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000034 /f
if %chat%==period ECHO Set Chat keybind to . - Done!
if %chat%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000000e /f
if %chat%==bckspc ECHO Set Chat keybind to Backspace - Done!
if %chat%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000000f /f
if %chat%==tab ECHO Set Chat keybind to Tab - Done!
if %chat%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000001c /f
if %chat%==enter ECHO Set Chat keybind to Enter - Done!
if %chat%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000039 /f
if %chat%==space ECHO Set Chat keybind to Space Bar - Done!
if %chat%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000001 /f
if %chat%==esc ECHO Set Chat keybind to Escape - Done!
if %chat%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000052 /f
if %chat%==ins ECHO Set Chat keybind to Insert - Done!
if %chat%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000053 /f
if %chat%==del ECHO Set Chat keybind to Delete - Done!
if %chat%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000047 /f
if %chat%==home ECHO Set Chat keybind to Home - Done!
if %chat%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000004f /f
if %chat%==end ECHO Set Chat keybind to End - Done!
if %chat%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000049 /f
if %chat%==pgup ECHO Set Chat keybind to Page Up - Done!
if %chat%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000051 /f
if %chat%==pgdn ECHO Set Chat keybind to Page Down - Done!
if %chat%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000003b /f
if %chat%==f1 ECHO Set Chat keybind to F1 - Done!
if %chat%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000003c /f
if %chat%==f2 ECHO Set Chat keybind to F2 - Done!
if %chat%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000003d /f
if %chat%==f3 ECHO Set Chat keybind to F3 - Done!
if %chat%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000003e /f
if %chat%==f4 ECHO Set Chat keybind to F4 - Done!
if %chat%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000003f /f
if %chat%==f5 ECHO Set Chat keybind to F5 - Done!
if %chat%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000040 /f
if %chat%==f6 ECHO Set Chat keybind to F6 - Done!
if %chat%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000041 /f
if %chat%==f7 ECHO Set Chat keybind to F7 - Done!
if %chat%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000042 /f
if %chat%==f8 ECHO Set Chat keybind to F8 - Done!
if %chat%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000043 /f
if %chat%==f9 ECHO Set Chat keybind to F9 - Done!
if %chat%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000044 /f
if %chat%==f10 ECHO Set Chat keybind to F10 - Done!
if %chat%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000085 /f
if %chat%==f11 ECHO Set Chat keybind to F11 - Done!
if %chat%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000086 /f
if %chat%==f12 ECHO Set Chat keybind to F12 - Done!
if %chat%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000004f /f
if %chat%==num1 ECHO Set Chat keybind to Numpad 1 - Done!
if %chat%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000050 /f
if %chat%==num2 ECHO Set Chat keybind to Numpad 2 - Done!
if %chat%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000051 /f
if %chat%==num3 ECHO Set Chat keybind to Numpad 3 - Done!
if %chat%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000004b /f
if %chat%==num4 ECHO Set Chat keybind to Numpad 4 - Done!
if %chat%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000004c /f
if %chat%==num5 ECHO Set Chat keybind to Numpad 5 - Done!
if %chat%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000004d /f
if %chat%==num6 ECHO Set Chat keybind to Numpad 6 - Done!
if %chat%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000047 /f
if %chat%==num7 ECHO Set Chat keybind to Numpad 7 - Done!
if %chat%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000048 /f
if %chat%==num8 ECHO Set Chat keybind to Numpad 8 - Done!
if %chat%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000049 /f
if %chat%==num9 ECHO Set Chat keybind to Numpad 9 - Done!
if %chat%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000037 /f
if %chat%==numstar ECHO Set Chat keybind to Numpad * - Done!
if %chat%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000004a /f
if %chat%==numminus ECHO Set Chat keybind to Numpad - - Done!
if %chat%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000004e /f
if %chat%==numplus ECHO Set Chat keybind to Numpad + - Done!
if %chat%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000048 /f
if %chat%==up ECHO Set Chat keybind to Up Arrow - Done!
if %chat%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x00000050 /f
if %chat%==down ECHO Set Chat keybind to Down Arrow - Done!
if %chat%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000004b /f
if %chat%==left ECHO Set Chat keybind to Left Arrow - Done!
if %chat%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat" /t REG_DWORD /d 0x0000004d /f
if %chat%==right ECHO Set Chat keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:netchat
ECHO                      --- Bind Network Chat ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p netchat="Input a key and press Enter to bind it to Weapon: "
@echo off
if %netchat%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000001e /f
if %netchat%==a ECHO Set Network Chat keybind to A - Done!
if %netchat%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000030 /f
if %netchat%==b ECHO Set Network Chat keybind to B - Done!
if %netchat%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000002e /f
if %netchat%==c ECHO Set Network Chat keybind to C - Done!
if %netchat%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000020 /f
if %netchat%==d ECHO Set Network Chat keybind to D - Done!
if %netchat%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000012 /f
if %netchat%==e ECHO Set Network Chat keybind to E - Done!
if %netchat%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000021 /f
if %netchat%==f ECHO Set Network Chat keybind to F - Done!
if %netchat%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000022 /f
if %netchat%==g ECHO Set Network Chat keybind to G - Done!
if %netchat%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000023 /f
if %netchat%==h ECHO Set Network Chat keybind to H - Done!
if %netchat%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000017 /f
if %netchat%==i ECHO Set Network Chat keybind to I - Done!
if %netchat%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000024 /f
if %netchat%==j ECHO Set Network Chat keybind to J - Done!
if %netchat%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000025 /f
if %netchat%==k ECHO Set Network Chat keybind to K - Done!
if %netchat%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000026 /f
if %netchat%==l ECHO Set Network Chat keybind to L - Done!
if %netchat%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000032 /f
if %netchat%==m ECHO Set Network Chat keybind to M - Done!
if %netchat%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000031 /f
if %netchat%==n ECHO Set Network Chat keybind to N - Done!
if %netchat%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000018 /f
if %netchat%==o ECHO Set Network Chat keybind to O - Done!
if %netchat%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000019 /f
if %netchat%==p ECHO Set Network Chat keybind to P - Done!
if %netchat%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000010 /f
if %netchat%==q ECHO Set Network Chat keybind to Q - Done!
if %netchat%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000013 /f
if %netchat%==r ECHO Set Network Chat keybind to R - Done!
if %netchat%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000001f /f
if %netchat%==s ECHO Set Network Chat keybind to S - Done!
if %netchat%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000014 /f
if %netchat%==t ECHO Set Network Chat keybind to T - Done!
if %netchat%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000016 /f
if %netchat%==u ECHO Set Network Chat keybind to U - Done!
if %netchat%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000002f /f
if %netchat%==v ECHO Set Network Chat keybind to V - Done!
if %netchat%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000011 /f
if %netchat%==w ECHO Set Network Chat keybind to W - Done!
if %netchat%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000002d /f
if %netchat%==x ECHO Set Network Chat keybind to X - Done!
if %netchat%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000015 /f
if %netchat%==y ECHO Set Network Chat keybind to Y - Done!
if %netchat%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000002c /f
if %netchat%==z ECHO Set Network Chat keybind to Z - Done!
if %netchat%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000029 /f
if %netchat%==tilde ECHO Set Network Chat keybind to ~ - Done!
if %netchat%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000000d /f
if %netchat%==equal ECHO Set Network Chat keybind to = - Done!
if %netchat%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000000c /f
if %netchat%==minus ECHO Set Network Chat keybind to - - Done!
if %netchat%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000001a /f
if %netchat%==lbracket ECHO Set Network Chat keybind to [ - Done!
if %netchat%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000001b /f
if %netchat%==rbracket ECHO Set Network Chat keybind to ] - Done!
if %netchat%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000035 /f
if %netchat%==slash ECHO Set Network Chat keybind to / - Done!
if %netchat%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000002b /f
if %netchat%==bslash ECHO Set Network Chat keybind to \ - Done!
if %netchat%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000027 /f
if %netchat%==colon ECHO Set Network Chat keybind to ; - Done!
if %netchat%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000028 /f
if %netchat%==quote ECHO Set Network Chat keybind to ' - Done!
if %netchat%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000033 /f
if %netchat%==comma ECHO Set Network Chat keybind to , - Done!
if %netchat%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000034 /f
if %netchat%==period ECHO Set Network Chat keybind to . - Done!
if %netchat%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000000e /f
if %netchat%==bckspc ECHO Set Network Chat keybind to Backspace - Done!
if %netchat%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000000f /f
if %netchat%==tab ECHO Set Network Chat keybind to Tab - Done!
if %netchat%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000001c /f
if %netchat%==enter ECHO Set Network Chat keybind to Enter - Done!
if %netchat%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000039 /f
if %netchat%==space ECHO Set Network Chat keybind to Space Bar - Done!
if %netchat%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000001 /f
if %netchat%==esc ECHO Set Network Chat keybind to Escape - Done!
if %netchat%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000052 /f
if %netchat%==ins ECHO Set Network Chat keybind to Insert - Done!
if %netchat%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000053 /f
if %netchat%==del ECHO Set Network Chat keybind to Delete - Done!
if %netchat%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000047 /f
if %netchat%==home ECHO Set Network Chat keybind to Home - Done!
if %netchat%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000004f /f
if %netchat%==end ECHO Set Network Chat keybind to End - Done!
if %netchat%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000049 /f
if %netchat%==pgup ECHO Set Network Chat keybind to Page Up - Done!
if %netchat%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000051 /f
if %netchat%==pgdn ECHO Set Network Chat keybind to Page Down - Done!
if %netchat%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000003b /f
if %netchat%==f1 ECHO Set Network Chat keybind to F1 - Done!
if %netchat%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000003c /f
if %netchat%==f2 ECHO Set Network Chat keybind to F2 - Done!
if %netchat%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000003d /f
if %netchat%==f3 ECHO Set Network Chat keybind to F3 - Done!
if %netchat%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000003e /f
if %netchat%==f4 ECHO Set Network Chat keybind to F4 - Done!
if %netchat%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000003f /f
if %netchat%==f5 ECHO Set Network Chat keybind to F5 - Done!
if %netchat%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000040 /f
if %netchat%==f6 ECHO Set Network Chat keybind to F6 - Done!
if %netchat%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000041 /f
if %netchat%==f7 ECHO Set Network Chat keybind to F7 - Done!
if %netchat%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000042 /f
if %netchat%==f8 ECHO Set Network Chat keybind to F8 - Done!
if %netchat%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000043 /f
if %netchat%==f9 ECHO Set Network Chat keybind to F9 - Done!
if %netchat%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000044 /f
if %netchat%==f10 ECHO Set Network Chat keybind to F10 - Done!
if %netchat%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000085 /f
if %netchat%==f11 ECHO Set Network Chat keybind to F11 - Done!
if %netchat%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000086 /f
if %netchat%==f12 ECHO Set Network Chat keybind to F12 - Done!
if %netchat%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000004f /f
if %netchat%==num1 ECHO Set Network Chat keybind to Numpad 1 - Done!
if %netchat%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000050 /f
if %netchat%==num2 ECHO Set Network Chat keybind to Numpad 2 - Done!
if %netchat%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000051 /f
if %netchat%==num3 ECHO Set Network Chat keybind to Numpad 3 - Done!
if %netchat%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000004b /f
if %netchat%==num4 ECHO Set Network Chat keybind to Numpad 4 - Done!
if %netchat%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000004c /f
if %netchat%==num5 ECHO Set Network Chat keybind to Numpad 5 - Done!
if %netchat%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000004d /f
if %netchat%==num6 ECHO Set Network Chat keybind to Numpad 6 - Done!
if %netchat%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000047 /f
if %netchat%==num7 ECHO Set Network Chat keybind to Numpad 7 - Done!
if %netchat%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000048 /f
if %netchat%==num8 ECHO Set Network Chat keybind to Numpad 8 - Done!
if %netchat%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000049 /f
if %netchat%==num9 ECHO Set Network Chat keybind to Numpad 9 - Done!
if %netchat%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000037 /f
if %netchat%==numstar ECHO Set Network Chat keybind to Numpad * - Done!
if %netchat%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000004a /f
if %netchat%==numminus ECHO Set Network Chat keybind to Numpad - - Done!
if %netchat%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000004e /f
if %netchat%==numplus ECHO Set Network Chat keybind to Numpad + - Done!
if %netchat%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000048 /f
if %netchat%==up ECHO Set Network Chat keybind to Up Arrow - Done!
if %netchat%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x00000050 /f
if %netchat%==down ECHO Set Network Chat keybind to Down Arrow - Done!
if %netchat%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000004b /f
if %netchat%==left ECHO Set Network Chat keybind to Left Arrow - Done!
if %netchat%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chat (Network Only)" /t REG_DWORD /d 0x0000004d /f
if %netchat%==right ECHO Set Network Chat keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:messages
ECHO                      --- Bind Messages ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p messages="Input a key and press Enter to bind it to Weapon: "
@echo off
if %messages%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000001e /f
if %messages%==a ECHO Set Messages keybind to A - Done!
if %messages%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000030 /f
if %messages%==b ECHO Set Messages keybind to B - Done!
if %messages%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000002e /f
if %messages%==c ECHO Set Messages keybind to C - Done!
if %messages%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000020 /f
if %messages%==d ECHO Set Messages keybind to D - Done!
if %messages%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000012 /f
if %messages%==e ECHO Set Messages keybind to E - Done!
if %messages%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000021 /f
if %messages%==f ECHO Set Messages keybind to F - Done!
if %messages%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000022 /f
if %messages%==g ECHO Set Messages keybind to G - Done!
if %messages%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000023 /f
if %messages%==h ECHO Set Messages keybind to H - Done!
if %messages%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000017 /f
if %messages%==i ECHO Set Messages keybind to I - Done!
if %messages%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000024 /f
if %messages%==j ECHO Set Messages keybind to J - Done!
if %messages%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000025 /f
if %messages%==k ECHO Set Messages keybind to K - Done!
if %messages%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000026 /f
if %messages%==l ECHO Set Messages keybind to L - Done!
if %messages%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000032 /f
if %messages%==m ECHO Set Messages keybind to M - Done!
if %messages%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000031 /f
if %messages%==n ECHO Set Messages keybind to N - Done!
if %messages%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000018 /f
if %messages%==o ECHO Set Messages keybind to O - Done!
if %messages%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000019 /f
if %messages%==p ECHO Set Messages keybind to P - Done!
if %messages%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000010 /f
if %messages%==q ECHO Set Messages keybind to Q - Done!
if %messages%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000013 /f
if %messages%==r ECHO Set Messages keybind to R - Done!
if %messages%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000001f /f
if %messages%==s ECHO Set Messages keybind to S - Done!
if %messages%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000014 /f
if %messages%==t ECHO Set Messages keybind to T - Done!
if %messages%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000016 /f
if %messages%==u ECHO Set Messages keybind to U - Done!
if %messages%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000002f /f
if %messages%==v ECHO Set Messages keybind to V - Done!
if %messages%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000011 /f
if %messages%==w ECHO Set Messages keybind to W - Done!
if %messages%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000002d /f
if %messages%==x ECHO Set Messages keybind to X - Done!
if %messages%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000015 /f
if %messages%==y ECHO Set Messages keybind to Y - Done!
if %messages%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000002c /f
if %messages%==z ECHO Set Messages keybind to Z - Done!
if %messages%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000029 /f
if %messages%==tilde ECHO Set Messages keybind to ~ - Done!
if %messages%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000000d /f
if %messages%==equal ECHO Set Messages keybind to = - Done!
if %messages%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000000c /f
if %messages%==minus ECHO Set Messages keybind to - - Done!
if %messages%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000001a /f
if %messages%==lbracket ECHO Set Messages keybind to [ - Done!
if %messages%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000001b /f
if %messages%==rbracket ECHO Set Messages keybind to ] - Done!
if %messages%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000035 /f
if %messages%==slash ECHO Set Messages keybind to / - Done!
if %messages%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000002b /f
if %messages%==bslash ECHO Set Messages keybind to \ - Done!
if %messages%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000027 /f
if %messages%==colon ECHO Set Messages keybind to ; - Done!
if %messages%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000028 /f
if %messages%==quote ECHO Set Messages keybind to ' - Done!
if %messages%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000033 /f
if %messages%==comma ECHO Set Messages keybind to , - Done!
if %messages%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000034 /f
if %messages%==period ECHO Set Messages keybind to . - Done!
if %messages%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000000e /f
if %messages%==bckspc ECHO Set Messages keybind to Backspace - Done!
if %messages%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000000f /f
if %messages%==tab ECHO Set Messages keybind to Tab - Done!
if %messages%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000001c /f
if %messages%==enter ECHO Set Messages keybind to Enter - Done!
if %messages%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000039 /f
if %messages%==space ECHO Set Messages keybind to Space Bar - Done!
if %messages%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000001 /f
if %messages%==esc ECHO Set Messages keybind to Escape - Done!
if %messages%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000052 /f
if %messages%==ins ECHO Set Messages keybind to Insert - Done!
if %messages%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000053 /f
if %messages%==del ECHO Set Messages keybind to Delete - Done!
if %messages%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000047 /f
if %messages%==home ECHO Set Messages keybind to Home - Done!
if %messages%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000004f /f
if %messages%==end ECHO Set Messages keybind to End - Done!
if %messages%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000049 /f
if %messages%==pgup ECHO Set Messages keybind to Page Up - Done!
if %messages%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000051 /f
if %messages%==pgdn ECHO Set Messages keybind to Page Down - Done!
if %messages%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000003b /f
if %messages%==f1 ECHO Set Messages keybind to F1 - Done!
if %messages%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000003c /f
if %messages%==f2 ECHO Set Messages keybind to F2 - Done!
if %messages%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000003d /f
if %messages%==f3 ECHO Set Messages keybind to F3 - Done!
if %messages%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000003e /f
if %messages%==f4 ECHO Set Messages keybind to F4 - Done!
if %messages%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000003f /f
if %messages%==f5 ECHO Set Messages keybind to F5 - Done!
if %messages%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000040 /f
if %messages%==f6 ECHO Set Messages keybind to F6 - Done!
if %messages%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000041 /f
if %messages%==f7 ECHO Set Messages keybind to F7 - Done!
if %messages%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000042 /f
if %messages%==f8 ECHO Set Messages keybind to F8 - Done!
if %messages%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000043 /f
if %messages%==f9 ECHO Set Messages keybind to F9 - Done!
if %messages%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000044 /f
if %messages%==f10 ECHO Set Messages keybind to F10 - Done!
if %messages%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000085 /f
if %messages%==f11 ECHO Set Messages keybind to F11 - Done!
if %messages%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000086 /f
if %messages%==f12 ECHO Set Messages keybind to F12 - Done!
if %messages%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000004f /f
if %messages%==num1 ECHO Set Messages keybind to Numpad 1 - Done!
if %messages%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000050 /f
if %messages%==num2 ECHO Set Messages keybind to Numpad 2 - Done!
if %messages%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000051 /f
if %messages%==num3 ECHO Set Messages keybind to Numpad 3 - Done!
if %messages%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000004b /f
if %messages%==num4 ECHO Set Messages keybind to Numpad 4 - Done!
if %messages%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000004c /f
if %messages%==num5 ECHO Set Messages keybind to Numpad 5 - Done!
if %messages%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000004d /f
if %messages%==num6 ECHO Set Messages keybind to Numpad 6 - Done!
if %messages%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000047 /f
if %messages%==num7 ECHO Set Messages keybind to Numpad 7 - Done!
if %messages%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000048 /f
if %messages%==num8 ECHO Set Messages keybind to Numpad 8 - Done!
if %messages%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000049 /f
if %messages%==num9 ECHO Set Messages keybind to Numpad 9 - Done!
if %messages%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000037 /f
if %messages%==numstar ECHO Set Messages keybind to Numpad * - Done!
if %messages%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000004a /f
if %messages%==numminus ECHO Set Messages keybind to Numpad - - Done!
if %messages%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000004e /f
if %messages%==numplus ECHO Set Messages keybind to Numpad + - Done!
if %messages%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000048 /f
if %messages%==up ECHO Set Messages keybind to Up Arrow - Done!
if %messages%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x00000050 /f
if %messages%==down ECHO Set Messages keybind to Down Arrow - Done!
if %messages%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000004b /f
if %messages%==left ECHO Set Messages keybind to Left Arrow - Done!
if %messages%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Messages" /t REG_DWORD /d 0x0000004d /f
if %messages%==right ECHO Set Messages keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:navigation
ECHO                      --- Bind Navigation ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p navigation="Input a key and press Enter to bind it to Weapon: "
@echo off
if %navigation%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000001e /f
if %navigation%==a ECHO Set Navigation keybind to A - Done!
if %navigation%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000030 /f
if %navigation%==b ECHO Set Navigation keybind to B - Done!
if %navigation%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000002e /f
if %navigation%==c ECHO Set Navigation keybind to C - Done!
if %navigation%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000020 /f
if %navigation%==d ECHO Set Navigation keybind to D - Done!
if %navigation%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000012 /f
if %navigation%==e ECHO Set Navigation keybind to E - Done!
if %navigation%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000021 /f
if %navigation%==f ECHO Set Navigation keybind to F - Done!
if %navigation%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000022 /f
if %navigation%==g ECHO Set Navigation keybind to G - Done!
if %navigation%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000023 /f
if %navigation%==h ECHO Set Navigation keybind to H - Done!
if %navigation%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000017 /f
if %navigation%==i ECHO Set Navigation keybind to I - Done!
if %navigation%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000024 /f
if %navigation%==j ECHO Set Navigation keybind to J - Done!
if %navigation%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000025 /f
if %navigation%==k ECHO Set Navigation keybind to K - Done!
if %navigation%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000026 /f
if %navigation%==l ECHO Set Navigation keybind to L - Done!
if %navigation%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000032 /f
if %navigation%==m ECHO Set Navigation keybind to M - Done!
if %navigation%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000031 /f
if %navigation%==n ECHO Set Navigation keybind to N - Done!
if %navigation%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000018 /f
if %navigation%==o ECHO Set Navigation keybind to O - Done!
if %navigation%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000019 /f
if %navigation%==p ECHO Set Navigation keybind to P - Done!
if %navigation%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000010 /f
if %navigation%==q ECHO Set Navigation keybind to Q - Done!
if %navigation%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000013 /f
if %navigation%==r ECHO Set Navigation keybind to R - Done!
if %navigation%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000001f /f
if %navigation%==s ECHO Set Navigation keybind to S - Done!
if %navigation%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000014 /f
if %navigation%==t ECHO Set Navigation keybind to T - Done!
if %navigation%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000016 /f
if %navigation%==u ECHO Set Navigation keybind to U - Done!
if %navigation%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000002f /f
if %navigation%==v ECHO Set Navigation keybind to V - Done!
if %navigation%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000011 /f
if %navigation%==w ECHO Set Navigation keybind to W - Done!
if %navigation%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000002d /f
if %navigation%==x ECHO Set Navigation keybind to X - Done!
if %navigation%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000015 /f
if %navigation%==y ECHO Set Navigation keybind to Y - Done!
if %navigation%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000002c /f
if %navigation%==z ECHO Set Navigation keybind to Z - Done!
if %navigation%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000029 /f
if %navigation%==tilde ECHO Set Navigation keybind to ~ - Done!
if %navigation%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000000d /f
if %navigation%==equal ECHO Set Navigation keybind to = - Done!
if %navigation%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000000c /f
if %navigation%==minus ECHO Set Navigation keybind to - - Done!
if %navigation%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000001a /f
if %navigation%==lbracket ECHO Set Navigation keybind to [ - Done!
if %navigation%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000001b /f
if %navigation%==rbracket ECHO Set Navigation keybind to ] - Done!
if %navigation%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000035 /f
if %navigation%==slash ECHO Set Navigation keybind to / - Done!
if %navigation%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000002b /f
if %navigation%==bslash ECHO Set Navigation keybind to \ - Done!
if %navigation%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000027 /f
if %navigation%==colon ECHO Set Navigation keybind to ; - Done!
if %navigation%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000028 /f
if %navigation%==quote ECHO Set Navigation keybind to ' - Done!
if %navigation%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000033 /f
if %navigation%==comma ECHO Set Navigation keybind to , - Done!
if %navigation%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000034 /f
if %navigation%==period ECHO Set Navigation keybind to . - Done!
if %navigation%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000000e /f
if %navigation%==bckspc ECHO Set Navigation keybind to Backspace - Done!
if %navigation%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000000f /f
if %navigation%==tab ECHO Set Navigation keybind to Tab - Done!
if %navigation%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000001c /f
if %navigation%==enter ECHO Set Navigation keybind to Enter - Done!
if %navigation%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000039 /f
if %navigation%==space ECHO Set Navigation keybind to Space Bar - Done!
if %navigation%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000001 /f
if %navigation%==esc ECHO Set Navigation keybind to Escape - Done!
if %navigation%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000052 /f
if %navigation%==ins ECHO Set Navigation keybind to Insert - Done!
if %navigation%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000053 /f
if %navigation%==del ECHO Set Navigation keybind to Delete - Done!
if %navigation%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000047 /f
if %navigation%==home ECHO Set Navigation keybind to Home - Done!
if %navigation%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000004f /f
if %navigation%==end ECHO Set Navigation keybind to End - Done!
if %navigation%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000049 /f
if %navigation%==pgup ECHO Set Navigation keybind to Page Up - Done!
if %navigation%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000051 /f
if %navigation%==pgdn ECHO Set Navigation keybind to Page Down - Done!
if %navigation%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000003b /f
if %navigation%==f1 ECHO Set Navigation keybind to F1 - Done!
if %navigation%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000003c /f
if %navigation%==f2 ECHO Set Navigation keybind to F2 - Done!
if %navigation%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000003d /f
if %navigation%==f3 ECHO Set Navigation keybind to F3 - Done!
if %navigation%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000003e /f
if %navigation%==f4 ECHO Set Navigation keybind to F4 - Done!
if %navigation%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000003f /f
if %navigation%==f5 ECHO Set Navigation keybind to F5 - Done!
if %navigation%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000040 /f
if %navigation%==f6 ECHO Set Navigation keybind to F6 - Done!
if %navigation%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000041 /f
if %navigation%==f7 ECHO Set Navigation keybind to F7 - Done!
if %navigation%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000042 /f
if %navigation%==f8 ECHO Set Navigation keybind to F8 - Done!
if %navigation%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000043 /f
if %navigation%==f9 ECHO Set Navigation keybind to F9 - Done!
if %navigation%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000044 /f
if %navigation%==f10 ECHO Set Navigation keybind to F10 - Done!
if %navigation%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000085 /f
if %navigation%==f11 ECHO Set Navigation keybind to F11 - Done!
if %navigation%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000086 /f
if %navigation%==f12 ECHO Set Navigation keybind to F12 - Done!
if %navigation%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000004f /f
if %navigation%==num1 ECHO Set Navigation keybind to Numpad 1 - Done!
if %navigation%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000050 /f
if %navigation%==num2 ECHO Set Navigation keybind to Numpad 2 - Done!
if %navigation%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000051 /f
if %navigation%==num3 ECHO Set Navigation keybind to Numpad 3 - Done!
if %navigation%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000004b /f
if %navigation%==num4 ECHO Set Navigation keybind to Numpad 4 - Done!
if %navigation%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000004c /f
if %navigation%==num5 ECHO Set Navigation keybind to Numpad 5 - Done!
if %navigation%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000004d /f
if %navigation%==num6 ECHO Set Navigation keybind to Numpad 6 - Done!
if %navigation%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000047 /f
if %navigation%==num7 ECHO Set Navigation keybind to Numpad 7 - Done!
if %navigation%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000048 /f
if %navigation%==num8 ECHO Set Navigation keybind to Numpad 8 - Done!
if %navigation%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000049 /f
if %navigation%==num9 ECHO Set Navigation keybind to Numpad 9 - Done!
if %navigation%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000037 /f
if %navigation%==numstar ECHO Set Navigation keybind to Numpad * - Done!
if %navigation%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000004a /f
if %navigation%==numminus ECHO Set Navigation keybind to Numpad - - Done!
if %navigation%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000004e /f
if %navigation%==numplus ECHO Set Navigation keybind to Numpad + - Done!
if %navigation%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000048 /f
if %navigation%==up ECHO Set Navigation keybind to Up Arrow - Done!
if %navigation%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x00000050 /f
if %navigation%==down ECHO Set Navigation keybind to Down Arrow - Done!
if %navigation%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000004b /f
if %navigation%==left ECHO Set Navigation keybind to Left Arrow - Done!
if %navigation%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Navigation" /t REG_DWORD /d 0x0000004d /f
if %navigation%==right ECHO Set Navigation keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:nightscope
ECHO                      --- Bind Nightscope ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p nightscope="Input a key and press Enter to bind it to Weapon: "
@echo off
if %nightscope%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000001e /f
if %nightscope%==a ECHO Set Nightscope keybind to A - Done!
if %nightscope%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000030 /f
if %nightscope%==b ECHO Set Nightscope keybind to B - Done!
if %nightscope%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000002e /f
if %nightscope%==c ECHO Set Nightscope keybind to C - Done!
if %nightscope%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000020 /f
if %nightscope%==d ECHO Set Nightscope keybind to D - Done!
if %nightscope%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000012 /f
if %nightscope%==e ECHO Set Nightscope keybind to E - Done!
if %nightscope%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000021 /f
if %nightscope%==f ECHO Set Nightscope keybind to F - Done!
if %nightscope%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000022 /f
if %nightscope%==g ECHO Set Nightscope keybind to G - Done!
if %nightscope%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000023 /f
if %nightscope%==h ECHO Set Nightscope keybind to H - Done!
if %nightscope%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000017 /f
if %nightscope%==i ECHO Set Nightscope keybind to I - Done!
if %nightscope%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000024 /f
if %nightscope%==j ECHO Set Nightscope keybind to J - Done!
if %nightscope%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000025 /f
if %nightscope%==k ECHO Set Nightscope keybind to K - Done!
if %nightscope%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000026 /f
if %nightscope%==l ECHO Set Nightscope keybind to L - Done!
if %nightscope%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000032 /f
if %nightscope%==m ECHO Set Nightscope keybind to M - Done!
if %nightscope%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000031 /f
if %nightscope%==n ECHO Set Nightscope keybind to N - Done!
if %nightscope%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000018 /f
if %nightscope%==o ECHO Set Nightscope keybind to O - Done!
if %nightscope%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000019 /f
if %nightscope%==p ECHO Set Nightscope keybind to P - Done!
if %nightscope%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000010 /f
if %nightscope%==q ECHO Set Nightscope keybind to Q - Done!
if %nightscope%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000013 /f
if %nightscope%==r ECHO Set Nightscope keybind to R - Done!
if %nightscope%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000001f /f
if %nightscope%==s ECHO Set Nightscope keybind to S - Done!
if %nightscope%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000014 /f
if %nightscope%==t ECHO Set Nightscope keybind to T - Done!
if %nightscope%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000016 /f
if %nightscope%==u ECHO Set Nightscope keybind to U - Done!
if %nightscope%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000002f /f
if %nightscope%==v ECHO Set Nightscope keybind to V - Done!
if %nightscope%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000011 /f
if %nightscope%==w ECHO Set Nightscope keybind to W - Done!
if %nightscope%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000002d /f
if %nightscope%==x ECHO Set Nightscope keybind to X - Done!
if %nightscope%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000015 /f
if %nightscope%==y ECHO Set Nightscope keybind to Y - Done!
if %nightscope%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000002c /f
if %nightscope%==z ECHO Set Nightscope keybind to Z - Done!
if %nightscope%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000029 /f
if %nightscope%==tilde ECHO Set Nightscope keybind to ~ - Done!
if %nightscope%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000000d /f
if %nightscope%==equal ECHO Set Nightscope keybind to = - Done!
if %nightscope%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000000c /f
if %nightscope%==minus ECHO Set Nightscope keybind to - - Done!
if %nightscope%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000001a /f
if %nightscope%==lbracket ECHO Set Nightscope keybind to [ - Done!
if %nightscope%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000001b /f
if %nightscope%==rbracket ECHO Set Nightscope keybind to ] - Done!
if %nightscope%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000035 /f
if %nightscope%==slash ECHO Set Nightscope keybind to / - Done!
if %nightscope%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000002b /f
if %nightscope%==bslash ECHO Set Nightscope keybind to \ - Done!
if %nightscope%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000027 /f
if %nightscope%==colon ECHO Set Nightscope keybind to ; - Done!
if %nightscope%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000028 /f
if %nightscope%==quote ECHO Set Nightscope keybind to ' - Done!
if %nightscope%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000033 /f
if %nightscope%==comma ECHO Set Nightscope keybind to , - Done!
if %nightscope%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000034 /f
if %nightscope%==period ECHO Set Nightscope keybind to . - Done!
if %nightscope%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000000e /f
if %nightscope%==bckspc ECHO Set Nightscope keybind to Backspace - Done!
if %nightscope%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000000f /f
if %nightscope%==tab ECHO Set Nightscope keybind to Tab - Done!
if %nightscope%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000001c /f
if %nightscope%==enter ECHO Set Nightscope keybind to Enter - Done!
if %nightscope%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000039 /f
if %nightscope%==space ECHO Set Nightscope keybind to Space Bar - Done!
if %nightscope%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000001 /f
if %nightscope%==esc ECHO Set Nightscope keybind to Escape - Done!
if %nightscope%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000052 /f
if %nightscope%==ins ECHO Set Nightscope keybind to Insert - Done!
if %nightscope%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000053 /f
if %nightscope%==del ECHO Set Nightscope keybind to Delete - Done!
if %nightscope%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000047 /f
if %nightscope%==home ECHO Set Nightscope keybind to Home - Done!
if %nightscope%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000004f /f
if %nightscope%==end ECHO Set Nightscope keybind to End - Done!
if %nightscope%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000049 /f
if %nightscope%==pgup ECHO Set Nightscope keybind to Page Up - Done!
if %nightscope%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000051 /f
if %nightscope%==pgdn ECHO Set Nightscope keybind to Page Down - Done!
if %nightscope%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000003b /f
if %nightscope%==f1 ECHO Set Nightscope keybind to F1 - Done!
if %nightscope%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000003c /f
if %nightscope%==f2 ECHO Set Nightscope keybind to F2 - Done!
if %nightscope%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000003d /f
if %nightscope%==f3 ECHO Set Nightscope keybind to F3 - Done!
if %nightscope%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000003e /f
if %nightscope%==f4 ECHO Set Nightscope keybind to F4 - Done!
if %nightscope%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000003f /f
if %nightscope%==f5 ECHO Set Nightscope keybind to F5 - Done!
if %nightscope%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000040 /f
if %nightscope%==f6 ECHO Set Nightscope keybind to F6 - Done!
if %nightscope%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000041 /f
if %nightscope%==f7 ECHO Set Nightscope keybind to F7 - Done!
if %nightscope%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000042 /f
if %nightscope%==f8 ECHO Set Nightscope keybind to F8 - Done!
if %nightscope%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000043 /f
if %nightscope%==f9 ECHO Set Nightscope keybind to F9 - Done!
if %nightscope%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000044 /f
if %nightscope%==f10 ECHO Set Nightscope keybind to F10 - Done!
if %nightscope%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000085 /f
if %nightscope%==f11 ECHO Set Nightscope keybind to F11 - Done!
if %nightscope%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000086 /f
if %nightscope%==f12 ECHO Set Nightscope keybind to F12 - Done!
if %nightscope%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000004f /f
if %nightscope%==num1 ECHO Set Nightscope keybind to Numpad 1 - Done!
if %nightscope%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000050 /f
if %nightscope%==num2 ECHO Set Nightscope keybind to Numpad 2 - Done!
if %nightscope%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000051 /f
if %nightscope%==num3 ECHO Set Nightscope keybind to Numpad 3 - Done!
if %nightscope%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000004b /f
if %nightscope%==num4 ECHO Set Nightscope keybind to Numpad 4 - Done!
if %nightscope%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000004c /f
if %nightscope%==num5 ECHO Set Nightscope keybind to Numpad 5 - Done!
if %nightscope%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000004d /f
if %nightscope%==num6 ECHO Set Nightscope keybind to Numpad 6 - Done!
if %nightscope%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000047 /f
if %nightscope%==num7 ECHO Set Nightscope keybind to Numpad 7 - Done!
if %nightscope%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000048 /f
if %nightscope%==num8 ECHO Set Nightscope keybind to Numpad 8 - Done!
if %nightscope%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000049 /f
if %nightscope%==num9 ECHO Set Nightscope keybind to Numpad 9 - Done!
if %nightscope%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000037 /f
if %nightscope%==numstar ECHO Set Nightscope keybind to Numpad * - Done!
if %nightscope%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000004a /f
if %nightscope%==numminus ECHO Set Nightscope keybind to Numpad - - Done!
if %nightscope%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000004e /f
if %nightscope%==numplus ECHO Set Nightscope keybind to Numpad + - Done!
if %nightscope%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000048 /f
if %nightscope%==up ECHO Set Nightscope keybind to Up Arrow - Done!
if %nightscope%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x00000050 /f
if %nightscope%==down ECHO Set Nightscope keybind to Down Arrow - Done!
if %nightscope%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000004b /f
if %nightscope%==left ECHO Set Nightscope keybind to Left Arrow - Done!
if %nightscope%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Nightscope" /t REG_DWORD /d 0x0000004d /f
if %nightscope%==right ECHO Set Nightscope keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:togglehud
ECHO                      --- Bind Toggle HUD ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p togglehud="Input a key and press Enter to bind it to Weapon: "
@echo off
if %togglehud%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000001e /f
if %togglehud%==a ECHO Set Toggle HUD keybind to A - Done!
if %togglehud%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000030 /f
if %togglehud%==b ECHO Set Toggle HUD keybind to B - Done!
if %togglehud%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000002e /f
if %togglehud%==c ECHO Set Toggle HUD keybind to C - Done!
if %togglehud%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000020 /f
if %togglehud%==d ECHO Set Toggle HUD keybind to D - Done!
if %togglehud%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000012 /f
if %togglehud%==e ECHO Set Toggle HUD keybind to E - Done!
if %togglehud%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000021 /f
if %togglehud%==f ECHO Set Toggle HUD keybind to F - Done!
if %togglehud%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000022 /f
if %togglehud%==g ECHO Set Toggle HUD keybind to G - Done!
if %togglehud%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000023 /f
if %togglehud%==h ECHO Set Toggle HUD keybind to H - Done!
if %togglehud%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000017 /f
if %togglehud%==i ECHO Set Toggle HUD keybind to I - Done!
if %togglehud%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000024 /f
if %togglehud%==j ECHO Set Toggle HUD keybind to J - Done!
if %togglehud%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000025 /f
if %togglehud%==k ECHO Set Toggle HUD keybind to K - Done!
if %togglehud%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000026 /f
if %togglehud%==l ECHO Set Toggle HUD keybind to L - Done!
if %togglehud%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000032 /f
if %togglehud%==m ECHO Set Toggle HUD keybind to M - Done!
if %togglehud%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000031 /f
if %togglehud%==n ECHO Set Toggle HUD keybind to N - Done!
if %togglehud%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000018 /f
if %togglehud%==o ECHO Set Toggle HUD keybind to O - Done!
if %togglehud%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000019 /f
if %togglehud%==p ECHO Set Toggle HUD keybind to P - Done!
if %togglehud%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000010 /f
if %togglehud%==q ECHO Set Toggle HUD keybind to Q - Done!
if %togglehud%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000013 /f
if %togglehud%==r ECHO Set Toggle HUD keybind to R - Done!
if %togglehud%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000001f /f
if %togglehud%==s ECHO Set Toggle HUD keybind to S - Done!
if %togglehud%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000014 /f
if %togglehud%==t ECHO Set Toggle HUD keybind to T - Done!
if %togglehud%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000016 /f
if %togglehud%==u ECHO Set Toggle HUD keybind to U - Done!
if %togglehud%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000002f /f
if %togglehud%==v ECHO Set Toggle HUD keybind to V - Done!
if %togglehud%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000011 /f
if %togglehud%==w ECHO Set Toggle HUD keybind to W - Done!
if %togglehud%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000002d /f
if %togglehud%==x ECHO Set Toggle HUD keybind to X - Done!
if %togglehud%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000015 /f
if %togglehud%==y ECHO Set Toggle HUD keybind to Y - Done!
if %togglehud%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000002c /f
if %togglehud%==z ECHO Set Toggle HUD keybind to Z - Done!
if %togglehud%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000029 /f
if %togglehud%==tilde ECHO Set Toggle HUD keybind to ~ - Done!
if %togglehud%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000000d /f
if %togglehud%==equal ECHO Set Toggle HUD keybind to = - Done!
if %togglehud%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000000c /f
if %togglehud%==minus ECHO Set Toggle HUD keybind to - - Done!
if %togglehud%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000001a /f
if %togglehud%==lbracket ECHO Set Toggle HUD keybind to [ - Done!
if %togglehud%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000001b /f
if %togglehud%==rbracket ECHO Set Toggle HUD keybind to ] - Done!
if %togglehud%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000035 /f
if %togglehud%==slash ECHO Set Toggle HUD keybind to / - Done!
if %togglehud%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000002b /f
if %togglehud%==bslash ECHO Set Toggle HUD keybind to \ - Done!
if %togglehud%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000027 /f
if %togglehud%==colon ECHO Set Toggle HUD keybind to ; - Done!
if %togglehud%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000028 /f
if %togglehud%==quote ECHO Set Toggle HUD keybind to ' - Done!
if %togglehud%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000033 /f
if %togglehud%==comma ECHO Set Toggle HUD keybind to , - Done!
if %togglehud%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000034 /f
if %togglehud%==period ECHO Set Toggle HUD keybind to . - Done!
if %togglehud%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000000e /f
if %togglehud%==bckspc ECHO Set Toggle HUD keybind to Backspace - Done!
if %togglehud%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000000f /f
if %togglehud%==tab ECHO Set Toggle HUD keybind to Tab - Done!
if %togglehud%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000001c /f
if %togglehud%==enter ECHO Set Toggle HUD keybind to Enter - Done!
if %togglehud%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000039 /f
if %togglehud%==space ECHO Set Toggle HUD keybind to Space Bar - Done!
if %togglehud%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000001 /f
if %togglehud%==esc ECHO Set Toggle HUD keybind to Escape - Done!
if %togglehud%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000052 /f
if %togglehud%==ins ECHO Set Toggle HUD keybind to Insert - Done!
if %togglehud%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000053 /f
if %togglehud%==del ECHO Set Toggle HUD keybind to Delete - Done!
if %togglehud%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000047 /f
if %togglehud%==home ECHO Set Toggle HUD keybind to Home - Done!
if %togglehud%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000004f /f
if %togglehud%==end ECHO Set Toggle HUD keybind to End - Done!
if %togglehud%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000049 /f
if %togglehud%==pgup ECHO Set Toggle HUD keybind to Page Up - Done!
if %togglehud%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000051 /f
if %togglehud%==pgdn ECHO Set Toggle HUD keybind to Page Down - Done!
if %togglehud%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000003b /f
if %togglehud%==f1 ECHO Set Toggle HUD keybind to F1 - Done!
if %togglehud%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000003c /f
if %togglehud%==f2 ECHO Set Toggle HUD keybind to F2 - Done!
if %togglehud%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000003d /f
if %togglehud%==f3 ECHO Set Toggle HUD keybind to F3 - Done!
if %togglehud%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000003e /f
if %togglehud%==f4 ECHO Set Toggle HUD keybind to F4 - Done!
if %togglehud%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000003f /f
if %togglehud%==f5 ECHO Set Toggle HUD keybind to F5 - Done!
if %togglehud%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000040 /f
if %togglehud%==f6 ECHO Set Toggle HUD keybind to F6 - Done!
if %togglehud%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000041 /f
if %togglehud%==f7 ECHO Set Toggle HUD keybind to F7 - Done!
if %togglehud%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000042 /f
if %togglehud%==f8 ECHO Set Toggle HUD keybind to F8 - Done!
if %togglehud%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000043 /f
if %togglehud%==f9 ECHO Set Toggle HUD keybind to F9 - Done!
if %togglehud%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000044 /f
if %togglehud%==f10 ECHO Set Toggle HUD keybind to F10 - Done!
if %togglehud%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000085 /f
if %togglehud%==f11 ECHO Set Toggle HUD keybind to F11 - Done!
if %togglehud%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000086 /f
if %togglehud%==f12 ECHO Set Toggle HUD keybind to F12 - Done!
if %togglehud%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000004f /f
if %togglehud%==num1 ECHO Set Toggle HUD keybind to Numpad 1 - Done!
if %togglehud%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000050 /f
if %togglehud%==num2 ECHO Set Toggle HUD keybind to Numpad 2 - Done!
if %togglehud%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000051 /f
if %togglehud%==num3 ECHO Set Toggle HUD keybind to Numpad 3 - Done!
if %togglehud%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000004b /f
if %togglehud%==num4 ECHO Set Toggle HUD keybind to Numpad 4 - Done!
if %togglehud%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000004c /f
if %togglehud%==num5 ECHO Set Toggle HUD keybind to Numpad 5 - Done!
if %togglehud%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000004d /f
if %togglehud%==num6 ECHO Set Toggle HUD keybind to Numpad 6 - Done!
if %togglehud%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000047 /f
if %togglehud%==num7 ECHO Set Toggle HUD keybind to Numpad 7 - Done!
if %togglehud%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000048 /f
if %togglehud%==num8 ECHO Set Toggle HUD keybind to Numpad 8 - Done!
if %togglehud%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000049 /f
if %togglehud%==num9 ECHO Set Toggle HUD keybind to Numpad 9 - Done!
if %togglehud%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000037 /f
if %togglehud%==numstar ECHO Set Toggle HUD keybind to Numpad * - Done!
if %togglehud%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000004a /f
if %togglehud%==numminus ECHO Set Toggle HUD keybind to Numpad - - Done!
if %togglehud%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000004e /f
if %togglehud%==numplus ECHO Set Toggle HUD keybind to Numpad + - Done!
if %togglehud%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000048 /f
if %togglehud%==up ECHO Set Toggle HUD keybind to Up Arrow - Done!
if %togglehud%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x00000050 /f
if %togglehud%==down ECHO Set Toggle HUD keybind to Down Arrow - Done!
if %togglehud%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000004b /f
if %togglehud%==left ECHO Set Toggle HUD keybind to Left Arrow - Done!
if %togglehud%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con HUD Function" /t REG_DWORD /d 0x0000004d /f
if %togglehud%==right ECHO Set Toggle HUD keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
REM ---------------------- View Controls -------------------------
REM --------------------------------------------------------------------------
:chaseview
ECHO                      --- Bind Chase View ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p chaseview="Input a key and press Enter to bind it to Weapon: "
@echo off
if %chaseview%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000001e /f
if %chaseview%==a ECHO Set Chase View keybind to A - Done!
if %chaseview%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000030 /f
if %chaseview%==b ECHO Set Chase View keybind to B - Done!
if %chaseview%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000002e /f
if %chaseview%==c ECHO Set Chase View keybind to C - Done!
if %chaseview%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000020 /f
if %chaseview%==d ECHO Set Chase View keybind to D - Done!
if %chaseview%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000012 /f
if %chaseview%==e ECHO Set Chase View keybind to E - Done!
if %chaseview%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000021 /f
if %chaseview%==f ECHO Set Chase View keybind to F - Done!
if %chaseview%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000022 /f
if %chaseview%==g ECHO Set Chase View keybind to G - Done!
if %chaseview%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000023 /f
if %chaseview%==h ECHO Set Chase View keybind to H - Done!
if %chaseview%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000017 /f
if %chaseview%==i ECHO Set Chase View keybind to I - Done!
if %chaseview%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000024 /f
if %chaseview%==j ECHO Set Chase View keybind to J - Done!
if %chaseview%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000025 /f
if %chaseview%==k ECHO Set Chase View keybind to K - Done!
if %chaseview%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000026 /f
if %chaseview%==l ECHO Set Chase View keybind to L - Done!
if %chaseview%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000032 /f
if %chaseview%==m ECHO Set Chase View keybind to M - Done!
if %chaseview%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000031 /f
if %chaseview%==n ECHO Set Chase View keybind to N - Done!
if %chaseview%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000018 /f
if %chaseview%==o ECHO Set Chase View keybind to O - Done!
if %chaseview%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000019 /f
if %chaseview%==p ECHO Set Chase View keybind to P - Done!
if %chaseview%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000010 /f
if %chaseview%==q ECHO Set Chase View keybind to Q - Done!
if %chaseview%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000013 /f
if %chaseview%==r ECHO Set Chase View keybind to R - Done!
if %chaseview%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000001f /f
if %chaseview%==s ECHO Set Chase View keybind to S - Done!
if %chaseview%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000014 /f
if %chaseview%==t ECHO Set Chase View keybind to T - Done!
if %chaseview%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000016 /f
if %chaseview%==u ECHO Set Chase View keybind to U - Done!
if %chaseview%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000002f /f
if %chaseview%==v ECHO Set Chase View keybind to V - Done!
if %chaseview%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000011 /f
if %chaseview%==w ECHO Set Chase View keybind to W - Done!
if %chaseview%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000002d /f
if %chaseview%==x ECHO Set Chase View keybind to X - Done!
if %chaseview%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000015 /f
if %chaseview%==y ECHO Set Chase View keybind to Y - Done!
if %chaseview%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000002c /f
if %chaseview%==z ECHO Set Chase View keybind to Z - Done!
if %chaseview%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000029 /f
if %chaseview%==tilde ECHO Set Chase View keybind to ~ - Done!
if %chaseview%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000000d /f
if %chaseview%==equal ECHO Set Chase View keybind to = - Done!
if %chaseview%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000000c /f
if %chaseview%==minus ECHO Set Chase View keybind to - - Done!
if %chaseview%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000001a /f
if %chaseview%==lbracket ECHO Set Chase View keybind to [ - Done!
if %chaseview%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000001b /f
if %chaseview%==rbracket ECHO Set Chase View keybind to ] - Done!
if %chaseview%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000035 /f
if %chaseview%==slash ECHO Set Chase View keybind to / - Done!
if %chaseview%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000002b /f
if %chaseview%==bslash ECHO Set Chase View keybind to \ - Done!
if %chaseview%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000027 /f
if %chaseview%==colon ECHO Set Chase View keybind to ; - Done!
if %chaseview%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000028 /f
if %chaseview%==quote ECHO Set Chase View keybind to ' - Done!
if %chaseview%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000033 /f
if %chaseview%==comma ECHO Set Chase View keybind to , - Done!
if %chaseview%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000034 /f
if %chaseview%==period ECHO Set Chase View keybind to . - Done!
if %chaseview%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000000e /f
if %chaseview%==bckspc ECHO Set Chase View keybind to Backspace - Done!
if %chaseview%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000000f /f
if %chaseview%==tab ECHO Set Chase View keybind to Tab - Done!
if %chaseview%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000001c /f
if %chaseview%==enter ECHO Set Chase View keybind to Enter - Done!
if %chaseview%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000039 /f
if %chaseview%==space ECHO Set Chase View keybind to Space Bar - Done!
if %chaseview%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000001 /f
if %chaseview%==esc ECHO Set Chase View keybind to Escape - Done!
if %chaseview%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000052 /f
if %chaseview%==ins ECHO Set Chase View keybind to Insert - Done!
if %chaseview%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000053 /f
if %chaseview%==del ECHO Set Chase View keybind to Delete - Done!
if %chaseview%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000047 /f
if %chaseview%==home ECHO Set Chase View keybind to Home - Done!
if %chaseview%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000004f /f
if %chaseview%==end ECHO Set Chase View keybind to End - Done!
if %chaseview%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000049 /f
if %chaseview%==pgup ECHO Set Chase View keybind to Page Up - Done!
if %chaseview%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000051 /f
if %chaseview%==pgdn ECHO Set Chase View keybind to Page Down - Done!
if %chaseview%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000003b /f
if %chaseview%==f1 ECHO Set Chase View keybind to F1 - Done!
if %chaseview%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000003c /f
if %chaseview%==f2 ECHO Set Chase View keybind to F2 - Done!
if %chaseview%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000003d /f
if %chaseview%==f3 ECHO Set Chase View keybind to F3 - Done!
if %chaseview%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000003e /f
if %chaseview%==f4 ECHO Set Chase View keybind to F4 - Done!
if %chaseview%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000003f /f
if %chaseview%==f5 ECHO Set Chase View keybind to F5 - Done!
if %chaseview%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000040 /f
if %chaseview%==f6 ECHO Set Chase View keybind to F6 - Done!
if %chaseview%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000041 /f
if %chaseview%==f7 ECHO Set Chase View keybind to F7 - Done!
if %chaseview%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000042 /f
if %chaseview%==f8 ECHO Set Chase View keybind to F8 - Done!
if %chaseview%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000043 /f
if %chaseview%==f9 ECHO Set Chase View keybind to F9 - Done!
if %chaseview%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000044 /f
if %chaseview%==f10 ECHO Set Chase View keybind to F10 - Done!
if %chaseview%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000085 /f
if %chaseview%==f11 ECHO Set Chase View keybind to F11 - Done!
if %chaseview%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000086 /f
if %chaseview%==f12 ECHO Set Chase View keybind to F12 - Done!
if %chaseview%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000004f /f
if %chaseview%==num1 ECHO Set Chase View keybind to Numpad 1 - Done!
if %chaseview%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000050 /f
if %chaseview%==num2 ECHO Set Chase View keybind to Numpad 2 - Done!
if %chaseview%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000051 /f
if %chaseview%==num3 ECHO Set Chase View keybind to Numpad 3 - Done!
if %chaseview%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000004b /f
if %chaseview%==num4 ECHO Set Chase View keybind to Numpad 4 - Done!
if %chaseview%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000004c /f
if %chaseview%==num5 ECHO Set Chase View keybind to Numpad 5 - Done!
if %chaseview%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000004d /f
if %chaseview%==num6 ECHO Set Chase View keybind to Numpad 6 - Done!
if %chaseview%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000047 /f
if %chaseview%==num7 ECHO Set Chase View keybind to Numpad 7 - Done!
if %chaseview%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000048 /f
if %chaseview%==num8 ECHO Set Chase View keybind to Numpad 8 - Done!
if %chaseview%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000049 /f
if %chaseview%==num9 ECHO Set Chase View keybind to Numpad 9 - Done!
if %chaseview%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000037 /f
if %chaseview%==numstar ECHO Set Chase View keybind to Numpad * - Done!
if %chaseview%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000004a /f
if %chaseview%==numminus ECHO Set Chase View keybind to Numpad - - Done!
if %chaseview%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000004e /f
if %chaseview%==numplus ECHO Set Chase View keybind to Numpad + - Done!
if %chaseview%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000048 /f
if %chaseview%==up ECHO Set Chase View keybind to Up Arrow - Done!
if %chaseview%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x00000050 /f
if %chaseview%==down ECHO Set Chase View keybind to Down Arrow - Done!
if %chaseview%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000004b /f
if %chaseview%==left ECHO Set Chase View keybind to Left Arrow - Done!
if %chaseview%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Chase View" /t REG_DWORD /d 0x0000004d /f
if %chaseview%==right ECHO Set Chase View keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:cockpitview
ECHO                      --- Bind Cockpit View ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p cockpitview="Input a key and press Enter to bind it to Weapon: "
@echo off
if %cockpitview%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000001e /f
if %cockpitview%==a ECHO Set Cockpit View keybind to A - Done!
if %cockpitview%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000030 /f
if %cockpitview%==b ECHO Set Cockpit View keybind to B - Done!
if %cockpitview%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000002e /f
if %cockpitview%==c ECHO Set Cockpit View keybind to C - Done!
if %cockpitview%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000020 /f
if %cockpitview%==d ECHO Set Cockpit View keybind to D - Done!
if %cockpitview%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000012 /f
if %cockpitview%==e ECHO Set Cockpit View keybind to E - Done!
if %cockpitview%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000021 /f
if %cockpitview%==f ECHO Set Cockpit View keybind to F - Done!
if %cockpitview%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000022 /f
if %cockpitview%==g ECHO Set Cockpit View keybind to G - Done!
if %cockpitview%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000023 /f
if %cockpitview%==h ECHO Set Cockpit View keybind to H - Done!
if %cockpitview%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000017 /f
if %cockpitview%==i ECHO Set Cockpit View keybind to I - Done!
if %cockpitview%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000024 /f
if %cockpitview%==j ECHO Set Cockpit View keybind to J - Done!
if %cockpitview%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000025 /f
if %cockpitview%==k ECHO Set Cockpit View keybind to K - Done!
if %cockpitview%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000026 /f
if %cockpitview%==l ECHO Set Cockpit View keybind to L - Done!
if %cockpitview%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000032 /f
if %cockpitview%==m ECHO Set Cockpit View keybind to M - Done!
if %cockpitview%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000031 /f
if %cockpitview%==n ECHO Set Cockpit View keybind to N - Done!
if %cockpitview%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000018 /f
if %cockpitview%==o ECHO Set Cockpit View keybind to O - Done!
if %cockpitview%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000019 /f
if %cockpitview%==p ECHO Set Cockpit View keybind to P - Done!
if %cockpitview%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000010 /f
if %cockpitview%==q ECHO Set Cockpit View keybind to Q - Done!
if %cockpitview%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000013 /f
if %cockpitview%==r ECHO Set Cockpit View keybind to R - Done!
if %cockpitview%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000001f /f
if %cockpitview%==s ECHO Set Cockpit View keybind to S - Done!
if %cockpitview%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000014 /f
if %cockpitview%==t ECHO Set Cockpit View keybind to T - Done!
if %cockpitview%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000016 /f
if %cockpitview%==u ECHO Set Cockpit View keybind to U - Done!
if %cockpitview%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000002f /f
if %cockpitview%==v ECHO Set Cockpit View keybind to V - Done!
if %cockpitview%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000011 /f
if %cockpitview%==w ECHO Set Cockpit View keybind to W - Done!
if %cockpitview%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000002d /f
if %cockpitview%==x ECHO Set Cockpit View keybind to X - Done!
if %cockpitview%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000015 /f
if %cockpitview%==y ECHO Set Cockpit View keybind to Y - Done!
if %cockpitview%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000002c /f
if %cockpitview%==z ECHO Set Cockpit View keybind to Z - Done!
if %cockpitview%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000029 /f
if %cockpitview%==tilde ECHO Set Cockpit View keybind to ~ - Done!
if %cockpitview%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000000d /f
if %cockpitview%==equal ECHO Set Cockpit View keybind to = - Done!
if %cockpitview%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000000c /f
if %cockpitview%==minus ECHO Set Cockpit View keybind to - - Done!
if %cockpitview%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000001a /f
if %cockpitview%==lbracket ECHO Set Cockpit View keybind to [ - Done!
if %cockpitview%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000001b /f
if %cockpitview%==rbracket ECHO Set Cockpit View keybind to ] - Done!
if %cockpitview%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000035 /f
if %cockpitview%==slash ECHO Set Cockpit View keybind to / - Done!
if %cockpitview%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000002b /f
if %cockpitview%==bslash ECHO Set Cockpit View keybind to \ - Done!
if %cockpitview%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000027 /f
if %cockpitview%==colon ECHO Set Cockpit View keybind to ; - Done!
if %cockpitview%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000028 /f
if %cockpitview%==quote ECHO Set Cockpit View keybind to ' - Done!
if %cockpitview%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000033 /f
if %cockpitview%==comma ECHO Set Cockpit View keybind to , - Done!
if %cockpitview%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000034 /f
if %cockpitview%==period ECHO Set Cockpit View keybind to . - Done!
if %cockpitview%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000000e /f
if %cockpitview%==bckspc ECHO Set Cockpit View keybind to Backspace - Done!
if %cockpitview%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000000f /f
if %cockpitview%==tab ECHO Set Cockpit View keybind to Tab - Done!
if %cockpitview%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000001c /f
if %cockpitview%==enter ECHO Set Cockpit View keybind to Enter - Done!
if %cockpitview%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000039 /f
if %cockpitview%==space ECHO Set Cockpit View keybind to Space Bar - Done!
if %cockpitview%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000001 /f
if %cockpitview%==esc ECHO Set Cockpit View keybind to Escape - Done!
if %cockpitview%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000052 /f
if %cockpitview%==ins ECHO Set Cockpit View keybind to Insert - Done!
if %cockpitview%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000053 /f
if %cockpitview%==del ECHO Set Cockpit View keybind to Delete - Done!
if %cockpitview%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000047 /f
if %cockpitview%==home ECHO Set Cockpit View keybind to Home - Done!
if %cockpitview%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000004f /f
if %cockpitview%==end ECHO Set Cockpit View keybind to End - Done!
if %cockpitview%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000049 /f
if %cockpitview%==pgup ECHO Set Cockpit View keybind to Page Up - Done!
if %cockpitview%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000051 /f
if %cockpitview%==pgdn ECHO Set Cockpit View keybind to Page Down - Done!
if %cockpitview%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000003b /f
if %cockpitview%==f1 ECHO Set Cockpit View keybind to F1 - Done!
if %cockpitview%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000003c /f
if %cockpitview%==f2 ECHO Set Cockpit View keybind to F2 - Done!
if %cockpitview%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000003d /f
if %cockpitview%==f3 ECHO Set Cockpit View keybind to F3 - Done!
if %cockpitview%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000003e /f
if %cockpitview%==f4 ECHO Set Cockpit View keybind to F4 - Done!
if %cockpitview%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000003f /f
if %cockpitview%==f5 ECHO Set Cockpit View keybind to F5 - Done!
if %cockpitview%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000040 /f
if %cockpitview%==f6 ECHO Set Cockpit View keybind to F6 - Done!
if %cockpitview%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000041 /f
if %cockpitview%==f7 ECHO Set Cockpit View keybind to F7 - Done!
if %cockpitview%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000042 /f
if %cockpitview%==f8 ECHO Set Cockpit View keybind to F8 - Done!
if %cockpitview%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000043 /f
if %cockpitview%==f9 ECHO Set Cockpit View keybind to F9 - Done!
if %cockpitview%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000044 /f
if %cockpitview%==f10 ECHO Set Cockpit View keybind to F10 - Done!
if %cockpitview%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000085 /f
if %cockpitview%==f11 ECHO Set Cockpit View keybind to F11 - Done!
if %cockpitview%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000086 /f
if %cockpitview%==f12 ECHO Set Cockpit View keybind to F12 - Done!
if %cockpitview%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000004f /f
if %cockpitview%==num1 ECHO Set Cockpit View keybind to Numpad 1 - Done!
if %cockpitview%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000050 /f
if %cockpitview%==num2 ECHO Set Cockpit View keybind to Numpad 2 - Done!
if %cockpitview%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000051 /f
if %cockpitview%==num3 ECHO Set Cockpit View keybind to Numpad 3 - Done!
if %cockpitview%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000004b /f
if %cockpitview%==num4 ECHO Set Cockpit View keybind to Numpad 4 - Done!
if %cockpitview%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000004c /f
if %cockpitview%==num5 ECHO Set Cockpit View keybind to Numpad 5 - Done!
if %cockpitview%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000004d /f
if %cockpitview%==num6 ECHO Set Cockpit View keybind to Numpad 6 - Done!
if %cockpitview%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000047 /f
if %cockpitview%==num7 ECHO Set Cockpit View keybind to Numpad 7 - Done!
if %cockpitview%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000048 /f
if %cockpitview%==num8 ECHO Set Cockpit View keybind to Numpad 8 - Done!
if %cockpitview%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000049 /f
if %cockpitview%==num9 ECHO Set Cockpit View keybind to Numpad 9 - Done!
if %cockpitview%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000037 /f
if %cockpitview%==numstar ECHO Set Cockpit View keybind to Numpad * - Done!
if %cockpitview%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000004a /f
if %cockpitview%==numminus ECHO Set Cockpit View keybind to Numpad - - Done!
if %cockpitview%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000004e /f
if %cockpitview%==numplus ECHO Set Cockpit View keybind to Numpad + - Done!
if %cockpitview%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000048 /f
if %cockpitview%==up ECHO Set Cockpit View keybind to Up Arrow - Done!
if %cockpitview%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x00000050 /f
if %cockpitview%==down ECHO Set Cockpit View keybind to Down Arrow - Done!
if %cockpitview%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000004b /f
if %cockpitview%==left ECHO Set Cockpit View keybind to Left Arrow - Done!
if %cockpitview%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Cockpit View" /t REG_DWORD /d 0x0000004d /f
if %cockpitview%==right ECHO Set Cockpit View keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:externalview
ECHO                      --- Bind External View ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p externalview="Input a key and press Enter to bind it to Weapon: "
@echo off
if %externalview%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000001e /f
if %externalview%==a ECHO Set External View keybind to A - Done!
if %externalview%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000030 /f
if %externalview%==b ECHO Set External View keybind to B - Done!
if %externalview%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000002e /f
if %externalview%==c ECHO Set External View keybind to C - Done!
if %externalview%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000020 /f
if %externalview%==d ECHO Set External View keybind to D - Done!
if %externalview%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000012 /f
if %externalview%==e ECHO Set External View keybind to E - Done!
if %externalview%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000021 /f
if %externalview%==f ECHO Set External View keybind to F - Done!
if %externalview%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000022 /f
if %externalview%==g ECHO Set External View keybind to G - Done!
if %externalview%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000023 /f
if %externalview%==h ECHO Set External View keybind to H - Done!
if %externalview%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000017 /f
if %externalview%==i ECHO Set External View keybind to I - Done!
if %externalview%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000024 /f
if %externalview%==j ECHO Set External View keybind to J - Done!
if %externalview%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000025 /f
if %externalview%==k ECHO Set External View keybind to K - Done!
if %externalview%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000026 /f
if %externalview%==l ECHO Set External View keybind to L - Done!
if %externalview%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000032 /f
if %externalview%==m ECHO Set External View keybind to M - Done!
if %externalview%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000031 /f
if %externalview%==n ECHO Set External View keybind to N - Done!
if %externalview%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000018 /f
if %externalview%==o ECHO Set External View keybind to O - Done!
if %externalview%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000019 /f
if %externalview%==p ECHO Set External View keybind to P - Done!
if %externalview%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000010 /f
if %externalview%==q ECHO Set External View keybind to Q - Done!
if %externalview%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000013 /f
if %externalview%==r ECHO Set External View keybind to R - Done!
if %externalview%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000001f /f
if %externalview%==s ECHO Set External View keybind to S - Done!
if %externalview%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000014 /f
if %externalview%==t ECHO Set External View keybind to T - Done!
if %externalview%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000016 /f
if %externalview%==u ECHO Set External View keybind to U - Done!
if %externalview%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000002f /f
if %externalview%==v ECHO Set External View keybind to V - Done!
if %externalview%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000011 /f
if %externalview%==w ECHO Set External View keybind to W - Done!
if %externalview%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000002d /f
if %externalview%==x ECHO Set External View keybind to X - Done!
if %externalview%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000015 /f
if %externalview%==y ECHO Set External View keybind to Y - Done!
if %externalview%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000002c /f
if %externalview%==z ECHO Set External View keybind to Z - Done!
if %externalview%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000029 /f
if %externalview%==tilde ECHO Set External View keybind to ~ - Done!
if %externalview%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000000d /f
if %externalview%==equal ECHO Set External View keybind to = - Done!
if %externalview%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000000c /f
if %externalview%==minus ECHO Set External View keybind to - - Done!
if %externalview%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000001a /f
if %externalview%==lbracket ECHO Set External View keybind to [ - Done!
if %externalview%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000001b /f
if %externalview%==rbracket ECHO Set External View keybind to ] - Done!
if %externalview%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000035 /f
if %externalview%==slash ECHO Set External View keybind to / - Done!
if %externalview%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000002b /f
if %externalview%==bslash ECHO Set External View keybind to \ - Done!
if %externalview%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000027 /f
if %externalview%==colon ECHO Set External View keybind to ; - Done!
if %externalview%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000028 /f
if %externalview%==quote ECHO Set External View keybind to ' - Done!
if %externalview%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000033 /f
if %externalview%==comma ECHO Set External View keybind to , - Done!
if %externalview%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000034 /f
if %externalview%==period ECHO Set External View keybind to . - Done!
if %externalview%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000000e /f
if %externalview%==bckspc ECHO Set External View keybind to Backspace - Done!
if %externalview%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000000f /f
if %externalview%==tab ECHO Set External View keybind to Tab - Done!
if %externalview%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000001c /f
if %externalview%==enter ECHO Set External View keybind to Enter - Done!
if %externalview%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000039 /f
if %externalview%==space ECHO Set External View keybind to Space Bar - Done!
if %externalview%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000001 /f
if %externalview%==esc ECHO Set External View keybind to Escape - Done!
if %externalview%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000052 /f
if %externalview%==ins ECHO Set External View keybind to Insert - Done!
if %externalview%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000053 /f
if %externalview%==del ECHO Set External View keybind to Delete - Done!
if %externalview%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000047 /f
if %externalview%==home ECHO Set External View keybind to Home - Done!
if %externalview%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000004f /f
if %externalview%==end ECHO Set External View keybind to End - Done!
if %externalview%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000049 /f
if %externalview%==pgup ECHO Set External View keybind to Page Up - Done!
if %externalview%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000051 /f
if %externalview%==pgdn ECHO Set External View keybind to Page Down - Done!
if %externalview%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000003b /f
if %externalview%==f1 ECHO Set External View keybind to F1 - Done!
if %externalview%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000003c /f
if %externalview%==f2 ECHO Set External View keybind to F2 - Done!
if %externalview%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000003d /f
if %externalview%==f3 ECHO Set External View keybind to F3 - Done!
if %externalview%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000003e /f
if %externalview%==f4 ECHO Set External View keybind to F4 - Done!
if %externalview%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000003f /f
if %externalview%==f5 ECHO Set External View keybind to F5 - Done!
if %externalview%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000040 /f
if %externalview%==f6 ECHO Set External View keybind to F6 - Done!
if %externalview%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000041 /f
if %externalview%==f7 ECHO Set External View keybind to F7 - Done!
if %externalview%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000042 /f
if %externalview%==f8 ECHO Set External View keybind to F8 - Done!
if %externalview%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000043 /f
if %externalview%==f9 ECHO Set External View keybind to F9 - Done!
if %externalview%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000044 /f
if %externalview%==f10 ECHO Set External View keybind to F10 - Done!
if %externalview%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000085 /f
if %externalview%==f11 ECHO Set External View keybind to F11 - Done!
if %externalview%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000086 /f
if %externalview%==f12 ECHO Set External View keybind to F12 - Done!
if %externalview%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000004f /f
if %externalview%==num1 ECHO Set External View keybind to Numpad 1 - Done!
if %externalview%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000050 /f
if %externalview%==num2 ECHO Set External View keybind to Numpad 2 - Done!
if %externalview%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000051 /f
if %externalview%==num3 ECHO Set External View keybind to Numpad 3 - Done!
if %externalview%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000004b /f
if %externalview%==num4 ECHO Set External View keybind to Numpad 4 - Done!
if %externalview%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000004c /f
if %externalview%==num5 ECHO Set External View keybind to Numpad 5 - Done!
if %externalview%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000004d /f
if %externalview%==num6 ECHO Set External View keybind to Numpad 6 - Done!
if %externalview%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000047 /f
if %externalview%==num7 ECHO Set External View keybind to Numpad 7 - Done!
if %externalview%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000048 /f
if %externalview%==num8 ECHO Set External View keybind to Numpad 8 - Done!
if %externalview%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000049 /f
if %externalview%==num9 ECHO Set External View keybind to Numpad 9 - Done!
if %externalview%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000037 /f
if %externalview%==numstar ECHO Set External View keybind to Numpad * - Done!
if %externalview%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000004a /f
if %externalview%==numminus ECHO Set External View keybind to Numpad - - Done!
if %externalview%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000004e /f
if %externalview%==numplus ECHO Set External View keybind to Numpad + - Done!
if %externalview%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000048 /f
if %externalview%==up ECHO Set External View keybind to Up Arrow - Done!
if %externalview%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x00000050 /f
if %externalview%==down ECHO Set External View keybind to Down Arrow - Done!
if %externalview%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000004b /f
if %externalview%==left ECHO Set External View keybind to Left Arrow - Done!
if %externalview%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con External View" /t REG_DWORD /d 0x0000004d /f
if %externalview%==right ECHO Set External View keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:invtargetview
ECHO                      --- Bind InvTarget View ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p invtargetview="Input a key and press Enter to bind it to Weapon: "
@echo off
if %invtargetview%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000001e /f
if %invtargetview%==a ECHO Set InvTarget View keybind to A - Done!
if %invtargetview%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000030 /f
if %invtargetview%==b ECHO Set InvTarget View keybind to B - Done!
if %invtargetview%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000002e /f
if %invtargetview%==c ECHO Set InvTarget View keybind to C - Done!
if %invtargetview%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000020 /f
if %invtargetview%==d ECHO Set InvTarget View keybind to D - Done!
if %invtargetview%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000012 /f
if %invtargetview%==e ECHO Set InvTarget View keybind to E - Done!
if %invtargetview%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000021 /f
if %invtargetview%==f ECHO Set InvTarget View keybind to F - Done!
if %invtargetview%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000022 /f
if %invtargetview%==g ECHO Set InvTarget View keybind to G - Done!
if %invtargetview%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000023 /f
if %invtargetview%==h ECHO Set InvTarget View keybind to H - Done!
if %invtargetview%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000017 /f
if %invtargetview%==i ECHO Set InvTarget View keybind to I - Done!
if %invtargetview%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000024 /f
if %invtargetview%==j ECHO Set InvTarget View keybind to J - Done!
if %invtargetview%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000025 /f
if %invtargetview%==k ECHO Set InvTarget View keybind to K - Done!
if %invtargetview%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000026 /f
if %invtargetview%==l ECHO Set InvTarget View keybind to L - Done!
if %invtargetview%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000032 /f
if %invtargetview%==m ECHO Set InvTarget View keybind to M - Done!
if %invtargetview%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000031 /f
if %invtargetview%==n ECHO Set InvTarget View keybind to N - Done!
if %invtargetview%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000018 /f
if %invtargetview%==o ECHO Set InvTarget View keybind to O - Done!
if %invtargetview%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000019 /f
if %invtargetview%==p ECHO Set InvTarget View keybind to P - Done!
if %invtargetview%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000010 /f
if %invtargetview%==q ECHO Set InvTarget View keybind to Q - Done!
if %invtargetview%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000013 /f
if %invtargetview%==r ECHO Set InvTarget View keybind to R - Done!
if %invtargetview%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000001f /f
if %invtargetview%==s ECHO Set InvTarget View keybind to S - Done!
if %invtargetview%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000014 /f
if %invtargetview%==t ECHO Set InvTarget View keybind to T - Done!
if %invtargetview%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000016 /f
if %invtargetview%==u ECHO Set InvTarget View keybind to U - Done!
if %invtargetview%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000002f /f
if %invtargetview%==v ECHO Set InvTarget View keybind to V - Done!
if %invtargetview%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000011 /f
if %invtargetview%==w ECHO Set InvTarget View keybind to W - Done!
if %invtargetview%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000002d /f
if %invtargetview%==x ECHO Set InvTarget View keybind to X - Done!
if %invtargetview%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000015 /f
if %invtargetview%==y ECHO Set InvTarget View keybind to Y - Done!
if %invtargetview%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000002c /f
if %invtargetview%==z ECHO Set InvTarget View keybind to Z - Done!
if %invtargetview%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000029 /f
if %invtargetview%==tilde ECHO Set InvTarget View keybind to ~ - Done!
if %invtargetview%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000000d /f
if %invtargetview%==equal ECHO Set InvTarget View keybind to = - Done!
if %invtargetview%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000000c /f
if %invtargetview%==minus ECHO Set InvTarget View keybind to - - Done!
if %invtargetview%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000001a /f
if %invtargetview%==lbracket ECHO Set InvTarget View keybind to [ - Done!
if %invtargetview%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000001b /f
if %invtargetview%==rbracket ECHO Set InvTarget View keybind to ] - Done!
if %invtargetview%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000035 /f
if %invtargetview%==slash ECHO Set InvTarget View keybind to / - Done!
if %invtargetview%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000002b /f
if %invtargetview%==bslash ECHO Set InvTarget View keybind to \ - Done!
if %invtargetview%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000027 /f
if %invtargetview%==colon ECHO Set InvTarget View keybind to ; - Done!
if %invtargetview%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000028 /f
if %invtargetview%==quote ECHO Set InvTarget View keybind to ' - Done!
if %invtargetview%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000033 /f
if %invtargetview%==comma ECHO Set InvTarget View keybind to , - Done!
if %invtargetview%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000034 /f
if %invtargetview%==period ECHO Set InvTarget View keybind to . - Done!
if %invtargetview%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000000e /f
if %invtargetview%==bckspc ECHO Set InvTarget View keybind to Backspace - Done!
if %invtargetview%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000000f /f
if %invtargetview%==tab ECHO Set InvTarget View keybind to Tab - Done!
if %invtargetview%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000001c /f
if %invtargetview%==enter ECHO Set InvTarget View keybind to Enter - Done!
if %invtargetview%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000039 /f
if %invtargetview%==space ECHO Set InvTarget View keybind to Space Bar - Done!
if %invtargetview%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000001 /f
if %invtargetview%==esc ECHO Set InvTarget View keybind to Escape - Done!
if %invtargetview%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000052 /f
if %invtargetview%==ins ECHO Set InvTarget View keybind to Insert - Done!
if %invtargetview%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000053 /f
if %invtargetview%==del ECHO Set InvTarget View keybind to Delete - Done!
if %invtargetview%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000047 /f
if %invtargetview%==home ECHO Set InvTarget View keybind to Home - Done!
if %invtargetview%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000004f /f
if %invtargetview%==end ECHO Set InvTarget View keybind to End - Done!
if %invtargetview%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000049 /f
if %invtargetview%==pgup ECHO Set InvTarget View keybind to Page Up - Done!
if %invtargetview%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000051 /f
if %invtargetview%==pgdn ECHO Set InvTarget View keybind to Page Down - Done!
if %invtargetview%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000003b /f
if %invtargetview%==f1 ECHO Set InvTarget View keybind to F1 - Done!
if %invtargetview%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000003c /f
if %invtargetview%==f2 ECHO Set InvTarget View keybind to F2 - Done!
if %invtargetview%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000003d /f
if %invtargetview%==f3 ECHO Set InvTarget View keybind to F3 - Done!
if %invtargetview%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000003e /f
if %invtargetview%==f4 ECHO Set InvTarget View keybind to F4 - Done!
if %invtargetview%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000003f /f
if %invtargetview%==f5 ECHO Set InvTarget View keybind to F5 - Done!
if %invtargetview%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000040 /f
if %invtargetview%==f6 ECHO Set InvTarget View keybind to F6 - Done!
if %invtargetview%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000041 /f
if %invtargetview%==f7 ECHO Set InvTarget View keybind to F7 - Done!
if %invtargetview%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000042 /f
if %invtargetview%==f8 ECHO Set InvTarget View keybind to F8 - Done!
if %invtargetview%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000043 /f
if %invtargetview%==f9 ECHO Set InvTarget View keybind to F9 - Done!
if %invtargetview%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000044 /f
if %invtargetview%==f10 ECHO Set InvTarget View keybind to F10 - Done!
if %invtargetview%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000085 /f
if %invtargetview%==f11 ECHO Set InvTarget View keybind to F11 - Done!
if %invtargetview%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000086 /f
if %invtargetview%==f12 ECHO Set InvTarget View keybind to F12 - Done!
if %invtargetview%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000004f /f
if %invtargetview%==num1 ECHO Set InvTarget View keybind to Numpad 1 - Done!
if %invtargetview%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000050 /f
if %invtargetview%==num2 ECHO Set InvTarget View keybind to Numpad 2 - Done!
if %invtargetview%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000051 /f
if %invtargetview%==num3 ECHO Set InvTarget View keybind to Numpad 3 - Done!
if %invtargetview%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000004b /f
if %invtargetview%==num4 ECHO Set InvTarget View keybind to Numpad 4 - Done!
if %invtargetview%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000004c /f
if %invtargetview%==num5 ECHO Set InvTarget View keybind to Numpad 5 - Done!
if %invtargetview%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000004d /f
if %invtargetview%==num6 ECHO Set InvTarget View keybind to Numpad 6 - Done!
if %invtargetview%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000047 /f
if %invtargetview%==num7 ECHO Set InvTarget View keybind to Numpad 7 - Done!
if %invtargetview%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000048 /f
if %invtargetview%==num8 ECHO Set InvTarget View keybind to Numpad 8 - Done!
if %invtargetview%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000049 /f
if %invtargetview%==num9 ECHO Set InvTarget View keybind to Numpad 9 - Done!
if %invtargetview%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000037 /f
if %invtargetview%==numstar ECHO Set InvTarget View keybind to Numpad * - Done!
if %invtargetview%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000004a /f
if %invtargetview%==numminus ECHO Set InvTarget View keybind to Numpad - - Done!
if %invtargetview%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000004e /f
if %invtargetview%==numplus ECHO Set InvTarget View keybind to Numpad + - Done!
if %invtargetview%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000048 /f
if %invtargetview%==up ECHO Set InvTarget View keybind to Up Arrow - Done!
if %invtargetview%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x00000050 /f
if %invtargetview%==down ECHO Set InvTarget View keybind to Down Arrow - Done!
if %invtargetview%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000004b /f
if %invtargetview%==left ECHO Set InvTarget View keybind to Left Arrow - Done!
if %invtargetview%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con InvTarget View" /t REG_DWORD /d 0x0000004d /f
if %invtargetview%==right ECHO Set InvTarget View keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:padlockview
ECHO                      --- Bind Padlock View ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p padlockview="Input a key and press Enter to bind it to Weapon: "
@echo off
if %padlockview%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000001e /f
if %padlockview%==a ECHO Set Padlock View keybind to A - Done!
if %padlockview%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000030 /f
if %padlockview%==b ECHO Set Padlock View keybind to B - Done!
if %padlockview%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000002e /f
if %padlockview%==c ECHO Set Padlock View keybind to C - Done!
if %padlockview%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000020 /f
if %padlockview%==d ECHO Set Padlock View keybind to D - Done!
if %padlockview%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000012 /f
if %padlockview%==e ECHO Set Padlock View keybind to E - Done!
if %padlockview%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000021 /f
if %padlockview%==f ECHO Set Padlock View keybind to F - Done!
if %padlockview%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000022 /f
if %padlockview%==g ECHO Set Padlock View keybind to G - Done!
if %padlockview%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000023 /f
if %padlockview%==h ECHO Set Padlock View keybind to H - Done!
if %padlockview%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000017 /f
if %padlockview%==i ECHO Set Padlock View keybind to I - Done!
if %padlockview%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000024 /f
if %padlockview%==j ECHO Set Padlock View keybind to J - Done!
if %padlockview%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000025 /f
if %padlockview%==k ECHO Set Padlock View keybind to K - Done!
if %padlockview%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000026 /f
if %padlockview%==l ECHO Set Padlock View keybind to L - Done!
if %padlockview%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000032 /f
if %padlockview%==m ECHO Set Padlock View keybind to M - Done!
if %padlockview%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000031 /f
if %padlockview%==n ECHO Set Padlock View keybind to N - Done!
if %padlockview%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000018 /f
if %padlockview%==o ECHO Set Padlock View keybind to O - Done!
if %padlockview%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000019 /f
if %padlockview%==p ECHO Set Padlock View keybind to P - Done!
if %padlockview%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000010 /f
if %padlockview%==q ECHO Set Padlock View keybind to Q - Done!
if %padlockview%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000013 /f
if %padlockview%==r ECHO Set Padlock View keybind to R - Done!
if %padlockview%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000001f /f
if %padlockview%==s ECHO Set Padlock View keybind to S - Done!
if %padlockview%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000014 /f
if %padlockview%==t ECHO Set Padlock View keybind to T - Done!
if %padlockview%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000016 /f
if %padlockview%==u ECHO Set Padlock View keybind to U - Done!
if %padlockview%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000002f /f
if %padlockview%==v ECHO Set Padlock View keybind to V - Done!
if %padlockview%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000011 /f
if %padlockview%==w ECHO Set Padlock View keybind to W - Done!
if %padlockview%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000002d /f
if %padlockview%==x ECHO Set Padlock View keybind to X - Done!
if %padlockview%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000015 /f
if %padlockview%==y ECHO Set Padlock View keybind to Y - Done!
if %padlockview%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000002c /f
if %padlockview%==z ECHO Set Padlock View keybind to Z - Done!
if %padlockview%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000029 /f
if %padlockview%==tilde ECHO Set Padlock View keybind to ~ - Done!
if %padlockview%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000000d /f
if %padlockview%==equal ECHO Set Padlock View keybind to = - Done!
if %padlockview%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000000c /f
if %padlockview%==minus ECHO Set Padlock View keybind to - - Done!
if %padlockview%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000001a /f
if %padlockview%==lbracket ECHO Set Padlock View keybind to [ - Done!
if %padlockview%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000001b /f
if %padlockview%==rbracket ECHO Set Padlock View keybind to ] - Done!
if %padlockview%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000035 /f
if %padlockview%==slash ECHO Set Padlock View keybind to / - Done!
if %padlockview%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000002b /f
if %padlockview%==bslash ECHO Set Padlock View keybind to \ - Done!
if %padlockview%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000027 /f
if %padlockview%==colon ECHO Set Padlock View keybind to ; - Done!
if %padlockview%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000028 /f
if %padlockview%==quote ECHO Set Padlock View keybind to ' - Done!
if %padlockview%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000033 /f
if %padlockview%==comma ECHO Set Padlock View keybind to , - Done!
if %padlockview%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000034 /f
if %padlockview%==period ECHO Set Padlock View keybind to . - Done!
if %padlockview%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000000e /f
if %padlockview%==bckspc ECHO Set Padlock View keybind to Backspace - Done!
if %padlockview%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000000f /f
if %padlockview%==tab ECHO Set Padlock View keybind to Tab - Done!
if %padlockview%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000001c /f
if %padlockview%==enter ECHO Set Padlock View keybind to Enter - Done!
if %padlockview%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000039 /f
if %padlockview%==space ECHO Set Padlock View keybind to Space Bar - Done!
if %padlockview%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000001 /f
if %padlockview%==esc ECHO Set Padlock View keybind to Escape - Done!
if %padlockview%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000052 /f
if %padlockview%==ins ECHO Set Padlock View keybind to Insert - Done!
if %padlockview%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000053 /f
if %padlockview%==del ECHO Set Padlock View keybind to Delete - Done!
if %padlockview%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000047 /f
if %padlockview%==home ECHO Set Padlock View keybind to Home - Done!
if %padlockview%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000004f /f
if %padlockview%==end ECHO Set Padlock View keybind to End - Done!
if %padlockview%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000049 /f
if %padlockview%==pgup ECHO Set Padlock View keybind to Page Up - Done!
if %padlockview%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000051 /f
if %padlockview%==pgdn ECHO Set Padlock View keybind to Page Down - Done!
if %padlockview%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000003b /f
if %padlockview%==f1 ECHO Set Padlock View keybind to F1 - Done!
if %padlockview%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000003c /f
if %padlockview%==f2 ECHO Set Padlock View keybind to F2 - Done!
if %padlockview%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000003d /f
if %padlockview%==f3 ECHO Set Padlock View keybind to F3 - Done!
if %padlockview%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000003e /f
if %padlockview%==f4 ECHO Set Padlock View keybind to F4 - Done!
if %padlockview%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000003f /f
if %padlockview%==f5 ECHO Set Padlock View keybind to F5 - Done!
if %padlockview%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000040 /f
if %padlockview%==f6 ECHO Set Padlock View keybind to F6 - Done!
if %padlockview%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000041 /f
if %padlockview%==f7 ECHO Set Padlock View keybind to F7 - Done!
if %padlockview%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000042 /f
if %padlockview%==f8 ECHO Set Padlock View keybind to F8 - Done!
if %padlockview%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000043 /f
if %padlockview%==f9 ECHO Set Padlock View keybind to F9 - Done!
if %padlockview%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000044 /f
if %padlockview%==f10 ECHO Set Padlock View keybind to F10 - Done!
if %padlockview%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000085 /f
if %padlockview%==f11 ECHO Set Padlock View keybind to F11 - Done!
if %padlockview%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000086 /f
if %padlockview%==f12 ECHO Set Padlock View keybind to F12 - Done!
if %padlockview%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000004f /f
if %padlockview%==num1 ECHO Set Padlock View keybind to Numpad 1 - Done!
if %padlockview%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000050 /f
if %padlockview%==num2 ECHO Set Padlock View keybind to Numpad 2 - Done!
if %padlockview%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000051 /f
if %padlockview%==num3 ECHO Set Padlock View keybind to Numpad 3 - Done!
if %padlockview%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000004b /f
if %padlockview%==num4 ECHO Set Padlock View keybind to Numpad 4 - Done!
if %padlockview%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000004c /f
if %padlockview%==num5 ECHO Set Padlock View keybind to Numpad 5 - Done!
if %padlockview%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000004d /f
if %padlockview%==num6 ECHO Set Padlock View keybind to Numpad 6 - Done!
if %padlockview%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000047 /f
if %padlockview%==num7 ECHO Set Padlock View keybind to Numpad 7 - Done!
if %padlockview%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000048 /f
if %padlockview%==num8 ECHO Set Padlock View keybind to Numpad 8 - Done!
if %padlockview%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000049 /f
if %padlockview%==num9 ECHO Set Padlock View keybind to Numpad 9 - Done!
if %padlockview%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000037 /f
if %padlockview%==numstar ECHO Set Padlock View keybind to Numpad * - Done!
if %padlockview%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000004a /f
if %padlockview%==numminus ECHO Set Padlock View keybind to Numpad - - Done!
if %padlockview%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000004e /f
if %padlockview%==numplus ECHO Set Padlock View keybind to Numpad + - Done!
if %padlockview%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000048 /f
if %padlockview%==up ECHO Set Padlock View keybind to Up Arrow - Done!
if %padlockview%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x00000050 /f
if %padlockview%==down ECHO Set Padlock View keybind to Down Arrow - Done!
if %padlockview%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000004b /f
if %padlockview%==left ECHO Set Padlock View keybind to Left Arrow - Done!
if %padlockview%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Padlock View" /t REG_DWORD /d 0x0000004d /f
if %padlockview%==right ECHO Set Padlock View keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:targetview
ECHO                      --- Bind Target View ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p targetview="Input a key and press Enter to bind it to Weapon: "
@echo off
if %targetview%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000001e /f
if %targetview%==a ECHO Set Target View keybind to A - Done!
if %targetview%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000030 /f
if %targetview%==b ECHO Set Target View keybind to B - Done!
if %targetview%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000002e /f
if %targetview%==c ECHO Set Target View keybind to C - Done!
if %targetview%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000020 /f
if %targetview%==d ECHO Set Target View keybind to D - Done!
if %targetview%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000012 /f
if %targetview%==e ECHO Set Target View keybind to E - Done!
if %targetview%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000021 /f
if %targetview%==f ECHO Set Target View keybind to F - Done!
if %targetview%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000022 /f
if %targetview%==g ECHO Set Target View keybind to G - Done!
if %targetview%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000023 /f
if %targetview%==h ECHO Set Target View keybind to H - Done!
if %targetview%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000017 /f
if %targetview%==i ECHO Set Target View keybind to I - Done!
if %targetview%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000024 /f
if %targetview%==j ECHO Set Target View keybind to J - Done!
if %targetview%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000025 /f
if %targetview%==k ECHO Set Target View keybind to K - Done!
if %targetview%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000026 /f
if %targetview%==l ECHO Set Target View keybind to L - Done!
if %targetview%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000032 /f
if %targetview%==m ECHO Set Target View keybind to M - Done!
if %targetview%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000031 /f
if %targetview%==n ECHO Set Target View keybind to N - Done!
if %targetview%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000018 /f
if %targetview%==o ECHO Set Target View keybind to O - Done!
if %targetview%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000019 /f
if %targetview%==p ECHO Set Target View keybind to P - Done!
if %targetview%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000010 /f
if %targetview%==q ECHO Set Target View keybind to Q - Done!
if %targetview%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000013 /f
if %targetview%==r ECHO Set Target View keybind to R - Done!
if %targetview%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000001f /f
if %targetview%==s ECHO Set Target View keybind to S - Done!
if %targetview%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000014 /f
if %targetview%==t ECHO Set Target View keybind to T - Done!
if %targetview%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000016 /f
if %targetview%==u ECHO Set Target View keybind to U - Done!
if %targetview%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000002f /f
if %targetview%==v ECHO Set Target View keybind to V - Done!
if %targetview%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000011 /f
if %targetview%==w ECHO Set Target View keybind to W - Done!
if %targetview%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000002d /f
if %targetview%==x ECHO Set Target View keybind to X - Done!
if %targetview%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000015 /f
if %targetview%==y ECHO Set Target View keybind to Y - Done!
if %targetview%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000002c /f
if %targetview%==z ECHO Set Target View keybind to Z - Done!
if %targetview%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000029 /f
if %targetview%==tilde ECHO Set Target View keybind to ~ - Done!
if %targetview%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000000d /f
if %targetview%==equal ECHO Set Target View keybind to = - Done!
if %targetview%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000000c /f
if %targetview%==minus ECHO Set Target View keybind to - - Done!
if %targetview%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000001a /f
if %targetview%==lbracket ECHO Set Target View keybind to [ - Done!
if %targetview%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000001b /f
if %targetview%==rbracket ECHO Set Target View keybind to ] - Done!
if %targetview%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000035 /f
if %targetview%==slash ECHO Set Target View keybind to / - Done!
if %targetview%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000002b /f
if %targetview%==bslash ECHO Set Target View keybind to \ - Done!
if %targetview%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000027 /f
if %targetview%==colon ECHO Set Target View keybind to ; - Done!
if %targetview%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000028 /f
if %targetview%==quote ECHO Set Target View keybind to ' - Done!
if %targetview%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000033 /f
if %targetview%==comma ECHO Set Target View keybind to , - Done!
if %targetview%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000034 /f
if %targetview%==period ECHO Set Target View keybind to . - Done!
if %targetview%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000000e /f
if %targetview%==bckspc ECHO Set Target View keybind to Backspace - Done!
if %targetview%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000000f /f
if %targetview%==tab ECHO Set Target View keybind to Tab - Done!
if %targetview%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000001c /f
if %targetview%==enter ECHO Set Target View keybind to Enter - Done!
if %targetview%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000039 /f
if %targetview%==space ECHO Set Target View keybind to Space Bar - Done!
if %targetview%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000001 /f
if %targetview%==esc ECHO Set Target View keybind to Escape - Done!
if %targetview%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000052 /f
if %targetview%==ins ECHO Set Target View keybind to Insert - Done!
if %targetview%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000053 /f
if %targetview%==del ECHO Set Target View keybind to Delete - Done!
if %targetview%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000047 /f
if %targetview%==home ECHO Set Target View keybind to Home - Done!
if %targetview%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000004f /f
if %targetview%==end ECHO Set Target View keybind to End - Done!
if %targetview%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000049 /f
if %targetview%==pgup ECHO Set Target View keybind to Page Up - Done!
if %targetview%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000051 /f
if %targetview%==pgdn ECHO Set Target View keybind to Page Down - Done!
if %targetview%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000003b /f
if %targetview%==f1 ECHO Set Target View keybind to F1 - Done!
if %targetview%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000003c /f
if %targetview%==f2 ECHO Set Target View keybind to F2 - Done!
if %targetview%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000003d /f
if %targetview%==f3 ECHO Set Target View keybind to F3 - Done!
if %targetview%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000003e /f
if %targetview%==f4 ECHO Set Target View keybind to F4 - Done!
if %targetview%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000003f /f
if %targetview%==f5 ECHO Set Target View keybind to F5 - Done!
if %targetview%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000040 /f
if %targetview%==f6 ECHO Set Target View keybind to F6 - Done!
if %targetview%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000041 /f
if %targetview%==f7 ECHO Set Target View keybind to F7 - Done!
if %targetview%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000042 /f
if %targetview%==f8 ECHO Set Target View keybind to F8 - Done!
if %targetview%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000043 /f
if %targetview%==f9 ECHO Set Target View keybind to F9 - Done!
if %targetview%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000044 /f
if %targetview%==f10 ECHO Set Target View keybind to F10 - Done!
if %targetview%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000085 /f
if %targetview%==f11 ECHO Set Target View keybind to F11 - Done!
if %targetview%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000086 /f
if %targetview%==f12 ECHO Set Target View keybind to F12 - Done!
if %targetview%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000004f /f
if %targetview%==num1 ECHO Set Target View keybind to Numpad 1 - Done!
if %targetview%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000050 /f
if %targetview%==num2 ECHO Set Target View keybind to Numpad 2 - Done!
if %targetview%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000051 /f
if %targetview%==num3 ECHO Set Target View keybind to Numpad 3 - Done!
if %targetview%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000004b /f
if %targetview%==num4 ECHO Set Target View keybind to Numpad 4 - Done!
if %targetview%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000004c /f
if %targetview%==num5 ECHO Set Target View keybind to Numpad 5 - Done!
if %targetview%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000004d /f
if %targetview%==num6 ECHO Set Target View keybind to Numpad 6 - Done!
if %targetview%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000047 /f
if %targetview%==num7 ECHO Set Target View keybind to Numpad 7 - Done!
if %targetview%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000048 /f
if %targetview%==num8 ECHO Set Target View keybind to Numpad 8 - Done!
if %targetview%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000049 /f
if %targetview%==num9 ECHO Set Target View keybind to Numpad 9 - Done!
if %targetview%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000037 /f
if %targetview%==numstar ECHO Set Target View keybind to Numpad * - Done!
if %targetview%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000004a /f
if %targetview%==numminus ECHO Set Target View keybind to Numpad - - Done!
if %targetview%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000004e /f
if %targetview%==numplus ECHO Set Target View keybind to Numpad + - Done!
if %targetview%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000048 /f
if %targetview%==up ECHO Set Target View keybind to Up Arrow - Done!
if %targetview%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x00000050 /f
if %targetview%==down ECHO Set Target View keybind to Down Arrow - Done!
if %targetview%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000004b /f
if %targetview%==left ECHO Set Target View keybind to Left Arrow - Done!
if %targetview%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Target View" /t REG_DWORD /d 0x0000004d /f
if %targetview%==right ECHO Set Target View keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:viewspecial
ECHO                      --- Bind View Special ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p viewspecial="Input a key and press Enter to bind it to Weapon: "
@echo off
if %viewspecial%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000001e /f
if %viewspecial%==a ECHO Set View Special keybind to A - Done!
if %viewspecial%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000030 /f
if %viewspecial%==b ECHO Set View Special keybind to B - Done!
if %viewspecial%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000002e /f
if %viewspecial%==c ECHO Set View Special keybind to C - Done!
if %viewspecial%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000020 /f
if %viewspecial%==d ECHO Set View Special keybind to D - Done!
if %viewspecial%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000012 /f
if %viewspecial%==e ECHO Set View Special keybind to E - Done!
if %viewspecial%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000021 /f
if %viewspecial%==f ECHO Set View Special keybind to F - Done!
if %viewspecial%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000022 /f
if %viewspecial%==g ECHO Set View Special keybind to G - Done!
if %viewspecial%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000023 /f
if %viewspecial%==h ECHO Set View Special keybind to H - Done!
if %viewspecial%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000017 /f
if %viewspecial%==i ECHO Set View Special keybind to I - Done!
if %viewspecial%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000024 /f
if %viewspecial%==j ECHO Set View Special keybind to J - Done!
if %viewspecial%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000025 /f
if %viewspecial%==k ECHO Set View Special keybind to K - Done!
if %viewspecial%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000026 /f
if %viewspecial%==l ECHO Set View Special keybind to L - Done!
if %viewspecial%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000032 /f
if %viewspecial%==m ECHO Set View Special keybind to M - Done!
if %viewspecial%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000031 /f
if %viewspecial%==n ECHO Set View Special keybind to N - Done!
if %viewspecial%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000018 /f
if %viewspecial%==o ECHO Set View Special keybind to O - Done!
if %viewspecial%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000019 /f
if %viewspecial%==p ECHO Set View Special keybind to P - Done!
if %viewspecial%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000010 /f
if %viewspecial%==q ECHO Set View Special keybind to Q - Done!
if %viewspecial%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000013 /f
if %viewspecial%==r ECHO Set View Special keybind to R - Done!
if %viewspecial%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000001f /f
if %viewspecial%==s ECHO Set View Special keybind to S - Done!
if %viewspecial%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000014 /f
if %viewspecial%==t ECHO Set View Special keybind to T - Done!
if %viewspecial%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000016 /f
if %viewspecial%==u ECHO Set View Special keybind to U - Done!
if %viewspecial%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000002f /f
if %viewspecial%==v ECHO Set View Special keybind to V - Done!
if %viewspecial%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000011 /f
if %viewspecial%==w ECHO Set View Special keybind to W - Done!
if %viewspecial%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000002d /f
if %viewspecial%==x ECHO Set View Special keybind to X - Done!
if %viewspecial%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000015 /f
if %viewspecial%==y ECHO Set View Special keybind to Y - Done!
if %viewspecial%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000002c /f
if %viewspecial%==z ECHO Set View Special keybind to Z - Done!
if %viewspecial%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000029 /f
if %viewspecial%==tilde ECHO Set View Special keybind to ~ - Done!
if %viewspecial%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000000d /f
if %viewspecial%==equal ECHO Set View Special keybind to = - Done!
if %viewspecial%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000000c /f
if %viewspecial%==minus ECHO Set View Special keybind to - - Done!
if %viewspecial%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000001a /f
if %viewspecial%==lbracket ECHO Set View Special keybind to [ - Done!
if %viewspecial%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000001b /f
if %viewspecial%==rbracket ECHO Set View Special keybind to ] - Done!
if %viewspecial%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000035 /f
if %viewspecial%==slash ECHO Set View Special keybind to / - Done!
if %viewspecial%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000002b /f
if %viewspecial%==bslash ECHO Set View Special keybind to \ - Done!
if %viewspecial%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000027 /f
if %viewspecial%==colon ECHO Set View Special keybind to ; - Done!
if %viewspecial%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000028 /f
if %viewspecial%==quote ECHO Set View Special keybind to ' - Done!
if %viewspecial%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000033 /f
if %viewspecial%==comma ECHO Set View Special keybind to , - Done!
if %viewspecial%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000034 /f
if %viewspecial%==period ECHO Set View Special keybind to . - Done!
if %viewspecial%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000000e /f
if %viewspecial%==bckspc ECHO Set View Special keybind to Backspace - Done!
if %viewspecial%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000000f /f
if %viewspecial%==tab ECHO Set View Special keybind to Tab - Done!
if %viewspecial%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000001c /f
if %viewspecial%==enter ECHO Set View Special keybind to Enter - Done!
if %viewspecial%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000039 /f
if %viewspecial%==space ECHO Set View Special keybind to Space Bar - Done!
if %viewspecial%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000001 /f
if %viewspecial%==esc ECHO Set View Special keybind to Escape - Done!
if %viewspecial%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000052 /f
if %viewspecial%==ins ECHO Set View Special keybind to Insert - Done!
if %viewspecial%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000053 /f
if %viewspecial%==del ECHO Set View Special keybind to Delete - Done!
if %viewspecial%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000047 /f
if %viewspecial%==home ECHO Set View Special keybind to Home - Done!
if %viewspecial%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000004f /f
if %viewspecial%==end ECHO Set View Special keybind to End - Done!
if %viewspecial%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000049 /f
if %viewspecial%==pgup ECHO Set View Special keybind to Page Up - Done!
if %viewspecial%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000051 /f
if %viewspecial%==pgdn ECHO Set View Special keybind to Page Down - Done!
if %viewspecial%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000003b /f
if %viewspecial%==f1 ECHO Set View Special keybind to F1 - Done!
if %viewspecial%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000003c /f
if %viewspecial%==f2 ECHO Set View Special keybind to F2 - Done!
if %viewspecial%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000003d /f
if %viewspecial%==f3 ECHO Set View Special keybind to F3 - Done!
if %viewspecial%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000003e /f
if %viewspecial%==f4 ECHO Set View Special keybind to F4 - Done!
if %viewspecial%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000003f /f
if %viewspecial%==f5 ECHO Set View Special keybind to F5 - Done!
if %viewspecial%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000040 /f
if %viewspecial%==f6 ECHO Set View Special keybind to F6 - Done!
if %viewspecial%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000041 /f
if %viewspecial%==f7 ECHO Set View Special keybind to F7 - Done!
if %viewspecial%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000042 /f
if %viewspecial%==f8 ECHO Set View Special keybind to F8 - Done!
if %viewspecial%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000043 /f
if %viewspecial%==f9 ECHO Set View Special keybind to F9 - Done!
if %viewspecial%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000044 /f
if %viewspecial%==f10 ECHO Set View Special keybind to F10 - Done!
if %viewspecial%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000085 /f
if %viewspecial%==f11 ECHO Set View Special keybind to F11 - Done!
if %viewspecial%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000086 /f
if %viewspecial%==f12 ECHO Set View Special keybind to F12 - Done!
if %viewspecial%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000004f /f
if %viewspecial%==num1 ECHO Set View Special keybind to Numpad 1 - Done!
if %viewspecial%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000050 /f
if %viewspecial%==num2 ECHO Set View Special keybind to Numpad 2 - Done!
if %viewspecial%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000051 /f
if %viewspecial%==num3 ECHO Set View Special keybind to Numpad 3 - Done!
if %viewspecial%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000004b /f
if %viewspecial%==num4 ECHO Set View Special keybind to Numpad 4 - Done!
if %viewspecial%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000004c /f
if %viewspecial%==num5 ECHO Set View Special keybind to Numpad 5 - Done!
if %viewspecial%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000004d /f
if %viewspecial%==num6 ECHO Set View Special keybind to Numpad 6 - Done!
if %viewspecial%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000047 /f
if %viewspecial%==num7 ECHO Set View Special keybind to Numpad 7 - Done!
if %viewspecial%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000048 /f
if %viewspecial%==num8 ECHO Set View Special keybind to Numpad 8 - Done!
if %viewspecial%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000049 /f
if %viewspecial%==num9 ECHO Set View Special keybind to Numpad 9 - Done!
if %viewspecial%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000037 /f
if %viewspecial%==numstar ECHO Set View Special keybind to Numpad * - Done!
if %viewspecial%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000004a /f
if %viewspecial%==numminus ECHO Set View Special keybind to Numpad - - Done!
if %viewspecial%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000004e /f
if %viewspecial%==numplus ECHO Set View Special keybind to Numpad + - Done!
if %viewspecial%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000048 /f
if %viewspecial%==up ECHO Set View Special keybind to Up Arrow - Done!
if %viewspecial%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x00000050 /f
if %viewspecial%==down ECHO Set View Special keybind to Down Arrow - Done!
if %viewspecial%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000004b /f
if %viewspecial%==left ECHO Set View Special keybind to Left Arrow - Done!
if %viewspecial%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con View Special" /t REG_DWORD /d 0x0000004d /f
if %viewspecial%==right ECHO Set View Special keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:panviewup
ECHO                      --- Bind Pan View Up ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p panviewup="Input a key and press Enter to bind it to Weapon: "
@echo off
if %panviewup%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000001e /f
if %panviewup%==a ECHO Set Pan View Up keybind to A - Done!
if %panviewup%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000030 /f
if %panviewup%==b ECHO Set Pan View Up keybind to B - Done!
if %panviewup%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000002e /f
if %panviewup%==c ECHO Set Pan View Up keybind to C - Done!
if %panviewup%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000020 /f
if %panviewup%==d ECHO Set Pan View Up keybind to D - Done!
if %panviewup%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000012 /f
if %panviewup%==e ECHO Set Pan View Up keybind to E - Done!
if %panviewup%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000021 /f
if %panviewup%==f ECHO Set Pan View Up keybind to F - Done!
if %panviewup%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000022 /f
if %panviewup%==g ECHO Set Pan View Up keybind to G - Done!
if %panviewup%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000023 /f
if %panviewup%==h ECHO Set Pan View Up keybind to H - Done!
if %panviewup%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000017 /f
if %panviewup%==i ECHO Set Pan View Up keybind to I - Done!
if %panviewup%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000024 /f
if %panviewup%==j ECHO Set Pan View Up keybind to J - Done!
if %panviewup%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000025 /f
if %panviewup%==k ECHO Set Pan View Up keybind to K - Done!
if %panviewup%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000026 /f
if %panviewup%==l ECHO Set Pan View Up keybind to L - Done!
if %panviewup%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000032 /f
if %panviewup%==m ECHO Set Pan View Up keybind to M - Done!
if %panviewup%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000031 /f
if %panviewup%==n ECHO Set Pan View Up keybind to N - Done!
if %panviewup%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000018 /f
if %panviewup%==o ECHO Set Pan View Up keybind to O - Done!
if %panviewup%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000019 /f
if %panviewup%==p ECHO Set Pan View Up keybind to P - Done!
if %panviewup%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000010 /f
if %panviewup%==q ECHO Set Pan View Up keybind to Q - Done!
if %panviewup%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000013 /f
if %panviewup%==r ECHO Set Pan View Up keybind to R - Done!
if %panviewup%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000001f /f
if %panviewup%==s ECHO Set Pan View Up keybind to S - Done!
if %panviewup%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000014 /f
if %panviewup%==t ECHO Set Pan View Up keybind to T - Done!
if %panviewup%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000016 /f
if %panviewup%==u ECHO Set Pan View Up keybind to U - Done!
if %panviewup%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000002f /f
if %panviewup%==v ECHO Set Pan View Up keybind to V - Done!
if %panviewup%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000011 /f
if %panviewup%==w ECHO Set Pan View Up keybind to W - Done!
if %panviewup%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000002d /f
if %panviewup%==x ECHO Set Pan View Up keybind to X - Done!
if %panviewup%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000015 /f
if %panviewup%==y ECHO Set Pan View Up keybind to Y - Done!
if %panviewup%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000002c /f
if %panviewup%==z ECHO Set Pan View Up keybind to Z - Done!
if %panviewup%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000029 /f
if %panviewup%==tilde ECHO Set Pan View Up keybind to ~ - Done!
if %panviewup%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000000d /f
if %panviewup%==equal ECHO Set Pan View Up keybind to = - Done!
if %panviewup%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000000c /f
if %panviewup%==minus ECHO Set Pan View Up keybind to - - Done!
if %panviewup%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000001a /f
if %panviewup%==lbracket ECHO Set Pan View Up keybind to [ - Done!
if %panviewup%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000001b /f
if %panviewup%==rbracket ECHO Set Pan View Up keybind to ] - Done!
if %panviewup%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000035 /f
if %panviewup%==slash ECHO Set Pan View Up keybind to / - Done!
if %panviewup%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000002b /f
if %panviewup%==bslash ECHO Set Pan View Up keybind to \ - Done!
if %panviewup%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000027 /f
if %panviewup%==colon ECHO Set Pan View Up keybind to ; - Done!
if %panviewup%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000028 /f
if %panviewup%==quote ECHO Set Pan View Up keybind to ' - Done!
if %panviewup%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000033 /f
if %panviewup%==comma ECHO Set Pan View Up keybind to , - Done!
if %panviewup%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000034 /f
if %panviewup%==period ECHO Set Pan View Up keybind to . - Done!
if %panviewup%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000000e /f
if %panviewup%==bckspc ECHO Set Pan View Up keybind to Backspace - Done!
if %panviewup%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000000f /f
if %panviewup%==tab ECHO Set Pan View Up keybind to Tab - Done!
if %panviewup%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000001c /f
if %panviewup%==enter ECHO Set Pan View Up keybind to Enter - Done!
if %panviewup%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000039 /f
if %panviewup%==space ECHO Set Pan View Up keybind to Space Bar - Done!
if %panviewup%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000001 /f
if %panviewup%==esc ECHO Set Pan View Up keybind to Escape - Done!
if %panviewup%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000052 /f
if %panviewup%==ins ECHO Set Pan View Up keybind to Insert - Done!
if %panviewup%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000053 /f
if %panviewup%==del ECHO Set Pan View Up keybind to Delete - Done!
if %panviewup%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000047 /f
if %panviewup%==home ECHO Set Pan View Up keybind to Home - Done!
if %panviewup%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000004f /f
if %panviewup%==end ECHO Set Pan View Up keybind to End - Done!
if %panviewup%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000049 /f
if %panviewup%==pgup ECHO Set Pan View Up keybind to Page Up - Done!
if %panviewup%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000051 /f
if %panviewup%==pgdn ECHO Set Pan View Up keybind to Page Down - Done!
if %panviewup%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000003b /f
if %panviewup%==f1 ECHO Set Pan View Up keybind to F1 - Done!
if %panviewup%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000003c /f
if %panviewup%==f2 ECHO Set Pan View Up keybind to F2 - Done!
if %panviewup%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000003d /f
if %panviewup%==f3 ECHO Set Pan View Up keybind to F3 - Done!
if %panviewup%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000003e /f
if %panviewup%==f4 ECHO Set Pan View Up keybind to F4 - Done!
if %panviewup%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000003f /f
if %panviewup%==f5 ECHO Set Pan View Up keybind to F5 - Done!
if %panviewup%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000040 /f
if %panviewup%==f6 ECHO Set Pan View Up keybind to F6 - Done!
if %panviewup%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000041 /f
if %panviewup%==f7 ECHO Set Pan View Up keybind to F7 - Done!
if %panviewup%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000042 /f
if %panviewup%==f8 ECHO Set Pan View Up keybind to F8 - Done!
if %panviewup%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000043 /f
if %panviewup%==f9 ECHO Set Pan View Up keybind to F9 - Done!
if %panviewup%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000044 /f
if %panviewup%==f10 ECHO Set Pan View Up keybind to F10 - Done!
if %panviewup%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000085 /f
if %panviewup%==f11 ECHO Set Pan View Up keybind to F11 - Done!
if %panviewup%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000086 /f
if %panviewup%==f12 ECHO Set Pan View Up keybind to F12 - Done!
if %panviewup%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000004f /f
if %panviewup%==num1 ECHO Set Pan View Up keybind to Numpad 1 - Done!
if %panviewup%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000050 /f
if %panviewup%==num2 ECHO Set Pan View Up keybind to Numpad 2 - Done!
if %panviewup%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000051 /f
if %panviewup%==num3 ECHO Set Pan View Up keybind to Numpad 3 - Done!
if %panviewup%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000004b /f
if %panviewup%==num4 ECHO Set Pan View Up keybind to Numpad 4 - Done!
if %panviewup%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000004c /f
if %panviewup%==num5 ECHO Set Pan View Up keybind to Numpad 5 - Done!
if %panviewup%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000004d /f
if %panviewup%==num6 ECHO Set Pan View Up keybind to Numpad 6 - Done!
if %panviewup%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000047 /f
if %panviewup%==num7 ECHO Set Pan View Up keybind to Numpad 7 - Done!
if %panviewup%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000048 /f
if %panviewup%==num8 ECHO Set Pan View Up keybind to Numpad 8 - Done!
if %panviewup%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000049 /f
if %panviewup%==num9 ECHO Set Pan View Up keybind to Numpad 9 - Done!
if %panviewup%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000037 /f
if %panviewup%==numstar ECHO Set Pan View Up keybind to Numpad * - Done!
if %panviewup%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000004a /f
if %panviewup%==numminus ECHO Set Pan View Up keybind to Numpad - - Done!
if %panviewup%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000004e /f
if %panviewup%==numplus ECHO Set Pan View Up keybind to Numpad + - Done!
if %panviewup%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000048 /f
if %panviewup%==up ECHO Set Pan View Up keybind to Up Arrow - Done!
if %panviewup%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x00000050 /f
if %panviewup%==down ECHO Set Pan View Up keybind to Down Arrow - Done!
if %panviewup%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000004b /f
if %panviewup%==left ECHO Set Pan View Up keybind to Left Arrow - Done!
if %panviewup%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Up" /t REG_DWORD /d 0x0000004d /f
if %panviewup%==right ECHO Set Pan View Up keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:panviewdown
ECHO                      --- Bind Pan View Down ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p panviewdown="Input a key and press Enter to bind it to Weapon: "
@echo off
if %panviewdown%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000001e /f
if %panviewdown%==a ECHO Set Pan View Down keybind to A - Done!
if %panviewdown%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000030 /f
if %panviewdown%==b ECHO Set Pan View Down keybind to B - Done!
if %panviewdown%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000002e /f
if %panviewdown%==c ECHO Set Pan View Down keybind to C - Done!
if %panviewdown%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000020 /f
if %panviewdown%==d ECHO Set Pan View Down keybind to D - Done!
if %panviewdown%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000012 /f
if %panviewdown%==e ECHO Set Pan View Down keybind to E - Done!
if %panviewdown%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000021 /f
if %panviewdown%==f ECHO Set Pan View Down keybind to F - Done!
if %panviewdown%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000022 /f
if %panviewdown%==g ECHO Set Pan View Down keybind to G - Done!
if %panviewdown%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000023 /f
if %panviewdown%==h ECHO Set Pan View Down keybind to H - Done!
if %panviewdown%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000017 /f
if %panviewdown%==i ECHO Set Pan View Down keybind to I - Done!
if %panviewdown%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000024 /f
if %panviewdown%==j ECHO Set Pan View Down keybind to J - Done!
if %panviewdown%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000025 /f
if %panviewdown%==k ECHO Set Pan View Down keybind to K - Done!
if %panviewdown%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000026 /f
if %panviewdown%==l ECHO Set Pan View Down keybind to L - Done!
if %panviewdown%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000032 /f
if %panviewdown%==m ECHO Set Pan View Down keybind to M - Done!
if %panviewdown%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000031 /f
if %panviewdown%==n ECHO Set Pan View Down keybind to N - Done!
if %panviewdown%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000018 /f
if %panviewdown%==o ECHO Set Pan View Down keybind to O - Done!
if %panviewdown%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000019 /f
if %panviewdown%==p ECHO Set Pan View Down keybind to P - Done!
if %panviewdown%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000010 /f
if %panviewdown%==q ECHO Set Pan View Down keybind to Q - Done!
if %panviewdown%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000013 /f
if %panviewdown%==r ECHO Set Pan View Down keybind to R - Done!
if %panviewdown%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000001f /f
if %panviewdown%==s ECHO Set Pan View Down keybind to S - Done!
if %panviewdown%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000014 /f
if %panviewdown%==t ECHO Set Pan View Down keybind to T - Done!
if %panviewdown%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000016 /f
if %panviewdown%==u ECHO Set Pan View Down keybind to U - Done!
if %panviewdown%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000002f /f
if %panviewdown%==v ECHO Set Pan View Down keybind to V - Done!
if %panviewdown%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000011 /f
if %panviewdown%==w ECHO Set Pan View Down keybind to W - Done!
if %panviewdown%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000002d /f
if %panviewdown%==x ECHO Set Pan View Down keybind to X - Done!
if %panviewdown%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000015 /f
if %panviewdown%==y ECHO Set Pan View Down keybind to Y - Done!
if %panviewdown%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000002c /f
if %panviewdown%==z ECHO Set Pan View Down keybind to Z - Done!
if %panviewdown%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000029 /f
if %panviewdown%==tilde ECHO Set Pan View Down keybind to ~ - Done!
if %panviewdown%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000000d /f
if %panviewdown%==equal ECHO Set Pan View Down keybind to = - Done!
if %panviewdown%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000000c /f
if %panviewdown%==minus ECHO Set Pan View Down keybind to - - Done!
if %panviewdown%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000001a /f
if %panviewdown%==lbracket ECHO Set Pan View Down keybind to [ - Done!
if %panviewdown%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000001b /f
if %panviewdown%==rbracket ECHO Set Pan View Down keybind to ] - Done!
if %panviewdown%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000035 /f
if %panviewdown%==slash ECHO Set Pan View Down keybind to / - Done!
if %panviewdown%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000002b /f
if %panviewdown%==bslash ECHO Set Pan View Down keybind to \ - Done!
if %panviewdown%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000027 /f
if %panviewdown%==colon ECHO Set Pan View Down keybind to ; - Done!
if %panviewdown%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000028 /f
if %panviewdown%==quote ECHO Set Pan View Down keybind to ' - Done!
if %panviewdown%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000033 /f
if %panviewdown%==comma ECHO Set Pan View Down keybind to , - Done!
if %panviewdown%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000034 /f
if %panviewdown%==period ECHO Set Pan View Down keybind to . - Done!
if %panviewdown%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000000e /f
if %panviewdown%==bckspc ECHO Set Pan View Down keybind to Backspace - Done!
if %panviewdown%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000000f /f
if %panviewdown%==tab ECHO Set Pan View Down keybind to Tab - Done!
if %panviewdown%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000001c /f
if %panviewdown%==enter ECHO Set Pan View Down keybind to Enter - Done!
if %panviewdown%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000039 /f
if %panviewdown%==space ECHO Set Pan View Down keybind to Space Bar - Done!
if %panviewdown%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000001 /f
if %panviewdown%==esc ECHO Set Pan View Down keybind to Escape - Done!
if %panviewdown%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000052 /f
if %panviewdown%==ins ECHO Set Pan View Down keybind to Insert - Done!
if %panviewdown%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000053 /f
if %panviewdown%==del ECHO Set Pan View Down keybind to Delete - Done!
if %panviewdown%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000047 /f
if %panviewdown%==home ECHO Set Pan View Down keybind to Home - Done!
if %panviewdown%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000004f /f
if %panviewdown%==end ECHO Set Pan View Down keybind to End - Done!
if %panviewdown%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000049 /f
if %panviewdown%==pgup ECHO Set Pan View Down keybind to Page Up - Done!
if %panviewdown%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000051 /f
if %panviewdown%==pgdn ECHO Set Pan View Down keybind to Page Down - Done!
if %panviewdown%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000003b /f
if %panviewdown%==f1 ECHO Set Pan View Down keybind to F1 - Done!
if %panviewdown%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000003c /f
if %panviewdown%==f2 ECHO Set Pan View Down keybind to F2 - Done!
if %panviewdown%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000003d /f
if %panviewdown%==f3 ECHO Set Pan View Down keybind to F3 - Done!
if %panviewdown%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000003e /f
if %panviewdown%==f4 ECHO Set Pan View Down keybind to F4 - Done!
if %panviewdown%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000003f /f
if %panviewdown%==f5 ECHO Set Pan View Down keybind to F5 - Done!
if %panviewdown%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000040 /f
if %panviewdown%==f6 ECHO Set Pan View Down keybind to F6 - Done!
if %panviewdown%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000041 /f
if %panviewdown%==f7 ECHO Set Pan View Down keybind to F7 - Done!
if %panviewdown%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000042 /f
if %panviewdown%==f8 ECHO Set Pan View Down keybind to F8 - Done!
if %panviewdown%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000043 /f
if %panviewdown%==f9 ECHO Set Pan View Down keybind to F9 - Done!
if %panviewdown%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000044 /f
if %panviewdown%==f10 ECHO Set Pan View Down keybind to F10 - Done!
if %panviewdown%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000085 /f
if %panviewdown%==f11 ECHO Set Pan View Down keybind to F11 - Done!
if %panviewdown%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000086 /f
if %panviewdown%==f12 ECHO Set Pan View Down keybind to F12 - Done!
if %panviewdown%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000004f /f
if %panviewdown%==num1 ECHO Set Pan View Down keybind to Numpad 1 - Done!
if %panviewdown%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000050 /f
if %panviewdown%==num2 ECHO Set Pan View Down keybind to Numpad 2 - Done!
if %panviewdown%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000051 /f
if %panviewdown%==num3 ECHO Set Pan View Down keybind to Numpad 3 - Done!
if %panviewdown%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000004b /f
if %panviewdown%==num4 ECHO Set Pan View Down keybind to Numpad 4 - Done!
if %panviewdown%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000004c /f
if %panviewdown%==num5 ECHO Set Pan View Down keybind to Numpad 5 - Done!
if %panviewdown%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000004d /f
if %panviewdown%==num6 ECHO Set Pan View Down keybind to Numpad 6 - Done!
if %panviewdown%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000047 /f
if %panviewdown%==num7 ECHO Set Pan View Down keybind to Numpad 7 - Done!
if %panviewdown%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000048 /f
if %panviewdown%==num8 ECHO Set Pan View Down keybind to Numpad 8 - Done!
if %panviewdown%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000049 /f
if %panviewdown%==num9 ECHO Set Pan View Down keybind to Numpad 9 - Done!
if %panviewdown%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000037 /f
if %panviewdown%==numstar ECHO Set Pan View Down keybind to Numpad * - Done!
if %panviewdown%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000004a /f
if %panviewdown%==numminus ECHO Set Pan View Down keybind to Numpad - - Done!
if %panviewdown%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000004e /f
if %panviewdown%==numplus ECHO Set Pan View Down keybind to Numpad + - Done!
if %panviewdown%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000048 /f
if %panviewdown%==up ECHO Set Pan View Down keybind to Up Arrow - Done!
if %panviewdown%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x00000050 /f
if %panviewdown%==down ECHO Set Pan View Down keybind to Down Arrow - Done!
if %panviewdown%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000004b /f
if %panviewdown%==left ECHO Set Pan View Down keybind to Left Arrow - Done!
if %panviewdown%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Down" /t REG_DWORD /d 0x0000004d /f
if %panviewdown%==right ECHO Set Pan View Down keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:panviewleft
ECHO                      --- Bind Pan View Left ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p panviewleft="Input a key and press Enter to bind it to Weapon: "
@echo off
if %panviewleft%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000001e /f
if %panviewleft%==a ECHO Set Pan View Left keybind to A - Done!
if %panviewleft%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000030 /f
if %panviewleft%==b ECHO Set Pan View Left keybind to B - Done!
if %panviewleft%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000002e /f
if %panviewleft%==c ECHO Set Pan View Left keybind to C - Done!
if %panviewleft%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000020 /f
if %panviewleft%==d ECHO Set Pan View Left keybind to D - Done!
if %panviewleft%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000012 /f
if %panviewleft%==e ECHO Set Pan View Left keybind to E - Done!
if %panviewleft%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000021 /f
if %panviewleft%==f ECHO Set Pan View Left keybind to F - Done!
if %panviewleft%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000022 /f
if %panviewleft%==g ECHO Set Pan View Left keybind to G - Done!
if %panviewleft%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000023 /f
if %panviewleft%==h ECHO Set Pan View Left keybind to H - Done!
if %panviewleft%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000017 /f
if %panviewleft%==i ECHO Set Pan View Left keybind to I - Done!
if %panviewleft%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000024 /f
if %panviewleft%==j ECHO Set Pan View Left keybind to J - Done!
if %panviewleft%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000025 /f
if %panviewleft%==k ECHO Set Pan View Left keybind to K - Done!
if %panviewleft%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000026 /f
if %panviewleft%==l ECHO Set Pan View Left keybind to L - Done!
if %panviewleft%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000032 /f
if %panviewleft%==m ECHO Set Pan View Left keybind to M - Done!
if %panviewleft%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000031 /f
if %panviewleft%==n ECHO Set Pan View Left keybind to N - Done!
if %panviewleft%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000018 /f
if %panviewleft%==o ECHO Set Pan View Left keybind to O - Done!
if %panviewleft%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000019 /f
if %panviewleft%==p ECHO Set Pan View Left keybind to P - Done!
if %panviewleft%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000010 /f
if %panviewleft%==q ECHO Set Pan View Left keybind to Q - Done!
if %panviewleft%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000013 /f
if %panviewleft%==r ECHO Set Pan View Left keybind to R - Done!
if %panviewleft%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000001f /f
if %panviewleft%==s ECHO Set Pan View Left keybind to S - Done!
if %panviewleft%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000014 /f
if %panviewleft%==t ECHO Set Pan View Left keybind to T - Done!
if %panviewleft%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000016 /f
if %panviewleft%==u ECHO Set Pan View Left keybind to U - Done!
if %panviewleft%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000002f /f
if %panviewleft%==v ECHO Set Pan View Left keybind to V - Done!
if %panviewleft%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000011 /f
if %panviewleft%==w ECHO Set Pan View Left keybind to W - Done!
if %panviewleft%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000002d /f
if %panviewleft%==x ECHO Set Pan View Left keybind to X - Done!
if %panviewleft%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000015 /f
if %panviewleft%==y ECHO Set Pan View Left keybind to Y - Done!
if %panviewleft%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000002c /f
if %panviewleft%==z ECHO Set Pan View Left keybind to Z - Done!
if %panviewleft%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000029 /f
if %panviewleft%==tilde ECHO Set Pan View Left keybind to ~ - Done!
if %panviewleft%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000000d /f
if %panviewleft%==equal ECHO Set Pan View Left keybind to = - Done!
if %panviewleft%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000000c /f
if %panviewleft%==minus ECHO Set Pan View Left keybind to - - Done!
if %panviewleft%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000001a /f
if %panviewleft%==lbracket ECHO Set Pan View Left keybind to [ - Done!
if %panviewleft%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000001b /f
if %panviewleft%==rbracket ECHO Set Pan View Left keybind to ] - Done!
if %panviewleft%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000035 /f
if %panviewleft%==slash ECHO Set Pan View Left keybind to / - Done!
if %panviewleft%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000002b /f
if %panviewleft%==bslash ECHO Set Pan View Left keybind to \ - Done!
if %panviewleft%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000027 /f
if %panviewleft%==colon ECHO Set Pan View Left keybind to ; - Done!
if %panviewleft%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000028 /f
if %panviewleft%==quote ECHO Set Pan View Left keybind to ' - Done!
if %panviewleft%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000033 /f
if %panviewleft%==comma ECHO Set Pan View Left keybind to , - Done!
if %panviewleft%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000034 /f
if %panviewleft%==period ECHO Set Pan View Left keybind to . - Done!
if %panviewleft%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000000e /f
if %panviewleft%==bckspc ECHO Set Pan View Left keybind to Backspace - Done!
if %panviewleft%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000000f /f
if %panviewleft%==tab ECHO Set Pan View Left keybind to Tab - Done!
if %panviewleft%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000001c /f
if %panviewleft%==enter ECHO Set Pan View Left keybind to Enter - Done!
if %panviewleft%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000039 /f
if %panviewleft%==space ECHO Set Pan View Left keybind to Space Bar - Done!
if %panviewleft%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000001 /f
if %panviewleft%==esc ECHO Set Pan View Left keybind to Escape - Done!
if %panviewleft%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000052 /f
if %panviewleft%==ins ECHO Set Pan View Left keybind to Insert - Done!
if %panviewleft%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000053 /f
if %panviewleft%==del ECHO Set Pan View Left keybind to Delete - Done!
if %panviewleft%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000047 /f
if %panviewleft%==home ECHO Set Pan View Left keybind to Home - Done!
if %panviewleft%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000004f /f
if %panviewleft%==end ECHO Set Pan View Left keybind to End - Done!
if %panviewleft%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000049 /f
if %panviewleft%==pgup ECHO Set Pan View Left keybind to Page Up - Done!
if %panviewleft%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000051 /f
if %panviewleft%==pgdn ECHO Set Pan View Left keybind to Page Down - Done!
if %panviewleft%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000003b /f
if %panviewleft%==f1 ECHO Set Pan View Left keybind to F1 - Done!
if %panviewleft%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000003c /f
if %panviewleft%==f2 ECHO Set Pan View Left keybind to F2 - Done!
if %panviewleft%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000003d /f
if %panviewleft%==f3 ECHO Set Pan View Left keybind to F3 - Done!
if %panviewleft%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000003e /f
if %panviewleft%==f4 ECHO Set Pan View Left keybind to F4 - Done!
if %panviewleft%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000003f /f
if %panviewleft%==f5 ECHO Set Pan View Left keybind to F5 - Done!
if %panviewleft%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000040 /f
if %panviewleft%==f6 ECHO Set Pan View Left keybind to F6 - Done!
if %panviewleft%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000041 /f
if %panviewleft%==f7 ECHO Set Pan View Left keybind to F7 - Done!
if %panviewleft%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000042 /f
if %panviewleft%==f8 ECHO Set Pan View Left keybind to F8 - Done!
if %panviewleft%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000043 /f
if %panviewleft%==f9 ECHO Set Pan View Left keybind to F9 - Done!
if %panviewleft%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000044 /f
if %panviewleft%==f10 ECHO Set Pan View Left keybind to F10 - Done!
if %panviewleft%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000085 /f
if %panviewleft%==f11 ECHO Set Pan View Left keybind to F11 - Done!
if %panviewleft%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000086 /f
if %panviewleft%==f12 ECHO Set Pan View Left keybind to F12 - Done!
if %panviewleft%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000004f /f
if %panviewleft%==num1 ECHO Set Pan View Left keybind to Numpad 1 - Done!
if %panviewleft%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000050 /f
if %panviewleft%==num2 ECHO Set Pan View Left keybind to Numpad 2 - Done!
if %panviewleft%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000051 /f
if %panviewleft%==num3 ECHO Set Pan View Left keybind to Numpad 3 - Done!
if %panviewleft%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000004b /f
if %panviewleft%==num4 ECHO Set Pan View Left keybind to Numpad 4 - Done!
if %panviewleft%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000004c /f
if %panviewleft%==num5 ECHO Set Pan View Left keybind to Numpad 5 - Done!
if %panviewleft%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000004d /f
if %panviewleft%==num6 ECHO Set Pan View Left keybind to Numpad 6 - Done!
if %panviewleft%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000047 /f
if %panviewleft%==num7 ECHO Set Pan View Left keybind to Numpad 7 - Done!
if %panviewleft%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000048 /f
if %panviewleft%==num8 ECHO Set Pan View Left keybind to Numpad 8 - Done!
if %panviewleft%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000049 /f
if %panviewleft%==num9 ECHO Set Pan View Left keybind to Numpad 9 - Done!
if %panviewleft%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000037 /f
if %panviewleft%==numstar ECHO Set Pan View Left keybind to Numpad * - Done!
if %panviewleft%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000004a /f
if %panviewleft%==numminus ECHO Set Pan View Left keybind to Numpad - - Done!
if %panviewleft%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000004e /f
if %panviewleft%==numplus ECHO Set Pan View Left keybind to Numpad + - Done!
if %panviewleft%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000048 /f
if %panviewleft%==up ECHO Set Pan View Left keybind to Up Arrow - Done!
if %panviewleft%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x00000050 /f
if %panviewleft%==down ECHO Set Pan View Left keybind to Down Arrow - Done!
if %panviewleft%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000004b /f
if %panviewleft%==left ECHO Set Pan View Left keybind to Left Arrow - Done!
if %panviewleft%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Left" /t REG_DWORD /d 0x0000004d /f
if %panviewleft%==right ECHO Set Pan View Left keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:panviewright
ECHO                      --- Bind Pan View Right ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p panviewright="Input a key and press Enter to bind it to Weapon: "
@echo off
if %panviewright%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000001e /f
if %panviewright%==a ECHO Set Pan View Right keybind to A - Done!
if %panviewright%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000030 /f
if %panviewright%==b ECHO Set Pan View Right keybind to B - Done!
if %panviewright%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000002e /f
if %panviewright%==c ECHO Set Pan View Right keybind to C - Done!
if %panviewright%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000020 /f
if %panviewright%==d ECHO Set Pan View Right keybind to D - Done!
if %panviewright%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000012 /f
if %panviewright%==e ECHO Set Pan View Right keybind to E - Done!
if %panviewright%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000021 /f
if %panviewright%==f ECHO Set Pan View Right keybind to F - Done!
if %panviewright%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000022 /f
if %panviewright%==g ECHO Set Pan View Right keybind to G - Done!
if %panviewright%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000023 /f
if %panviewright%==h ECHO Set Pan View Right keybind to H - Done!
if %panviewright%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000017 /f
if %panviewright%==i ECHO Set Pan View Right keybind to I - Done!
if %panviewright%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000024 /f
if %panviewright%==j ECHO Set Pan View Right keybind to J - Done!
if %panviewright%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000025 /f
if %panviewright%==k ECHO Set Pan View Right keybind to K - Done!
if %panviewright%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000026 /f
if %panviewright%==l ECHO Set Pan View Right keybind to L - Done!
if %panviewright%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000032 /f
if %panviewright%==m ECHO Set Pan View Right keybind to M - Done!
if %panviewright%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000031 /f
if %panviewright%==n ECHO Set Pan View Right keybind to N - Done!
if %panviewright%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000018 /f
if %panviewright%==o ECHO Set Pan View Right keybind to O - Done!
if %panviewright%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000019 /f
if %panviewright%==p ECHO Set Pan View Right keybind to P - Done!
if %panviewright%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000010 /f
if %panviewright%==q ECHO Set Pan View Right keybind to Q - Done!
if %panviewright%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000013 /f
if %panviewright%==r ECHO Set Pan View Right keybind to R - Done!
if %panviewright%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000001f /f
if %panviewright%==s ECHO Set Pan View Right keybind to S - Done!
if %panviewright%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000014 /f
if %panviewright%==t ECHO Set Pan View Right keybind to T - Done!
if %panviewright%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000016 /f
if %panviewright%==u ECHO Set Pan View Right keybind to U - Done!
if %panviewright%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000002f /f
if %panviewright%==v ECHO Set Pan View Right keybind to V - Done!
if %panviewright%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000011 /f
if %panviewright%==w ECHO Set Pan View Right keybind to W - Done!
if %panviewright%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000002d /f
if %panviewright%==x ECHO Set Pan View Right keybind to X - Done!
if %panviewright%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000015 /f
if %panviewright%==y ECHO Set Pan View Right keybind to Y - Done!
if %panviewright%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000002c /f
if %panviewright%==z ECHO Set Pan View Right keybind to Z - Done!
if %panviewright%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000029 /f
if %panviewright%==tilde ECHO Set Pan View Right keybind to ~ - Done!
if %panviewright%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000000d /f
if %panviewright%==equal ECHO Set Pan View Right keybind to = - Done!
if %panviewright%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000000c /f
if %panviewright%==minus ECHO Set Pan View Right keybind to - - Done!
if %panviewright%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000001a /f
if %panviewright%==lbracket ECHO Set Pan View Right keybind to [ - Done!
if %panviewright%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000001b /f
if %panviewright%==rbracket ECHO Set Pan View Right keybind to ] - Done!
if %panviewright%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000035 /f
if %panviewright%==slash ECHO Set Pan View Right keybind to / - Done!
if %panviewright%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000002b /f
if %panviewright%==bslash ECHO Set Pan View Right keybind to \ - Done!
if %panviewright%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000027 /f
if %panviewright%==colon ECHO Set Pan View Right keybind to ; - Done!
if %panviewright%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000028 /f
if %panviewright%==quote ECHO Set Pan View Right keybind to ' - Done!
if %panviewright%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000033 /f
if %panviewright%==comma ECHO Set Pan View Right keybind to , - Done!
if %panviewright%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000034 /f
if %panviewright%==period ECHO Set Pan View Right keybind to . - Done!
if %panviewright%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000000e /f
if %panviewright%==bckspc ECHO Set Pan View Right keybind to Backspace - Done!
if %panviewright%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000000f /f
if %panviewright%==tab ECHO Set Pan View Right keybind to Tab - Done!
if %panviewright%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000001c /f
if %panviewright%==enter ECHO Set Pan View Right keybind to Enter - Done!
if %panviewright%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000039 /f
if %panviewright%==space ECHO Set Pan View Right keybind to Space Bar - Done!
if %panviewright%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000001 /f
if %panviewright%==esc ECHO Set Pan View Right keybind to Escape - Done!
if %panviewright%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000052 /f
if %panviewright%==ins ECHO Set Pan View Right keybind to Insert - Done!
if %panviewright%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000053 /f
if %panviewright%==del ECHO Set Pan View Right keybind to Delete - Done!
if %panviewright%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000047 /f
if %panviewright%==home ECHO Set Pan View Right keybind to Home - Done!
if %panviewright%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000004f /f
if %panviewright%==end ECHO Set Pan View Right keybind to End - Done!
if %panviewright%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000049 /f
if %panviewright%==pgup ECHO Set Pan View Right keybind to Page Up - Done!
if %panviewright%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000051 /f
if %panviewright%==pgdn ECHO Set Pan View Right keybind to Page Down - Done!
if %panviewright%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000003b /f
if %panviewright%==f1 ECHO Set Pan View Right keybind to F1 - Done!
if %panviewright%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000003c /f
if %panviewright%==f2 ECHO Set Pan View Right keybind to F2 - Done!
if %panviewright%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000003d /f
if %panviewright%==f3 ECHO Set Pan View Right keybind to F3 - Done!
if %panviewright%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000003e /f
if %panviewright%==f4 ECHO Set Pan View Right keybind to F4 - Done!
if %panviewright%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000003f /f
if %panviewright%==f5 ECHO Set Pan View Right keybind to F5 - Done!
if %panviewright%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000040 /f
if %panviewright%==f6 ECHO Set Pan View Right keybind to F6 - Done!
if %panviewright%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000041 /f
if %panviewright%==f7 ECHO Set Pan View Right keybind to F7 - Done!
if %panviewright%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000042 /f
if %panviewright%==f8 ECHO Set Pan View Right keybind to F8 - Done!
if %panviewright%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000043 /f
if %panviewright%==f9 ECHO Set Pan View Right keybind to F9 - Done!
if %panviewright%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000044 /f
if %panviewright%==f10 ECHO Set Pan View Right keybind to F10 - Done!
if %panviewright%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000085 /f
if %panviewright%==f11 ECHO Set Pan View Right keybind to F11 - Done!
if %panviewright%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000086 /f
if %panviewright%==f12 ECHO Set Pan View Right keybind to F12 - Done!
if %panviewright%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000004f /f
if %panviewright%==num1 ECHO Set Pan View Right keybind to Numpad 1 - Done!
if %panviewright%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000050 /f
if %panviewright%==num2 ECHO Set Pan View Right keybind to Numpad 2 - Done!
if %panviewright%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000051 /f
if %panviewright%==num3 ECHO Set Pan View Right keybind to Numpad 3 - Done!
if %panviewright%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000004b /f
if %panviewright%==num4 ECHO Set Pan View Right keybind to Numpad 4 - Done!
if %panviewright%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000004c /f
if %panviewright%==num5 ECHO Set Pan View Right keybind to Numpad 5 - Done!
if %panviewright%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000004d /f
if %panviewright%==num6 ECHO Set Pan View Right keybind to Numpad 6 - Done!
if %panviewright%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000047 /f
if %panviewright%==num7 ECHO Set Pan View Right keybind to Numpad 7 - Done!
if %panviewright%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000048 /f
if %panviewright%==num8 ECHO Set Pan View Right keybind to Numpad 8 - Done!
if %panviewright%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000049 /f
if %panviewright%==num9 ECHO Set Pan View Right keybind to Numpad 9 - Done!
if %panviewright%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000037 /f
if %panviewright%==numstar ECHO Set Pan View Right keybind to Numpad * - Done!
if %panviewright%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000004a /f
if %panviewright%==numminus ECHO Set Pan View Right keybind to Numpad - - Done!
if %panviewright%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000004e /f
if %panviewright%==numplus ECHO Set Pan View Right keybind to Numpad + - Done!
if %panviewright%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000048 /f
if %panviewright%==up ECHO Set Pan View Right keybind to Up Arrow - Done!
if %panviewright%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x00000050 /f
if %panviewright%==down ECHO Set Pan View Right keybind to Down Arrow - Done!
if %panviewright%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000004b /f
if %panviewright%==left ECHO Set Pan View Right keybind to Left Arrow - Done!
if %panviewright%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Pan View Right" /t REG_DWORD /d 0x0000004d /f
if %panviewright%==right ECHO Set Pan View Right keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:zoomviewin
ECHO                      --- Bind Zoom View In ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p zoomviewin="Input a key and press Enter to bind it to Weapon: "
@echo off
if %zoomviewin%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000001e /f
if %zoomviewin%==a ECHO Set Zoom View In keybind to A - Done!
if %zoomviewin%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000030 /f
if %zoomviewin%==b ECHO Set Zoom View In keybind to B - Done!
if %zoomviewin%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000002e /f
if %zoomviewin%==c ECHO Set Zoom View In keybind to C - Done!
if %zoomviewin%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000020 /f
if %zoomviewin%==d ECHO Set Zoom View In keybind to D - Done!
if %zoomviewin%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000012 /f
if %zoomviewin%==e ECHO Set Zoom View In keybind to E - Done!
if %zoomviewin%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000021 /f
if %zoomviewin%==f ECHO Set Zoom View In keybind to F - Done!
if %zoomviewin%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000022 /f
if %zoomviewin%==g ECHO Set Zoom View In keybind to G - Done!
if %zoomviewin%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000023 /f
if %zoomviewin%==h ECHO Set Zoom View In keybind to H - Done!
if %zoomviewin%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000017 /f
if %zoomviewin%==i ECHO Set Zoom View In keybind to I - Done!
if %zoomviewin%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000024 /f
if %zoomviewin%==j ECHO Set Zoom View In keybind to J - Done!
if %zoomviewin%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000025 /f
if %zoomviewin%==k ECHO Set Zoom View In keybind to K - Done!
if %zoomviewin%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000026 /f
if %zoomviewin%==l ECHO Set Zoom View In keybind to L - Done!
if %zoomviewin%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000032 /f
if %zoomviewin%==m ECHO Set Zoom View In keybind to M - Done!
if %zoomviewin%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000031 /f
if %zoomviewin%==n ECHO Set Zoom View In keybind to N - Done!
if %zoomviewin%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000018 /f
if %zoomviewin%==o ECHO Set Zoom View In keybind to O - Done!
if %zoomviewin%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000019 /f
if %zoomviewin%==p ECHO Set Zoom View In keybind to P - Done!
if %zoomviewin%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000010 /f
if %zoomviewin%==q ECHO Set Zoom View In keybind to Q - Done!
if %zoomviewin%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000013 /f
if %zoomviewin%==r ECHO Set Zoom View In keybind to R - Done!
if %zoomviewin%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000001f /f
if %zoomviewin%==s ECHO Set Zoom View In keybind to S - Done!
if %zoomviewin%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000014 /f
if %zoomviewin%==t ECHO Set Zoom View In keybind to T - Done!
if %zoomviewin%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000016 /f
if %zoomviewin%==u ECHO Set Zoom View In keybind to U - Done!
if %zoomviewin%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000002f /f
if %zoomviewin%==v ECHO Set Zoom View In keybind to V - Done!
if %zoomviewin%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000011 /f
if %zoomviewin%==w ECHO Set Zoom View In keybind to W - Done!
if %zoomviewin%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000002d /f
if %zoomviewin%==x ECHO Set Zoom View In keybind to X - Done!
if %zoomviewin%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000015 /f
if %zoomviewin%==y ECHO Set Zoom View In keybind to Y - Done!
if %zoomviewin%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000002c /f
if %zoomviewin%==z ECHO Set Zoom View In keybind to Z - Done!
if %zoomviewin%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000029 /f
if %zoomviewin%==tilde ECHO Set Zoom View In keybind to ~ - Done!
if %zoomviewin%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000000d /f
if %zoomviewin%==equal ECHO Set Zoom View In keybind to = - Done!
if %zoomviewin%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000000c /f
if %zoomviewin%==minus ECHO Set Zoom View In keybind to - - Done!
if %zoomviewin%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000001a /f
if %zoomviewin%==lbracket ECHO Set Zoom View In keybind to [ - Done!
if %zoomviewin%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000001b /f
if %zoomviewin%==rbracket ECHO Set Zoom View In keybind to ] - Done!
if %zoomviewin%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000035 /f
if %zoomviewin%==slash ECHO Set Zoom View In keybind to / - Done!
if %zoomviewin%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000002b /f
if %zoomviewin%==bslash ECHO Set Zoom View In keybind to \ - Done!
if %zoomviewin%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000027 /f
if %zoomviewin%==colon ECHO Set Zoom View In keybind to ; - Done!
if %zoomviewin%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000028 /f
if %zoomviewin%==quote ECHO Set Zoom View In keybind to ' - Done!
if %zoomviewin%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000033 /f
if %zoomviewin%==comma ECHO Set Zoom View In keybind to , - Done!
if %zoomviewin%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000034 /f
if %zoomviewin%==period ECHO Set Zoom View In keybind to . - Done!
if %zoomviewin%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000000e /f
if %zoomviewin%==bckspc ECHO Set Zoom View In keybind to Backspace - Done!
if %zoomviewin%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000000f /f
if %zoomviewin%==tab ECHO Set Zoom View In keybind to Tab - Done!
if %zoomviewin%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000001c /f
if %zoomviewin%==enter ECHO Set Zoom View In keybind to Enter - Done!
if %zoomviewin%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000039 /f
if %zoomviewin%==space ECHO Set Zoom View In keybind to Space Bar - Done!
if %zoomviewin%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000001 /f
if %zoomviewin%==esc ECHO Set Zoom View In keybind to Escape - Done!
if %zoomviewin%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000052 /f
if %zoomviewin%==ins ECHO Set Zoom View In keybind to Insert - Done!
if %zoomviewin%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000053 /f
if %zoomviewin%==del ECHO Set Zoom View In keybind to Delete - Done!
if %zoomviewin%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000047 /f
if %zoomviewin%==home ECHO Set Zoom View In keybind to Home - Done!
if %zoomviewin%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000004f /f
if %zoomviewin%==end ECHO Set Zoom View In keybind to End - Done!
if %zoomviewin%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000049 /f
if %zoomviewin%==pgup ECHO Set Zoom View In keybind to Page Up - Done!
if %zoomviewin%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000051 /f
if %zoomviewin%==pgdn ECHO Set Zoom View In keybind to Page Down - Done!
if %zoomviewin%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000003b /f
if %zoomviewin%==f1 ECHO Set Zoom View In keybind to F1 - Done!
if %zoomviewin%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000003c /f
if %zoomviewin%==f2 ECHO Set Zoom View In keybind to F2 - Done!
if %zoomviewin%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000003d /f
if %zoomviewin%==f3 ECHO Set Zoom View In keybind to F3 - Done!
if %zoomviewin%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000003e /f
if %zoomviewin%==f4 ECHO Set Zoom View In keybind to F4 - Done!
if %zoomviewin%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000003f /f
if %zoomviewin%==f5 ECHO Set Zoom View In keybind to F5 - Done!
if %zoomviewin%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000040 /f
if %zoomviewin%==f6 ECHO Set Zoom View In keybind to F6 - Done!
if %zoomviewin%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000041 /f
if %zoomviewin%==f7 ECHO Set Zoom View In keybind to F7 - Done!
if %zoomviewin%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000042 /f
if %zoomviewin%==f8 ECHO Set Zoom View In keybind to F8 - Done!
if %zoomviewin%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000043 /f
if %zoomviewin%==f9 ECHO Set Zoom View In keybind to F9 - Done!
if %zoomviewin%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000044 /f
if %zoomviewin%==f10 ECHO Set Zoom View In keybind to F10 - Done!
if %zoomviewin%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000085 /f
if %zoomviewin%==f11 ECHO Set Zoom View In keybind to F11 - Done!
if %zoomviewin%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000086 /f
if %zoomviewin%==f12 ECHO Set Zoom View In keybind to F12 - Done!
if %zoomviewin%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000004f /f
if %zoomviewin%==num1 ECHO Set Zoom View In keybind to Numpad 1 - Done!
if %zoomviewin%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000050 /f
if %zoomviewin%==num2 ECHO Set Zoom View In keybind to Numpad 2 - Done!
if %zoomviewin%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000051 /f
if %zoomviewin%==num3 ECHO Set Zoom View In keybind to Numpad 3 - Done!
if %zoomviewin%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000004b /f
if %zoomviewin%==num4 ECHO Set Zoom View In keybind to Numpad 4 - Done!
if %zoomviewin%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000004c /f
if %zoomviewin%==num5 ECHO Set Zoom View In keybind to Numpad 5 - Done!
if %zoomviewin%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000004d /f
if %zoomviewin%==num6 ECHO Set Zoom View In keybind to Numpad 6 - Done!
if %zoomviewin%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000047 /f
if %zoomviewin%==num7 ECHO Set Zoom View In keybind to Numpad 7 - Done!
if %zoomviewin%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000048 /f
if %zoomviewin%==num8 ECHO Set Zoom View In keybind to Numpad 8 - Done!
if %zoomviewin%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000049 /f
if %zoomviewin%==num9 ECHO Set Zoom View In keybind to Numpad 9 - Done!
if %zoomviewin%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000037 /f
if %zoomviewin%==numstar ECHO Set Zoom View In keybind to Numpad * - Done!
if %zoomviewin%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000004a /f
if %zoomviewin%==numminus ECHO Set Zoom View In keybind to Numpad - - Done!
if %zoomviewin%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000004e /f
if %zoomviewin%==numplus ECHO Set Zoom View In keybind to Numpad + - Done!
if %zoomviewin%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000048 /f
if %zoomviewin%==up ECHO Set Zoom View In keybind to Up Arrow - Done!
if %zoomviewin%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x00000050 /f
if %zoomviewin%==down ECHO Set Zoom View In keybind to Down Arrow - Done!
if %zoomviewin%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000004b /f
if %zoomviewin%==left ECHO Set Zoom View In keybind to Left Arrow - Done!
if %zoomviewin%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View In" /t REG_DWORD /d 0x0000004d /f
if %zoomviewin%==right ECHO Set Zoom View In keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:zoomviewout
ECHO                      --- Bind Zoom View Out ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p zoomviewout="Input a key and press Enter to bind it to Weapon: "
@echo off
if %zoomviewout%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000001e /f
if %zoomviewout%==a ECHO Set Zoom View Out keybind to A - Done!
if %zoomviewout%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000030 /f
if %zoomviewout%==b ECHO Set Zoom View Out keybind to B - Done!
if %zoomviewout%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000002e /f
if %zoomviewout%==c ECHO Set Zoom View Out keybind to C - Done!
if %zoomviewout%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000020 /f
if %zoomviewout%==d ECHO Set Zoom View Out keybind to D - Done!
if %zoomviewout%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000012 /f
if %zoomviewout%==e ECHO Set Zoom View Out keybind to E - Done!
if %zoomviewout%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000021 /f
if %zoomviewout%==f ECHO Set Zoom View Out keybind to F - Done!
if %zoomviewout%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000022 /f
if %zoomviewout%==g ECHO Set Zoom View Out keybind to G - Done!
if %zoomviewout%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000023 /f
if %zoomviewout%==h ECHO Set Zoom View Out keybind to H - Done!
if %zoomviewout%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000017 /f
if %zoomviewout%==i ECHO Set Zoom View Out keybind to I - Done!
if %zoomviewout%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000024 /f
if %zoomviewout%==j ECHO Set Zoom View Out keybind to J - Done!
if %zoomviewout%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000025 /f
if %zoomviewout%==k ECHO Set Zoom View Out keybind to K - Done!
if %zoomviewout%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000026 /f
if %zoomviewout%==l ECHO Set Zoom View Out keybind to L - Done!
if %zoomviewout%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000032 /f
if %zoomviewout%==m ECHO Set Zoom View Out keybind to M - Done!
if %zoomviewout%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000031 /f
if %zoomviewout%==n ECHO Set Zoom View Out keybind to N - Done!
if %zoomviewout%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000018 /f
if %zoomviewout%==o ECHO Set Zoom View Out keybind to O - Done!
if %zoomviewout%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000019 /f
if %zoomviewout%==p ECHO Set Zoom View Out keybind to P - Done!
if %zoomviewout%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000010 /f
if %zoomviewout%==q ECHO Set Zoom View Out keybind to Q - Done!
if %zoomviewout%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000013 /f
if %zoomviewout%==r ECHO Set Zoom View Out keybind to R - Done!
if %zoomviewout%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000001f /f
if %zoomviewout%==s ECHO Set Zoom View Out keybind to S - Done!
if %zoomviewout%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000014 /f
if %zoomviewout%==t ECHO Set Zoom View Out keybind to T - Done!
if %zoomviewout%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000016 /f
if %zoomviewout%==u ECHO Set Zoom View Out keybind to U - Done!
if %zoomviewout%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000002f /f
if %zoomviewout%==v ECHO Set Zoom View Out keybind to V - Done!
if %zoomviewout%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000011 /f
if %zoomviewout%==w ECHO Set Zoom View Out keybind to W - Done!
if %zoomviewout%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000002d /f
if %zoomviewout%==x ECHO Set Zoom View Out keybind to X - Done!
if %zoomviewout%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000015 /f
if %zoomviewout%==y ECHO Set Zoom View Out keybind to Y - Done!
if %zoomviewout%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000002c /f
if %zoomviewout%==z ECHO Set Zoom View Out keybind to Z - Done!
if %zoomviewout%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000029 /f
if %zoomviewout%==tilde ECHO Set Zoom View Out keybind to ~ - Done!
if %zoomviewout%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000000d /f
if %zoomviewout%==equal ECHO Set Zoom View Out keybind to = - Done!
if %zoomviewout%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000000c /f
if %zoomviewout%==minus ECHO Set Zoom View Out keybind to - - Done!
if %zoomviewout%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000001a /f
if %zoomviewout%==lbracket ECHO Set Zoom View Out keybind to [ - Done!
if %zoomviewout%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000001b /f
if %zoomviewout%==rbracket ECHO Set Zoom View Out keybind to ] - Done!
if %zoomviewout%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000035 /f
if %zoomviewout%==slash ECHO Set Zoom View Out keybind to / - Done!
if %zoomviewout%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000002b /f
if %zoomviewout%==bslash ECHO Set Zoom View Out keybind to \ - Done!
if %zoomviewout%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000027 /f
if %zoomviewout%==colon ECHO Set Zoom View Out keybind to ; - Done!
if %zoomviewout%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000028 /f
if %zoomviewout%==quote ECHO Set Zoom View Out keybind to ' - Done!
if %zoomviewout%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000033 /f
if %zoomviewout%==comma ECHO Set Zoom View Out keybind to , - Done!
if %zoomviewout%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000034 /f
if %zoomviewout%==period ECHO Set Zoom View Out keybind to . - Done!
if %zoomviewout%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000000e /f
if %zoomviewout%==bckspc ECHO Set Zoom View Out keybind to Backspace - Done!
if %zoomviewout%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000000f /f
if %zoomviewout%==tab ECHO Set Zoom View Out keybind to Tab - Done!
if %zoomviewout%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000001c /f
if %zoomviewout%==enter ECHO Set Zoom View Out keybind to Enter - Done!
if %zoomviewout%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000039 /f
if %zoomviewout%==space ECHO Set Zoom View Out keybind to Space Bar - Done!
if %zoomviewout%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000001 /f
if %zoomviewout%==esc ECHO Set Zoom View Out keybind to Escape - Done!
if %zoomviewout%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000052 /f
if %zoomviewout%==ins ECHO Set Zoom View Out keybind to Insert - Done!
if %zoomviewout%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000053 /f
if %zoomviewout%==del ECHO Set Zoom View Out keybind to Delete - Done!
if %zoomviewout%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000047 /f
if %zoomviewout%==home ECHO Set Zoom View Out keybind to Home - Done!
if %zoomviewout%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000004f /f
if %zoomviewout%==end ECHO Set Zoom View Out keybind to End - Done!
if %zoomviewout%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000049 /f
if %zoomviewout%==pgup ECHO Set Zoom View Out keybind to Page Up - Done!
if %zoomviewout%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000051 /f
if %zoomviewout%==pgdn ECHO Set Zoom View Out keybind to Page Down - Done!
if %zoomviewout%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000003b /f
if %zoomviewout%==f1 ECHO Set Zoom View Out keybind to F1 - Done!
if %zoomviewout%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000003c /f
if %zoomviewout%==f2 ECHO Set Zoom View Out keybind to F2 - Done!
if %zoomviewout%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000003d /f
if %zoomviewout%==f3 ECHO Set Zoom View Out keybind to F3 - Done!
if %zoomviewout%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000003e /f
if %zoomviewout%==f4 ECHO Set Zoom View Out keybind to F4 - Done!
if %zoomviewout%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000003f /f
if %zoomviewout%==f5 ECHO Set Zoom View Out keybind to F5 - Done!
if %zoomviewout%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000040 /f
if %zoomviewout%==f6 ECHO Set Zoom View Out keybind to F6 - Done!
if %zoomviewout%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000041 /f
if %zoomviewout%==f7 ECHO Set Zoom View Out keybind to F7 - Done!
if %zoomviewout%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000042 /f
if %zoomviewout%==f8 ECHO Set Zoom View Out keybind to F8 - Done!
if %zoomviewout%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000043 /f
if %zoomviewout%==f9 ECHO Set Zoom View Out keybind to F9 - Done!
if %zoomviewout%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000044 /f
if %zoomviewout%==f10 ECHO Set Zoom View Out keybind to F10 - Done!
if %zoomviewout%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000085 /f
if %zoomviewout%==f11 ECHO Set Zoom View Out keybind to F11 - Done!
if %zoomviewout%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000086 /f
if %zoomviewout%==f12 ECHO Set Zoom View Out keybind to F12 - Done!
if %zoomviewout%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000004f /f
if %zoomviewout%==num1 ECHO Set Zoom View Out keybind to Numpad 1 - Done!
if %zoomviewout%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000050 /f
if %zoomviewout%==num2 ECHO Set Zoom View Out keybind to Numpad 2 - Done!
if %zoomviewout%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000051 /f
if %zoomviewout%==num3 ECHO Set Zoom View Out keybind to Numpad 3 - Done!
if %zoomviewout%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000004b /f
if %zoomviewout%==num4 ECHO Set Zoom View Out keybind to Numpad 4 - Done!
if %zoomviewout%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000004c /f
if %zoomviewout%==num5 ECHO Set Zoom View Out keybind to Numpad 5 - Done!
if %zoomviewout%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000004d /f
if %zoomviewout%==num6 ECHO Set Zoom View Out keybind to Numpad 6 - Done!
if %zoomviewout%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000047 /f
if %zoomviewout%==num7 ECHO Set Zoom View Out keybind to Numpad 7 - Done!
if %zoomviewout%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000048 /f
if %zoomviewout%==num8 ECHO Set Zoom View Out keybind to Numpad 8 - Done!
if %zoomviewout%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000049 /f
if %zoomviewout%==num9 ECHO Set Zoom View Out keybind to Numpad 9 - Done!
if %zoomviewout%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000037 /f
if %zoomviewout%==numstar ECHO Set Zoom View Out keybind to Numpad * - Done!
if %zoomviewout%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000004a /f
if %zoomviewout%==numminus ECHO Set Zoom View Out keybind to Numpad - - Done!
if %zoomviewout%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000004e /f
if %zoomviewout%==numplus ECHO Set Zoom View Out keybind to Numpad + - Done!
if %zoomviewout%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000048 /f
if %zoomviewout%==up ECHO Set Zoom View Out keybind to Up Arrow - Done!
if %zoomviewout%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x00000050 /f
if %zoomviewout%==down ECHO Set Zoom View Out keybind to Down Arrow - Done!
if %zoomviewout%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000004b /f
if %zoomviewout%==left ECHO Set Zoom View Out keybind to Left Arrow - Done!
if %zoomviewout%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Zoom View Out" /t REG_DWORD /d 0x0000004d /f
if %zoomviewout%==right ECHO Set Zoom View Out keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
REM ---------------------- Other Controls ------------------------
REM --------------------------------------------------------------------------
:console
ECHO                   --- Bind Console (Terminal) ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p console="Input a key and press Enter to bind it to Weapon: "
@echo off
if %console%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000001e /f
if %console%==a ECHO Set Console keybind to A - Done!
if %console%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000030 /f
if %console%==b ECHO Set Console keybind to B - Done!
if %console%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000002e /f
if %console%==c ECHO Set Console keybind to C - Done!
if %console%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000020 /f
if %console%==d ECHO Set Console keybind to D - Done!
if %console%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000012 /f
if %console%==e ECHO Set Console keybind to E - Done!
if %console%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000021 /f
if %console%==f ECHO Set Console keybind to F - Done!
if %console%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000022 /f
if %console%==g ECHO Set Console keybind to G - Done!
if %console%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000023 /f
if %console%==h ECHO Set Console keybind to H - Done!
if %console%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000017 /f
if %console%==i ECHO Set Console keybind to I - Done!
if %console%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000024 /f
if %console%==j ECHO Set Console keybind to J - Done!
if %console%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000025 /f
if %console%==k ECHO Set Console keybind to K - Done!
if %console%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000026 /f
if %console%==l ECHO Set Console keybind to L - Done!
if %console%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000032 /f
if %console%==m ECHO Set Console keybind to M - Done!
if %console%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000031 /f
if %console%==n ECHO Set Console keybind to N - Done!
if %console%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000018 /f
if %console%==o ECHO Set Console keybind to O - Done!
if %console%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000019 /f
if %console%==p ECHO Set Console keybind to P - Done!
if %console%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000010 /f
if %console%==q ECHO Set Console keybind to Q - Done!
if %console%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000013 /f
if %console%==r ECHO Set Console keybind to R - Done!
if %console%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000001f /f
if %console%==s ECHO Set Console keybind to S - Done!
if %console%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000014 /f
if %console%==t ECHO Set Console keybind to T - Done!
if %console%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000016 /f
if %console%==u ECHO Set Console keybind to U - Done!
if %console%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000002f /f
if %console%==v ECHO Set Console keybind to V - Done!
if %console%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000011 /f
if %console%==w ECHO Set Console keybind to W - Done!
if %console%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000002d /f
if %console%==x ECHO Set Console keybind to X - Done!
if %console%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000015 /f
if %console%==y ECHO Set Console keybind to Y - Done!
if %console%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000002c /f
if %console%==z ECHO Set Console keybind to Z - Done!
if %console%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000029 /f
if %console%==tilde ECHO Set Console keybind to ~ - Done!
if %console%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000000d /f
if %console%==equal ECHO Set Console keybind to = - Done!
if %console%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000000c /f
if %console%==minus ECHO Set Console keybind to - - Done!
if %console%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000001a /f
if %console%==lbracket ECHO Set Console keybind to [ - Done!
if %console%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000001b /f
if %console%==rbracket ECHO Set Console keybind to ] - Done!
if %console%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000035 /f
if %console%==slash ECHO Set Console keybind to / - Done!
if %console%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000002b /f
if %console%==bslash ECHO Set Console keybind to \ - Done!
if %console%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000027 /f
if %console%==colon ECHO Set Console keybind to ; - Done!
if %console%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000028 /f
if %console%==quote ECHO Set Console keybind to ' - Done!
if %console%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000033 /f
if %console%==comma ECHO Set Console keybind to , - Done!
if %console%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000034 /f
if %console%==period ECHO Set Console keybind to . - Done!
if %console%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000000e /f
if %console%==bckspc ECHO Set Console keybind to Backspace - Done!
if %console%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000000f /f
if %console%==tab ECHO Set Console keybind to Tab - Done!
if %console%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000001c /f
if %console%==enter ECHO Set Console keybind to Enter - Done!
if %console%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000039 /f
if %console%==space ECHO Set Console keybind to Space Bar - Done!
if %console%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000001 /f
if %console%==esc ECHO Set Console keybind to Escape - Done!
if %console%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000052 /f
if %console%==ins ECHO Set Console keybind to Insert - Done!
if %console%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000053 /f
if %console%==del ECHO Set Console keybind to Delete - Done!
if %console%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000047 /f
if %console%==home ECHO Set Console keybind to Home - Done!
if %console%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000004f /f
if %console%==end ECHO Set Console keybind to End - Done!
if %console%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000049 /f
if %console%==pgup ECHO Set Console keybind to Page Up - Done!
if %console%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000051 /f
if %console%==pgdn ECHO Set Console keybind to Page Down - Done!
if %console%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000003b /f
if %console%==f1 ECHO Set Console keybind to F1 - Done!
if %console%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000003c /f
if %console%==f2 ECHO Set Console keybind to F2 - Done!
if %console%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000003d /f
if %console%==f3 ECHO Set Console keybind to F3 - Done!
if %console%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000003e /f
if %console%==f4 ECHO Set Console keybind to F4 - Done!
if %console%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000003f /f
if %console%==f5 ECHO Set Console keybind to F5 - Done!
if %console%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000040 /f
if %console%==f6 ECHO Set Console keybind to F6 - Done!
if %console%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000041 /f
if %console%==f7 ECHO Set Console keybind to F7 - Done!
if %console%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000042 /f
if %console%==f8 ECHO Set Console keybind to F8 - Done!
if %console%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000043 /f
if %console%==f9 ECHO Set Console keybind to F9 - Done!
if %console%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000044 /f
if %console%==f10 ECHO Set Console keybind to F10 - Done!
if %console%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000085 /f
if %console%==f11 ECHO Set Console keybind to F11 - Done!
if %console%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000086 /f
if %console%==f12 ECHO Set Console keybind to F12 - Done!
if %console%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000004f /f
if %console%==num1 ECHO Set Console keybind to Numpad 1 - Done!
if %console%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000050 /f
if %console%==num2 ECHO Set Console keybind to Numpad 2 - Done!
if %console%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000051 /f
if %console%==num3 ECHO Set Console keybind to Numpad 3 - Done!
if %console%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000004b /f
if %console%==num4 ECHO Set Console keybind to Numpad 4 - Done!
if %console%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000004c /f
if %console%==num5 ECHO Set Console keybind to Numpad 5 - Done!
if %console%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000004d /f
if %console%==num6 ECHO Set Console keybind to Numpad 6 - Done!
if %console%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000047 /f
if %console%==num7 ECHO Set Console keybind to Numpad 7 - Done!
if %console%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000048 /f
if %console%==num8 ECHO Set Console keybind to Numpad 8 - Done!
if %console%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000049 /f
if %console%==num9 ECHO Set Console keybind to Numpad 9 - Done!
if %console%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000037 /f
if %console%==numstar ECHO Set Console keybind to Numpad * - Done!
if %console%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000004a /f
if %console%==numminus ECHO Set Console keybind to Numpad - - Done!
if %console%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000004e /f
if %console%==numplus ECHO Set Console keybind to Numpad + - Done!
if %console%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000048 /f
if %console%==up ECHO Set Console keybind to Up Arrow - Done!
if %console%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x00000050 /f
if %console%==down ECHO Set Console keybind to Down Arrow - Done!
if %console%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000004b /f
if %console%==left ECHO Set Console keybind to Left Arrow - Done!
if %console%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Console" /t REG_DWORD /d 0x0000004d /f
if %console%==right ECHO Set Console keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:godhangar
ECHO                      --- Bind God Hangar ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p godhangar="Input a key and press Enter to bind it to Weapon: "
@echo off
if %godhangar%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000001e /f
if %godhangar%==a ECHO Set God Hangar keybind to A - Done!
if %godhangar%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000030 /f
if %godhangar%==b ECHO Set God Hangar keybind to B - Done!
if %godhangar%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000002e /f
if %godhangar%==c ECHO Set God Hangar keybind to C - Done!
if %godhangar%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000020 /f
if %godhangar%==d ECHO Set God Hangar keybind to D - Done!
if %godhangar%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000012 /f
if %godhangar%==e ECHO Set God Hangar keybind to E - Done!
if %godhangar%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000021 /f
if %godhangar%==f ECHO Set God Hangar keybind to F - Done!
if %godhangar%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000022 /f
if %godhangar%==g ECHO Set God Hangar keybind to G - Done!
if %godhangar%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000023 /f
if %godhangar%==h ECHO Set God Hangar keybind to H - Done!
if %godhangar%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000017 /f
if %godhangar%==i ECHO Set God Hangar keybind to I - Done!
if %godhangar%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000024 /f
if %godhangar%==j ECHO Set God Hangar keybind to J - Done!
if %godhangar%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000025 /f
if %godhangar%==k ECHO Set God Hangar keybind to K - Done!
if %godhangar%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000026 /f
if %godhangar%==l ECHO Set God Hangar keybind to L - Done!
if %godhangar%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000032 /f
if %godhangar%==m ECHO Set God Hangar keybind to M - Done!
if %godhangar%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000031 /f
if %godhangar%==n ECHO Set God Hangar keybind to N - Done!
if %godhangar%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000018 /f
if %godhangar%==o ECHO Set God Hangar keybind to O - Done!
if %godhangar%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000019 /f
if %godhangar%==p ECHO Set God Hangar keybind to P - Done!
if %godhangar%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000010 /f
if %godhangar%==q ECHO Set God Hangar keybind to Q - Done!
if %godhangar%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000013 /f
if %godhangar%==r ECHO Set God Hangar keybind to R - Done!
if %godhangar%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000001f /f
if %godhangar%==s ECHO Set God Hangar keybind to S - Done!
if %godhangar%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000014 /f
if %godhangar%==t ECHO Set God Hangar keybind to T - Done!
if %godhangar%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000016 /f
if %godhangar%==u ECHO Set God Hangar keybind to U - Done!
if %godhangar%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000002f /f
if %godhangar%==v ECHO Set God Hangar keybind to V - Done!
if %godhangar%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000011 /f
if %godhangar%==w ECHO Set God Hangar keybind to W - Done!
if %godhangar%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000002d /f
if %godhangar%==x ECHO Set God Hangar keybind to X - Done!
if %godhangar%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000015 /f
if %godhangar%==y ECHO Set God Hangar keybind to Y - Done!
if %godhangar%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000002c /f
if %godhangar%==z ECHO Set God Hangar keybind to Z - Done!
if %godhangar%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000029 /f
if %godhangar%==tilde ECHO Set God Hangar keybind to ~ - Done!
if %godhangar%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000000d /f
if %godhangar%==equal ECHO Set God Hangar keybind to = - Done!
if %godhangar%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000000c /f
if %godhangar%==minus ECHO Set God Hangar keybind to - - Done!
if %godhangar%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000001a /f
if %godhangar%==lbracket ECHO Set God Hangar keybind to [ - Done!
if %godhangar%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000001b /f
if %godhangar%==rbracket ECHO Set God Hangar keybind to ] - Done!
if %godhangar%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000035 /f
if %godhangar%==slash ECHO Set God Hangar keybind to / - Done!
if %godhangar%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000002b /f
if %godhangar%==bslash ECHO Set God Hangar keybind to \ - Done!
if %godhangar%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000027 /f
if %godhangar%==colon ECHO Set God Hangar keybind to ; - Done!
if %godhangar%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000028 /f
if %godhangar%==quote ECHO Set God Hangar keybind to ' - Done!
if %godhangar%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000033 /f
if %godhangar%==comma ECHO Set God Hangar keybind to , - Done!
if %godhangar%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000034 /f
if %godhangar%==period ECHO Set God Hangar keybind to . - Done!
if %godhangar%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000000e /f
if %godhangar%==bckspc ECHO Set God Hangar keybind to Backspace - Done!
if %godhangar%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000000f /f
if %godhangar%==tab ECHO Set God Hangar keybind to Tab - Done!
if %godhangar%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000001c /f
if %godhangar%==enter ECHO Set God Hangar keybind to Enter - Done!
if %godhangar%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000039 /f
if %godhangar%==space ECHO Set God Hangar keybind to Space Bar - Done!
if %godhangar%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000001 /f
if %godhangar%==esc ECHO Set God Hangar keybind to Escape - Done!
if %godhangar%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000052 /f
if %godhangar%==ins ECHO Set God Hangar keybind to Insert - Done!
if %godhangar%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000053 /f
if %godhangar%==del ECHO Set God Hangar keybind to Delete - Done!
if %godhangar%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000047 /f
if %godhangar%==home ECHO Set God Hangar keybind to Home - Done!
if %godhangar%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000004f /f
if %godhangar%==end ECHO Set God Hangar keybind to End - Done!
if %godhangar%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000049 /f
if %godhangar%==pgup ECHO Set God Hangar keybind to Page Up - Done!
if %godhangar%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000051 /f
if %godhangar%==pgdn ECHO Set God Hangar keybind to Page Down - Done!
if %godhangar%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000003b /f
if %godhangar%==f1 ECHO Set God Hangar keybind to F1 - Done!
if %godhangar%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000003c /f
if %godhangar%==f2 ECHO Set God Hangar keybind to F2 - Done!
if %godhangar%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000003d /f
if %godhangar%==f3 ECHO Set God Hangar keybind to F3 - Done!
if %godhangar%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000003e /f
if %godhangar%==f4 ECHO Set God Hangar keybind to F4 - Done!
if %godhangar%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000003f /f
if %godhangar%==f5 ECHO Set God Hangar keybind to F5 - Done!
if %godhangar%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000040 /f
if %godhangar%==f6 ECHO Set God Hangar keybind to F6 - Done!
if %godhangar%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000041 /f
if %godhangar%==f7 ECHO Set God Hangar keybind to F7 - Done!
if %godhangar%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000042 /f
if %godhangar%==f8 ECHO Set God Hangar keybind to F8 - Done!
if %godhangar%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000043 /f
if %godhangar%==f9 ECHO Set God Hangar keybind to F9 - Done!
if %godhangar%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000044 /f
if %godhangar%==f10 ECHO Set God Hangar keybind to F10 - Done!
if %godhangar%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000085 /f
if %godhangar%==f11 ECHO Set God Hangar keybind to F11 - Done!
if %godhangar%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000086 /f
if %godhangar%==f12 ECHO Set God Hangar keybind to F12 - Done!
if %godhangar%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000004f /f
if %godhangar%==num1 ECHO Set God Hangar keybind to Numpad 1 - Done!
if %godhangar%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000050 /f
if %godhangar%==num2 ECHO Set God Hangar keybind to Numpad 2 - Done!
if %godhangar%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000051 /f
if %godhangar%==num3 ECHO Set God Hangar keybind to Numpad 3 - Done!
if %godhangar%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000004b /f
if %godhangar%==num4 ECHO Set God Hangar keybind to Numpad 4 - Done!
if %godhangar%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000004c /f
if %godhangar%==num5 ECHO Set God Hangar keybind to Numpad 5 - Done!
if %godhangar%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000004d /f
if %godhangar%==num6 ECHO Set God Hangar keybind to Numpad 6 - Done!
if %godhangar%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000047 /f
if %godhangar%==num7 ECHO Set God Hangar keybind to Numpad 7 - Done!
if %godhangar%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000048 /f
if %godhangar%==num8 ECHO Set God Hangar keybind to Numpad 8 - Done!
if %godhangar%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000049 /f
if %godhangar%==num9 ECHO Set God Hangar keybind to Numpad 9 - Done!
if %godhangar%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000037 /f
if %godhangar%==numstar ECHO Set God Hangar keybind to Numpad * - Done!
if %godhangar%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000004a /f
if %godhangar%==numminus ECHO Set God Hangar keybind to Numpad - - Done!
if %godhangar%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000004e /f
if %godhangar%==numplus ECHO Set God Hangar keybind to Numpad + - Done!
if %godhangar%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000048 /f
if %godhangar%==up ECHO Set God Hangar keybind to Up Arrow - Done!
if %godhangar%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x00000050 /f
if %godhangar%==down ECHO Set God Hangar keybind to Down Arrow - Done!
if %godhangar%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000004b /f
if %godhangar%==left ECHO Set God Hangar keybind to Left Arrow - Done!
if %godhangar%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con God Hangar" /t REG_DWORD /d 0x0000004d /f
if %godhangar%==right ECHO Set God Hangar keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------
:netrankings
ECHO                      --- Bind Rankings (Network Only) ---
ECHO     ---- FOR SPECIAL CHARACTERS YOU MUST TYPE THEIR NAME ----
ECHO       ~^|^tilde   =^|^equal   -^|^minus   [^|^lbracket   ]^|^rbracket
ECHO   /^|^slash   \^|^bslash  ;^|^colon  '^|^quote   ,^|^comma   .^|^period
ECHO  ---------------------------------------------------------------
ECHO  bckspc  tab  enter  space  esc  ins  del  home  end  pgup  pgdn
ECHO  ---------------------------------------------------------------
ECHO   f1   f2   f3   f4   f5   f6    f7   f8   f9   f10   f11   f12
ECHO  ---------------------------------------------------------------
ECHO   num1   num2   num3   num4   num5    num6   num7   num8   num9
ECHO                  numstar   numminus   numplus
ECHO  ---------------------------------------------------------------
ECHO  Up Arrow^|^up  Down Arrow^|^down  Left Arrow^|^left  Right Arrow^|^right
ECHO  ---------------------------------------------------------------
set /p netrankings="Input a key and press Enter to bind it to Weapon: "
@echo off
if %netrankings%==a REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000001e /f
if %netrankings%==a ECHO Set Rankings (Network Only) keybind to A - Done!
if %netrankings%==b REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000030 /f
if %netrankings%==b ECHO Set Rankings (Network Only) keybind to B - Done!
if %netrankings%==c REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000002e /f
if %netrankings%==c ECHO Set Rankings (Network Only) keybind to C - Done!
if %netrankings%==d REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000020 /f
if %netrankings%==d ECHO Set Rankings (Network Only) keybind to D - Done!
if %netrankings%==e REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000012 /f
if %netrankings%==e ECHO Set Rankings (Network Only) keybind to E - Done!
if %netrankings%==f REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000021 /f
if %netrankings%==f ECHO Set Rankings (Network Only) keybind to F - Done!
if %netrankings%==g REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000022 /f
if %netrankings%==g ECHO Set Rankings (Network Only) keybind to G - Done!
if %netrankings%==h REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000023 /f
if %netrankings%==h ECHO Set Rankings (Network Only) keybind to H - Done!
if %netrankings%==i REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000017 /f
if %netrankings%==i ECHO Set Rankings (Network Only) keybind to I - Done!
if %netrankings%==j REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000024 /f
if %netrankings%==j ECHO Set Rankings (Network Only) keybind to J - Done!
if %netrankings%==k REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000025 /f
if %netrankings%==k ECHO Set Rankings (Network Only) keybind to K - Done!
if %netrankings%==l REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000026 /f
if %netrankings%==l ECHO Set Rankings (Network Only) keybind to L - Done!
if %netrankings%==m REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000032 /f
if %netrankings%==m ECHO Set Rankings (Network Only) keybind to M - Done!
if %netrankings%==n REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000031 /f
if %netrankings%==n ECHO Set Rankings (Network Only) keybind to N - Done!
if %netrankings%==o REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000018 /f
if %netrankings%==o ECHO Set Rankings (Network Only) keybind to O - Done!
if %netrankings%==p REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000019 /f
if %netrankings%==p ECHO Set Rankings (Network Only) keybind to P - Done!
if %netrankings%==q REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000010 /f
if %netrankings%==q ECHO Set Rankings (Network Only) keybind to Q - Done!
if %netrankings%==r REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000013 /f
if %netrankings%==r ECHO Set Rankings (Network Only) keybind to R - Done!
if %netrankings%==s REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000001f /f
if %netrankings%==s ECHO Set Rankings (Network Only) keybind to S - Done!
if %netrankings%==t REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000014 /f
if %netrankings%==t ECHO Set Rankings (Network Only) keybind to T - Done!
if %netrankings%==u REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000016 /f
if %netrankings%==u ECHO Set Rankings (Network Only) keybind to U - Done!
if %netrankings%==v REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000002f /f
if %netrankings%==v ECHO Set Rankings (Network Only) keybind to V - Done!
if %netrankings%==w REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000011 /f
if %netrankings%==w ECHO Set Rankings (Network Only) keybind to W - Done!
if %netrankings%==x REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000002d /f
if %netrankings%==x ECHO Set Rankings (Network Only) keybind to X - Done!
if %netrankings%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000015 /f
if %netrankings%==y ECHO Set Rankings (Network Only) keybind to Y - Done!
if %netrankings%==z REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000002c /f
if %netrankings%==z ECHO Set Rankings (Network Only) keybind to Z - Done!
if %netrankings%==tilde REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000029 /f
if %netrankings%==tilde ECHO Set Rankings (Network Only) keybind to ~ - Done!
if %netrankings%==equal REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000000d /f
if %netrankings%==equal ECHO Set Rankings (Network Only) keybind to = - Done!
if %netrankings%==minus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000000c /f
if %netrankings%==minus ECHO Set Rankings (Network Only) keybind to - - Done!
if %netrankings%==lbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000001a /f
if %netrankings%==lbracket ECHO Set Rankings (Network Only) keybind to [ - Done!
if %netrankings%==rbracket REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000001b /f
if %netrankings%==rbracket ECHO Set Rankings (Network Only) keybind to ] - Done!
if %netrankings%==slash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000035 /f
if %netrankings%==slash ECHO Set Rankings (Network Only) keybind to / - Done!
if %netrankings%==bslash REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000002b /f
if %netrankings%==bslash ECHO Set Rankings (Network Only) keybind to \ - Done!
if %netrankings%==colon REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000027 /f
if %netrankings%==colon ECHO Set Rankings (Network Only) keybind to ; - Done!
if %netrankings%==quote REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000028 /f
if %netrankings%==quote ECHO Set Rankings (Network Only) keybind to ' - Done!
if %netrankings%==comma REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000033 /f
if %netrankings%==comma ECHO Set Rankings (Network Only) keybind to , - Done!
if %netrankings%==period REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000034 /f
if %netrankings%==period ECHO Set Rankings (Network Only) keybind to . - Done!
if %netrankings%==bckspc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000000e /f
if %netrankings%==bckspc ECHO Set Rankings (Network Only) keybind to Backspace - Done!
if %netrankings%==tab REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000000f /f
if %netrankings%==tab ECHO Set Rankings (Network Only) keybind to Tab - Done!
if %netrankings%==enter REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000001c /f
if %netrankings%==enter ECHO Set Rankings (Network Only) keybind to Enter - Done!
if %netrankings%==space REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000039 /f
if %netrankings%==space ECHO Set Rankings (Network Only) keybind to Space Bar - Done!
if %netrankings%==esc REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000001 /f
if %netrankings%==esc ECHO Set Rankings (Network Only) keybind to Escape - Done!
if %netrankings%==ins REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000052 /f
if %netrankings%==ins ECHO Set Rankings (Network Only) keybind to Insert - Done!
if %netrankings%==del REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000053 /f
if %netrankings%==del ECHO Set Rankings (Network Only) keybind to Delete - Done!
if %netrankings%==home REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000047 /f
if %netrankings%==home ECHO Set Rankings (Network Only) keybind to Home - Done!
if %netrankings%==end REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000004f /f
if %netrankings%==end ECHO Set Rankings (Network Only) keybind to End - Done!
if %netrankings%==pgup REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000049 /f
if %netrankings%==pgup ECHO Set Rankings (Network Only) keybind to Page Up - Done!
if %netrankings%==pgdn REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000051 /f
if %netrankings%==pgdn ECHO Set Rankings (Network Only) keybind to Page Down - Done!
if %netrankings%==f1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000003b /f
if %netrankings%==f1 ECHO Set Rankings (Network Only) keybind to F1 - Done!
if %netrankings%==f2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000003c /f
if %netrankings%==f2 ECHO Set Rankings (Network Only) keybind to F2 - Done!
if %netrankings%==f3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000003d /f
if %netrankings%==f3 ECHO Set Rankings (Network Only) keybind to F3 - Done!
if %netrankings%==f4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000003e /f
if %netrankings%==f4 ECHO Set Rankings (Network Only) keybind to F4 - Done!
if %netrankings%==f5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000003f /f
if %netrankings%==f5 ECHO Set Rankings (Network Only) keybind to F5 - Done!
if %netrankings%==f6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000040 /f
if %netrankings%==f6 ECHO Set Rankings (Network Only) keybind to F6 - Done!
if %netrankings%==f7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000041 /f
if %netrankings%==f7 ECHO Set Rankings (Network Only) keybind to F7 - Done!
if %netrankings%==f8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000042 /f
if %netrankings%==f8 ECHO Set Rankings (Network Only) keybind to F8 - Done!
if %netrankings%==f9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000043 /f
if %netrankings%==f9 ECHO Set Rankings (Network Only) keybind to F9 - Done!
if %netrankings%==f10 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000044 /f
if %netrankings%==f10 ECHO Set Rankings (Network Only) keybind to F10 - Done!
if %netrankings%==f11 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000085 /f
if %netrankings%==f11 ECHO Set Rankings (Network Only) keybind to F11 - Done!
if %netrankings%==f12 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000086 /f
if %netrankings%==f12 ECHO Set Rankings (Network Only) keybind to F12 - Done!
if %netrankings%==num1 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000004f /f
if %netrankings%==num1 ECHO Set Rankings (Network Only) keybind to Numpad 1 - Done!
if %netrankings%==num2 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000050 /f
if %netrankings%==num2 ECHO Set Rankings (Network Only) keybind to Numpad 2 - Done!
if %netrankings%==num3 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000051 /f
if %netrankings%==num3 ECHO Set Rankings (Network Only) keybind to Numpad 3 - Done!
if %netrankings%==num4 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000004b /f
if %netrankings%==num4 ECHO Set Rankings (Network Only) keybind to Numpad 4 - Done!
if %netrankings%==num5 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000004c /f
if %netrankings%==num5 ECHO Set Rankings (Network Only) keybind to Numpad 5 - Done!
if %netrankings%==num6 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000004d /f
if %netrankings%==num6 ECHO Set Rankings (Network Only) keybind to Numpad 6 - Done!
if %netrankings%==num7 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000047 /f
if %netrankings%==num7 ECHO Set Rankings (Network Only) keybind to Numpad 7 - Done!
if %netrankings%==num8 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000048 /f
if %netrankings%==num8 ECHO Set Rankings (Network Only) keybind to Numpad 8 - Done!
if %netrankings%==num9 REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000049 /f
if %netrankings%==num9 ECHO Set Rankings (Network Only) keybind to Numpad 9 - Done!
if %netrankings%==numstar REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000037 /f
if %netrankings%==numstar ECHO Set Rankings (Network Only) keybind to Numpad * - Done!
if %netrankings%==numminus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000004a /f
if %netrankings%==numminus ECHO Set Rankings (Network Only) keybind to Numpad - - Done!
if %netrankings%==numplus REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000004e /f
if %netrankings%==numplus ECHO Set Rankings (Network Only) keybind to Numpad + - Done!
if %netrankings%==up REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000048 /f
if %netrankings%==up ECHO Set Rankings (Network Only) keybind to Up Arrow - Done!
if %netrankings%==down REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x00000050 /f
if %netrankings%==down ECHO Set Rankings (Network Only) keybind to Down Arrow - Done!
if %netrankings%==left REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000004b /f
if %netrankings%==left ECHO Set Rankings (Network Only) keybind to Left Arrow - Done!
if %netrankings%==right REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v "Con Rankings (Network Only)" /t REG_DWORD /d 0x0000004d /f
if %netrankings%==right ECHO Set Rankings (Network Only) keybind to Right Arrow - Done!
@echo off
timeout /t 2
goto rebindkeyboard
REM --------------------------------------------------------------------------

REM --------------------Debug/Other/Unknown Functions Menu-----------------------------------------------------------------

:dou_functions
cls
ECHO 			  --- Other Functions ---
ECHO 1.  Attract Mode When Idle (AI pilots will target you when idle)
ECHO 2.  Run Hardwar In The Background
ECHO 3.  Play Intro Video (Literally just plays the intro video)
ECHO --------------------------------------------------------------------------
ECHO 			  --- Debug Functions ---
ECHO 4.  Basic Log File
ECHO 5.  Developer's Info
ECHO 6.  Debug Keys (Press G to warp to God Hangar)
ECHO 7.  Debug Logging
ECHO --------------------------------------------------------------------------
ECHO 			  --- Unknown Functions ---
ECHO 8.  Debug (Presumably debug mode)
ECHO 9.  recordnone
ECHO 10. recordsave
ECHO 11. recordsavefast
ECHO 12. recordplay
ECHO 13. recordplaygrab24
ECHO 14. recordplaygrab12
ECHO 15. recordplayaudio
ECHO 16. Lobby (Presumably an unimplemented server lobby)
ECHO 17. Back to Main Menu
ECHO --------------------------------------------------------------------------
SET /P of=Type the number of your selection:
if %of%==1 goto attractmode
if %of%==2 goto runbackground
if %of%==3 goto introvid
if %of%==4 goto basiclog
if %of%==5 goto devinfo
if %of%==6 goto debugkeys
if %of%==7 goto debuglog
if %of%==8 goto debug
if %of%==9 goto recordnone
if %of%==10 goto recordsave
if %of%==11 goto recordsavefast
if %of%==12 goto recordplay
if %of%==13 goto recordplaygrab24
if %of%==14 goto recordplaygrab12
if %of%==15 goto recordplayaudio
if %of%==16 goto lobby
if %of%==17 goto main_menu
ECHO "%of%" is invalid, choose something on the list!
ECHO.
goto main_menu

REM --------------------Debug/Other/Unknown Functions Commands-------------------------------------------------------------

:attractmode
set /p am="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Attract /t REG_DWORD /d 0x0000000%am% /f
ECHO Set Attract Mode When Idle Value - Done!
@echo off
timeout /t 5
goto dou_functions
:runbackground
set /p rb="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Attract /t REG_DWORD /d 0x0000000%rb% /f
ECHO Set Run Hardwar In The Background Value - Done!
@echo off
timeout /t 5
goto dou_functions
:basiclog
set /p lf="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v LogFile /t REG_DWORD /d 0x0000000%lf% /f
ECHO Set Basic Log File Value - Done!
@echo off
timeout /t 5
goto dou_functions
:devinfo
set /p di="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v DebugSafe /t REG_DWORD /d 0x0000000%di% /f
ECHO Set Developer Info Value - Done!
@echo off
timeout /t 5
goto dou_functions
:debugkeys
set /p dk="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v DebugKeys /t REG_DWORD /d 0x0000000%dk% /f
ECHO Set Debug Keys (Press G to warp to God Hangar) Value - Done!
@echo off
timeout /t 5
goto dou_functions
:debuglog
set /p dl="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v GameDebugLog /t REG_DWORD /d 0x0000000%dl% /f
ECHO Set Debug Logging Value - Done!
@echo off
timeout /t 5
goto dou_functions
:introvid
start HardwarW.exe /t:video
goto end
:debug
start HardwarW.exe /debug
goto end
:recordnone
start HardwarW.exe /t:recordnone
goto end
:recordsave
start HardwarW.exe /t:recordsave
goto end
:recordsavefast
start HardwarW.exe /t:recordsavefast
goto end
:recordplay
start HardwarW.exe /t:recordplay
goto end
:recordplaygrab24
start HardwarW.exe /t:recordplaygrab24
goto end
:recordplaygrab12
start HardwarW.exe /t:recordplaygrab12
goto end
:recordplayaudio
start HardwarW.exe /t:recordplayaudio
goto end
:lobby
start HardwarW.exe /t:lobby
goto end


REM --------------------Resolution Switcher Menu-------------------------------------------------------------

:resolution_switcher
cls
ECHO 		--- Resolution Switcher ---
ECHO 1.  3840 x 2160
ECHO 2.  2560 x 1440
ECHO 3.  2048 x 1080
ECHO 4.  1920 x 1080
ECHO 5.  1680 x 1050
ECHO 6.  1600 x 1200
ECHO 7.  1600 x 900
ECHO 8.  1366 x 768
ECHO 9.  1360 x 768
ECHO 10. 1280 x 1024
ECHO 11. 1280 x 960
ECHO 12. 1280 x 800
ECHO 13. 1280 x 768
ECHO 14. 1280 x 720
ECHO 15. 1176 x 664
ECHO 16. 1152 x 864
ECHO 17. 1024 x 768
ECHO 18. 800 x 600
ECHO 19. 720 x 576
ECHO 20. 720 x 480
ECHO 21. 640 x 480
ECHO 22. Custom Resolution (High probability of crashes)
ECHO 23. Back to Main Menu
ECHO --------------------------------------------------------------------------
SET /P res=Type the number of your selection: 
if %res%==1 goto res1
if %res%==2 goto res2
if %res%==3 goto res3
if %res%==4 goto res4
if %res%==5 goto res5
if %res%==6 goto res6
if %res%==7 goto res7
if %res%==8 goto res8
if %res%==9 goto res9
if %res%==10 goto res10
if %res%==11 goto res11
if %res%==12 goto res12
if %res%==13 goto res13
if %res%==14 goto res14
if %res%==15 goto res15
if %res%==16 goto res16
if %res%==17 goto res17
if %res%==18 goto res18
if %res%==19 goto res19
if %res%==20 goto res20
if %res%==21 goto res21
if %res%==22 goto res22
if %res%==23 goto main_menu
ECHO "%res%" is invalid, choose something on the list!
ECHO.
goto main_menu

REM --------------------Resolution Switcher Commands------------------------------------------------------------------

:res1
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000F00 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000870 /f
ECHO Set 3840 x 2160 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res2
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000A00 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x000005A0 /f
ECHO Set 2560 x 1440 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res3
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x000005A0 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000438 /f
ECHO Set 2048 x 1080 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res4
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000780 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000438 /f
ECHO Set 1920 x 1080 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res5
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000690 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x0000041A /f
ECHO Set 1680 x 1050 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res6
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000640 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x000004B0 /f
ECHO Set 1600 x 1200 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res7
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000640 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000384 /f
ECHO Set 1600 x 900 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res8
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000556 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000300 /f
ECHO Set 1366 x 768 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res9
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000550 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000300 /f
ECHO Set 1360 x 768 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res10
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000500 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000400 /f
ECHO Set 1280 x 1024 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res11
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000500 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x000003C0 /f
ECHO Set 1280 x 960 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res12
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000500 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000320 /f
ECHO Set 1280 x 800 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res13
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000500 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000300 /f
ECHO Set 1280 x 768 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res14
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000500 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x000002D0 /f
ECHO Set 1280 x 720 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res15
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000498 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000298 /f
ECHO Set 1176 x 664 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res16
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000480 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000360 /f
ECHO Set 1152 x 864 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res17
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000400 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000300 /f
ECHO Set 1024 x 768 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res18
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000320 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000258 /f
ECHO Set 800 x 600 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res19
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x000002D0 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000240 /f
ECHO Set 720 x 576 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res20
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x000002D0 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x000001E0 /f
ECHO Set 720 x 480 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res21
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000280 /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x000001E0 /f
ECHO Set 640 x 480 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res22
ECHO    Use a Decimal to Hexadecimal converter to find these values
ECHO 	       Both values MUST be in 4-digit signed hex!
ECHO rapidtables.com/convert/number/decimal-to-hex.html is what I used
set /p RESX="Type your desired X resolution: "
set /p RESY="Type your desired Y resolution: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x0000%RESX% /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x0000%RESY% /f
ECHO Set Custom Resolution - Done! - Once again, don't be surprised if this crashes your game!
@echo off
timeout /t 10
goto resolution_switcher

REM --------------------Mods Menu-------------------------------------------------------------

:mods
cls
ECHO				       --- Mod Options ---
ECHO ----------------------------------------------------------------------------------------------
ECHO        If patches fail, run option 21 from the Main Menu, re-run the version you want to 
ECHO          patch from the version switcher, then come back here and run your patch again
ECHO ----------------------------------------------------------------------------------------------
ECHO             - All of these patches require the original, unmodified .exe's -
ECHO     - All versions except UIM.06 MUST be run from the version switcher before patching! -
ECHO --------------------------------Always Admin Patches------------------------------------------
ECHO		      -- Enables cheats using any username --
ECHO 1.  UIM.06     Always Admin			12.  UIM.06     Always Admin Removal
ECHO 2.  U3.00b1    Always Admin			13.  U3.00b1    Always Admin Removal
ECHO 3.  U3.00b2    Always Admin			14.  U3.00b2    Always Admin Removal
ECHO 4.  U3.00b3    Always Admin			15.  U3.00b3    Always Admin Removal
ECHO 5.  U3.00b4    Always Admin			16.  U3.00b4    Always Admin Removal
ECHO 6.  U3.00b5    Always Admin			17.  U3.00b5    Always Admin Removal
ECHO 7.  UIM.01     Always Admin			18.  UIM.01     Always Admin Removal
ECHO 8.  UIM.02.01  Always Admin			19.  UIM.02.01  Always Admin Removal
ECHO 9.  UIM.03     Always Admin			20.  UIM.03     Always Admin Removal
ECHO 10. UIM.04     Always Admin			21.  UIM.04     Always Admin Removal
ECHO 11. UIM.05     Always Admin			22.  UIM.05     Always Admin Removal
ECHO ----------------------------------------------------------------------------------------------
ECHO 				     - Cheats -
ECHO		   Open the System Console using the o key while playing the game
ECHO		      Type either command to blag (spawn) cash or blag a moth
ECHO ----------------------------------------------------------------------------------------------
ECHO					 blag cash,10000
ECHO					   blag moth,1
ECHO ----------------------------------------------------------------------------------------------
ECHO				      - Moth Blag Numbers -
ECHO	  1 = Moon Moth		  2 = Silver-Y		  3 = Neo Tiger		  4 = Hawk
ECHO	  5 = Death's Head	  6 = Police		  7 = Alien		  8 = Swallow
ECHO ----------------------------------------------------------------------------------------------
ECHO ----------------------------Spawn at God Hangar Patches---------------------------------------
ECHO 23.  Demo D1.6  Spawn at God Hangar		38.  Demo D1.6  Spawn at God Hangar Removal
REM 24.  F2.0       Spawn at God Hangar			39.  F2.0       Spawn at God Hangar Removal
REM 25.  F2.1       Spawn at God Hangar			40.  F2.1       Spawn at God Hangar Removal
REM 26.  U2.04      Spawn at God Hangar			41.  U2.04      Spawn at God Hangar Removal
REM 27.  U3.00b1    Spawn at God Hangar			42.  U3.00b1    Spawn at God Hangar Removal
REM 28.  U3.00b2    Spawn at God Hangar			43.  U3.00b2    Spawn at God Hangar Removal
REM 29.  U3.00b3    Spawn at God Hangar			44.  U3.00b3    Spawn at God Hangar Removal
REM 30.  U3.00b4    Spawn at God Hangar			45.  U3.00b4    Spawn at God Hangar Removal
REM 31.  U3.00b5    Spawn at God Hangar			46.  U3.00b5    Spawn at God Hangar Removal
REM 32.  UIM.01     Spawn at God Hangar			47.  UIM.01     Spawn at God Hangar Removal
REM 33.  UIM.02.01  Spawn at God Hangar			48.  UIM.02.01  Spawn at God Hangar Removal
REM 34.  UIM.03     Spawn at God Hangar			49.  UIM.03     Spawn at God Hangar Removal
REM 35.  UIM.04     Spawn at God Hangar			50.  UIM.04     Spawn at God Hangar Removal
REM 36.  UIM.05     Spawn at God Hangar			51.  UIM.05     Spawn at God Hangar Removal
ECHO 37.  UIM.06     Spawn at God Hangar		52.  UIM.06     Spawn at God Hangar Removal
ECHO ----------------------------------------------------------------------------------------------
ECHO 53.  Back to Main Menu
ECHO ----------------------------------------------------------------------------------------------
SET /P mod=Type the number of your selection: 
if %mod%==1 goto alwaysadmin
if %mod%==2 goto alwaysadminB31
if %mod%==3 goto alwaysadminB32
if %mod%==4 goto alwaysadminB33
if %mod%==5 goto alwaysadminB34
if %mod%==6 goto alwaysadminB35
if %mod%==7 goto alwaysadminUM1
if %mod%==8 goto alwaysadminU21
if %mod%==9 goto alwaysadminUM3
if %mod%==10 goto alwaysadminUM4
if %mod%==11 goto alwaysadminUM5
if %mod%==12 goto alwaysadminremoval
if %mod%==13 goto alwaysadminremovalB31
if %mod%==14 goto alwaysadminremovalB32
if %mod%==15 goto alwaysadminremovalB33
if %mod%==16 goto alwaysadminremovalB34
if %mod%==17 goto alwaysadminremovalB35
if %mod%==18 goto alwaysadminremovalUM1
if %mod%==19 goto alwaysadminremovalU21
if %mod%==20 goto alwaysadminremovalUM3
if %mod%==21 goto alwaysadminremovalUM4
if %mod%==22 goto alwaysadminremovalUM5
if %mod%==23 goto demogodhangarspawn
if %mod%==24 goto godhangarspawnF20
if %mod%==25 goto godhangarspawnF21
if %mod%==26 goto godhangarspawnU24
if %mod%==27 goto godhangarspawnB31
if %mod%==28 goto godhangarspawnB32
if %mod%==29 goto godhangarspawnB33
if %mod%==30 goto godhangarspawnB34
if %mod%==31 goto godhangarspawnB35
if %mod%==32 goto godhangarspawnUM1
if %mod%==33 goto godhangarspawnU21
if %mod%==34 goto godhangarspawnUM3
if %mod%==35 goto godhangarspawnUM4
if %mod%==36 goto godhangarspawnUM5
if %mod%==37 goto godhangarspawnUM6
if %mod%==38 goto demogodhangarspawnremoval
if %mod%==39 goto godhangarspawnremovalF20
if %mod%==40 goto godhangarspawnremovalF21
if %mod%==41 goto godhangarspawnremovalU24
if %mod%==42 goto godhangarspawnremovalB31
if %mod%==43 goto godhangarspawnremovalB32
if %mod%==44 goto godhangarspawnremovalB33
if %mod%==45 goto godhangarspawnremovalB34
if %mod%==46 goto godhangarspawnremovalB35
if %mod%==47 goto godhangarspawnremovalUM1
if %mod%==48 goto godhangarspawnremovalU21
if %mod%==49 goto godhangarspawnremovalUM3
if %mod%==50 goto godhangarspawnremovalUM4
if %mod%==51 goto godhangarspawnremovalUM5
if %mod%==52 goto godhangarspawnremovalUM6
if %mod%==53 goto main_menu


ECHO "%mod%" is invalid, choose something on the list!
goto main_menu

REM --------------------Mods Commands-------------------------------------------------------------

REM -----------------------------Always Admin------------------------------------------------------

:alwaysadmin
@echo off
set "currentDirectory=%cd%"
@echo off

del "%cd%"\HardwarW.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardwarWUIM06.exe "%cd%"\HardLaunch\EXE\Patches\Admin.xdelta "%cd%"\HardwarW.exe
ECHO Apply Always Admin patch to HardwarW.exe - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminremoval
@echo off
set "currentDirectory=%cd%"
@echo off
del "%cd%"\HardwarW.exe
copy "%cd%"\HardLaunch\EXE\Backups\HardwarWUIM06.exe "%cd%"\HardwarW.exe
ECHO Remove Always Admin patch from HardwarW.exe - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminB31
@echo off
set "currentDirectory=%cd%"
@echo off
copy "%cd%"\HardLaunch\VS\B31\HardWB31.exe "%cd%"\HardLaunch\EXE\Backups\HardWB31.exe
del "%cd%"\HardLaunch\VS\B31\HardWB31.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardWB31.exe "%cd%"\HardLaunch\VS\B31\Patches\Admin.xdelta "%cd%"\HardLaunch\VS\B31\HardWB31.exe
ECHO Apply Always Admin patch to HardWB31.exe (U3.00b1) - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminremovalB31
@echo off
set "currentDirectory=%cd%"
@echo off
del "%cd%"\HardLaunch\VS\B31\HardWB31.exe
copy "%cd%"\HardLaunch\EXE\Backups\HardWB31.exe "%cd%"\HardLaunch\VS\B31\HardWB31.exe
ECHO Remove Always Admin patch from HardWB31.exe - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminB32
@echo off
set "currentDirectory=%cd%"
@echo off
copy "%cd%"\HardLaunch\VS\B32\HardWB32.exe "%cd%"\HardLaunch\EXE\Backups\HardWB32.exe
del "%cd%"\HardLaunch\VS\B32\HardWB32.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardWB32.exe "%cd%"\HardLaunch\VS\B32\Patches\Admin.xdelta "%cd%"\HardLaunch\VS\B32\HardWB32.exe
ECHO Apply Always Admin patch to HardWB32.exe (U3.00b2) - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminremovalB32
@echo off
set "currentDirectory=%cd%"
@echo off
del "%cd%"\HardLaunch\VS\B32\HardWB32.exe
copy "%cd%"\HardLaunch\EXE\Backups\HardWB32.exe "%cd%"\HardLaunch\VS\B32\HardWB32.exe
ECHO Remove Always Admin patch from HardWB32.exe - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminB33
@echo off
set "currentDirectory=%cd%"
@echo off
copy "%cd%"\HardLaunch\VS\B33\HardWB33.exe "%cd%"\HardLaunch\EXE\Backups\HardWB33.exe
del "%cd%"\HardLaunch\VS\B33\HardWB33.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardWB33.exe "%cd%"\HardLaunch\VS\B33\Patches\Admin.xdelta "%cd%"\HardLaunch\VS\B33\HardWB33.exe
ECHO Apply Always Admin patch to HardWB33.exe (U3.00b3) - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminremovalB33
@echo off
set "currentDirectory=%cd%"
@echo off
del "%cd%"\HardLaunch\VS\B33\HardWB33.exe
copy "%cd%"\HardLaunch\EXE\Backups\HardWB33.exe "%cd%"\HardLaunch\VS\B33\HardWB33.exe
ECHO Remove Always Admin patch from HardWB33.exe - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminB34
@echo off
set "currentDirectory=%cd%"
@echo off
copy "%cd%"\HardLaunch\VS\B34\HardWB34.exe "%cd%"\HardLaunch\EXE\Backups\HardWB34.exe
del "%cd%"\HardLaunch\VS\B34\HardWB34.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardWB34.exe "%cd%"\HardLaunch\VS\B34\Patches\Admin.xdelta "%cd%"\HardLaunch\VS\B34\HardWB34.exe
ECHO Apply Always Admin patch to HardWB34.exe (U3.00b4) - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminremovalB34
@echo off
set "currentDirectory=%cd%"
@echo off
del "%cd%"\HardLaunch\VS\B34\HardWB34.exe
copy "%cd%"\HardLaunch\EXE\Backups\HardWB34.exe "%cd%"\HardLaunch\VS\B34\HardWB34.exe
ECHO Remove Always Admin patch from HardWB34.exe - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminB35
@echo off
set "currentDirectory=%cd%"
@echo off
copy "%cd%"\HardLaunch\VS\B35\HardWB35.exe "%cd%"\HardLaunch\EXE\Backups\HardWB35.exe
del "%cd%"\HardLaunch\VS\B35\HardWB35.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardWB35.exe "%cd%"\HardLaunch\VS\B35\Patches\Admin.xdelta "%cd%"\HardLaunch\VS\B35\HardWB35.exe
ECHO Apply Always Admin patch to HardWB35.exe (U3.00b5) - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminremovalB35
@echo off
set "currentDirectory=%cd%"
@echo off
del "%cd%"\HardLaunch\VS\B35\HardWB35.exe
copy "%cd%"\HardLaunch\EXE\Backups\HardWB35.exe "%cd%"\HardLaunch\VS\B35\HardWB35.exe
ECHO Remove Always Admin patch from HardWB35.exe - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminUM1
@echo off
set "currentDirectory=%cd%"
@echo off
copy "%cd%"\HardLaunch\VS\UM1\HardWUM1.exe "%cd%"\HardLaunch\EXE\Backups\HardWUM1.exe
del "%cd%"\HardLaunch\VS\UM1\HardWUM1.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardWUM1.exe "%cd%"\HardLaunch\VS\UM1\Patches\Admin.xdelta "%cd%"\HardLaunch\VS\UM1\HardWUM1.exe
ECHO Apply Always Admin patch to HardWUM1.exe (UIM.01) - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminremovalUM1
@echo off
set "currentDirectory=%cd%"
@echo off
del "%cd%"\HardLaunch\VS\UM1\HardWUM1.exe
copy "%cd%"\HardLaunch\EXE\Backups\HardWUM1.exe "%cd%"\HardLaunch\VS\UM1\HardWUM1.exe
ECHO Remove Always Admin patch from HardWUM1.exe - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminU21
@echo off
set "currentDirectory=%cd%"
@echo off
copy "%cd%"\HardLaunch\VS\U21\HardWU21.exe "%cd%"\HardLaunch\EXE\Backups\HardWU21.exe
del "%cd%"\HardLaunch\VS\U21\HardWU21.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardWU21.exe "%cd%"\HardLaunch\VS\U21\Patches\Admin.xdelta "%cd%"\HardLaunch\VS\U21\HardWU21.exe
ECHO Apply Always Admin patch to HardWU21.exe (UIM.02.01) - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminremovalU21
@echo off
set "currentDirectory=%cd%"
@echo off
del "%cd%"\HardLaunch\VS\U21\HardWU21.exe
copy "%cd%"\HardLaunch\EXE\Backups\HardWU21.exe "%cd%"\HardLaunch\VS\U21\HardWU21.exe
ECHO Remove Always Admin patch from HardWU21.exe - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminUM3
@echo off
set "currentDirectory=%cd%"
@echo off
copy "%cd%"\HardLaunch\VS\UM3\HardWUM3.exe "%cd%"\HardLaunch\EXE\Backups\HardWUM3.exe
del "%cd%"\HardLaunch\VS\UM3\HardWUM3.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardWUM3.exe "%cd%"\HardLaunch\VS\UM3\Patches\Admin.xdelta "%cd%"\HardLaunch\VS\UM3\HardWUM3.exe
ECHO Apply Always Admin patch to HardWUM3.exe (UIM.03) - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminremovalUM3
@echo off
set "currentDirectory=%cd%"
@echo off
del "%cd%"\HardLaunch\VS\UM3\HardWUM3.exe
copy "%cd%"\HardLaunch\EXE\Backups\HardWUM3.exe "%cd%"\HardLaunch\VS\UM3\HardWUM3.exe
ECHO Remove Always Admin patch from HardWUM3.exe - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminUM4
@echo off
set "currentDirectory=%cd%"
@echo off
copy "%cd%"\HardLaunch\VS\UM4\HardWUM4.exe "%cd%"\HardLaunch\EXE\Backups\HardWUM4.exe
del "%cd%"\HardLaunch\VS\UM4\HardWUM4.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardWUM4.exe "%cd%"\HardLaunch\VS\UM4\Patches\Admin.xdelta "%cd%"\HardLaunch\VS\UM4\HardWUM4.exe
ECHO Apply Always Admin patch to HardWUM4.exe (UIM.04) - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminremovalUM4
@echo off
set "currentDirectory=%cd%"
@echo off
del "%cd%"\HardLaunch\VS\UM4\HardWUM4.exe
copy "%cd%"\HardLaunch\EXE\Backups\HardWUM4.exe "%cd%"\HardLaunch\VS\UM4\HardWUM4.exe
ECHO Remove Always Admin patch from HardWUM4.exe - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminUM5
@echo off
set "currentDirectory=%cd%"
@echo off
copy "%cd%"\HardLaunch\VS\UM5\HardWUM5.exe "%cd%"\HardLaunch\EXE\Backups\HardWUM5.exe
del "%cd%"\HardLaunch\VS\UM5\HardWUM5.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardWUM5.exe "%cd%"\HardLaunch\VS\UM5\Patches\Admin.xdelta "%cd%"\HardLaunch\VS\UM5\HardWUM5.exe
ECHO Apply Always Admin patch to HardWUM5.exe (UIM.05) - Done!
@echo off
timeout /t 5
goto mods
:alwaysadminremovalUM5
@echo off
set "currentDirectory=%cd%"
@echo off
del "%cd%"\HardLaunch\VS\UM5\HardWUM5.exe
copy "%cd%"\HardLaunch\EXE\Backups\HardWUM5.exe "%cd%"\HardLaunch\VS\UM5\HardWUM5.exe
ECHO Remove Always Admin patch from HardWUM5.exe - Done!
@echo off
timeout /t 5
goto mods

REM -----------------------------God Hangar Spawn--------------------------------------------------

:demogodhangarspawn
@echo off
set "currentDirectory=%cd%"
@echo off
copy "%cd%"\HardLaunch\VS\Demo16\HardDemo.exe "%cd%"\HardLaunch\EXE\Backups\HardDemo.exe
del "%cd%"\HardLaunch\VS\Demo16\HardDemo.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardDemo.exe "%cd%"\HardLaunch\VS\Demo16\Patches\GodHangarSpawn.xdelta "%cd%"\HardLaunch\VS\Demo16\HardDemo.exe
ECHO Apply God Hangar Spawn patch to HardDemo.exe (Demo D1.6) - Done!
@echo off
timeout /t 5
goto mods
:demogodhangarspawnremoval
@echo off
set "currentDirectory=%cd%"
@echo off
del "%cd%"\HardLaunch\VS\Demo16\HardDemo.exe
copy "%cd%"\HardLaunch\EXE\Backups\HardDemo.exe "%cd%"\HardLaunch\VS\Demo16\HardDemo.exe
ECHO Remove God Hangar Spawn patch from HardDemo.exe (Demo D1.6) - Done!
@echo off
timeout /t 5
goto mods

:godhangarspawnUM6
@echo off
set "currentDirectory=%cd%"
@echo off
copy HardwarW.exe "%cd%"\HardLaunch\EXE\Backups\HardwarW.exe
del HardwarW.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardwarW.exe "%cd%"\HardLaunch\EXE\Patches\GodHangarSpawn.xdelta "%cd%"\HardwarW.exe
ECHO Apply God Hangar Spawn patch to HardwarW.exe (UIM.06) - Done!
@echo off
timeout /t 5
goto mods
:godhangarspawnremovalUM6
@echo off
set "currentDirectory=%cd%"
@echo off
del HardwarW.exe
copy "%cd%"\HardLaunch\EXE\Backups\HardwarW.exe "%cd%"\HardwarW.exe
ECHO Remove God Hangar Spawn patch from HardwarW.exe (UIM.06) - Done!
@echo off
timeout /t 5
goto mods
REM --------------------Moth Skin Swapper Menu-----------------------------------------------------

:moth_skin_swapper
cls
ECHO	         -- Make packs of moth skins in: Hardwar\Moth_Skins\Pack# --
ECHO ------------------------------------------------------------------------------------------
ECHO				        - Example -
ECHO	    Hardwar\Moth_Skins\Pack1\moth_death.bmp   (Death's Head Skin)
ECHO				     moth_hawk.bmp    (Hawk Skin)
ECHO				     moth_moon.bmp    (Moon Moth Skin)
ECHO				     moth_neo.bmp     (Neo Tiger Skin)
ECHO				     moth_police.bmp  (Police Moth Skin)
ECHO				     moth_silver.bmp  (Silver-Y Skin)
ECHO				     moth_swallow.bmp (Swallow Skin)
ECHO ------------------------------------------------------------------------------------------
ECHO -- Skins MUST be renamed to moth_death, moth_hawk, etc. or the skin packs will not work --
ECHO ------------------------------------------------------------------------------------------
ECHO				--- Moth Skin Swapper ---
ECHO 1.  Install Pack1  Skins			2.  Install Pack2  Skins
ECHO 3.  Install Pack3  Skins			4.  Install Pack4  Skins
ECHO 5.  Install Pack5  Skins			6.  Install Pack6  Skins
ECHO 7.  Install Pack7  Skins			8.  Install Pack8  Skins
ECHO 9.  Install Pack9  Skins			10. Install Pack10 Skins
ECHO 11. Install Pack11 Skins			12. Install Pack12 Skins
ECHO 13. Install Pack13 Skins			14. Install Pack14 Skins
ECHO 15. Install Pack15 Skins			16. Revert to Vanilla Skins
ECHO 17. Back to Main Menu
REM -----------------------------------------------------------------------------------------------
SET /P mss=Type the number of your selection: 
if %mss%==1 goto pack1
if %mss%==2 goto pack2
if %mss%==3 goto pack3
if %mss%==4 goto pack4
if %mss%==5 goto pack5
if %mss%==6 goto pack6
if %mss%==7 goto pack7
if %mss%==8 goto pack8
if %mss%==9 goto pack9
if %mss%==10 goto pack10
if %mss%==11 goto pack11
if %mss%==12 goto pack12
if %mss%==13 goto pack13
if %mss%==14 goto pack14
if %mss%==15 goto pack15
if %mss%==16 goto vanillaskins
if %mss%==17 goto main_menu

REM --------------------Moth Skin Swapper Commands-------------------------------------------------

:pack1
@echo off
set "currentDirectory=%cd%"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SkinDir /t REG_SZ /d "%cd%"\Moth_Skins\Pack1\ /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin0 /t REG_SZ /d "%cd%"\Moth_Skins\Pack1\moth_moon.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin1 /t REG_SZ /d "%cd%"\Moth_Skins\Pack1\moth_silver.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin2 /t REG_SZ /d "%cd%"\Moth_Skins\Pack1\moth_neo.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin3 /t REG_SZ /d "%cd%"\Moth_Skins\Pack1\moth_hawk.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin4 /t REG_SZ /d "%cd%"\Moth_Skins\Pack1\moth_death.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin5 /t REG_SZ /d "%cd%"\Moth_Skins\Pack1\moth_police.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin6 /t REG_SZ /d "%cd%"\Moth_Skins\Pack1\moth_swallow.bmp /f
ECHO Apply Pack1 Skins - Done!
@echo off
timeout /t 5
goto moth_skin_swapper
:pack2
@echo off
set "currentDirectory=%cd%"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SkinDir /t REG_SZ /d "%cd%"\Moth_Skins\Pack2\ /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin0 /t REG_SZ /d "%cd%"\Moth_Skins\Pack2\moth_moon.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin1 /t REG_SZ /d "%cd%"\Moth_Skins\Pack2\moth_silver.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin2 /t REG_SZ /d "%cd%"\Moth_Skins\Pack2\moth_neo.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin3 /t REG_SZ /d "%cd%"\Moth_Skins\Pack2\moth_hawk.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin4 /t REG_SZ /d "%cd%"\Moth_Skins\Pack2\moth_death.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin5 /t REG_SZ /d "%cd%"\Moth_Skins\Pack2\moth_police.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin6 /t REG_SZ /d "%cd%"\Moth_Skins\Pack2\moth_swallow.bmp /f
ECHO Apply Pack2 Skins - Done!
@echo off
timeout /t 5
goto moth_skin_swapper
:pack3
@echo off
set "currentDirectory=%cd%"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SkinDir /t REG_SZ /d "%cd%"\Moth_Skins\Pack3\ /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin0 /t REG_SZ /d "%cd%"\Moth_Skins\Pack3\moth_moon.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin1 /t REG_SZ /d "%cd%"\Moth_Skins\Pack3\moth_silver.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin2 /t REG_SZ /d "%cd%"\Moth_Skins\Pack3\moth_neo.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin3 /t REG_SZ /d "%cd%"\Moth_Skins\Pack3\moth_hawk.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin4 /t REG_SZ /d "%cd%"\Moth_Skins\Pack3\moth_death.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin5 /t REG_SZ /d "%cd%"\Moth_Skins\Pack3\moth_police.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin6 /t REG_SZ /d "%cd%"\Moth_Skins\Pack3\moth_swallow.bmp /f
ECHO Apply Pack3 Skins - Done!
@echo off
timeout /t 5
goto moth_skin_swapper
:pack4
@echo off
set "currentDirectory=%cd%"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SkinDir /t REG_SZ /d "%cd%"\Moth_Skins\Pack4\ /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin0 /t REG_SZ /d "%cd%"\Moth_Skins\Pack4\moth_moon.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin1 /t REG_SZ /d "%cd%"\Moth_Skins\Pack4\moth_silver.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin2 /t REG_SZ /d "%cd%"\Moth_Skins\Pack4\moth_neo.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin3 /t REG_SZ /d "%cd%"\Moth_Skins\Pack4\moth_hawk.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin4 /t REG_SZ /d "%cd%"\Moth_Skins\Pack4\moth_death.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin5 /t REG_SZ /d "%cd%"\Moth_Skins\Pack4\moth_police.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin6 /t REG_SZ /d "%cd%"\Moth_Skins\Pack4\moth_swallow.bmp /f
ECHO Apply Pack4 Skins - Done!
@echo off
timeout /t 5
goto moth_skin_swapper
:pack5
@echo off
set "currentDirectory=%cd%"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SkinDir /t REG_SZ /d "%cd%"\Moth_Skins\Pack5\ /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin0 /t REG_SZ /d "%cd%"\Moth_Skins\Pack5\moth_moon.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin1 /t REG_SZ /d "%cd%"\Moth_Skins\Pack5\moth_silver.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin2 /t REG_SZ /d "%cd%"\Moth_Skins\Pack5\moth_neo.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin3 /t REG_SZ /d "%cd%"\Moth_Skins\Pack5\moth_hawk.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin4 /t REG_SZ /d "%cd%"\Moth_Skins\Pack5\moth_death.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin5 /t REG_SZ /d "%cd%"\Moth_Skins\Pack5\moth_police.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin6 /t REG_SZ /d "%cd%"\Moth_Skins\Pack5\moth_swallow.bmp /f
ECHO Apply Pack5 Skins - Done!
@echo off
timeout /t 5
goto moth_skin_swapper
:pack6
@echo off
set "currentDirectory=%cd%"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SkinDir /t REG_SZ /d "%cd%"\Moth_Skins\Pack6\ /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin0 /t REG_SZ /d "%cd%"\Moth_Skins\Pack6\moth_moon.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin1 /t REG_SZ /d "%cd%"\Moth_Skins\Pack6\moth_silver.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin2 /t REG_SZ /d "%cd%"\Moth_Skins\Pack6\moth_neo.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin3 /t REG_SZ /d "%cd%"\Moth_Skins\Pack6\moth_hawk.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin4 /t REG_SZ /d "%cd%"\Moth_Skins\Pack6\moth_death.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin5 /t REG_SZ /d "%cd%"\Moth_Skins\Pack6\moth_police.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin6 /t REG_SZ /d "%cd%"\Moth_Skins\Pack6\moth_swallow.bmp /f
ECHO Apply Pack6 Skins - Done!
@echo off
timeout /t 5
goto moth_skin_swapper
:pack7
@echo off
set "currentDirectory=%cd%"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SkinDir /t REG_SZ /d "%cd%"\Moth_Skins\Pack7\ /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin0 /t REG_SZ /d "%cd%"\Moth_Skins\Pack7\moth_moon.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin1 /t REG_SZ /d "%cd%"\Moth_Skins\Pack7\moth_silver.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin2 /t REG_SZ /d "%cd%"\Moth_Skins\Pack7\moth_neo.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin3 /t REG_SZ /d "%cd%"\Moth_Skins\Pack7\moth_hawk.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin4 /t REG_SZ /d "%cd%"\Moth_Skins\Pack7\moth_death.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin5 /t REG_SZ /d "%cd%"\Moth_Skins\Pack7\moth_police.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin6 /t REG_SZ /d "%cd%"\Moth_Skins\Pack7\moth_swallow.bmp /f
ECHO Apply Pack7 Skins - Done!
@echo off
timeout /t 5
goto moth_skin_swapper
:pack8
@echo off
set "currentDirectory=%cd%"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SkinDir /t REG_SZ /d "%cd%"\Moth_Skins\Pack8\ /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin0 /t REG_SZ /d "%cd%"\Moth_Skins\Pack8\moth_moon.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin1 /t REG_SZ /d "%cd%"\Moth_Skins\Pack8\moth_silver.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin2 /t REG_SZ /d "%cd%"\Moth_Skins\Pack8\moth_neo.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin3 /t REG_SZ /d "%cd%"\Moth_Skins\Pack8\moth_hawk.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin4 /t REG_SZ /d "%cd%"\Moth_Skins\Pack8\moth_death.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin5 /t REG_SZ /d "%cd%"\Moth_Skins\Pack8\moth_police.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin6 /t REG_SZ /d "%cd%"\Moth_Skins\Pack8\moth_swallow.bmp /f
ECHO Apply Pack8 Skins - Done!
@echo off
timeout /t 5
goto moth_skin_swapper
:pack9
@echo off
set "currentDirectory=%cd%"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SkinDir /t REG_SZ /d "%cd%"\Moth_Skins\Pack9\ /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin0 /t REG_SZ /d "%cd%"\Moth_Skins\Pack9\moth_moon.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin1 /t REG_SZ /d "%cd%"\Moth_Skins\Pack9\moth_silver.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin2 /t REG_SZ /d "%cd%"\Moth_Skins\Pack9\moth_neo.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin3 /t REG_SZ /d "%cd%"\Moth_Skins\Pack9\moth_hawk.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin4 /t REG_SZ /d "%cd%"\Moth_Skins\Pack9\moth_death.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin5 /t REG_SZ /d "%cd%"\Moth_Skins\Pack9\moth_police.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin6 /t REG_SZ /d "%cd%"\Moth_Skins\Pack9\moth_swallow.bmp /f
ECHO Apply Pack9 Skins - Done!
@echo off
timeout /t 5
goto moth_skin_swapper
:pack10
@echo off
set "currentDirectory=%cd%"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SkinDir /t REG_SZ /d "%cd%"\Moth_Skins\Pack10\ /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin0 /t REG_SZ /d "%cd%"\Moth_Skins\Pack10\moth_moon.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin1 /t REG_SZ /d "%cd%"\Moth_Skins\Pack10\moth_silver.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin2 /t REG_SZ /d "%cd%"\Moth_Skins\Pack10\moth_neo.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin3 /t REG_SZ /d "%cd%"\Moth_Skins\Pack10\moth_hawk.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin4 /t REG_SZ /d "%cd%"\Moth_Skins\Pack10\moth_death.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin5 /t REG_SZ /d "%cd%"\Moth_Skins\Pack10\moth_police.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin6 /t REG_SZ /d "%cd%"\Moth_Skins\Pack10\moth_swallow.bmp /f
ECHO Apply Pack10 Skins - Done!
@echo off
timeout /t 5
goto moth_skin_swapper
:pack11
@echo off
set "currentDirectory=%cd%"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SkinDir /t REG_SZ /d "%cd%"\Moth_Skins\Pack11\ /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin0 /t REG_SZ /d "%cd%"\Moth_Skins\Pack11\moth_moon.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin1 /t REG_SZ /d "%cd%"\Moth_Skins\Pack11\moth_silver.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin2 /t REG_SZ /d "%cd%"\Moth_Skins\Pack11\moth_neo.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin3 /t REG_SZ /d "%cd%"\Moth_Skins\Pack11\moth_hawk.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin4 /t REG_SZ /d "%cd%"\Moth_Skins\Pack11\moth_death.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin5 /t REG_SZ /d "%cd%"\Moth_Skins\Pack11\moth_police.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin6 /t REG_SZ /d "%cd%"\Moth_Skins\Pack11\moth_swallow.bmp /f
ECHO Apply Pack11 Skins - Done!
@echo off
timeout /t 5
goto moth_skin_swapper
:pack12
@echo off
set "currentDirectory=%cd%"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SkinDir /t REG_SZ /d "%cd%"\Moth_Skins\Pack12\ /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin0 /t REG_SZ /d "%cd%"\Moth_Skins\Pack12\moth_moon.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin1 /t REG_SZ /d "%cd%"\Moth_Skins\Pack12\moth_silver.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin2 /t REG_SZ /d "%cd%"\Moth_Skins\Pack12\moth_neo.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin3 /t REG_SZ /d "%cd%"\Moth_Skins\Pack12\moth_hawk.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin4 /t REG_SZ /d "%cd%"\Moth_Skins\Pack12\moth_death.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin5 /t REG_SZ /d "%cd%"\Moth_Skins\Pack12\moth_police.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin6 /t REG_SZ /d "%cd%"\Moth_Skins\Pack12\moth_swallow.bmp /f
ECHO Apply Pack12 Skins - Done!
@echo off
timeout /t 5
goto moth_skin_swapper
:pack13
@echo off
set "currentDirectory=%cd%"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SkinDir /t REG_SZ /d "%cd%"\Moth_Skins\Pack13\ /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin0 /t REG_SZ /d "%cd%"\Moth_Skins\Pack13\moth_moon.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin1 /t REG_SZ /d "%cd%"\Moth_Skins\Pack13\moth_silver.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin2 /t REG_SZ /d "%cd%"\Moth_Skins\Pack13\moth_neo.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin3 /t REG_SZ /d "%cd%"\Moth_Skins\Pack13\moth_hawk.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin4 /t REG_SZ /d "%cd%"\Moth_Skins\Pack13\moth_death.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin5 /t REG_SZ /d "%cd%"\Moth_Skins\Pack13\moth_police.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin6 /t REG_SZ /d "%cd%"\Moth_Skins\Pack13\moth_swallow.bmp /f
ECHO Apply Pack13 Skins - Done!
@echo off
timeout /t 5
goto moth_skin_swapper
:pack14
@echo off
set "currentDirectory=%cd%"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SkinDir /t REG_SZ /d "%cd%"\Moth_Skins\Pack14\ /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin0 /t REG_SZ /d "%cd%"\Moth_Skins\Pack14\moth_moon.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin1 /t REG_SZ /d "%cd%"\Moth_Skins\Pack14\moth_silver.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin2 /t REG_SZ /d "%cd%"\Moth_Skins\Pack14\moth_neo.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin3 /t REG_SZ /d "%cd%"\Moth_Skins\Pack14\moth_hawk.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin4 /t REG_SZ /d "%cd%"\Moth_Skins\Pack14\moth_death.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin5 /t REG_SZ /d "%cd%"\Moth_Skins\Pack14\moth_police.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin6 /t REG_SZ /d "%cd%"\Moth_Skins\Pack14\moth_swallow.bmp /f
ECHO Apply Pack14 Skins - Done!
@echo off
timeout /t 5
goto moth_skin_swapper
:pack15
@echo off
set "currentDirectory=%cd%"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SkinDir /t REG_SZ /d "%cd%"\Moth_Skins\Pack15\ /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin0 /t REG_SZ /d "%cd%"\Moth_Skins\Pack15\moth_moon.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin1 /t REG_SZ /d "%cd%"\Moth_Skins\Pack15\moth_silver.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin2 /t REG_SZ /d "%cd%"\Moth_Skins\Pack15\moth_neo.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin3 /t REG_SZ /d "%cd%"\Moth_Skins\Pack15\moth_hawk.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin4 /t REG_SZ /d "%cd%"\Moth_Skins\Pack15\moth_death.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin5 /t REG_SZ /d "%cd%"\Moth_Skins\Pack15\moth_police.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin6 /t REG_SZ /d "%cd%"\Moth_Skins\Pack15\moth_swallow.bmp /f
ECHO Apply Pack15 Skins - Done!
@echo off
timeout /t 5
goto moth_skin_swapper
:vanillaskins
@echo off
set "currentDirectory=%cd%"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SkinDir /t REG_SZ /d "%cd%"\Moth_Skins\Vanilla\ /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin0 /t REG_SZ /d "%cd%"\Moth_Skins\Vanilla\moth_moon.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin1 /t REG_SZ /d "%cd%"\Moth_Skins\Vanilla\moth_silver.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin2 /t REG_SZ /d "%cd%"\Moth_Skins\Vanilla\moth_neo.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin3 /t REG_SZ /d "%cd%"\Moth_Skins\Vanilla\moth_hawk.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin4 /t REG_SZ /d "%cd%"\Moth_Skins\Vanilla\moth_death.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin5 /t REG_SZ /d "%cd%"\Moth_Skins\Vanilla\moth_police.bmp /f
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin6 /t REG_SZ /d "%cd%"\Moth_Skins\Vanilla\moth_swallow.bmp /f
ECHO Apply Default Skins - Done!
@echo off
timeout /t 5
goto moth_skin_swapper

REM --------------------Version Switcher Menu------------------------------------------------------

:version_switcher
cls
ECHO				      --- Version Switcher ---
ECHO             - If any version fails to launch, run option 21 from the Main Menu -
ECHO - Launch failure would be due to a CRC mismatch on HardwarW.exe, Hardman.exe, or a .res file -
ECHO ----------------------------------------------------------------------------------------------
ECHO  - All of these versions REQUIRE the original, unmodified Hardwar UIM.06 exe and res files -
ECHO ----------------------------------------------------------------------------------------------
ECHO 1.  Run Hardwar Demo - ver. D1.6
ECHO 2.  Run Hardwar - ver. F2.0
ECHO 3.  Run Hardwar - ver. F2.1
ECHO 4.  Run Hardwar - ver. U2.04
ECHO 5.  Run Hardwar - ver. U3.00b1
ECHO 6.  Run Hardwar - ver. U3.00b2
ECHO 7.  Run Hardwar - ver. U3.00b3
ECHO 8.  Run Hardwar - ver. U3.00b4
ECHO 9.  Run Hardwar - ver. U3.00b5
ECHO --------------------------------------------------
ECHO 10. Run Hardwar - ver. UIM.01
ECHO 11. Run Hardwar - ver. UIM.02 - Lost to time...
ECHO 12. Run Hardwar - ver. UIM.02.01
ECHO 13. Run Hardwar - ver. UIM.03
ECHO 14. Run Hardwar - ver. UIM.04
ECHO 15. Run Hardwar - ver. UIM.05
ECHO ----------------------------------------------------------------------------------------------
ECHO 16. Back to Main Menu
ECHO -----------------------------------------------------------------------------------------------
SET /P vs=Type the number of your selection: 
if %vs%==1 goto demo16
if %vs%==2 goto f20
if %vs%==3 goto f21
if %vs%==4 goto u24
if %vs%==5 goto b31
if %vs%==6 goto b32
if %vs%==7 goto b33
if %vs%==8 goto b34
if %vs%==9 goto b35
if %vs%==10 goto um1
if %vs%==11 goto um2
if %vs%==12 goto u21
if %vs%==13 goto um3
if %vs%==14 goto um4
if %vs%==15 goto um5
if %vs%==16 goto main_menu
ECHO "%vs%" is invalid, choose something on the list!
goto main_menu

REM --------------------Version Switcher Commands--------------------------------------------------

:demo16
@echo off
set "currentDirectory=%cd%"
@echo off
regedit /s "%~dp0\HardLaunch\VS\Demo16\harddem.reg"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HardDem\Config /v DataPath /t REG_SZ /d "%cd%"\HardLaunch\VS\Demo16\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HardDem\Config /v DataPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\Demo16\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HardDem\Config /v GDVPath /t REG_SZ /d "%cd%"\HardLaunch\VS\Demo16\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HardDem\Config /v GDVPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\Demo16\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HardDem\Config /v GDVPath3 /t REG_SZ /d "%cd%"\HardLaunch\VS\Demo16\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HardDem\Config /v RunPath /t REG_SZ /d "%cd%"\HardLaunch\VS\Demo16\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HardDem\Config /v SavePath /t REG_SZ /d "%cd%"\HardLaunch\VS\Demo16\Savegames\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HardDem\Config /v SourcePath /t REG_SZ /d "%cd%"\HardLaunch\VS\Demo16\ /f
@echo off
copy "%cd%"\HardLaunch\RES\Backups\HardwarUIM06.res "%cd%"\HardLaunch\VS\Demo16\Harddem.res
copy "%cd%"\HardLaunch\#Dependencies\dgVoodooCpl.exe "%cd%"\HardLaunch\VS\Demo16\dgVoodooCpl.exe
copy "%cd%"\HardLaunch\#Dependencies\dgVoodoo.conf "%cd%"\HardLaunch\VS\Demo16\dgVoodoo.conf
copy "%cd%"\HardLaunch\#Dependencies\DDraw.dll "%cd%"\HardLaunch\VS\Demo16\DDraw.dll
copy "%cd%"\HardLaunch\#Dependencies\D3DImm.dll "%cd%"\HardLaunch\VS\Demo16\D3DImm.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D9.dll "%cd%"\HardLaunch\VS\Demo16\D3D9.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D8.dll "%cd%"\HardLaunch\VS\Demo16\D3D8.dll
copy DSetup.DLL "%cd%"\HardLaunch\VS\Demo16\DSetup.DLL
cd /D "%cd%"\HardLaunch\VS\Demo16 && HardLaunchDemo.bat
@echo off
goto end

:f20
@echo off
set "currentDirectory=%cd%"
@echo off
regedit /s "%~dp0\HardLaunch\VS\F20\f20.reg"
@echo off
mklink /d "%~dp0\HardLaunch\VS\F20\GDV" "~dp0\GDV"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF20\Config /v DataPath /t REG_SZ /d "%cd%"\HardLaunch\VS\F20\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF20\Config /v DataPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\F20\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF20\Config /v GDVPath /t REG_SZ /d "%cd%"\HardLaunch\VS\F20\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF20\Config /v GDVPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\F20\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF20\Config /v GDVPath3 /t REG_SZ /d "%cd%"\HardLaunch\VS\F20\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF20\Config /v RunPath /t REG_SZ /d "%cd%"\HardLaunch\VS\F20\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF20\Config /v SavePath /t REG_SZ /d "%cd%"\HardLaunch\VS\F20\Savegames\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF20\Config /v SourcePath /t REG_SZ /d "%cd%"\HardLaunch\VS\F20\ /f
@echo off
copy "%cd%"\DATA\Hardwar.res "%cd%"\HardLaunch\VS\F20\HardF20.res
@echo off
set "currentDirectory=%cd%"
@echo off
copy "%cd%"\HardLaunch\RES\Backups\HardwarUIM06.res "%cd%"\HardLaunch\VS\F20\HardF20.res
copy "%cd%"\HardLaunch\#Dependencies\dgVoodooCpl.exe "%cd%"\HardLaunch\VS\F20\dgVoodooCpl.exe
copy "%cd%"\HardLaunch\#Dependencies\dgVoodoo.conf "%cd%"\HardLaunch\VS\F20\dgVoodoo.conf
copy "%cd%"\HardLaunch\#Dependencies\DDraw.dll "%cd%"\HardLaunch\VS\F20\DDraw.dll
copy "%cd%"\HardLaunch\#Dependencies\D3DImm.dll "%cd%"\HardLaunch\VS\F20\D3DImm.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D9.dll "%cd%"\HardLaunch\VS\F20\D3D9.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D8.dll "%cd%"\HardLaunch\VS\F20\D3D8.dll
copy DSetup.DLL "%cd%"\HardLaunch\VS\F20\DSetup.DLL
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardwarWUIM06.exe "%cd%"\HardLaunch\VS\F20\Patches\HWW_UIM06toF20.xdelta "%cd%"\HardLaunch\VS\F20\HardWF20.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardmanUIM06.exe "%cd%"\HardLaunch\VS\F20\Patches\HMAN_UIM06toF20.xdelta "%cd%"\HardLaunch\VS\F20\HmanF20.exe
@echo off
cd /D "%cd%"\HardLaunch\VS\F20 && HardLaunchF20.bat
@echo off
goto end

:f21
@echo off
set "currentDirectory=%cd%"
@echo off
regedit /s "%~dp0\HardLaunch\VS\f21\f21.reg"
@echo off
mklink /d "%cd%"\HardLaunch\VS\F21\GDV\ "%cd%"\GDV\
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF21\Config /v DataPath /t REG_SZ /d "%cd%"\HardLaunch\VS\F21\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF21\Config /v DataPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\F21\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF21\Config /v GDVPath /t REG_SZ /d "%cd%"\HardLaunch\VS\F21\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF21\Config /v GDVPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\F21\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF21\Config /v GDVPath3 /t REG_SZ /d "%cd%"\HardLaunch\VS\F21\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF21\Config /v RunPath /t REG_SZ /d "%cd%"\HardLaunch\VS\F21\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF21\Config /v SavePath /t REG_SZ /d "%cd%"\HardLaunch\VS\F21\Savegames\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF21\Config /v SourcePath /t REG_SZ /d "%cd%"\HardLaunch\VS\F21\ /f
@echo off
copy "%cd%"\DATA\Hardwar.res "%cd%"\HardLaunch\VS\F21\HardF21.res
@echo off
set "currentDirectory=%cd%"
@echo off
copy "%cd%"\HardLaunch\RES\Backups\HardwarUIM06.res "%cd%"\HardLaunch\VS\F21\HardF21.res
copy "%cd%"\HardLaunch\#Dependencies\dgVoodooCpl.exe "%cd%"\HardLaunch\VS\F21\dgVoodooCpl.exe
copy "%cd%"\HardLaunch\#Dependencies\dgVoodoo.conf "%cd%"\HardLaunch\VS\F21\dgVoodoo.conf
copy "%cd%"\HardLaunch\#Dependencies\DDraw.dll "%cd%"\HardLaunch\VS\F21\DDraw.dll
copy "%cd%"\HardLaunch\#Dependencies\D3DImm.dll "%cd%"\HardLaunch\VS\F21\D3DImm.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D9.dll "%cd%"\HardLaunch\VS\F21\D3D9.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D8.dll "%cd%"\HardLaunch\VS\F21\D3D8.dll
copy DSetup.DLL "%cd%"\HardLaunch\VS\F21\DSetup.DLL
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardwarWUIM06.exe "%cd%"\HardLaunch\VS\F21\Patches\HWW_UIM06toF21.xdelta "%cd%"\HardLaunch\VS\F21\HardWF21.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardmanUIM06.exe "%cd%"\HardLaunch\VS\F21\Patches\HMAN_UIM06toF21.xdelta "%cd%"\HardLaunch\VS\F21\HmanF21.exe
@echo off
cd /D "%cd%"\HardLaunch\VS\F21 && HardLaunchF21.bat
@echo off
goto end

:u24
@echo off
set "currentDirectory=%cd%"
@echo off
regedit /s "%~dp0\HardLaunch\VS\U24\u24.reg"
@echo off
mklink /d "%cd%"\HardLaunch\VS\U24\GDV\ "%cd%"\GDV\
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU24\Config /v DataPath /t REG_SZ /d "%cd%"\HardLaunch\VS\U24\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU24\Config /v DataPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\U24\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU24\Config /v GDVPath /t REG_SZ /d "%cd%"\HardLaunch\VS\U24\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU24\Config /v GDVPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\U24\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU24\Config /v GDVPath3 /t REG_SZ /d "%cd%"\HardLaunch\VS\U24\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU24\Config /v RunPath /t REG_SZ /d "%cd%"\HardLaunch\VS\U24\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU24\Config /v SavePath /t REG_SZ /d "%cd%"\HardLaunch\VS\U24\Savegames\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU24\Config /v SourcePath /t REG_SZ /d "%cd%"\HardLaunch\VS\U24\ /f
@echo off
copy "%cd%"\DATA\Hardwar.res "%cd%"\HardLaunch\VS\U24\HardU24.res
@echo off
set "currentDirectory=%cd%"
@echo off
copy "%cd%"\HardLaunch\RES\Backups\HardwarUIM06.res "%cd%"\HardLaunch\VS\U24\HardU24.res
copy "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res
copy "%cd%"\HardLaunch\#Dependencies\dgVoodooCpl.exe "%cd%"\HardLaunch\VS\U24\dgVoodooCpl.exe
copy "%cd%"\HardLaunch\#Dependencies\dgVoodoo.conf "%cd%"\HardLaunch\VS\U24\dgVoodoo.conf
copy "%cd%"\HardLaunch\#Dependencies\DDraw.dll "%cd%"\HardLaunch\VS\U24\DDraw.dll
copy "%cd%"\HardLaunch\#Dependencies\D3DImm.dll "%cd%"\HardLaunch\VS\U24\D3DImm.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D9.dll "%cd%"\HardLaunch\VS\U24\D3D9.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D8.dll "%cd%"\HardLaunch\VS\U24\D3D8.dll
copy DSetup.DLL "%cd%"\HardLaunch\VS\U24\DSetup.DLL
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardwarWUIM06.exe "%cd%"\HardLaunch\VS\U24\Patches\HWW_UIM06toU24.xdelta "%cd%"\HardLaunch\VS\U24\HardWU24.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardmanUIM06.exe "%cd%"\HardLaunch\VS\U24\Patches\HMAN_UIM06toU24.xdelta "%cd%"\HardLaunch\VS\U24\HmanU24.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res "%cd%"\HardLaunch\VS\U24\Patches\HUP_UIM06toU24.xdelta "%cd%"\HardLaunch\VS\U24\HupU24.res
@echo off
cd /D "%cd%"\HardLaunch\VS\U24 && HardLaunchU24.bat
@echo off
goto end

:b31
@echo off
set "currentDirectory=%cd%"
@echo off
regedit /s "%~dp0\HardLaunch\VS\B31\B31.reg"
@echo off
mklink /d "%cd%"\HardLaunch\VS\B31\GDV\ "%cd%"\GDV\
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB31\Config /v Skin0 /t REG_SZ /d "%cd%"\HardLaunch\VS\B31\Moth_Skins\moth_moon.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB31\Config /v Skin1 /t REG_SZ /d "%cd%"\HardLaunch\VS\B31\Moth_Skins\moth_silver.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB31\Config /v Skin2 /t REG_SZ /d "%cd%"\HardLaunch\VS\B31\Moth_Skins\moth_neo.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB31\Config /v Skin3 /t REG_SZ /d "%cd%"\HardLaunch\VS\B31\Moth_Skins\moth_hawk.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB31\Config /v Skin4 /t REG_SZ /d "%cd%"\HardLaunch\VS\B31\Moth_Skins\moth_death.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB31\Config /v Skin5 /t REG_SZ /d "%cd%"\HardLaunch\VS\B31\Moth_Skins\moth_police.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB31\Config /v Skin6 /t REG_SZ /d "%cd%"\HardLaunch\VS\B31\Moth_Skins\moth_swallow.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB31\Config /v SkinsOn /t REG_DWORD /d 0x00000000 /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB31\Config /v SkinDir /t REG_SZ /d "%cd%"\HardLaunch\VS\B31\Moth_Skins\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB31\Config /v DataPath /t REG_SZ /d "%cd%"\HardLaunch\VS\B31\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB31\Config /v DataPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\B31\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB31\Config /v GDVPath /t REG_SZ /d "%cd%"\HardLaunch\VS\B31\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB31\Config /v GDVPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\B31\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB31\Config /v GDVPath3 /t REG_SZ /d "%cd%"\HardLaunch\VS\B31\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB31\Config /v RunPath /t REG_SZ /d "%cd%"\HardLaunch\VS\B31\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB31\Config /v SavePath /t REG_SZ /d "%cd%"\HardLaunch\VS\B31\Savegames\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB31\Config /v SourcePath /t REG_SZ /d "%cd%"\HardLaunch\VS\B31\ /f
@echo off
copy "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res
copy "%cd%"\HardLaunch\RES\Backups\HardwarUIM06.res "%cd%"\HardLaunch\VS\B31\HardB31.res
copy "%cd%"\HardLaunch\#Dependencies\dgVoodooCpl.exe "%cd%"\HardLaunch\VS\B31\dgVoodooCpl.exe
copy "%cd%"\HardLaunch\#Dependencies\dgVoodoo.conf "%cd%"\HardLaunch\VS\B31\dgVoodoo.conf
copy "%cd%"\HardLaunch\#Dependencies\DDraw.dll "%cd%"\HardLaunch\VS\B31\DDraw.dll
copy "%cd%"\HardLaunch\#Dependencies\D3DImm.dll "%cd%"\HardLaunch\VS\B31\D3DImm.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D9.dll "%cd%"\HardLaunch\VS\B31\D3D9.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D8.dll "%cd%"\HardLaunch\VS\B31\D3D8.dll
copy DSetup.DLL "%cd%"\HardLaunch\VS\B31\DSetup.DLL
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardwarWUIM06.exe "%cd%"\HardLaunch\VS\B31\Patches\HWW_UIM06toB31.xdelta "%cd%"\HardLaunch\VS\B31\HardWB31.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardmanUIM06.exe "%cd%"\HardLaunch\VS\B31\Patches\HMAN_UIM06toB31.xdelta "%cd%"\HardLaunch\VS\B31\HmanB31.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res "%cd%"\HardLaunch\VS\B31\Patches\HUP_UIM06toB31.xdelta "%cd%"\HardLaunch\VS\B31\HupB31.res
@echo off
cd /D "%cd%"\HardLaunch\VS\B31 && HardLaunchB31.bat
@echo off
goto end

:b32
@echo off
set "currentDirectory=%cd%"
@echo off
regedit /s "%~dp0\HardLaunch\VS\B32\B32.reg"
@echo off
mklink /d "%cd%"\HardLaunch\VS\B32\GDV\ "%cd%"\GDV\
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32\Config /v Skin0 /t REG_SZ /d "%cd%"\HardLaunch\VS\B32\Moth_Skins\moth_moon.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32\Config /v Skin1 /t REG_SZ /d "%cd%"\HardLaunch\VS\B32\Moth_Skins\moth_silver.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32\Config /v Skin2 /t REG_SZ /d "%cd%"\HardLaunch\VS\B32\Moth_Skins\moth_neo.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32\Config /v Skin3 /t REG_SZ /d "%cd%"\HardLaunch\VS\B32\Moth_Skins\moth_hawk.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32\Config /v Skin4 /t REG_SZ /d "%cd%"\HardLaunch\VS\B32\Moth_Skins\moth_death.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32\Config /v Skin5 /t REG_SZ /d "%cd%"\HardLaunch\VS\B32\Moth_Skins\moth_police.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32\Config /v Skin6 /t REG_SZ /d "%cd%"\HardLaunch\VS\B32\Moth_Skins\moth_swallow.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32\Config /v SkinsOn /t REG_DWORD /d 0x00000000 /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32\Config /v SkinDir /t REG_SZ /d "%cd%"\HardLaunch\VS\B32\Moth_Skins\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32\Config /v DataPath /t REG_SZ /d "%cd%"\HardLaunch\VS\B32\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32\Config /v DataPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\B32\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32\Config /v GDVPath /t REG_SZ /d "%cd%"\HardLaunch\VS\B32\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32\Config /v GDVPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\B32\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32\Config /v GDVPath3 /t REG_SZ /d "%cd%"\HardLaunch\VS\B32\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32\Config /v RunPath /t REG_SZ /d "%cd%"\HardLaunch\VS\B32\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32\Config /v SavePath /t REG_SZ /d "%cd%"\HardLaunch\VS\B32\Savegames\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32\Config /v SourcePath /t REG_SZ /d "%cd%"\HardLaunch\VS\B32\ /f
@echo off
copy "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res
copy "%cd%"\HardLaunch\RES\Backups\HardwarUIM06.res "%cd%"\HardLaunch\VS\B32\HardB32.res
copy "%cd%"\HardLaunch\RES\Backups\HardimUIM06.res "%cd%"\HardLaunch\VS\B32\Hardim.res
copy "%cd%"\HardLaunch\#Dependencies\dgVoodooCpl.exe "%cd%"\HardLaunch\VS\B32\dgVoodooCpl.exe
copy "%cd%"\HardLaunch\#Dependencies\dgVoodoo.conf "%cd%"\HardLaunch\VS\B32\dgVoodoo.conf
copy "%cd%"\HardLaunch\#Dependencies\DDraw.dll "%cd%"\HardLaunch\VS\B32\DDraw.dll
copy "%cd%"\HardLaunch\#Dependencies\D3DImm.dll "%cd%"\HardLaunch\VS\B32\D3DImm.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D9.dll "%cd%"\HardLaunch\VS\B32\D3D9.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D8.dll "%cd%"\HardLaunch\VS\B32\D3D8.dll
copy DSetup.DLL "%cd%"\HardLaunch\VS\B32\DSetup.DLL
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardwarWUIM06.exe "%cd%"\HardLaunch\VS\B32\Patches\HWW_UIM06toB32.xdelta "%cd%"\HardLaunch\VS\B32\HardWB32.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardmanUIM06.exe "%cd%"\HardLaunch\VS\B32\Patches\HMAN_UIM06toB32.xdelta "%cd%"\HardLaunch\VS\B32\HmanB32.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res "%cd%"\HardLaunch\VS\B32\Patches\HUP_UIM06toB32.xdelta "%cd%"\HardLaunch\VS\B32\HupB32.res
@echo off
cd /D "%cd%"\HardLaunch\VS\B32 && HardLaunchB32.bat
@echo off
goto end

:b33
@echo off
set "currentDirectory=%cd%"
@echo off
regedit /s "%~dp0\HardLaunch\VS\B33\b33.reg"
@echo off
mklink /d "%cd%"\HardLaunch\VS\B33\GDV\ "%cd%"\GDV\
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33\Config /v Skin0 /t REG_SZ /d "%cd%"\HardLaunch\VS\B33\Moth_Skins\moth_moon.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33\Config /v Skin1 /t REG_SZ /d "%cd%"\HardLaunch\VS\B33\Moth_Skins\moth_silver.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33\Config /v Skin2 /t REG_SZ /d "%cd%"\HardLaunch\VS\B33\Moth_Skins\moth_neo.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33\Config /v Skin3 /t REG_SZ /d "%cd%"\HardLaunch\VS\B33\Moth_Skins\moth_hawk.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33\Config /v Skin4 /t REG_SZ /d "%cd%"\HardLaunch\VS\B33\Moth_Skins\moth_death.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33\Config /v Skin5 /t REG_SZ /d "%cd%"\HardLaunch\VS\B33\Moth_Skins\moth_police.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33\Config /v Skin6 /t REG_SZ /d "%cd%"\HardLaunch\VS\B33\Moth_Skins\moth_swallow.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33\Config /v SkinsOn /t REG_DWORD /d 0x00000000 /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33\Config /v SkinDir /t REG_SZ /d "%cd%"\HardLaunch\VS\B33\Moth_Skins\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33\Config /v DataPath /t REG_SZ /d "%cd%"\HardLaunch\VS\B33\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33\Config /v DataPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\B33\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33\Config /v GDVPath /t REG_SZ /d "%cd%"\HardLaunch\VS\B33\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33\Config /v GDVPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\B33\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33\Config /v GDVPath3 /t REG_SZ /d "%cd%"\HardLaunch\VS\B33\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33\Config /v RunPath /t REG_SZ /d "%cd%"\HardLaunch\VS\B33\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33\Config /v SavePath /t REG_SZ /d "%cd%"\HardLaunch\VS\B33\Savegames\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33\Config /v SourcePath /t REG_SZ /d "%cd%"\HardLaunch\VS\B33\ /f
@echo off
copy "%cd%"\HardLaunch\RES\Backups\HardwarUIM06.res "%cd%"\HardLaunch\VS\B33\HardB33.res
copy "%cd%"\HardLaunch\RES\Backups\HardimUIM06.res "%cd%"\HardLaunch\VS\B33\Hardim.res
copy "%cd%"\HardLaunch\#Dependencies\dgVoodooCpl.exe "%cd%"\HardLaunch\VS\B33\dgVoodooCpl.exe
copy "%cd%"\HardLaunch\#Dependencies\dgVoodoo.conf "%cd%"\HardLaunch\VS\B33\dgVoodoo.conf
copy "%cd%"\HardLaunch\#Dependencies\DDraw.dll "%cd%"\HardLaunch\VS\B33\DDraw.dll
copy "%cd%"\HardLaunch\#Dependencies\D3DImm.dll "%cd%"\HardLaunch\VS\B33\D3DImm.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D9.dll "%cd%"\HardLaunch\VS\B33\D3D9.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D8.dll "%cd%"\HardLaunch\VS\B33\D3D8.dll
copy DSetup.DLL "%cd%"\HardLaunch\VS\B33\DSetup.DLL
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardwarWUIM06.exe "%cd%"\HardLaunch\VS\B33\Patches\HWW_UIM06toB33.xdelta "%cd%"\HardLaunch\VS\B33\HardWB33.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardmanUIM06.exe "%cd%"\HardLaunch\VS\B33\Patches\HMAN_UIM06toB33.xdelta "%cd%"\HardLaunch\VS\B33\HmanB33.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res "%cd%"\HardLaunch\VS\B33\Patches\HUP_UIM06toB33.xdelta "%cd%"\HardLaunch\VS\B33\HupB33.res
@echo off
cd /D "%cd%"\HardLaunch\VS\B33 && HardLaunchB33.bat
@echo off
goto end

:b34
@echo off
set "currentDirectory=%cd%"
@echo off
regedit /s "%~dp0\HardLaunch\VS\B34\b34.reg"
@echo off
mklink /d "%cd%"\HardLaunch\VS\B34\GDV\ "%cd%"\GDV\
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34\Config /v Skin0 /t REG_SZ /d "%cd%"\HardLaunch\VS\B34\Moth_Skins\moth_moon.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34\Config /v Skin1 /t REG_SZ /d "%cd%"\HardLaunch\VS\B34\Moth_Skins\moth_silver.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34\Config /v Skin2 /t REG_SZ /d "%cd%"\HardLaunch\VS\B34\Moth_Skins\moth_neo.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34\Config /v Skin3 /t REG_SZ /d "%cd%"\HardLaunch\VS\B34\Moth_Skins\moth_hawk.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34\Config /v Skin4 /t REG_SZ /d "%cd%"\HardLaunch\VS\B34\Moth_Skins\moth_death.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34\Config /v Skin5 /t REG_SZ /d "%cd%"\HardLaunch\VS\B34\Moth_Skins\moth_police.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34\Config /v Skin6 /t REG_SZ /d "%cd%"\HardLaunch\VS\B34\Moth_Skins\moth_swallow.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34\Config /v SkinsOn /t REG_DWORD /d 0x00000000 /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34\Config /v SkinDir /t REG_SZ /d "%cd%"\HardLaunch\VS\B34\Moth_Skins\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34\Config /v DataPath /t REG_SZ /d "%cd%"\HardLaunch\VS\B34\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34\Config /v DataPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\B34\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34\Config /v GDVPath /t REG_SZ /d "%cd%"\HardLaunch\VS\B34\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34\Config /v GDVPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\B34\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34\Config /v GDVPath3 /t REG_SZ /d "%cd%"\HardLaunch\VS\B34\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34\Config /v RunPath /t REG_SZ /d "%cd%"\HardLaunch\VS\B34\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34\Config /v SavePath /t REG_SZ /d "%cd%"\HardLaunch\VS\B34\Savegames\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34\Config /v SourcePath /t REG_SZ /d "%cd%"\HardLaunch\VS\B34\ /f
@echo off
copy "%cd%"\HardLaunch\RES\Backups\HardwarUIM06.res "%cd%"\HardLaunch\VS\B34\HardB34.res
copy "%cd%"\HardLaunch\RES\Backups\HardimUIM06.res "%cd%"\HardLaunch\VS\B34\Hardim.res
copy "%cd%"\HardLaunch\#Dependencies\dgVoodooCpl.exe "%cd%"\HardLaunch\VS\B34\dgVoodooCpl.exe
copy "%cd%"\HardLaunch\#Dependencies\dgVoodoo.conf "%cd%"\HardLaunch\VS\B34\dgVoodoo.conf
copy "%cd%"\HardLaunch\#Dependencies\DDraw.dll "%cd%"\HardLaunch\VS\B34\DDraw.dll
copy "%cd%"\HardLaunch\#Dependencies\D3DImm.dll "%cd%"\HardLaunch\VS\B34\D3DImm.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D9.dll "%cd%"\HardLaunch\VS\B34\D3D9.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D8.dll "%cd%"\HardLaunch\VS\B34\D3D8.dll
copy DSetup.DLL "%cd%"\HardLaunch\VS\B34\DSetup.DLL
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardwarWUIM06.exe "%cd%"\HardLaunch\VS\B34\Patches\HWW_UIM06toB34.xdelta "%cd%"\HardLaunch\VS\B34\HardWB34.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardmanUIM06.exe "%cd%"\HardLaunch\VS\B34\Patches\HMAN_UIM06toB34.xdelta "%cd%"\HardLaunch\VS\B34\HmanB34.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res "%cd%"\HardLaunch\VS\B34\Patches\HUP_UIM06toB34.xdelta "%cd%"\HardLaunch\VS\B34\HupB34.res
@echo off
cd /D "%cd%"\HardLaunch\VS\B34 && HardLaunchB34.bat
@echo off
goto end

:b35
@echo off
set "currentDirectory=%cd%"
@echo off
regedit /s "%~dp0\HardLaunch\VS\B35\b35.reg"
@echo off
mklink /d "%cd%"\HardLaunch\VS\B35\GDV\ "%cd%"\GDV\
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35\Config /v Skin0 /t REG_SZ /d "%cd%"\HardLaunch\VS\B35\Moth_Skins\moth_moon.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35\Config /v Skin1 /t REG_SZ /d "%cd%"\HardLaunch\VS\B35\Moth_Skins\moth_silver.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35\Config /v Skin2 /t REG_SZ /d "%cd%"\HardLaunch\VS\B35\Moth_Skins\moth_neo.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35\Config /v Skin3 /t REG_SZ /d "%cd%"\HardLaunch\VS\B35\Moth_Skins\moth_hawk.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35\Config /v Skin4 /t REG_SZ /d "%cd%"\HardLaunch\VS\B35\Moth_Skins\moth_death.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35\Config /v Skin5 /t REG_SZ /d "%cd%"\HardLaunch\VS\B35\Moth_Skins\moth_police.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35\Config /v Skin6 /t REG_SZ /d "%cd%"\HardLaunch\VS\B35\Moth_Skins\moth_swallow.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35\Config /v SkinsOn /t REG_DWORD /d 0x00000000 /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35\Config /v SkinDir /t REG_SZ /d "%cd%"\HardLaunch\VS\B35\Moth_Skins\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35\Config /v DataPath /t REG_SZ /d "%cd%"\HardLaunch\VS\B35\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35\Config /v DataPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\B35\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35\Config /v GDVPath /t REG_SZ /d "%cd%"\HardLaunch\VS\B35\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35\Config /v GDVPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\B35\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35\Config /v GDVPath3 /t REG_SZ /d "%cd%"\HardLaunch\VS\B35\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35\Config /v RunPath /t REG_SZ /d "%cd%"\HardLaunch\VS\B35\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35\Config /v SavePath /t REG_SZ /d "%cd%"\HardLaunch\VS\B35\Savegames\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35\Config /v SourcePath /t REG_SZ /d "%cd%"\HardLaunch\VS\B35\ /f
@echo off
copy "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res "%cd%"\HardLaunch\VS\B35\Hardup.res
copy "%cd%"\HardLaunch\RES\Backups\HardwarUIM06.res "%cd%"\HardLaunch\VS\B35\HardB35.res
copy "%cd%"\HardLaunch\RES\Backups\HardimUIM06.res "%cd%"\HardLaunch\VS\B35\Hardim.res
copy "%cd%"\HardLaunch\#Dependencies\dgVoodooCpl.exe "%cd%"\HardLaunch\VS\B35\dgVoodooCpl.exe
copy "%cd%"\HardLaunch\#Dependencies\dgVoodoo.conf "%cd%"\HardLaunch\VS\B35\dgVoodoo.conf
copy "%cd%"\HardLaunch\#Dependencies\DDraw.dll "%cd%"\HardLaunch\VS\B35\DDraw.dll
copy "%cd%"\HardLaunch\#Dependencies\D3DImm.dll "%cd%"\HardLaunch\VS\B35\D3DImm.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D9.dll "%cd%"\HardLaunch\VS\B35\D3D9.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D8.dll "%cd%"\HardLaunch\VS\B35\D3D8.dll
copy DSetup.DLL "%cd%"\HardLaunch\VS\B35\DSetup.DLL
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardwarWUIM06.exe "%cd%"\HardLaunch\VS\B35\Patches\HWW_UIM06toB35.xdelta "%cd%"\HardLaunch\VS\B35\HardWB35.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardmanUIM06.exe "%cd%"\HardLaunch\VS\B35\Patches\HMAN_UIM06toB35.xdelta "%cd%"\HardLaunch\VS\B35\HmanB35.exe
@echo off
cd /D "%cd%"\HardLaunch\VS\B35 && HardLaunchB35.bat
@echo off
goto end

:um1
@echo off
set "currentDirectory=%cd%"
@echo off
regedit /s "%~dp0\HardLaunch\VS\UM1\um1.reg"
@echo off
mklink /d "%cd%"\HardLaunch\VS\UM1\GDV\ "%cd%"\GDV\
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1\Config /v Skin0 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM1\Moth_Skins\moth_moon.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1\Config /v Skin1 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM1\Moth_Skins\moth_silver.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1\Config /v Skin2 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM1\Moth_Skins\moth_neo.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1\Config /v Skin3 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM1\Moth_Skins\moth_hawk.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1\Config /v Skin4 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM1\Moth_Skins\moth_death.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1\Config /v Skin5 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM1\Moth_Skins\moth_police.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1\Config /v Skin6 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM1\Moth_Skins\moth_swallow.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1\Config /v SkinsOn /t REG_DWORD /d 0x00000000 /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1\Config /v SkinDir /t REG_SZ /d "%cd%"\HardLaunch\VS\UM1\Moth_Skins\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1\Config /v DataPath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM1\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1\Config /v DataPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM1\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1\Config /v GDVPath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM1\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1\Config /v GDVPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM1\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1\Config /v GDVPath3 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM1\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1\Config /v RunPath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM1\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1\Config /v SavePath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM1\Savegames\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1\Config /v SourcePath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM1\ /f
@echo off
copy "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res "%cd%"\HardLaunch\VS\UM1\Hardup.res
copy "%cd%"\HardLaunch\RES\Backups\HardwarUIM06.res "%cd%"\HardLaunch\VS\UM1\HardUM1.res
copy "%cd%"\HardLaunch\#Dependencies\dgVoodooCpl.exe "%cd%"\HardLaunch\VS\UM1\dgVoodooCpl.exe
copy "%cd%"\HardLaunch\#Dependencies\dgVoodoo.conf "%cd%"\HardLaunch\VS\UM1\dgVoodoo.conf
copy "%cd%"\HardLaunch\#Dependencies\DDraw.dll "%cd%"\HardLaunch\VS\UM1\DDraw.dll
copy "%cd%"\HardLaunch\#Dependencies\D3DImm.dll "%cd%"\HardLaunch\VS\UM1\D3DImm.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D9.dll "%cd%"\HardLaunch\VS\UM1\D3D9.dll
copy "%cd%"\HardLaunch\#Dependencies\D3D8.dll "%cd%"\HardLaunch\VS\UM1\D3D8.dll
copy DSetup.DLL "%cd%"\HardLaunch\VS\UM1\DSetup.DLL
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardwarWUIM06.exe "%cd%"\HardLaunch\VS\UM1\Patches\HWW_UIM06toUM1.xdelta "%cd%"\HardLaunch\VS\UM1\HardWUM1.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardmanUIM06.exe "%cd%"\HardLaunch\VS\UM1\Patches\HMAN_UIM06toUM1.xdelta "%cd%"\HardLaunch\VS\UM1\HmanUM1.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\RES\Backups\HardimUIM06.res "%cd%"\HardLaunch\VS\UM1\Patches\HIM_UIM06toUM1.xdelta "%cd%"\HardLaunch\VS\UM1\Hardim.res
@echo off
cd /D "%cd%"\HardLaunch\VS\UM1 && HardLaunchUM1.bat
@echo off
goto end

:um2
ECHO Unfortunately UIM.02 has been lost to time for now... let me know if you find it! - Bladez1992#3813 (Discord)
@echo off
timeout /t 10
goto version_switcher

:u21
@echo off
set "currentDirectory=%cd%"
@echo off
regedit /s "%~dp0\HardLaunch\VS\U21\u21.reg"
@echo off
mklink /d "%cd%"\HardLaunch\VS\U21\GDV\ "%cd%"\GDV\
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21\Config /v Skin0 /t REG_SZ /d "%cd%"\HardLaunch\VS\U21\Moth_Skins\moth_moon.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21\Config /v Skin1 /t REG_SZ /d "%cd%"\HardLaunch\VS\U21\Moth_Skins\moth_silver.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21\Config /v Skin2 /t REG_SZ /d "%cd%"\HardLaunch\VS\U21\Moth_Skins\moth_neo.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21\Config /v Skin3 /t REG_SZ /d "%cd%"\HardLaunch\VS\U21\Moth_Skins\moth_hawk.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21\Config /v Skin4 /t REG_SZ /d "%cd%"\HardLaunch\VS\U21\Moth_Skins\moth_death.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21\Config /v Skin5 /t REG_SZ /d "%cd%"\HardLaunch\VS\U21\Moth_Skins\moth_police.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21\Config /v Skin6 /t REG_SZ /d "%cd%"\HardLaunch\VS\U21\Moth_Skins\moth_swallow.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21\Config /v SkinsOn /t REG_DWORD /d 0x00000000 /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21\Config /v SkinDir /t REG_SZ /d "%cd%"\HardLaunch\VS\U21\Moth_Skins\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21\Config /v DataPath /t REG_SZ /d "%cd%"\HardLaunch\VS\U21\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21\Config /v DataPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\U21\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21\Config /v GDVPath /t REG_SZ /d "%cd%"\HardLaunch\VS\U21\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21\Config /v GDVPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\U21\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21\Config /v GDVPath3 /t REG_SZ /d "%cd%"\HardLaunch\VS\U21\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21\Config /v RunPath /t REG_SZ /d "%cd%"\HardLaunch\VS\U21\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21\Config /v SavePath /t REG_SZ /d "%cd%"\HardLaunch\VS\U21\Savegames\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21\Config /v SourcePath /t REG_SZ /d "%cd%"\HardLaunch\VS\U21\ /f
@echo off
copy "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res "%cd%"\HardLaunch\VS\U21\Hardup.res
copy "%cd%"\HardLaunch\RES\Backups\HardwarUIM06.res "%cd%"\HardLaunch\VS\U21\HardU21.res
copy DSetup.DLL "%cd%"\HardLaunch\VS\U21\DSetup.DLL
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardwarWUIM06.exe "%cd%"\HardLaunch\VS\U21\Patches\HWW_UIM06toU21.xdelta "%cd%"\HardLaunch\VS\U21\HardWU21.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardmanUIM06.exe "%cd%"\HardLaunch\VS\U21\Patches\HMAN_UIM06toU21.xdelta "%cd%"\HardLaunch\VS\U21\HmanU21.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\RES\Backups\HardimUIM06.res "%cd%"\HardLaunch\VS\U21\Patches\HIM_UIM06toU21.xdelta "%cd%"\HardLaunch\VS\U21\Hardim.res
@echo off
cd /D "%cd%"\HardLaunch\VS\U21 && HardLaunchU21.bat
@echo off
goto end

:um3
@echo off
set "currentDirectory=%cd%"
@echo off
regedit /s "%~dp0\HardLaunch\VS\UM3\um3.reg"
@echo off
mklink /d "%cd%"\HardLaunch\VS\UM3\GDV\ "%cd%"\GDV\
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3\Config /v Skin0 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM3\Moth_Skins\moth_moon.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3\Config /v Skin1 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM3\Moth_Skins\moth_silver.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3\Config /v Skin2 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM3\Moth_Skins\moth_neo.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3\Config /v Skin3 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM3\Moth_Skins\moth_hawk.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3\Config /v Skin4 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM3\Moth_Skins\moth_death.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3\Config /v Skin5 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM3\Moth_Skins\moth_police.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3\Config /v Skin6 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM3\Moth_Skins\moth_swallow.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3\Config /v SkinsOn /t REG_DWORD /d 0x00000000 /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3\Config /v SkinDir /t REG_SZ /d "%cd%"\HardLaunch\VS\UM3\Moth_Skins\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3\Config /v DataPath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM3\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3\Config /v DataPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM3\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3\Config /v GDVPath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM3\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3\Config /v GDVPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM3\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3\Config /v GDVPath3 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM3\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3\Config /v RunPath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM3\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3\Config /v SavePath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM3\Savegames\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3\Config /v SourcePath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM3\ /f
@echo off
copy "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res "%cd%"\HardLaunch\VS\UM3\Hardup.res
copy "%cd%"\HardLaunch\RES\Backups\HardwarUIM06.res "%cd%"\HardLaunch\VS\UM3\HardUM3.res
copy DSetup.DLL "%cd%"\HardLaunch\VS\UM3\DSetup.DLL
copy rock_e.bmp "%cd%"\HardLaunch\VS\UM3\rock_e.bmp
copy met_e.bmp "%cd%"\HardLaunch\VS\UM3\met_e.bmp
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardwarWUIM06.exe "%cd%"\HardLaunch\VS\UM3\Patches\HWW_UIM06toUM3.xdelta "%cd%"\HardLaunch\VS\UM3\HardWUM3.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardmanUIM06.exe "%cd%"\HardLaunch\VS\UM3\Patches\HMAN_UIM06toUM3.xdelta "%cd%"\HardLaunch\VS\UM3\HmanUM3.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\RES\Backups\HardimUIM06.res "%cd%"\HardLaunch\VS\UM3\Patches\HIM_UIM06toUM3.xdelta "%cd%"\HardLaunch\VS\UM3\Hardim.res
@echo off
cd /D "%cd%"\HardLaunch\VS\UM3 && HardLaunchUM3.bat
@echo off
goto end

:um4
@echo off
set "currentDirectory=%cd%"
@echo off
regedit /s "%~dp0\HardLaunch\VS\UM4\um4.reg"
@echo off
mklink /d "%~dp0\HardLaunch\VS\UM4\GDV\" "%~dp0\GDV\"
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4\Config /v Skin0 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM4\Moth_Skins\moth_moon.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4\Config /v Skin1 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM4\Moth_Skins\moth_silver.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4\Config /v Skin2 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM4\Moth_Skins\moth_neo.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4\Config /v Skin3 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM4\Moth_Skins\moth_hawk.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4\Config /v Skin4 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM4\Moth_Skins\moth_death.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4\Config /v Skin5 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM4\Moth_Skins\moth_police.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4\Config /v Skin6 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM4\Moth_Skins\moth_swallow.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4\Config /v SkinsOn /t REG_DWORD /d 0x00000000 /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4\Config /v SkinDir /t REG_SZ /d "%cd%"\HardLaunch\VS\UM4\Moth_Skins\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4\Config /v DataPath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM4\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4\Config /v DataPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM4\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4\Config /v GDVPath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM4\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4\Config /v GDVPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM4\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4\Config /v GDVPath3 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM4\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4\Config /v RunPath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM4\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4\Config /v SavePath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM4\Savegames\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4\Config /v SourcePath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM4\ /f
@echo off
copy "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res "%cd%"\HardLaunch\VS\UM4\Hardup.res
copy "%cd%"\HardLaunch\RES\Backups\HardwarUIM06.res "%cd%"\HardLaunch\VS\UM4\HardUM4.res
copy DSetup.DLL "%cd%"\HardLaunch\VS\UM4\DSetup.DLL
copy rock_e.bmp "%cd%"\HardLaunch\VS\UM4\rock_e.bmp
copy met_e.bmp "%cd%"\HardLaunch\VS\UM4\met_e.bmp
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardwarWUIM06.exe "%cd%"\HardLaunch\VS\UM4\Patches\HWW_UIM06toUM4.xdelta "%cd%"\HardLaunch\VS\UM4\HardWUM4.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardmanUIM06.exe "%cd%"\HardLaunch\VS\UM4\Patches\HMAN_UIM06toUM4.xdelta "%cd%"\HardLaunch\VS\UM4\HmanUM4.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\RES\Backups\HardimUIM06.res "%cd%"\HardLaunch\VS\UM4\Patches\HIM_UIM06toUM4.xdelta "%cd%"\HardLaunch\VS\UM4\Hardim.res
@echo off
cd /D "%cd%"\HardLaunch\VS\UM4 && HardLaunchUM4.bat
@echo off
goto end

:um5
@echo off
set "currentDirectory=%cd%"
@echo off
regedit /s "%~dp0\HardLaunch\VS\UM5\um5.reg"
@echo off
mklink /d "%cd%"\HardLaunch\VS\UM5\GDV\ "%cd%"\GDV\
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5\Config /v Skin0 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM5\Moth_Skins\moth_moon.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5\Config /v Skin1 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM5\Moth_Skins\moth_silver.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5\Config /v Skin2 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM5\Moth_Skins\moth_neo.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5\Config /v Skin3 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM5\Moth_Skins\moth_hawk.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5\Config /v Skin4 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM5\Moth_Skins\moth_death.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5\Config /v Skin5 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM5\Moth_Skins\moth_police.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5\Config /v Skin6 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM5\Moth_Skins\moth_swallow.bmp /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5\Config /v SkinsOn /t REG_DWORD /d 0x00000000 /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5\Config /v SkinDir /t REG_SZ /d "%cd%"\HardLaunch\VS\UM5\Moth_Skins\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5\Config /v DataPath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM5\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5\Config /v DataPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM5\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5\Config /v GDVPath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM5\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5\Config /v GDVPath2 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM5\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5\Config /v GDVPath3 /t REG_SZ /d "%cd%"\HardLaunch\VS\UM5\GDV\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5\Config /v RunPath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM5\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5\Config /v SavePath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM5\Savegames\ /f
@echo off
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5\Config /v SourcePath /t REG_SZ /d "%cd%"\HardLaunch\VS\UM5\ /f
@echo off
copy "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res "%cd%"\HardLaunch\VS\UM5\Hardup.res
copy "%cd%"\HardLaunch\RES\Backups\HardwarUIM06.res "%cd%"\HardLaunch\VS\UM5\HardUM5.res
copy DSetup.DLL "%cd%"\HardLaunch\VS\UM5\DSetup.DLL
copy rock_e.bmp "%cd%"\HardLaunch\VS\UM5\rock_e.bmp
copy met_e.bmp "%cd%"\HardLaunch\VS\UM5\met_e.bmp
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardwarWUIM06.exe "%cd%"\HardLaunch\VS\UM5\Patches\HWW_UIM06toUM5.xdelta "%cd%"\HardLaunch\VS\UM5\HardWUM5.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\EXE\Backups\HardmanUIM06.exe "%cd%"\HardLaunch\VS\UM5\Patches\HMAN_UIM06toUM5.xdelta "%cd%"\HardLaunch\VS\UM5\HmanUM5.exe
"%cd%"\HardLaunch\#Dependencies\xdelta3.exe -d -s "%cd%"\HardLaunch\RES\Backups\HardimUIM06.res "%cd%"\HardLaunch\VS\UM5\Patches\HIM_UIM06toUM5.xdelta "%cd%"\HardLaunch\VS\UM5\Hardim.res
@echo off
cd /D "%cd%"\HardLaunch\VS\UM5 && HardLaunchUM5.bat
@echo off
goto end

REM --------------------Interface Colors Menu----------------------------------------------------------------

:interface_colors
cls
ECHO	---- Choose Your Interface Colors ----
ECHO	      0 = Black       8 = Gray
ECHO	      1 = Blue        9 = Light Blue
ECHO	      2 = Green       A = Light Green
ECHO	      3 = Aqua        B = Light Aqua
ECHO	      4 = Red         C = Light Red
ECHO	      5 = Purple      D = Light Purple
ECHO	      6 = Yellow      E = Light Yellow
ECHO	      7 = White       F = Bright White
ECHO The first character is the background color, the second is the text
ECHO    Example: 0C would be a black background with light red text
@ECHO off
set /p IC="What colors would you like: "
@echo off
color %IC%
goto main_menu

REM --------------------Registry Cleanup---------------------------------------------------------------------

:registrycleanup
cls
ECHO         - This option removes all registry entries created by HardLaunch -
ECHO           - It does not remove any of the default UIM.06 registry keys -
ECHO     - Generally you only would use this if you were getting rid of HardLaunch -
ECHO - If run unintentionally, you'll need to re-launch any versions you'd like to play -
ECHO   - If errors occur, it simply means you haven't started every version one time! -
ECHO ------------------------------------------------------------------------------------
ECHO            Are you positive you want to do this?
set /p regclean=If so input Y, if not input N to go back to the Main Menu: 
@echo off
if %regclean%==y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HardDem /f
if %regclean%==y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\Hmanb31 /f
if %regclean%==y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32 /f
if %regclean%==y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33 /f
if %regclean%==y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34 /f
if %regclean%==y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35 /f
if %regclean%==y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF20 /f
if %regclean%==y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF21 /f
if %regclean%==y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21 /f
if %regclean%==y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU24 /f
if %regclean%==y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1 /f
if %regclean%==y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3 /f
if %regclean%==y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4 /f
if %regclean%==y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5 /f
if %regclean%==y ECHO Remove all registry keys created by HardLaunch - Done!
if %regclean%==y timeout /t 10
if %regclean%==y goto main_menu
if %regclean%==n goto main_menu
if %regclean%==Y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HardDem /f
if %regclean%==Y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\Hmanb31 /f
if %regclean%==Y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB32 /f
if %regclean%==Y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB33 /f
if %regclean%==Y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB34 /f
if %regclean%==Y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanB35 /f
if %regclean%==Y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF20 /f
if %regclean%==Y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanF21 /f
if %regclean%==Y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU21 /f
if %regclean%==Y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanU24 /f
if %regclean%==Y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM1 /f
if %regclean%==Y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM3 /f
if %regclean%==Y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM4 /f
if %regclean%==Y REG DELETE HKEY_CURRENT_USER\SOFTWARE\Refinery\HmanUM5 /f
if %regclean%==Y ECHO Remove all registry keys created by HardLaunch - Done!
if %regclean%==Y timeout /t 10
if %regclean%==Y goto main_menu
if %regclean%==N goto main_menu

REM --------------------Create Backups-------------------------------------------------------------
:createbackups
cls
ECHO - Creates backups of UIM.06's HardwarW.exe, Hardman.exe, Hardim.res, Hardup.res, Hardwar.res -
ECHO    - Run this ONCE when you first start HardLaunch, then forget this option exists -
ECHO           - Requires an unmodified UIM.06 installation (Zoom, Steam, or Retail) -
ECHO             - RUNNING THIS IS REQUIRED FOR HARDLAUNCH TO FUNCTION AS INTENDED -
ECHO ----------------------------------------------------------------------------------------------
set /p createbackups=Input Y to create your ONE TIME backups, or N to go back to Main Menu: 
if %createbackups%==y goto backup
if %createbackups%==Y goto backup
if %createbackups%==n goto main_menu
if %createbackups%==N goto main_menu
:backup
@echo off
set "currentDirectory=%cd%"
copy HardwarW.exe "%cd%"\HardLaunch\EXE\Backups\HardwarWUIM06.exe
copy Hardman.exe "%cd%"\HardLaunch\EXE\Backups\HardmanUIM06.exe
copy "%cd%"\DATA\Hardim.res "%cd%"\HardLaunch\RES\Backups\HardimUIM06.res
copy "%cd%"\DATA\Hardup.res "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res
copy "%cd%"\DATA\Hardwar.res "%cd%"\HardLaunch\RES\Backups\HardwarUIM06.res
ECHO Created backups... Please do not run this option a second time!
timeout /t 20
goto main_menu

REM --------------------Restore Files------------------------------------------------------------------------

:restorefiles
cls
ECHO - Restores all .exe and .res files in the main Hardwar directory to vanilla UIM.06 -
ECHO ----------------------------------------------------------------------------------------------
ECHO             Are you positive you want to do this?
set /p restfiles=If so input Y, if not input N to go back to the Main Menu: 
@echo off
set "currentDirectory=%cd%"
if %restfiles%==y del HardwarW.exe
if %restfiles%==y del Hardman.exe
if %restfiles%==y del "%cd%"\DATA\Hardim.res
if %restfiles%==y del "%cd%"\DATA\Hardup.res
if %restfiles%==y del "%cd%"\DATA\Hardwar.res
if %restfiles%==y copy "%cd%"\HardLaunch\EXE\Backups\HardwarWUIM06.exe HardwarW.exe
if %restfiles%==y copy "%cd%"\HardLaunch\EXE\Backups\HardmanUIM06.exe Hardman.exe
if %restfiles%==y copy "%cd%"\HardLaunch\RES\Backups\HardimUIM06.res "%cd%"\DATA\Hardim.res
if %restfiles%==y copy "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res "%cd%"\DATA\Hardup.res
if %restfiles%==y copy "%cd%"\HardLaunch\RES\Backups\HardwarUIM06.res "%cd%"\DATA\Hardwar.res
if %restfiles%==y ECHO Restore all .exe and .res files to vanilla UIM.06 versions - Done!
if %restfiles%==y timeout /t 10
if %restfiles%==y goto main_menu
if %restfiles%==n goto main_menu
if %restfiles%==Y del HardwarW.exe
if %restfiles%==Y del Hardman.exe
if %restfiles%==Y del "%cd%"\DATA\Hardim.res
if %restfiles%==Y del "%cd%"\DATA\Hardup.res
if %restfiles%==Y del "%cd%"\DATA\Hardwar.res
if %restfiles%==Y copy "%cd%"\HardLaunch\EXE\Backups\HardwarWUIM06.exe HardwarW.exe
if %restfiles%==Y copy "%cd%"\HardLaunch\EXE\Backups\HardmanUIM06.exe Hardman.exe
if %restfiles%==Y copy "%cd%"\HardLaunch\RES\Backups\HardimUIM06.res "%cd%"\DATA\Hardim.res
if %restfiles%==Y copy "%cd%"\HardLaunch\RES\Backups\HardupUIM06.res "%cd%"\DATA\Hardup.res
if %restfiles%==Y copy "%cd%"\HardLaunch\RES\Backups\HardwarUIM06.res "%cd%"\DATA\Hardwar.res
if %restfiles%==Y ECHO Restore all .exe and .res files to vanilla UIM.06 versions - Done!
if %restfiles%==Y timeout /t 10
if %restfiles%==Y goto main_menu
if %restfiles%==N goto main_menu

REM --------------------Set Directory------------------------------------------------------------------------

:setdirectory
cls
ECHO        - Sets the UIM.06 directory to wherever HardLaunch.bat is currently located -
ECHO ----------------------------------------------------------------------------------------------
ECHO             Are you positive you want to do this?
set /p setdirectory=If so input Y, if not input N to go back to the Main Menu: 
@echo off
set "currentDirectory=%cd%"
if %setdirectory%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin0 /t REG_SZ /d "%cd%"\Moth_Skins\moth_moon.bmp /f
@echo off
if %setdirectory%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin1 /t REG_SZ /d "%cd%"\Moth_Skins\moth_silver.bmp /f
@echo off
if %setdirectory%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin2 /t REG_SZ /d "%cd%"\Moth_Skins\moth_neo.bmp /f
@echo off
if %setdirectory%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin3 /t REG_SZ /d "%cd%"\Moth_Skins\moth_hawk.bmp /f
@echo off
if %setdirectory%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin4 /t REG_SZ /d "%cd%"\Moth_Skins\moth_death.bmp /f
@echo off
if %setdirectory%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin5 /t REG_SZ /d "%cd%"\Moth_Skins\moth_police.bmp /f
@echo off
if %setdirectory%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin6 /t REG_SZ /d "%cd%"\Moth_Skins\moth_swallow.bmp /f
@echo off
if %setdirectory%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SkinDir /t REG_SZ /d "%cd%"\Moth_Skins\ /f
@echo off
if %setdirectory%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v DataPath /t REG_SZ /d "%cd%"\DATA\ /f
@echo off
if %setdirectory%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v DataPath2 /t REG_SZ /d "%cd%"\DATA\ /f
@echo off
if %setdirectory%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v GDVPath /t REG_SZ /d "%cd%"\GDV\ /f
@echo off
if %setdirectory%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v GDVPath2 /t REG_SZ /d "%cd%"\GDV\ /f
@echo off
if %setdirectory%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v GDVPath3 /t REG_SZ /d "%cd%"\GDV\ /f
@echo off
if %setdirectory%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v RunPath /t REG_SZ /d "%cd%"\ /f
@echo off
if %setdirectory%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SavePath /t REG_SZ /d "%cd%"\Savegames\ /f
@echo off
if %setdirectory%==y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SourcePath /t REG_SZ /d "%cd%"\ /f
if %setdirectory%==y ECHO Set UIM.06 directory to HardLaunch location - Done!
if %setdirectory%==y timeout /t 10
if %setdirectory%==y goto main_menu
if %setdirectory%==n goto main_menu
if %setdirectory%==Y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin0 /t REG_SZ /d "%cd%"\Moth_Skins\moth_moon.bmp /f
@echo off
if %setdirectory%==Y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin1 /t REG_SZ /d "%cd%"\Moth_Skins\moth_silver.bmp /f
@echo off
if %setdirectory%==Y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin2 /t REG_SZ /d "%cd%"\Moth_Skins\moth_neo.bmp /f
@echo off
if %setdirectory%==Y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin3 /t REG_SZ /d "%cd%"\Moth_Skins\moth_hawk.bmp /f
@echo off
if %setdirectory%==Y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin4 /t REG_SZ /d "%cd%"\Moth_Skins\moth_death.bmp /f
@echo off
if %setdirectory%==Y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin5 /t REG_SZ /d "%cd%"\Moth_Skins\moth_police.bmp /f
@echo off
if %setdirectory%==Y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Skin6 /t REG_SZ /d "%cd%"\Moth_Skins\moth_swallow.bmp /f
@echo off
if %setdirectory%==Y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SkinDir /t REG_SZ /d "%cd%"\Moth_Skins\ /f
@echo off
if %setdirectory%==Y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v DataPath /t REG_SZ /d "%cd%"\DATA\ /f
@echo off
if %setdirectory%==Y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v DataPath2 /t REG_SZ /d "%cd%"\DATA\ /f
@echo off
if %setdirectory%==Y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v GDVPath /t REG_SZ /d "%cd%"\GDV\ /f
@echo off
if %setdirectory%==Y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v GDVPath2 /t REG_SZ /d "%cd%"\GDV\ /f
@echo off
if %setdirectory%==Y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v GDVPath3 /t REG_SZ /d "%cd%"\GDV\ /f
@echo off
if %setdirectory%==Y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v RunPath /t REG_SZ /d "%cd%"\ /f
@echo off
if %setdirectory%==Y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SavePath /t REG_SZ /d "%cd%"\Savegames\ /f
@echo off
if %setdirectory%==Y REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SourcePath /t REG_SZ /d "%cd%"\ /f
if %setdirectory%==Y ECHO Set UIM.06 directory to HardLaunch location - Done!
if %setdirectory%==Y timeout /t 10
if %setdirectory%==Y goto main_menu
if %setdirectory%==N goto main_menu

REM --------------------END----------------------------------------------------------------------------------

:end
exit