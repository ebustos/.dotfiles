import XMonad                   --hiding (Tall)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Util.Run --(spawnPipe)
import XMonad.Util.EZConfig --(additionalKeys)
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.UrgencyHook
import XMonad.ManageHook
import XMonad.Layout.LayoutHints
import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders
import XMonad.Layout.HintedTile
import XMonad.Layout.IM
import XMonad.Layout.Reflect
import XMonad.Layout.Magnifier
import XMonad.Layout.Grid

import XMonad.Actions.CycleWS
import XMonad.Actions.WindowGo
import XMonad.Actions.SpawnOn
import XMonad.Actions.UpdatePointer
import XMonad.Util.Themes

import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.Ssh

import Data.List

--import qualified System.IO.UTF8
 
import qualified Data.Map as M
import qualified XMonad.Actions.FlexibleResize as Flex
import qualified XMonad.StackSet as W
 
main = do
    din <- spawnPipe myStatusBar
    din2 <- spawnPipe myTopBar
    din3 <- spawnPipe myBottomBar
--     spawn mcabberDetach
--     nada <- spawn mcabber
    xmonad $ myUrgencyHook $ defaultConfig
        { manageHook = newManageHook <+> manageDocks
        , layoutHook = myLayoutHook
        , logHook = myLogHookWithPP $ myDzenPP din
        , startupHook = myStartupHook >> setWMName "LG3D"
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
--        , normalBorderColor = "#0f0f0f"
--        , focusedBorderColor = "#0077cc"
        , terminal = myTerminal
        , workspaces = ["im", "www", "work"] ++ (map show [4..7]) ++ ["music", "TV"]
        --, workspaces = ["1:irc", "2:www", "3:music"] ++ map show [4..9]
        -- , numlockMask = mod2Mask
        , borderWidth = 1
--         , focusFollowsMouse = True
        , clickJustFocuses = False
        }
       `additionalKeysP`
        [
--        mod-shift-space Reset the layouts on the current workspace to default
--        mod-n  Resize viewed windows to the correct size
--        mod-m  Move focus to the master window
--        mod-h  Shrink the master area
--        mod-l  Expand the master area
--        mod-t  Push window back into tiling
--        mod-comma  Increment the number of windows in the master area
--        mod-period Deincrement the number of windows in the master area
--        mod-b  Toggle the status bar gap
--        mod-{w,e,r} Switch to physical/Xinerama screens 1, 2, or 3
--        mod-shift-{w,e,r} Move client to screen 1, 2, or 3

        -- Application launchers
         ("M-f", runOrRaise "chromium" (className =? "Chromium-browser"))
--         ("M-f", runOrRaise "firefox" (className =? "Navigator"))
--         , ("M-o", runOrRaiseNext "opera" (className =? "Opera"))
        , ("M-u", runOrRaiseNext "uzbl-browser" (className =? "Uzbl-core"))
--         , ("M-y", spawnHere "uzbl-browser")
        , ("M-S-`", runOrRaiseNext "xpad -t" (className =? "xpad"))
        , ("M-`", spawn "xpad -t")
        , ("M-a", runOrRaiseNext "apvlv" (className =? "Apvlv"))
        , ("M-e", runOrRaiseNext "gvim" (className =? "Gvim"))
--         , ("M-e", runOrRaiseNext "gvim" (className =? "Gvim" <&&> (fmap (\t -> (not (isConfigFile t))) title)))
        , ("M-i", raiseMaybe (runInTerm "-T Im" mcabber) (title =? "Im")) -- <||>  (fmap (\t -> (isImApp t)) title)))
        , ("M-m", raiseMaybe (runInTerm "-T Mutt" "mutt") (title =? "Mutt")) -- <||>  (fmap (\t -> (isCliApp t)) title)))
