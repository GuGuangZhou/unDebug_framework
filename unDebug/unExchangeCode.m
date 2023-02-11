//
//  unExchangeCode.m
//  unResign
//
//  Created by xinxi on 2021/5/06.
//

#import "unExchangeCode.h"
#import <objc/message.h>
#import "fishhook.h"

@implementation unExchangeCode

+ (void)load
{
    //针对某个类中重要代码进行检测
    /**
     
     Method old = class_getInstanceMethod(objc_getClass("ViewController"), @selector(btnClick1:));
     Method new = class_getInstanceMethod(self, @selector(click1Hook:));
     method_exchangeImplementations(old, new);
     
     struct rebinding bd1;
     bd1.name = "method_exchangeImplementations";
     bd1.replacement = myExchange;
     bd1.replaced = (void *)&exchangeP;
     
     struct rebinding bd2;
     bd2.name = "method_getImplementation";
     bd2.replacement = myExchange;
     bd2.replaced = (void *)&getIMP;
     
     struct rebinding bd3;
     bd3.name = "method_setImplementation";
     bd3.replacement = myExchange;
     bd3.replaced = (void *)&setIMP;
     
     struct rebinding rebindings[] = {bd1,bd2,bd3};
     rebind_symbols(rebindings, 3);
     
     */
}

//保存原来的交换函数
IMP _Nonnull (*setIMP)(Method _Nonnull m, IMP _Nonnull imp);
IMP _Nonnull (*getIMP)(Method _Nonnull m);
void (*exchangeP)(Method _Nonnull m1, Method _Nonnull m2);

void myExchange(Method _Nonnull m1, Method _Nonnull m2){
    
    // 检测到hook
    // 退出
    asm(
        "mov X0, #0\n"
        "mov w16, #1\n"
        "svc #0x80"
    );
}

-(void)click1Hook:(id)sender
{
    //原方法 ----- 没有被hook
}

@end
