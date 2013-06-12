//
//  PTMetricImperialConversions.m
//  Personal Library for Metric <=> Imperial conversions
//
//  Created by Richard Holland on 07/06/2013.
//  Copyright (c) 2013 Richard Holland. All rights reserved.
//
//  Used to convert between metric and imperial as needed.
//

#import "PTMetricImperialConversions.h"

@implementation PTMetricImperialConversions

+(NSNumber *)convertCMtoIN:(NSNumber *)value
{
  NSDecimalNumber *number = [[NSDecimalNumber alloc] initWithDecimal:[value decimalValue]];
  NSDecimalNumber *divisor = [[NSDecimalNumber alloc] initWithFloat:2.54];
  NSDecimalNumber *convertedValue = [number decimalNumberByDividingBy:divisor withBehavior:[NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:3 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO]];
  return convertedValue;
}

+(NSNumber *)convertINtoCM:(NSNumber *)value
{
  NSDecimalNumber *number = [[NSDecimalNumber alloc] initWithDecimal:[value decimalValue]];
  NSDecimalNumber *multiplicand = [[NSDecimalNumber alloc] initWithFloat:2.54];
  NSDecimalNumber *convertedValue = [number decimalNumberByMultiplyingBy:multiplicand withBehavior:[NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:3 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO]];
  return convertedValue;
}

+(NSNumber *)convertKGtoLB:(NSNumber *)value
{
  NSDecimalNumber *number = [[NSDecimalNumber alloc] initWithDecimal:[value decimalValue]];
  NSDecimalNumber *multiplicand = [[NSDecimalNumber alloc] initWithFloat:2.20462262];
  NSDecimalNumber *convertedValue = [number decimalNumberByMultiplyingBy:multiplicand withBehavior:[NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:3 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO]];
  return convertedValue;
}

+(NSNumber *)convertLBtoKG:(NSNumber *)value
{
  NSDecimalNumber *number = [[NSDecimalNumber alloc] initWithDecimal:[value decimalValue]];
  NSDecimalNumber *divisor = [[NSDecimalNumber alloc] initWithFloat:2.20462262];
  NSDecimalNumber *convertedValue = [number decimalNumberByDividingBy:divisor withBehavior:[NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:3 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO]];
  return convertedValue;
}

+(NSNumber *)convertStonesAndPoundsStringtoLB:(NSString *)value
// Expected format "00st 00lb"
{
  NSMutableCharacterSet *specialSet = [[NSMutableCharacterSet alloc] init];
  [specialSet addCharactersInString:@" stlb"];
  NSArray *tempArray = [value componentsSeparatedByCharactersInSet:specialSet];
  NSDecimalNumber *stones = [[NSDecimalNumber alloc] initWithInt:[[tempArray objectAtIndex:0] integerValue]];
  NSDecimalNumber *lbs = [[NSDecimalNumber alloc] initWithFloat:[[tempArray objectAtIndex:3] floatValue]];
  NSDecimalNumber *multiplicand = [[NSDecimalNumber alloc] initWithInt:14];
  NSDecimalNumber *stonesToLb = [stones decimalNumberByMultiplyingBy:multiplicand];
  NSDecimalNumber *convertedValue = [stonesToLb decimalNumberByAdding:lbs withBehavior:[NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:3 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO]];
  return convertedValue;
}

+(NSString *)convertLBtoStonesAndPoundsString:(NSNumber *)value
{
  NSDecimalNumber *lbs = [[NSDecimalNumber alloc] initWithFloat:[value floatValue]];
  NSDecimalNumber *divisor = [[NSDecimalNumber alloc] initWithInt:14];
  NSDecimalNumber *wholeStones = [lbs decimalNumberByDividingBy:divisor withBehavior:[NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:0 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO]];
  
  NSDecimalNumber *wholeLbs = [wholeStones decimalNumberByMultiplyingBy:divisor];
  
  lbs = [lbs decimalNumberBySubtracting:wholeLbs withBehavior:[NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:0 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO]];
  
  NSDecimalNumber *one = [[NSDecimalNumber alloc] initWithInt:1];
  if ([lbs integerValue]==14)
  {
    lbs = [[NSDecimalNumber alloc] initWithInt:0];
    wholeStones = [wholeStones decimalNumberByAdding:one];
  }
  
  NSString *convertedValue = [[NSString alloc] initWithFormat:@"%@st %@lb",wholeStones,lbs];
  return convertedValue;
}

