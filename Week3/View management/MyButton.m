//
//  MyButton.m
//  ViewManagement
//
//  Created by Victor Baro on 26/05/2014.
//  Copyright (c) 2014 Victor Baro. All rights reserved.
//

#import "MyButton.h"

@interface MyButton ()
@property (nonatomic, strong) UIView *shadow;
@end


@implementation MyButton

//OVERRIDE ORIGINAL
- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame title:@"set title" color:[UIColor redColor]];
}

//DESIGNATED INITIALIZER
- (id) initWithFrame:(CGRect)frame
               title:(NSString *)theTitle
               color:(UIColor *)fillColor {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _title = theTitle;
        self.backgroundColor = fillColor;
        [self setup];
    }
    return self;
}


- (void) setup {
    
    UILabel *buttonTitle = [[UILabel alloc]initWithFrame:CGRectInset(self.bounds, 10, 10)];
    buttonTitle.text = self.title;
    buttonTitle.textColor = [UIColor whiteColor];
    buttonTitle.textAlignment = NSTextAlignmentCenter;
    [self addSubview:buttonTitle];
    
    CGFloat shadowHeight = 5;
    self.shadow = [[UIView alloc]initWithFrame:CGRectMake(0,
                                                          self.bounds.size.height - shadowHeight,
                                                          
                                                          self.bounds.size.width,
                                                          
                                                          shadowHeight)];
    self.shadow.backgroundColor = [UIColor blackColor];
    self.shadow.alpha = 0.2;
    [self addSubview:self.shadow];
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.shadow.frame = self.bounds;
    NSLog(@"MyButton has been touched");
    
    
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    CGFloat shadowHeight = 5;
    self.shadow.frame = CGRectMake(0,
                                   self.bounds.size.height - shadowHeight,
                                   self.bounds.size.width,
                                   shadowHeight);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code

    
}
*/

@end
