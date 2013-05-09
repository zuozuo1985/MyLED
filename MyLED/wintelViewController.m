//
//  wintelViewController.m
//  MyLED
//  Wintelsui
//  Created by  on 12-2-16.
//  Copyright (c) 2012年 IDS. All rights reserved.
//

#import "wintelViewController.h"

/*@interface wintelViewController ()
{
    CGPoint oldpoint;
    CGPoint newPoint;
    NSMutableArray *array;
    NSInteger number;
    BOOL ISPLAY;
    BOOL ISPLAYTWO;
    float du;
    float sudu;
}

@property (weak, nonatomic) IBOutlet UIImageView *myimageview;
@property (weak, nonatomic) IBOutlet UIView *MyViewController;
@property (weak, nonatomic) IBOutlet UIButton *MyPlayOrStopButton;
@property (weak, nonatomic) IBOutlet UIButton *MyMiddleButton;

@property CGPoint oldpoint;
@property CGPoint newPoint;
@property (retain) NSMutableArray *array;
@property BOOL ISPLAY;
@property (weak, nonatomic) IBOutlet UISlider *slidervalue;

- (IBAction)MyPlayOrStopButtonClicked:(id)sender;
- (IBAction)myClearButtonClicked:(id)sender;
- (IBAction)Suduchange:(id)sender;
@end*/

@implementation wintelViewController
@synthesize myimageview;
@synthesize MyViewController;
@synthesize MyPlayOrStopButton;
@synthesize MyMiddleButton;
@synthesize oldpoint;
@synthesize newPoint;
@synthesize array;
@synthesize ISPLAY;
@synthesize slidervalue;

- (void)viewDidLoad
{
    [super viewDidLoad];
    array = [[NSMutableArray alloc] initWithCapacity:1];
    [MyPlayOrStopButton setTitle:@"PLAY" forState:UIControlStateNormal];
    self.ISPLAY = NO;
    ISPLAYTWO = NO;
    sudu = slidervalue.value;
}

- (void)viewDidUnload
{
    [self setMyimageview:nil];
    [self setMyPlayOrStopButton:nil];
    [self setMyViewController:nil];
    [self setMyMiddleButton:nil];
    [self setSlidervalue:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{    
    UITouch *touch = [touches anyObject];
    oldpoint = [touch locationInView:self.view];
    int x = oldpoint.x;
    int y = oldpoint.y;
    x = x - x%10;
    y = y - y%10;
    oldpoint.x = x;
    oldpoint.y = y;
    if (oldpoint.y < 280) {
        [self addbutton:oldpoint.x with:oldpoint.y];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    newPoint = [touch locationInView:self.view];
    int x = newPoint.x;
    int y = newPoint.y;
    x = x - x%10;
    y = y - y%10;
    newPoint.x = x;
    newPoint.y = y;
    if (newPoint.y<280) {
        if (fabs(newPoint.x - oldpoint.x) >=10 || fabs(newPoint.y - oldpoint.y) >=10) {
            [self addbutton:newPoint.x with:newPoint.y];
            oldpoint = newPoint;
        }
    }else {
        oldpoint = newPoint;
    }
    
}

-(void)addbutton:(float)a with:(float)b {
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(a, b, 10, 10)];
    bt.enabled = NO;
    [bt setBackgroundColor:[UIColor clearColor]];
    [bt setImage:[UIImage imageNamed:@"dy.png"] forState:UIControlStateNormal];
    [bt setImage:[UIImage imageNamed:@"dy.png"] forState:UIControlStateHighlighted];
    [bt setImage:[UIImage imageNamed:@"dy.png"] forState:UIControlStateDisabled];
    [self.myimageview addSubview:bt];
    [array addObject:bt];
}

- (IBAction)MyPlayOrStopButtonClicked:(id)sender {
    if (self.ISPLAY == NO) {
        self.ISPLAY = YES;
        [MyPlayOrStopButton setTitle:@"STOP" forState:UIControlStateNormal];
    }else {
        self.ISPLAY = NO;
        [MyPlayOrStopButton setTitle:@"PLAY" forState:UIControlStateNormal];
    }
    [self RunButton];
}

-(void)RunButton {
    [UIView animateWithDuration:sudu delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        if (ISPLAYTWO == NO) {
            ISPLAYTWO = YES;
            du = M_PI_4;
        }else {
            ISPLAYTWO = NO;
            du = 0;
        }
        for (UIButton *bt in array) {
            MyMiddleButton.transform = CGAffineTransformMakeRotation(du);
        }
        
    } completion:^(BOOL finished) {
        for (UIButton *bt in array) {
            CGRect rect = bt.frame;
            if (rect.origin.x == -50) {
                rect.origin.x = 480;
            }else {
                rect.origin.x -= 10;
            }
            bt.frame = rect;
        }
        if (ISPLAY == YES) {
            [self RunButton];
        }
    }];
}

- (IBAction)myClearButtonClicked:(id)sender {
    for (id bt in array) {
        [bt removeFromSuperview];
    }
}

- (IBAction)Suduchange:(id)sender {
    sudu = slidervalue.value;
}
@end
