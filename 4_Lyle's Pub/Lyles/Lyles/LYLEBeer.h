#import <Foundation/Foundation.h>

@interface LYLEBeer : NSObject
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *category;

- (NSString *)price;

- (instancetype)initWithName:(NSString *)name category:(NSString *)category price:(double)price;

@end
