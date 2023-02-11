//
//  unSystemCode.m
//  unDebug
//
//  Created by xinxi on 2021/5/06.
//

#import "unSystemCode.h"
#import "myPtrace.h"
#import <sys/sysctl.h>

@implementation unSystemCode

//检测是否被调试
BOOL isDebugger(void)
{
    /**
     查询信息：控制码
     1. 查内核
     2. 查询进程
     3. 进程ID
     4. 进程参数
     */
    
    int name[4];
    
    name[0] = CTL_KERN;
    name[1] = KERN_PROC;
    name[2] = KERN_PROC_PID;
    name[3] = getpid();
    
    struct kinfo_proc info;
    size_t info_size = sizeof(info);
    int error = sysctl(name, sizeof(name)/sizeof(*name), &info, &info_size, 0, 0);
    assert(error == 0);
    
    return ((info.kp_proc.p_flag & P_TRACED) != 0);
}

static void unDebugFunc(){
    
    if (isDebugger()) {
        NSLog(@"进程被调试 --- 使用了debugserver");
    }
    
    // 汇编调用ptrace函数
    asm(
        "mov X0, #31\n"
        "mov X1, #0\n"
        "mov X2, #0\n"
        "mov X3, #0\n"
        "mov w16, #26\n"
        "svc #0x80"
        );
}

+ (void)load
{
    unDebugFunc();
}

@end
