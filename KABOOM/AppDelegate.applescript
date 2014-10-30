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
	property theWindow : missing value
	
	on applicationWillFinishLaunching_(aNotification)
        -- remove DerivedData
        
        do shell script "rm -r -- ~/Library/Developer/Xcode/DerivedData/*"
        
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
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script