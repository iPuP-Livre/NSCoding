//
//  ArchiverHelper.m
//  NSCoding
//
//  Created by Marian Paul on 02/04/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import "ArchiverHelper.h"

@implementation ArchiverHelper

+ (NSMutableArray*)unarchiveData 
{
    NSMutableArray *toReturn = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Matieres.myArchive"];
    if(path)
    {
        NSData *data;
        NSKeyedUnarchiver *unarchiver;
        
        data = [[NSData alloc] initWithContentsOfFile:path];
        if(data)
        {
            unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
            
            NSMutableArray *arrayArchived = [unarchiver decodeObjectForKey:@"Matieres"];
            toReturn = arrayArchived;
            [unarchiver finishDecoding];
        }   
    }
    return toReturn;
}

+ (BOOL)archiveArray:(NSMutableArray*)array
{
    NSMutableData *data;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *archivePath = [documentsDirectory stringByAppendingPathComponent:@"Matieres.myArchive"];
    
    NSKeyedArchiver *archiver;
    BOOL result;
    
    data = [NSMutableData data];
    archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    [archiver encodeObject:array forKey:@"Matieres"];
    [archiver finishEncoding];
    result = [data writeToFile:archivePath atomically:YES];
    
    return result;
}


@end
