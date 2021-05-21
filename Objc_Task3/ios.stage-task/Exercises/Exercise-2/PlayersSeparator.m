#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
        
    if ([ratingArray count] < 3) {
        return 0;
    }
    
    NSMutableArray *increaseBuffer;
    NSMutableArray *decreaseBuffer;
    NSMutableSet *finalSet = [NSMutableSet new];
    
    for (int i = 0; i < [ratingArray count] - 2; i++) {
        
        increaseBuffer = [[NSMutableArray alloc] initWithObjects:ratingArray[i], nil];
        decreaseBuffer = [[NSMutableArray alloc] initWithObjects:ratingArray[i], nil];
        
        for (int j = i+1; j < [ratingArray count]; j++) {
            if ([increaseBuffer count] > 1) {
                [increaseBuffer removeLastObject];
            }
            
            if ([decreaseBuffer count] > 1) {
                [decreaseBuffer removeLastObject];
            }
            
            if ([ratingArray[j] intValue] > [[increaseBuffer lastObject] intValue]) {
                [increaseBuffer addObject:[ratingArray objectAtIndex:j]];
            } else if ([[ratingArray objectAtIndex:j] intValue] < [[decreaseBuffer lastObject] intValue]) {
                [decreaseBuffer addObject:[ratingArray objectAtIndex:j]];
            }
            
            for (int k = j+1; k < [ratingArray count]; k++) {
                if ([ratingArray[k] intValue] > [[increaseBuffer lastObject] intValue]) {
                    [increaseBuffer addObject:[ratingArray objectAtIndex:k]];
                } else if ([[ratingArray objectAtIndex:k] intValue] < [[decreaseBuffer lastObject] intValue]) {
                    [decreaseBuffer addObject:[ratingArray objectAtIndex:k]];
                }
                
                if ([increaseBuffer count] > 2) {
                    [finalSet addObject: [[increaseBuffer valueForKey:@"description"] componentsJoinedByString:@""]];
                    [increaseBuffer removeLastObject];
                }
                
                if ([decreaseBuffer count] > 2) {
                    [finalSet addObject: [[decreaseBuffer valueForKey:@"description"] componentsJoinedByString:@""]];
                    [decreaseBuffer removeLastObject];
                }
                
            }
            
        }
    }
    return [finalSet count];
}

@end