--         , ("M-m", raiseMaybe (runInTerm "-T Mutt" mutt) (title =? "Mutt")) -- <||>  (fmap (\t -> (isCliApp t)) title)))
        , ("M-<F1>", runOrRaiseNext "galculator" (className =? "Galculator"))
        , ("M-c", runOrRaiseNext myTerminal (className =? myTerminalClass <&&> (fmap (\t -> (not (isCliApp t))) title)))
        , ("M-x", runOrRaiseNext "gvim ~/.xmonad/xmonad.hs" (fmap (\t -> (isXmonadConfig t)) title))
        , ("M-z", runOrRaiseNext "gvim ~/.conkyrc" (fmap (\t -> (isConkyConfig t)) title))
        , ("M-s", sshPrompt defaultXPConfig)
        , ("M1-<Tab>", windows W.focusDown)
        , ("M1-S-<Tab>", windows W.focusUp)
        , ("M-<Return>", spawn myTerminal)
        , ("C-M-<Return>", windows W.swapMaster)
        -- Prompt
        , ("M-p", shellPrompt wfarrPrompt)
        -- Workspaces
        --, ("M-w", windows $ W.greedyView "www")
        --, ("M-m", windows $ W.greedyView "mail")
--         , ("M-b", toggleWS)
        , ("M-<Left>", moveTo Prev NonEmptyWS)
        , ("M-<Right>", moveTo Next NonEmptyWS)
        -- MPC
        , ("M-C-<Space>", spawn "mpc toggle")
        , ("M-C-,", spawn "mpc prev")
        , ("M-C-.", (do {spawn "mpc next; sleep 1"; showSong}))
        , ("M-C-[", spawn "mpc seek -00:00:10")
        , ("M-C-]", spawn "mpc seek +00:00:10")
--         , ("M-S-w", spawn "mpc toggle")
--         , ("M-S-p", spawn "mpc prev")
--         , ("M-S-n", (do {spawn "mpc next"; showSong}))
--         , ("M-<KP_Multiply>", spawn "mpc seek +3%")
--         , ("M-<KP_Divide>", spawn "mpc seek -3%")
        , ("M-C-m", showSong)
        -- MOC
        , ("M-S-<Space>", spawn "mocp --toggle-pause")
        , ("M-S-f", spawn "mocp -f")
        , ("M-<Page_Down>", spawn "mocp -f")
        , ("M-S-r", spawn "mocp -r")
        , ("M-<Page_Up>", spawn "mocp -r")
        , ("M-S-n", (do {spawn "mocp -f"; showSong}))
        , ("M-<KP_Multiply>", spawn "mocp --seek 5")
        , ("M-<KP_Divide>", spawn "mocp --seek -5")
        , ("M-S-m", showSong)
        -- Volume control
        , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+")
        , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%-")
        , ("M-<KP_Add>", spawn "amixer set Master 5%+") -- PCM
        , ("M-<KP_Subtract>", spawn "amixer set Master 5%-")
        -- Miscelaneous Keys
--         , ("M-c", kill)
        , ("M-S-z", spawn "xscreensaver-command -lock")
        , ("C-<Print>", spawn "sleep 0.2; scrot -s '%Y-%m-%d_$wx$h.png' -e 'mv $f ~/.shots/'")
        , ("<Print>", spawn "scrot '%Y-%m-%d_$wx$h.png' -e 'mv $f ~/.shots/'")
          
        -- increase/decrease transparency
--         , ("M-t", spawn "transset-df -a --dec .1")
        , ("M-S-t", spawn "transset-df -a --inc .1")

        -- Sleep mode
--         , ("<XF86Sleep>", spawn "sudo pm-suspend")

        ]
mcabber = "screen -c /dev/null -Rd -S xmpp mcabber"
mutt = "screen -c /dev/null -Rd -S mail mutt"
mcabberDetach = "screen -d xmpp"
isXmonadConfig x = isPrefixOf "xmonad.hs" x
isConkyConfig x = isPrefixOf ".conkyrc" x
isConfigFile x = isXmonadConfig x || isConkyConfig x
isBuddyList x = isPrefixOf "Lista de amigos" x
-- isCliApp x = isPrefixOf "Mutt" x || isPrefixOf "mutt" x
isCliApp x = isPrefixOf "Mutt" x || isPrefixOf "mutt" x ||  isPrefixOf "Im" x || isPrefixOf "im" x || isPrefixOf "IM" x
isImApp x = isPrefixOf "Im" x || isPrefixOf "im" x || isPrefixOf "IM" x
-- isCliApp x = "Mutt" == x || "mutt" == x

