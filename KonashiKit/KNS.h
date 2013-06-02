//
//  Created by TAKAHASHI kazuyuki on 2013/06/02.
//


#import <Foundation/Foundation.h>


@interface KNS : NSObject

+ (instancetype)sharedInstance;

@property (copy, nonatomic) NSString *peripheralName;
@property (assign, nonatomic) BOOL usesLastPeripheralName;

- (void)find:(void(^)())completionBlock;

@end
