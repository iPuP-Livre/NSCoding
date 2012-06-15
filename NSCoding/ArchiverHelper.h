//
//  ArchiverHelper.h
//  NSCoding
//
//  Created by Marian Paul on 02/04/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArchiverHelper : NSObject
+ (NSMutableArray*)unarchiveData;
+ (BOOL)archiveArray:(NSMutableArray*)array;
@end
