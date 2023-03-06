@ECHO off

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

REM --------------------Main Menu----------------------------------------------------------------------------

:main_menu
cls
ECHO			        HardLaunch
ECHO			         v1.0.7.5
ECHO			      By Bladez1992
ECHO      Credit to Lord Solarix for finding some of these commands!
ECHO --------------------------------------------------------------------------
ECHO 1.  Create A New Local World					 
ECHO 2.  Create A New Network Game					 
ECHO 3.  Create A New Dedicated Server					 
ECHO 4.  Load A Local World						 
ECHO 5.  Load A Network Game						 
ECHO 6.  Load A Dedicated Server					 
ECHO 7.  Connect (Connect to a Network Game or Dedicated Server)	 
ECHO 8.  Change Resolution						 
ECHO 9.  Graphics Options						 
ECHO 10. Audio Options							 
ECHO 11. Network Options						 
ECHO 12. Debug/Other/Unknown Functions						 
ECHO 13. Change Interface Colors					 
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
if '%choice%'=='12' goto dou_functions
if '%choice%'=='13' goto interface_colors
ECHO "%choice%" is invalid, choose something on the list!
goto main_menu

REM --------------------World/Game/Network Commands----------------------------------------------------------

:newworld
set /p LocalSaveName="What would you like your Local World to be called: "
@echo off
set "currentDirectory=%cd%"
start HardwarW.exe /t:new %cd%\Savegames\%LocalSaveName%.sav
goto end
:newnetworld
set /p NetSaveName="What would you like your Network Game to be called: "
@echo off
set "currentDirectory=%cd%"
start HardwarW.exe /t:new %cd%\Savegames\%NetSaveName%.sav
goto end
:newdedworld
set /p DedSaveName="What would you like your Dedicated Server to be called: "
@echo off
set "currentDirectory=%cd%"
start HardwarW.exe /t:new %cd%\Savegames\%DedSaveName%.sav
goto end
:loadworld
set /p LoadLocalSaveName="Type your Local World's name to load it: "
@echo off
set "currentDirectory=%cd%"
start HardwarW.exe /t:load %cd%\Savegames\%LoadLocalSaveName%.sav
goto end
:loadnetworld
set /p LoadNetSaveName="Type your Network Game's name to load it: "
@echo off
set "currentDirectory=%cd%"
start HardwarW.exe /t:load %cd%\Savegames\%LoadNetSaveName%.sav
goto end
:loaddedworld
set /p LoadDedSaveName="Type your Dedicated Server's name to load it: "
@echo off
set "currentDirectory=%cd%"
start HardwarW.exe /t:load %cd%\Savegames\%LoadDedSaveName%.sav
goto end
:connectnetgame
start HardwarW.exe /t:connect
goto end

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
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v 32Bit /t REG_DWORD /d 0x0000000%T%
ECHO Set 32 Bit Textures Value - Done!
@echo off
timeout /t 5
goto graphics_options
:bldgsmoke
set /p S="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v BuildingSmoke /t REG_DWORD /d 0x0000000%S%
ECHO Set Building Smoke Value - Done!
@echo off
timeout /t 5
goto graphics_options
:clamptex
set /p P="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ClampTPage /t REG_DWORD /d 0x0000000%P%
ECHO Set Clamp Textures Value - Done!
@echo off
timeout /t 5
goto graphics_options
:clouds
set /p C="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v BuildingSmoke /t REG_DWORD /d 0x0000000%C%
ECHO Set Clouds Value - Done!
@echo off
timeout /t 5
goto graphics_options
:embossedtex
set /p E="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Emboss /t REG_DWORD /d 0x0000000%E%
ECHO Set Embossed Textures Value - Done!
@echo off
timeout /t 5
goto graphics_options
:fogdepth
set /p F="Type 0 thru 3 with 0 being no fog, 3 being max fog"
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Foglevel /t REG_DWORD /d 0x0000000%F%
ECHO Set Fog Depth Value - Done!
@echo off
timeout /t 5
goto graphics_options
:lensflare
set /p L="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v LensFlare /t REG_DWORD /d 0x0000000%L%
ECHO Set Lens Flare Value - Done!
@echo off
timeout /t 5
goto graphics_options
:mipmaps
set /p mm="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v RGBText /t REG_DWORD /d 0x0000000%mm%
ECHO Set MipMaps Value - Done!
@echo off
timeout /t 5
goto graphics_options
:rgbdisplay
set /p R="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v RGBDisplay /t REG_DWORD /d 0x0000000%R%
ECHO Set RGB Display Value - Done!
@echo off
timeout /t 5
goto graphics_options
:origexplosions
set /p X="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v NewExplosions /t REG_DWORD /d 0x0000000%X%
ECHO Set Original Explosions Value - Done!
@echo off
timeout /t 5
goto graphics_options
:origfog
set /p O="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v OldFog /t REG_DWORD /d 0x0000000%O%
ECHO Set Original Fog Value- Done!
@echo off
timeout /t 5
goto graphics_options
:philsending
set /p N="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v PhilsEnding /t REG_DWORD /d 0x0000000%N%
ECHO Set Phil's Ending Value - Done!
@echo off
timeout /t 5
goto graphics_options
:simulatelag
set /p M="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Lag /t REG_DWORD /d 0x0000000%M%
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
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Sound3DAudio /t REG_DWORD /d 0x0000000%D%
ECHO Set 3D Audio Value - Done!
@echo off
timeout /t 5
goto audio_options
:compvoice
set /p V="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SoundCompVoice /t REG_DWORD /d 0x0000000%V%
ECHO Set Computer Voice Value - Done!
@echo off
timeout /t 5
goto audio_options
:hangarfx
set /p H="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v HangarSounds /t REG_DWORD /d 0x0000000%H%
ECHO Set Hangar Sound Effects Value - Done!
@echo off
timeout /t 5
goto audio_options
:cdaudio
set /p A="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Music /t REG_DWORD /d 0x0000000%A%
ECHO Set Music/CD Audio Value - Done!
@echo off
timeout /t 5
goto audio_options
:samplerate
set /p G="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v SampleRate /t REG_DWORD /d 0x0000000%G%
ECHO Set Sample Rate Value - Done!
@echo off
timeout /t 5
goto audio_options
:sound
set /p I="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Sound /t REG_DWORD /d 0x0000000%I%
ECHO Set Sound Effects Value - Done!
@echo off
timeout /t 5
goto audio_options
:stereoaudio
set /p J="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Stereo /t REG_DWORD /d 0x0000000%J%
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
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v CashOnKill /t REG_DWORD /d 0x0000000%bm%
ECHO Set Blood Money Value - Done!
@echo off
timeout /t 5
goto network_options
:cpupilots
set /p cp="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v IncludeCPU /t REG_DWORD /d 0x0000000%cp%
ECHO Set CPU (AI) Pilots Value - Done!
@echo off
timeout /t 5
goto network_options
:godhangaraccess
set /p gh="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v LinkAllowGodHangar /t REG_DWORD /d 0x0000000%gh%
ECHO Set God Hangar Access Value - Done!
@echo off
timeout /t 5
goto network_options
:maxplayers
set /p mp="Set anywhere between 2 - 16 (other values may cause a crash): "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v MaxPlayersInt /t REG_DWORD /d 0x0000000%mp%
ECHO Set Max Players Value - Done!
@echo off
timeout /t 5
goto network_options
:mothhopping
set /p mh="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v MothHopping /t REG_DWORD /d 0x0000000%mh%
ECHO Set Moth Hopping Value - Done!
@echo off
timeout /t 5
goto network_options
:persistentgame
set /p pg="Type 0 to set Network Game, 1 to set Dedicated Server: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v PersistentGame /t REG_DWORD /d 0x0000000%pg%
ECHO Set Persistent Game Value - Done!
@echo off
timeout /t 5
goto network_options
:playerannouncement
set /p pa="0 = Anonymous, 1 = Named, 2 = Name and Target: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v PlayerAnnounce /t REG_DWORD /d 0x0000000%pa%
ECHO Set Player Announcement Value - Done!
@echo off
timeout /t 5
goto network_options
:restrictalpha
set /p ra="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v RestrictAlpha /t REG_DWORD /d 0x0000000%ra%
ECHO Set Restrict Gamplay to Alpha Crater Value - Done!
@echo off
timeout /t 5
goto network_options
:requirepasswords
set /p rp="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v PilotPasswords /t REG_DWORD /d 0x0000000%rp%
ECHO Set Require Players to Enter Passwords Value - Done!
@echo off
timeout /t 5
goto network_options
:terminalport
set /p tp="0 = Disabled, 9001 = HW Recommended, or enter a 4-digit port number: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v MothHopping /t REG_DWORD /d 0x0000000%tp%
ECHO Set Terminal Port Value - Done!
@echo off
timeout /t 5
goto network_options

