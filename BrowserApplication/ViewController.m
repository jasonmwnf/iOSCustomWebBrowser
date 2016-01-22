//
//  ViewController.m
//  BrowserApplication
//
//  Created by Jason Williams on 2016-01-22.
//  Copyright © 2016 Screaming Goat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@", self.searchBar.text]]]];
    [self.webView addSubview:self.indicator];
    [self.searchBar resignFirstResponder];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/2.0) target:self selector:@selector(loading) userInfo:nil repeats:YES];
    
    
    
}

-(void)loading {
    
    if (!self.webView.loading)
        [self.indicator stopAnimating];
    else
        [self.indicator startAnimating];
    
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
 
    self.searchBar.text = nil;
    [self.searchBar resignFirstResponder];
    
}


@end
