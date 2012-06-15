//
//  Subject.m
//  NSCoding
//
//  Created by Marian Paul on 02/04/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import "Subject.h"

@implementation Subject
@synthesize number = _number, subject = _subject, startDate = _startDate, cellColor = _cellColor, teacher = _teacher, room = _room;

- (NSString*) description 
{
    return [NSString stringWithFormat:@"Number %d — Date %@ - Subject %@", _number, _startDate, _subject];
}

- (id)initWithNumber:(int)myNumber color:(UIColor*)myColor date:(NSString*)myDate teacher:(NSString*)myTeacher subject:(NSString*)mySubject room:(NSString*)myRoom 
{
    
    if (self = [super init]) {
        self.number = myNumber;
        self.cellColor = myColor;
        self.startDate = myDate;
        self.teacher = myTeacher;
        self.subject = mySubject;
        self.room = myRoom;
    }
    return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)coder 
{
    [coder encodeInt:self.number forKey:kNumber];
    [coder encodeObject:self.cellColor forKey:kColour];
    [coder encodeObject:self.startDate forKey:kStartDate];
    [coder encodeObject:self.teacher forKey:kTeacher];
    [coder encodeObject:self.room forKey:kRoom];
    [coder encodeObject:self.subject forKey:kSubjectName];
    
}
- (id)initWithCoder:(NSCoder *)coder 
{
    if (self = [super init]) {
        self.number = [coder decodeIntForKey:kNumber];
        self.cellColor = [coder decodeObjectForKey:kColour];
        self.startDate = [coder decodeObjectForKey:kStartDate];
        self.teacher = [coder decodeObjectForKey:kTeacher];
        self.subject = [coder decodeObjectForKey:kSubjectName];
        self.room = [coder decodeObjectForKey:kRoom]; 
    }
    return self;
}

@end
