//
//  CalculatorBrain.m
//  Calculator
//
//  Created by apple on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <math.h>
#import "CalculatorBrain.h"


@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end


@implementation CalculatorBrain
@synthesize operandStack = _operandStack;


- (NSMutableArray *) operandStack
{
	if (!_operandStack) {
		_operandStack = [[NSMutableArray alloc] init];
	}
	return _operandStack;
}


- (void) pushOperand:(double)operand {
	//if (![[self.operandStack lastObject] isEqualToNumber:[NSNumber numberWithDouble:M_PI]]) {
	//NSLog(@"Last object in the stack is %@", [self.operandStack lastObject]);
	NSNumber *operandObject = [NSNumber numberWithDouble:operand];
	[self.operandStack addObject:operandObject];

}

- (double) popOperand {
	NSNumber *operandObject = [self.operandStack lastObject];
	if (operandObject)
		[self.operandStack removeLastObject];
	return operandObject.doubleValue;
}



- (double) performOperation:(NSString *)operation {
	double result = 0;
	if ([operation isEqualToString:@"+"]) {
		result = [self popOperand] + [self popOperand];
	} else if ([@"*" isEqualToString:operation]) {
		result = [self popOperand] * [self popOperand];
	} else if ([operation isEqualToString:@"-"]) {
		double subtrahend = [self popOperand];
		result = [self popOperand] - subtrahend;
	} else if ([operation isEqualToString:@"/"]) {
		double divisor = [self popOperand];
		if (divisor) 
			result = [self popOperand] / divisor;
	} else if ([operation isEqualToString:@"sin"]) {//sin function
		result = sin([self popOperand]);
	} else if ([operation isEqualToString:@"cos"]) {//cos function
		result = cos([self popOperand]);
	} else if ([operation isEqualToString:@"tan"]) {//tan function
		result = tan([self popOperand]);
	} else if ([operation isEqualToString:@"sqrt"]) {//sqrt function
		result = sqrt([self popOperand]);
	} else if ([operation isEqualToString:@"Pi"]) {//Pi function
		[self pushOperand:M_PI];
		result = M_PI;
	}
	
	[self pushOperand:result];
	return result;
}

- (void) clearOperation {
	[self.operandStack removeAllObjects];
}


@end
