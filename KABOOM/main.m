//
//  main.m
//  KABOOM
//
//  Created by Grzegorz Leszek on 30/10/14.
//  Copyright (c) 2014 Grzegorz.Leszek. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[]) {
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}
