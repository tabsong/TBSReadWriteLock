//
//  TBSReadWriteLock.h
//  QMapKit
//
//  Created by tabsong on 15/5/15.
//  Copyright (c) 2015年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

// 读写锁, 用来处理读并发的应用场景.
// 1> 写写互斥
// 2> 写读互斥
// 3> 读读并发
@interface TBSReadWriteLock : NSObject

/*!
 *  @brief  写者 加锁(阻塞态).
 *
 *  @return 0表示成功, 非0表示error.
 */
- (int)TBS_WriterLock;

/*!
 *  @brief  读者 加锁(阻塞态).
 *
 *  @return 0表示成功, 非0表示error.
 */
- (int)TBS_ReaderLock;

/*!
 *  @brief  通用 释放锁.
 *
 *  @return 0表示成功, 非0表示error.
 */
- (int)TBS_Unlock;

@end
