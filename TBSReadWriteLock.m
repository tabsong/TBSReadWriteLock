//
//  TBSReadWriteLock.m
//
//  Created by tabsong on 15/5/15.
//  Copyright (c) 2015年 tabsong. All rights reserved.
//

#import "TBSReadWriteLock.h"
#import <pthread.h>

@interface TBSReadWriteLock ()
{
    pthread_rwlock_t rwlock;
}

@end

@implementation TBSReadWriteLock

#pragma mark - Interface

/*!
 *  @brief  写者 加锁.
 *
 *  @return 0表示成功, 非0表示error.
 */
- (int)TBS_WriterLock
{
    return pthread_rwlock_wrlock(&rwlock);
}

/*!
 *  @brief  读者 加锁.
 *
 *  @return 0表示成功, 非0表示error.
 */
- (int)TBS_ReaderLock
{
    return pthread_rwlock_rdlock(&rwlock);
}

/*!
 *  @brief  通用 释放锁.
 *
 *  @return 0表示成功, 非0表示error.
 */
- (int)TBS_Unlock
{
    return pthread_rwlock_unlock(&rwlock);
}

#pragma mark - Life Cycle

- (id)init
{
    if (self = [super init])
    {
        pthread_rwlock_init(&rwlock, NULL);
    }
    
    return self;
}

- (void)dealloc
{
    pthread_rwlock_destroy(&rwlock);
}

@end
