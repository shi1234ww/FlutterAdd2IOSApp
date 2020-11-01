//
//  PeriodCalenderSubTitleFomatter.m
//  FSCalendarExample
//
//  Created by shi1234ww on 2020/10/30.
//  Copyright © 2020 wenchaoios. All rights reserved.
//

#import "PeriodCalenderSubTitleFomatter.h"
#import "NSDate+Utilities.h"

@interface PeriodCalenderSubTitleFomatter ()
@property (strong, nonatomic) NSCalendar *calendar;
@property (strong, nonatomic) NSDateFormatter *formatter;

@end

@implementation PeriodCalenderSubTitleFomatter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierISO8601];
        self.formatter = [[NSDateFormatter alloc] init];
        self.formatter.calendar = self.calendar;
        self.formatter.dateFormat = @"M";
    }
    return self;
}

// 不可订 || 已满 || 余 999 || ¥99

// 10.30 || 11.1 || 11.2  || 11.3
- (NSString *)periodStringFromDate:(NSDate *)date{
    
    NSLog(@"date: %@====> month:%ld, day:%ld ,  year:%ld", date , date.month , (long)date.day, date.year);
    
    if (date.month == 11 && date.day == 1) {
        return @"已满";
    }else if (date.month == 11 && date.day == 2){
        return @"余 999";
    }else if (date.month == 11 && date.day == 3){
        return @"¥99";
    }else{
        return @"不可订";        
    }
    
}

@end

//NSInteger day = [self.chineseCalendar component:NSCalendarUnitDay fromDate:date];
//    if (day != 1) {
//        return self.lunarDays[day-2];
//    }
//    // First day of month
//    NSString *monthString = [self.formatter stringFromDate:date];
//    if ([self.chineseCalendar.veryShortMonthSymbols containsObject:monthString]) {
//        return self.lunarMonths[monthString.integerValue-1];
//    }
//    // Leap month
//    NSInteger month = [self.chineseCalendar component:NSCalendarUnitMonth fromDate:date];
//    monthString = [NSString stringWithFormat:@"闰%@", self.lunarMonths[month-1]];
//    return monthString;