-- myTerminal="sakura"
-- myTerminalClass="Sakura"
myTerminal="roxterm"
myTerminalClass="Roxterm"
-- myTerminal="urxvtc"

-- runOrRaise = raiseMaybe ○ unsafeSpawn

-- Layout
-- myLayout = withIM (0.11) (Role "gimp-toolbox") $ reflectHoriz $ withIM (0.15) (Role "gimp-dock") $ reflectHoriz $ layoutHook defaultConfig 
--myLayoutHook = ewmhDesktopsLayout $ avoidStruts $ reflectHoriz $ withIM (0.16) (Role "buddy_list")$ reflectHoriz $ withIM (0.11) (Role "gimp-toolbox") $ smartBorders (myLayout)
-- myLayoutHook = avoidStruts $ reflectHoriz $ withIM (0.16) (Role "buddy_list")$ reflectHoriz $ withIM (0.11) (Role "gimp-toolbox") $ smartBorders (myLayout)
myLayoutHook = avoidStruts $ withIM (0.16) (Role "buddy_list")$ smartBorders (myLayout)
-- myLayout = tabbed shrinkText (theme wfarrTheme) ||| hintedTile Wide ||| magnify Grid
myLayout = tabbed shrinkText (theme wfarrTheme) ||| hintedTile Wide ||| Grid
       where
       hintedTile = HintedTile nmaster delta ratio TopLeft
       nmaster = 1
       ratio = toRational (2/(1+sqrt(5)::Double))
       delta = 3/100
--        magnify = magnifiercz 1.2
 
myStartupHook = do
    spawn "trayer --edge bottom --align left --widthtype request --height 18"
--     spawn "lxpanel"

myLogHookWithPP pp = do
    ewmhDesktopsLogHook
    dynamicLogWithPP pp -- $ myDzenPP din
-- >> updatePointer

-- Window rules
myManageHook = composeAll . concat $
    [
     [title =? t --> doShift "im" | t <- myComms]
--     , [title =? t --> doF (W.shift "1") | t <- myComms]
    , [className =? r   --> doIgnore | r <- myIgnores]
--    , [className =? mp  --> doF (W.shift "mp") | mp <- mediaPlayers]
--    , [className =? im  --> doF (W.shift "im") | im <- insMessenger]
--     , [className =? x --> doF (W.shift "9") | x <- pads]
    , [role =? bw  --> doShift "www" | bw <- ["browser"]]
    , [className =? f   --> doFloat | f <- myFloats]
    , [className =? w   --> doF (W.shift "2") | w <- workApps]
    ]
    where
    role = stringProperty "WM_WINDOW_ROLE"
    myComms = ["Im", "mutt", "Mutt"]
    myFloats = [ "Xmessage", "MPlayer", "mplayer2", "mpv", "Nitrogen", "Galculator", "Sonata", "Gcalctool", "xpad"]
    myIgnores = ["XClock"]
    mediaPlayers = ["Quodlibet", "Audacious"]
    insMessenger = ["Pidgin", "emesene"]
    pads = ["xpad", "Xpad"]
    workApps = ["Evince", "Mirage", "Gimp", "Inkscape", "Gvim"]

newManageHook = myManageHook -- <+> manageHook defaultConfig
 
wfarrPrompt :: XPConfig
wfarrPrompt = defaultXPConfig { font              = "xft:DejaVu Vera Sans Mono:pixelsize=13"
                              , bgColor           = "#000055"
			      , fgColor           = "#999999"
			      , fgHLight          = "#ffffff"
			      , bgHLight          = "#4c7899"
			      , promptBorderWidth = 0
			      , position          = Top
			      , height            = 18
			      , historySize       = 128 }

