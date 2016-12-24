#import "LYLEBeer.h"

@implementation LYLEBeer {
  double rawPrice;
}

- (instancetype)initWithName:(NSString *)name category:(NSString *)category price:(double)price {
  if (self = [super init]) {
    _name = name;
    _category = category;
    rawPrice = price;
    return self;
  } else {
    return nil;
  }
}

- (NSString *)price {
  return [NSString stringWithFormat:@"$ %.2f", rawPrice];
}

@end
