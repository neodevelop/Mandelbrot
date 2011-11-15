//
//  Dragon.m
//  Mandelbrot
//
//  Created by neodevelop on 04/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Dragon.h"

@implementation Dragon

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    int EjeX[4098],EjeY[4098];
    int Paso, Signo;
    
    Paso = 4096;
    Signo = -1;
    EjeX[1] = CGRectGetMaxX(rect) / 4;
    EjeY[4097] = 3 * CGRectGetMaxX(rect) / 4;
    EjeY[1] = EjeY[4097] = 2 * CGRectGetMaxY(rect) / 3;
    CGContextSetRGBStrokeColor(context, .999, .999, .999, 1.0);
    CGContextMoveToPoint(context, EjeX[1], EjeY[1]);
    CGContextAddLineToPoint(context, EjeX[4097], EjeY[4097]);
    
    
    
    
    
    for(int k=0;k<13;k++){
        
        int i, j, dx, dy;
        j = Paso / 2;
        for( i = 1; i <= 4096; i+= Paso )
        {
            dx = EjeX[Paso + i] - EjeX[i];
            dy = EjeY[Paso + i] - EjeY[i];
            Signo *= -1;
            EjeX[i + j] = EjeX[i] + ( dx + ( dy * Signo ) ) / 2;
            EjeY[i + j] = EjeY[i] + ( dy + ( dx * Signo ) ) / 2;
            
            CGContextMoveToPoint(context, EjeX[i], EjeY[i]);
            CGContextAddLineToPoint(context, EjeX[i+j], EjeY[i+j]);
            //NSLog(@"Linea 1: (%d,%d) - (%d,%d)",EjeX[i],EjeY[i],EjeX[i+j],EjeY[i+j]);
            
            CGContextMoveToPoint(context, EjeX[i + j], EjeY[i + j]);
            CGContextAddLineToPoint(context, EjeX[i+Paso], EjeY[i + j]);
            //NSLog(@"Linea 2: (%d,%d) - (%d,%d)",EjeX[i + j],EjeY[i + j],EjeX[i+Paso],EjeY[i + j]);
        }
        
        Paso /= 2;
    }
    
    CGContextStrokePath(context);
    
}


@end
