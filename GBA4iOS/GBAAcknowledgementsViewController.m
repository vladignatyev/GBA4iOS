//
//  GBAAcknowledgementsViewController.m
//  GBA4iOS
//
//  Created by Riley Testut on 9/3/14.
//  Copyright (c) 2014 Riley Testut. All rights reserved.
//

#import "GBAAcknowledgementsViewController.h"

@interface GBAAcknowledgementsViewController ()

@property (strong, nonatomic) UIWebView *textView;

@end

@implementation GBAAcknowledgementsViewController

- (instancetype)init
{
    self = [super initWithNibName:@"Settings" bundle:nil];
    if (self)
    {
        self.title = NSLocalizedString(@"Acknowledgements", @"");
    }
    
    return self;
}

- (void)loadView
{
    UIWebView *textView = [UIWebView new];
    
    self.view = textView;
    self.textView = textView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"Acknowledgements" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [self.textView loadHTMLString:htmlString baseURL:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
