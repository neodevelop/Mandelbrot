//
//  Fractal.m
//  Mandelbrot
//
//  Created by neodevelop on 04/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Fractal.h"

@implementation Fractal

float colors[16][3] = {
    {0.0,0.0,0.0},  //black
    {0.0,0.0,255},  //blue
    {0.0,255,0.0},  //green
    {0.0,255,255},  //cyan
    {204,0.0,0.0},  //red 
    {255,0.0,255},  //magenta
    {128,0.0,0.0},  //brown
    {226,226,226},  //lightgray
    {110,110,110},  //darkgray
    {210,247,255},  //lightblue
    {210,255,236},  //lightgreen
    {210,220,255},  //lightcyan
    {255,173,173},  //lightred
    {254,202,255},  //lightmagenta
    {255,255,0.0},  //yellow
    {255,255,255}   //white
};

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    int maxX, maxY, Limite, i, j, Pasos, Terminar;
    CGFloat PasoX, PasoY, PosX, PosY, OrigX, OrigY, DimX, DimY, IterX, IterY, TempX;
    CGContextRef context = UIGraphicsGetCurrentContext();
    //CGContextSetRGBFillColor(context, 0.592, 0.204, 0.651, 0.75);
    //CGContextAddRect(context, CGRectMake(50, 50, 51, 51));
    
    maxX = CGRectGetMaxX(rect);     //               -1.25               //
    maxY = CGRectGetMaxY(rect);     //                 ^                 //
    Limite = 100;                   //                 |                 //
    //      -2.0 < - - + - - > +0.5      //
    OrigX = -2.0;                   //                 |                 //
    OrigY = -1.25;                  //                 v                 //
    DimX = 0.5;                     //               +1.25               //
    DimY = 1.25;                    //                                   //
    //===================================//
    
    PasoX = ( DimX - OrigX ) / maxX;
    PasoY = ( DimY - OrigY ) / maxY;
    
    for( i = 0; i <= maxX ; i++ ){
        for( j = 0; j <= maxY ; j++ )
        {
            PosX = OrigX + i * PasoX;	// Inicia el valor para la posicion
            PosY = OrigY + j * PasoY;
            IterX = 0.0;		// Pone a cero los valores iniciales
            IterY = 0.0;
            Terminar = Pasos = 0;	// Pone a ceros los pasos y la se¤al
            
            while( !Terminar )
            {
                TempX = ( IterX * IterX ) - ( IterY * IterY ) + PosX;
                IterY = 2 * (IterX * IterY ) + PosY;
                IterX = TempX;
                Pasos++;
                if( hypot( fabs( IterX ), fabs( IterY ) ) >= 2.0 )
                    Terminar++;
                if( Pasos >= Limite ) Terminar++;
                if( FALSE )		//Salida del bucle
                {
                    i = maxX;
                    j = maxY;
                    Terminar++;
                }
            }
            if( Pasos < Limite ){
                float currentColor = (float)1/16*Pasos;
                //float R = (float)(Pasos % 256) /32;
                //float G = (float)(Pasos / 256 % 256) /32;
                //float B = (float)(Pasos / 256 / 256 % 256) /32;
                //float R = (float)(colors[Pasos][0]/255);
                //float G = (float)(colors[Pasos][1]/255);
                //float B = (float)(colors[Pasos][2]/255);
                //NSLog(@"%d,%d,%d",i,j,Pasos);
                //NSLog(@"%f",currentColor);
                CGContextSetRGBFillColor(context, currentColor, currentColor, currentColor, 1.0);
                //CGContextSetRGBFillColor(context, R, G, B, 1.0);
                //CGContextSetRGBStrokeColor(context, 1/16*Pasos, 1/16*Pasos, 1/16*Pasos, 0.75);
                CGContextFillRect(context, CGRectMake(i,j,1,1));
            }
            
        }
        CGContextFillPath(context);
    }
    NSLog(@"Termino!!!");
}


@end
