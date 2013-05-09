//
//  wintelViewController.h
//  MyLED
//  Wintelsui
//  Created by  on 12-2-16.
//  Copyright (c) 2012年 IDS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wintelViewController : UIViewController

{
    CGPoint oldpoint;
    CGPoint newPoint;
    NSMutableArray *array;
    NSInteger number;
    BOOL ISPLAY;
    BOOL ISPLAYTWO;
    float du;
    float sudu;
	
	IBOutlet UIImageView *myimageview;
}

@property (retain, nonatomic) IBOutlet UIImageView *myimageview;
@property (retain, nonatomic) IBOutlet UIView *MyViewController;
@property (retain, nonatomic) IBOutlet UIButton *MyPlayOrStopButton;
@property (retain, nonatomic) IBOutlet UIButton *MyMiddleButton;

/*@property (weak, nonatomic) IBOutlet UIView *MyViewController;
@property (weak, nonatomic) IBOutlet UIButton *MyPlayOrStopButton;
@property (weak, nonatomic) IBOutlet UIButton *MyMiddleButton;*/

@property CGPoint oldpoint;
@property CGPoint newPoint;
@property (retain) NSMutableArray *array;
@property BOOL ISPLAY;
//@property (weak, nonatomic) IBOutlet UISlider *slidervalue;
@property (retain, nonatomic) IBOutlet UISlider *slidervalue;

- (IBAction)MyPlayOrStopButtonClicked:(id)sender;
- (IBAction)myClearButtonClicked:(id)sender;
- (IBAction)Suduchange:(id)sender;
@end

