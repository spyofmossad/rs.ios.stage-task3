#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSString *firstString = [[NSString alloc] initWithString: string1];
    NSString *secondString = [[NSString alloc] initWithString: string2];
    NSMutableString *compositeString = [[NSMutableString alloc] init];
    
    while ([firstString length] && [secondString length]) {
        const char *first = [firstString UTF8String];
        const char *second = [secondString UTF8String];
        
        if (first[0] < second[0] || first[0] == second[0]) {
            [compositeString appendString: [firstString substringToIndex: 1]];
            firstString = [firstString substringFromIndex: 1];
        } else {
            [compositeString appendString: [secondString substringToIndex: 1]];
            secondString = [secondString substringFromIndex: 1];
        }
    }
    
    if ([firstString length]) {
        [compositeString appendString: firstString];
    } else {
        [compositeString appendString: secondString];
    }
    
    return compositeString;
}

@end
