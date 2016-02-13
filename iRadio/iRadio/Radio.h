//
//  Radio.h
//  iRadio
//
//  Created by Aymen on 13/02/2016.
//  Copyright © 2016 Farrah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Radio : NSObject <NSCopying, NSCoding>

@property (nonatomic, strong) NSString          *name;
@property (nonatomic, strong) NSString          *desc;
@property (nonatomic, strong) NSURL             *url;
@property (nonatomic, strong) UIImageView       *image;

@end
