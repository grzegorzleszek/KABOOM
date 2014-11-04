--
--  AppDelegate.applescript
--  KABOOM
--
--  Created by Grzegorz Leszek on 30/10/14.
--  Copyright (c) 2014 Grzegorz.Leszek. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
	
	-- IBOutlets
    property NSImage : class "NSImage"
    property NSStatusBar : class "NSStatusBar"
    property NSStatusItem : class "NSStatusItem"
    property StatusItem : ""
    property MainMenu : missing value
	
	on applicationWillFinishLaunching_(aNotification)
        set StatusItem to NSStatusBar's systemStatusBar's statusItemWithLength_(-2)
        StatusItem's setImage_(NSImage's imageNamed_("MenuIcon"))
        StatusItem's setMenu_(MainMenu)
        StatusItem's setHighlightMode_(true)
	end applicationWillFinishLaunching_
    
    on nukeXcodeAction_(object)
        
        -- remove DerivedData
        
        do shell script "rm -rf ~/Library/Developer/Xcode/DerivedData/"
        
        -- clean build
        
        tell application "Xcode"
            activate
        end tell
        
        tell application "System Events"
            tell application process "Xcode"
                click menu item "Clean" of menu 1 of menu bar item "Product" of menu bar 1
                
            end tell
        end tell
        
        -- restart simulator
        
        tell application "iOS Simulator"
            activate
        end tell
        
        tell application "System Events"
            tell process "iOS Simulator"
                tell menu bar 1
                    tell menu bar item "iOS Simulator"
                        tell menu "iOS Simulator"
                            click menu item "Reset Content and Settings…"
                        end tell
                    end tell
                end tell
                tell window 1
                    click button "Reset"
                end tell
            end tell
        end tell
        
    end nukeXcodeAction
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script