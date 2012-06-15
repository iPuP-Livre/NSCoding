//
//  Subject.h
//  NSCoding
//
//  Created by Marian Paul on 02/04/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kNumber @"number"
#define kSubjectName @"Subject"
#define kStartDate @"StartDate"
#define kColour @"CellColor"
#define kTeacher @"Teacher"
#define kRoom @"Room"

@interface Subject : NSObject <NSCoding>
- (id)initWithNumber:(int)myNumber color:(UIColor*)myColor date:(NSString*)myDate teacher:(NSString*)myTeacher subject:(NSString*)mySubject room:(NSString*)myRoom;
@property (nonatomic, assign) int number;
@property (nonatomic, retain) NSString *subject;
@property (nonatomic, retain) NSString *startDate;
@property (nonatomic, retain) UIColor *cellColor; // cet objet ne sert à rien mais vous montre simplement que l'on peut archiver n'importe quel objet implémentant le protocole NSCoding
@property (nonatomic, retain) NSString *teacher;
@property (nonatomic, retain) NSString *room;
@end
