//
//  WLDetailViewController.m
//  WebList
//
//  Created by Joshua Howland on 7/1/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "WLDetailViewController.h"
#import <WebKit/WebKit.h>

@interface WLDetailViewController ()

- (void)configureView;

@property (strong, nonatomic) WKWebView *webView;

@end

@implementation WLDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        
        NSURL *url = [NSURL URLWithString:self.detailItem];
        
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        
        if (self.webView) {
            [self.webView loadRequest:urlRequest];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.webView];
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
