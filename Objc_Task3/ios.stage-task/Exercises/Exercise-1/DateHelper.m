#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (0 < monthNumber && monthNumber <= 12) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        NSString *monthName = [[dateFormatter monthSymbols] objectAtIndex:monthNumber - 1];
        return monthName;
    }
    
    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    
    NSDate *parsedDate = [dateFormatter dateFromString:date];
    long day = [calendar component:NSCalendarUnitDay fromDate:parsedDate];
    
    return day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setLocale: [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"]];
    
    NSInteger dayNumber = [calendar component:NSCalendarUnitWeekday fromDate:date];
    
    if (dayNumber) {
        return [[dateFormatter shortWeekdaySymbols] objectAtIndex:dayNumber - 1];
    }
    
    return nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierCoptic];
    NSDate *weekBegin;
    NSDate *weekEnd;
    NSTimeInterval interval;
    
    [calendar rangeOfUnit:NSCalendarUnitWeekOfMonth
                startDate:&weekBegin
                 interval:&interval
                  forDate:[NSDate now]];
    
    weekEnd = [weekBegin dateByAddingTimeInterval:interval-1];
    
    if (date > weekBegin && date < weekEnd) {
        return YES;
    }
    return NO;
}

@end
