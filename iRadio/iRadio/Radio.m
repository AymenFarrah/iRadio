//
//  Radio.m
//  iRadio
//
//  Created by Aymen on 13/02/2016.
//  Copyright © 2016 Farrah. All rights reserved.
//

#import "Radio.h"

static NSString *kName = @"name";
static NSString *kDesc = @"desc";
static NSString *kUrl = @"url";
static NSString *kImage = @"image";


@implementation Radio



#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:_name forKey:kName];
    [encoder encodeObject:_desc forKey:kDesc];
    [encoder encodeObject:_url forKey:kUrl];
    [encoder encodeObject:_image forKey:kImage];
    
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self.name = [decoder decodeObjectForKey:kName];
    self.desc = [decoder decodeObjectForKey:kDesc];
    self.url = [decoder decodeObjectForKey:kUrl];
    self.image = [decoder decodeObjectForKey:kImage];
    
    return self;
}

#pragma mark -
#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    Radio *radio = [[Radio allocWithZone:zone] init];
    
    radio.name = [_name copy];
    radio.desc = [_desc copy];
    radio.url = [_url copy];
    radio.image = [_image copy];
    
    return radio;
}

@end
