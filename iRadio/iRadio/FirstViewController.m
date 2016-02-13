//
//  FirstViewController.m
//  iRadio
//
//  Created by Aymen on 13/02/2016.
//  Copyright © 2016 Farrah. All rights reserved.
//

#import "FirstViewController.h"
#import "Radio.h"

#import <StreamingKit/STKAudioPlayer.h>

@interface FirstViewController () <STKAudioPlayerDelegate>
{
    
        STKAudioPlayer* audioPlayer;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    audioPlayer = [[STKAudioPlayer alloc] initWithOptions:(STKAudioPlayerOptions){ .flushQueueOnSeek = YES, .enableVolumeMixer = NO, .equalizerBandFrequencies = {50, 100, 200, 400, 800, 1600, 2600, 16000} }];
    audioPlayer.meteringEnabled = YES;
    audioPlayer.delegate = self;
    audioPlayer.volume = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)play:(id)sender
{
    NSURL* url = [NSURL URLWithString:@"http://radio.mosaiquefm.net:8000/mosalive"];
    
    STKDataSource* dataSource = [STKAudioPlayer dataSourceFromURL:url];
    
    Radio *radio = [[Radio alloc] init];
    
    [audioPlayer setDataSource:dataSource withQueueItemId:radio];
}


/// Raised when an item has started playing
-(void) audioPlayer:(STKAudioPlayer*)audioPlayer didStartPlayingQueueItemId:(NSObject*)queueItemId
{
    NSLog(@"didStartPlayingQueueItemId = %@",queueItemId);
}
-(void) audioPlayer:(STKAudioPlayer*)audioPlayer didFinishBufferingSourceWithQueueItemId:(NSObject*)queueItemId
{
        NSLog(@"didFinishBufferingSourceWithQueueItemId = %@",queueItemId);
}

-(void) audioPlayer:(STKAudioPlayer*)audioPlayer stateChanged:(STKAudioPlayerState)state previousState:(STKAudioPlayerState)previousState
{
    NSLog(@"stateChanged = %ld",(long)state);
}

-(void) audioPlayer:(STKAudioPlayer*)audioPlayer didFinishPlayingQueueItemId:(NSObject*)queueItemId withReason:(STKAudioPlayerStopReason)stopReason andProgress:(double)progress andDuration:(double)duration
{
    NSLog(@"didFinishPlayingQueueItemId = %@",queueItemId);
}

-(void) audioPlayer:(STKAudioPlayer*)audioPlayer unexpectedError:(STKAudioPlayerErrorCode)errorCode
{
    NSLog(@"unexpectedError = %ld",(long)errorCode);
}


-(void) audioPlayer:(STKAudioPlayer*)audioPlayer logInfo:(NSString*)line
{
    NSLog(@"logInfo = %@",line);
}

-(void) audioPlayer:(STKAudioPlayer*)audioPlayer didCancelQueuedItems:(NSArray*)queuedItems
{
    NSLog(@"didCancelQueuedItems = %@",queuedItems);
}


@end
