//
//  KLViewController.m
//  KLCarousel
//
//  Created by Kalanhall@163.com on 11/29/2019.
//  Copyright (c) 2019 Kalanhall@163.com. All rights reserved.
//

#import "KLViewController.h"
#import <KLCarousel/KLCarousel.h>
@import SDWebImage;

@interface KLViewController ()

@property (strong, nonatomic) KLCarousel *carousel;

@end

@implementation KLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    
//    self.carousel = [KLCarousel carouselWithFrame:rect];
    
    KLCarouselViewLayout *layout = KLCarouselViewLayout.alloc.init;
    layout.itemSize = CGSizeMake(rect.size.width * 0.8, rect.size.height * 0.8);
    layout.itemSpacing = 10;
    layout.itemHorizontalCenter = YES;
    layout.itemVerticalCenter = YES;
    layout.layoutType = KLCarouselTransformLayoutTypeCoverflow;
    self.carousel = [KLCarousel carouselWithFrame:rect layout:layout cell:nil];
    
    self.carousel.didSelectedItemCell = ^(NSInteger index) {
        NSLog(@"Index - %@", @(index));
    };
    
    self.carousel.cellForItemAtIndex = ^(KLCarouselCell * _Nonnull cell, NSInteger index) {
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1575035592451&di=bca037f79660b2bf137c3d1cfcee4c66&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2017-12-01%2F5a20c01220da2.jpg"]];
    };
    
    [self.view addSubview:self.carousel];
    self.carousel.imageURLs = @[@"", @"", @""];
}


@end
