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
    [self.view addSubview:self.carousel];
    
    self.carousel.cellForItemAtIndex = ^(KLCarouselCell * _Nonnull cell, NSArray * _Nonnull images, NSInteger index) {
          [cell.imageView sd_setImageWithURL:[NSURL URLWithString:images[index]]];
    };
    
    self.carousel.didSelectedItemCell = ^(NSInteger index) {
        NSLog(@"Index - %@", @(index));
    };
    
    
    // 模拟网络数据源
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.carousel.images = @[@"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2373773158,2067703814&fm=26&gp=0.jpg",
            @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1575283456550&di=372bae7542877af3f89f92831c18a196&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201610%2F12%2F20161012124101_aX4Cf.png",
            @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1575283456550&di=6b426d81feebc8e60676a1caae07450f&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201610%2F13%2F20161013192818_AHfhJ.jpeg"];
            [self.carousel reloadData];
    });
}


@end