REM --------------------Debug/Other/Unknown Functions Menu-----------------------------------------------------------------

:dou_functions
cls
ECHO 			  --- Other Functions ---
ECHO 1.  Attract Mode When Idle (AI pilots will target you when idle)
ECHO 2.  Joystick - Multiple Button Detection (0 = Enabled / 1 = Disabled)
ECHO 3.  Run Hardwar In The Background
ECHO 4.  Play Intro Video (Literally just plays the intro video)
ECHO --------------------------------------------------------------------------
ECHO 			  --- Debug Functions ---
ECHO 5.  Basic Log File
ECHO 6.  Developer's Info
ECHO 7.  Debug Keys (Press G to warp to God Hangar)
ECHO 8.  Debug Logging
ECHO --------------------------------------------------------------------------
ECHO 			  --- Unknown Functions ---
ECHO 9.  Debug (Presumably debug mode)
ECHO 10. recordnone
ECHO 11. recordsave
ECHO 12. recordsavefast
ECHO 13. recordplay
ECHO 14. recordplaygrab24
ECHO 15. recordplaygrab12
ECHO 16. recordplayaudio
ECHO 17. Lobby (Presumably an unimplemented server lobby)
ECHO 18. Back to Main Menu
ECHO --------------------------------------------------------------------------
SET /P of=Type the number of your selection:
if %of%==1 goto attractmode
if %of%==2 goto joystickmbd
if %of%==3 goto runbackground
if %of%==4 goto introvid
if %of%==5 goto basiclog
if %of%==6 goto devinfo
if %of%==7 goto debugkeys
if %of%==8 goto debuglog
if %of%==9 goto debug
if %of%==10 goto recordnone
if %of%==11 goto recordsave
if %of%==12 goto recordsavefast
if %of%==13 goto recordplay
if %of%==14 goto recordplaygrab24
if %of%==15 goto recordplaygrab12
if %of%==16 goto recordplayaudio
if %of%==17 goto lobby
if %of%==18 goto main_menu
ECHO "%of%" is invalid, choose something on the list!
ECHO.
goto main_menu

