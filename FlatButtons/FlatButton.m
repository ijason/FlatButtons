//
//  FlatButton.m
//  FlatButtons
//
//  Created by JASON EVERETT on 6/22/13.
//  Copyright (c) 2013 JASON EVERETT. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import "FlatButton.h"
#import <QuartzCore/QuartzCore.h>

@interface FlatButton()
-(void)wasPressed;
-(void)endedPress;
-(void)makeFlat:(FlatButton*)button withBackgroundColor:(UIColor*)backgroundColor;
@end

@implementation FlatButton

- (id)initWithFrame:(CGRect)frame withBackgroundColor:(UIColor*)backgroundColor
{
    self = [super initWithFrame:frame];
    if (self) {
        [self makeFlat:self withBackgroundColor:backgroundColor];
    }
    return self;
}

-(void)makeFlat:(FlatButton*)button withBackgroundColor:(UIColor*)backgroundColor
{
    //save our color so we can alter it upon a touch event
    self.myColor = backgroundColor;
    [self setBackgroundColor:backgroundColor];
    [self addTarget:self action:@selector(wasPressed) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(endedPress) forControlEvents:UIControlEventTouchUpInside];
}

//When button is touched, grab our existing color and make it 20% darker (or lighter if its black)
//We will return it to its original state when the touch is lifted and touchesEnded:withEvent: is called
-(void)wasPressed
{
    UIColor *newColor;
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0, white = 0.0;
    
    //Check if we're working with atleast iOS 5.0
    if([self.myColor respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self.myColor getRed:&red green:&green blue:&blue alpha:&alpha];
        [self.myColor getWhite:&white alpha:&alpha];
        
        //test if we're working with a grayscale, black or RGB color
        if(!(red + green + blue) && white){
            //grayscale
            newColor = [UIColor colorWithWhite:white - 0.2 alpha:alpha];
        } else if(!(red + green + blue) && !white) {
            //black
            newColor = [UIColor colorWithWhite:white + 0.2 alpha:alpha];
        } else{
            //RGB
            newColor = [UIColor colorWithRed:red - 0.2 green:green - 0.2 blue:blue - 0.2 alpha:alpha];
        }
    } else if(CGColorGetNumberOfComponents(self.myColor.CGColor) == 4) {
        //for earlier than ios 5
        const CGFloat *components = CGColorGetComponents(self.myColor.CGColor);
        red = components[0];
        green = components[1];
        blue = components[2];
        alpha = components[3];
        
        newColor = [UIColor colorWithRed:red - 0.2 green:green - 0.2 blue:blue - 0.2 alpha:alpha];
    } else if(CGColorGetNumberOfComponents(self.myColor.CGColor) == 2){
        //if we have a non-RGB color
        CGFloat hue;
        CGFloat saturation;
        CGFloat brightness;
        [self.myColor getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
        
        newColor = [UIColor colorWithHue:hue - 0.2 saturation:saturation - 0.2 brightness:brightness - 0.2 alpha:alpha];
    }
    
    self.backgroundColor = newColor;
    
}

-(void)endedPress
{
    //Reset our button to its original color
    self.backgroundColor = self.myColor;
}

@end
