//
//  ViewController.m
//  Crapstagram
//
//  Created by Ian MacKinnon on 2015-03-19.
//  Copyright (c) 2015 Ian MacKinnon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
    CGPoint startLocation;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(sayHello:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;

    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPan:)];
    
    [self.view addGestureRecognizer:panGesture];
}

- (void)didPan:(UIPanGestureRecognizer *)sender {
    CGFloat distance =0.0;
    
    if (startLocation.x != 0.0){
        CGPoint currentLocation = [sender locationInView:self.view];
        CGFloat dx = currentLocation.x - startLocation.x;
        CGFloat dy = currentLocation.y - startLocation.y;
        distance = sqrt(dx*dx + dy*dy );
        NSLog(@"Distance: %f", distance);
    }
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        startLocation = [sender locationInView:self.view];
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"YOU DONE SWIPED" message:[NSString stringWithFormat:@"%f", distance] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    }
}


-(IBAction)sayHello:(id)sender{
    
    NSString *message = [NSString stringWithFormat:@"slider is currently at %f", self.slider.value];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    
}

-(IBAction)takePicture:(id)sender{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:imagePicker animated:true completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self.selectedImage setImage:originalImage];
    
    [picker dismissViewControllerAnimated:false completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