REM --------------------Debug/Other/Unknown Functions Commands-------------------------------------------------------------

:attractmode
set /p am="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Attract /t REG_DWORD /d 0x0000000%am%
ECHO Set Attract Mode When Idle Value - Done!
@echo off
timeout /t 5
goto dou_functions
:joystickmbd
set /p jb="Type 0 to enable, 1 to disable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v OneButtonOnly /t REG_DWORD /d 0x0000000%jb%
ECHO Set Joystick - Multiple Button Detection Value - Done!
@echo off
timeout /t 5
goto dou_functions
:runbackground
set /p rb="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v Attract /t REG_DWORD /d 0x0000000%rb%
ECHO Set Run Hardwar In The Background Value - Done!
@echo off
timeout /t 5
goto dou_functions
:basiclog
set /p lf="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v LogFile /t REG_DWORD /d 0x0000000%lf%
ECHO Set Basic Log File Value - Done!
@echo off
timeout /t 5
goto dou_functions
:devinfo
set /p di="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v DebugSafe /t REG_DWORD /d 0x0000000%di%
ECHO Set Developer Info Value - Done!
@echo off
timeout /t 5
goto dou_functions
:debugkeys
set /p dk="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v DebugKeys /t REG_DWORD /d 0x0000000%dk%
ECHO Set Debug Keys (Press G to warp to God Hangar) Value - Done!
@echo off
timeout /t 5
goto dou_functions
:debuglog
set /p dl="Type 0 to disable, 1 to enable: "
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v GameDebugLog /t REG_DWORD /d 0x0000000%dl%
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
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000F00
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000870
ECHO Set 3840 x 2160 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res2
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000A00
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x000005A0
ECHO Set 2560 x 1440 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res3
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x000005A0
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000438
ECHO Set 2048 x 1080 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res4
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000780
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000438
ECHO Set 1920 x 1080 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res5
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000690
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x0000041A
ECHO Set 1680 x 1050 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res6
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000640
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x000004B0
ECHO Set 1600 x 1200 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res7
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000640
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000384
ECHO Set 1600 x 900 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res8
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000556
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000300
ECHO Set 1366 x 768 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res9
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000550
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000300
ECHO Set 1360 x 768 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res10
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000500
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000400
ECHO Set 1280 x 1024 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res11
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000500
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x000003C0
ECHO Set 1280 x 960 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res12
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000500
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000320
ECHO Set 1280 x 800 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res13
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000500
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000300
ECHO Set 1280 x 768 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res14
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000500
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x000002D0
ECHO Set 1280 x 720 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res15
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000498
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000298
ECHO Set 1176 x 664 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res16
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000480
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000360
ECHO Set 1152 x 864 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res17
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000400
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000300
ECHO Set 1024 x 768 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res18
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000320
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000258
ECHO Set 800 x 600 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res19
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x000002D0
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x00000240
ECHO Set 720 x 576 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res20
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x000002D0
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x000001E0
ECHO Set 720 x 480 - Done!
@echo off
timeout /t 5
goto resolution_switcher
:res21
@echo off 
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x00000280
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x000001E0
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
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionX /t REG_DWORD /d 0x0000%RESX%
REG ADD HKEY_CURRENT_USER\SOFTWARE\Refinery\Hardman\Config /v ResolutionY /t REG_DWORD /d 0x0000%RESY%
ECHO Set Custom Resolution - Done! - Once again, don't be surprised if this crashes your game!
@echo off
timeout /t 10
goto resolution_switcher

REM --------------------END----------------------------------------------------------------------------------

:end
exit