--myFont = "xft:DejaVu Vera Sans Mono:pixelsize=12"
myFont    = "-xos4-terminus-medium-r-normal-*-14-*-*-*-c-*-iso10646-1"
-- myFont    = "-*-terminal-*-*-*-*-14-*-*-*-*-*-*-*"
myFontBig = "-xos4-terminus-bold-r-normal-*-32-*-*-*-*-*-iso10646-1"
showSong  = spawn ("(mpc | head -n1; sleep 1.5) | dzen2 -y '20' -h '40' -fn '" ++ myFontBig ++ "' -bg '#000040' -fg '#8080CC' -e")
-- showSong  = spawn ("(mocp -i | head -2 | tail -1 | sed 's/.*\\///; s/.mp3//i'; sleep 1.5) | dzen2 -y '500' -h '40' -fn '" ++ myFontBig ++ "' -bg '#000040' -fg '#8080CC' -e")


-- Statusbars
myStatusBar = "dzen2 -x '0' -w '500' -y '0' -h '18' -ta 'l' -fg '#fff0ff' -bg '#0f0f0f' -fn '" ++ myFont ++ "'"
myTopBar = "conky | dzen2 -x '360' -w '1056' -y '0' -h '18' -ta 'r' -fg '#AAAAEE' -bg '#0f0f0f' -fn '" ++ myFont ++ "'"
myBottomBar = "conky -c ~/.config/conky/bottom |dzen2 -x '0' -w '1370' -y '750' -h '18' -ta 'r' -fg '#AAAAEE' -bg '#0f0f0f' -p -fn '" ++ myFont ++ "'"
 
-- Urgency hint options:
-- myUrgencyHook = withUrgencyHook dzenUrgencyHook
--     { args = ["-x", "0", "-y", "1010", "-h", "12", "-ta", "r", "-expand", "l", "-fg", "#0099ff", "-bg", "#0f0f0f", "-fn", myFont] }
myUrgencyHook = withUrgencyHook NoUrgencyHook
 
-- dynamicLog pretty printer for dzen:
myDzenPP h = defaultPP
    { ppCurrent = wrap "^fg(#0099ff)^bg(#333333)[^fg(#ffffff)" "^fg(#0099ff)]^fg()^bg()^p()" . \wsId -> if (':' `elem` wsId) then drop 2 wsId else wsId 
      , ppVisible = wrap "^fg(#ffffff)^bg(#333333)" "^fg()^bg()^p()" . \wsId -> if (':' `elem` wsId) then drop 2 wsId else wsId
      , ppHidden = wrap " " " "
      --ppHiddenNoWindows = wrap "^fg(#777777)^bg()^p()^i(/home/and1/.dzen/corner.xbm)" "^fg()^bg()^p()" . \wsId -> if (':' `elem` wsId) then drop 2 wsId else wsId
     , ppUrgent = wrap "^fg(#0099ff)^bg()^p()" "^fg()^bg()^p()" . \wsId -> if (':' `elem` wsId) then drop 2 wsId else wsId
     , ppSep = " "
     , ppWsSep = ""
     , ppTitle = dzenColor "#ffff77" "" . wrap "<" ">"
     , ppLayout =
         (\x -> case x of
         "IM Wide" -> "[-]"
         "IM Tabbed Simplest" -> "[|]"
         "IM Full" -> "[ ]"
--          "ReflectX IM ReflectX IM Wide" -> "[-]"
--          "ReflectX IM ReflectX IM Tabbed Simplest" -> "[|]"
--          "ReflectX IM ReflectX IM Full" -> "[ ]"
--          "Wide" -> "[-]"
--          "Tabbed Simplest" -> "[|]"
--          "Full" -> "[ ]"
         _ -> x
         )
    , ppOutput = hPutStrLn h --System.IO.UTF8.
    }
