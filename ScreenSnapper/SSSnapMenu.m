//
//  SSSnapMenu.m
//  ScreenSnapper
//
//  Created by Sam Stone on 31/03/2015.
//  Copyright (c) 2015 Sam Stone. All rights reserved.
//

#import "SSSnapMenu.h"
#import "SSScreenshotController.h"

@implementation SSSnapMenu
- (instancetype) init {
    if (self = [super init]) {
        self.saveToClipboardItem = [[NSMenuItem alloc] initWithTitle:@"Save to Clipboard"
                                                              action:@selector(saveToClipboardSelected:)
                                                       keyEquivalent:@""];
        [self addItem:self.saveToClipboardItem];
        self.saveToDiskItem = [[NSMenuItem alloc] initWithTitle:@"Save to File"
                                                         action:@selector(saveToDiskSelected:)
                                                  keyEquivalent:@""];
        [self addItem:self.saveToDiskItem];
        self.snapScreenItem = [[NSMenuItem alloc] initWithTitle:@"Snap Screen"
                                                         action:@selector(snapScreen:)
                                                  keyEquivalent:@""];
        
        [self addItem:[NSMenuItem separatorItem]];
        
        [self addItem:self.snapScreenItem];
        self.snapSelectionItem = [[NSMenuItem alloc] initWithTitle:@"Snap Selection"
                                                            action:@selector(snapSelection:)
                                                     keyEquivalent:@""];
        [self addItem:self.snapSelectionItem];
        self.snapWindowItem = [[NSMenuItem alloc] initWithTitle:@"Snap Window"
                                                         action:@selector(snapWindow:)
                                                  keyEquivalent:@""];
        [self addItem:self.snapWindowItem];
        for (NSMenuItem *item in self.itemArray) {
            item.target = [SSScreenshotController sharedInstance];
        }
        
        [self addItem:[NSMenuItem separatorItem]];
        self.quitAppItem = [[NSMenuItem alloc] initWithTitle:@"Quit"
                                                      action:@selector(terminate:)
                                               keyEquivalent:@""];
        self.quitAppItem.target = [NSApplication sharedApplication];
        [self addItem:self.quitAppItem];
    }
    return self;
}
@end