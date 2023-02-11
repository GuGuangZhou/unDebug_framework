//
//  NSObject+Codesign.h
//  unDebug
//
//  Created by xinxi on 2021/5/06.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Codesign)

//检测TeamID
void checkCodesign(NSString *id);

@end

NS_ASSUME_NONNULL_END