+(NSNumber *)convertKgStringtoKg:(NSString *)value
// Expected format "0.0kg"
{
  NSString *tempValue = [value stringByReplacingOccurrencesOfString:@"kg" withString:@""];
  NSNumber *convertedValue = [[NSNumber alloc] initWithFloat:[tempValue floatValue]];
  return convertedValue;
}

+(NSString *)convertKgtoKgString:(NSNumber *)value
{
  NSString *convertedValue = [[NSString alloc] initWithFormat:@"%0.1fkg",[value floatValue]];
  return convertedValue;
}

+(NSNumber *)convertInchesStringtoInches:(NSString *)value
// Expected format '0 0/0"'
{
  NSMutableCharacterSet *specialSet = [[NSMutableCharacterSet alloc] init];
  [specialSet addCharactersInString:@" /\""];
  NSArray *tempArray = [value componentsSeparatedByCharactersInSet:specialSet];
  
  NSDecimalNumber *convertedValue = [[NSDecimalNumber alloc] init];
  
  if ([tempArray count]==2) // Only a whole number of inches passed
  {
    convertedValue = [[NSDecimalNumber alloc] initWithInt:[[tempArray objectAtIndex:0] integerValue]];
  }
  else
  {
    NSDecimalNumber *multiplicand = [[NSDecimalNumber alloc] initWithFloat:[[tempArray objectAtIndex:2] floatValue]];
    NSDecimalNumber *inches = [[NSDecimalNumber alloc] initWithFloat:[[tempArray objectAtIndex:0]floatValue]];
    NSDecimalNumber *eighths = [[NSDecimalNumber alloc] initWithFloat:[[tempArray objectAtIndex:1] floatValue]];
    NSDecimalNumber *fraction = [eighths decimalNumberByDividingBy:multiplicand];
  convertedValue = [inches decimalNumberByAdding:fraction];
  }
  return convertedValue;
}

+(NSString *)convertInchestoInchesString:(NSNumber *)value
{
  NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
  [formatter setMaximumFractionDigits:0];
  [formatter setRoundingMode: NSNumberFormatterRoundDown];
  NSString *wholeInches =  [formatter stringFromNumber:[NSNumber numberWithFloat:[value floatValue]]];
  NSDecimalNumber *divisor = [[NSDecimalNumber alloc] initWithInt:8];
  NSDecimalNumber *originalValue = [[NSDecimalNumber alloc] initWithFloat:[value floatValue]];
  NSDecimalNumber *fraction = [originalValue decimalNumberBySubtracting:[[NSDecimalNumber alloc] initWithInt:[wholeInches integerValue]]];
  fraction = [fraction decimalNumberByMultiplyingBy:divisor];
  [formatter setRoundingMode:NSNumberFormatterRoundHalfUp];
  NSString *eighths = [formatter stringFromNumber:fraction];
  
  NSString *convertedValue = [[NSString alloc] init];
  
  // Convert 2 4 or 6 eights into 1/4 1/2 3/4
  if ([eighths isEqualToString:@"2"])
  {
    eighths = @"1";
    divisor = [[NSDecimalNumber alloc] initWithInt:4];
  }
  if ([eighths isEqualToString:@"4"])
  {
    eighths = @"1";
    divisor = [[NSDecimalNumber alloc] initWithInt:2];
  }
  if ([eighths isEqualToString:@"6"])
  {
    eighths = @"3";
    divisor = [[NSDecimalNumber alloc] initWithInt:4];
  }
  if ([eighths isEqualToString:@"8"])
  {
    eighths = @"0";
    divisor = [[NSDecimalNumber alloc] initWithInt:8];
    int inches = [wholeInches integerValue];
    inches ++;
    wholeInches = [[NSString alloc] initWithFormat:@"%0d",inches];
  }
  if ([eighths isEqualToString:@"0"])
  {
    // Whole number of inches
    convertedValue = [[NSString alloc] initWithFormat:@"%@\"",wholeInches];
  }
  else
  {
    convertedValue = [[NSString alloc] initWithFormat:@"%@ %@/%@\"",wholeInches,eighths,divisor];
  }
  return convertedValue;
}

+(NSNumber *)convertCmStringtoCm:(NSString *)value
{
  NSString *tempValue = [value stringByReplacingOccurrencesOfString:@"cm" withString:@""];
  NSNumber *convertedValue = [[NSNumber alloc] initWithFloat:[tempValue floatValue]];
  return convertedValue;
}

+(NSString *)convertCmtoCmString:(NSNumber *)value
{
  NSString *convertedValue = [[NSString alloc] initWithFormat:@"%0.0fcm",[value floatValue]];
  return convertedValue;
}

@end
