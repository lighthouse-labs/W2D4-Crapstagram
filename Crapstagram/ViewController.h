//
//  ViewController.h
//  Crapstagram
//
//  Created by Ian MacKinnon on 2015-03-19.
//  Copyright (c) 2015 Ian MacKinnon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property(nonatomic, weak) IBOutlet UIButton *helloButton;
@property(nonatomic, weak) IBOutlet UISlider *slider;

@property(nonatomic, weak) IBOutlet UIImageView *selectedImage;


-(IBAction)sayHello:(id)sender;

-(IBAction)takePicture:(id)sender;

@end

