//
//  RARecipeDetailViewController.m
//  Recipes
//
//  Created by Dan Clawson on 4/4/15.
//  Copyright (c) 2015 Slacker Tools. All rights reserved.
//

#import "RARecipeDetailViewController.h"
#import "RARecipes.h"

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@interface RARecipeDetailViewController ()

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat margin;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat widthWithMargins;
@property (nonatomic) CGFloat textHeight;

@property (nonatomic) NSInteger ingredientCount;

@end

@implementation RARecipeDetailViewController

- (void) viewDidLoad {
    [super viewDidLoad];

    // log the recipe contents
    //NSDictionary *recipe = [RARecipes recipeAtIndex:self.index];
    //NSLog(@"%@", recipe);


    /*
    Some notes...

    http://www.idev101.com/code/User_Interface/sizes.html

    Status bar:     20
    Navigation bar: 44
    Text fields:    31

     */

    // some sizing variables
    self.top = 64;
    self.margin = 10;
    self.width = CGRectGetWidth(self.view.bounds);
    self.widthWithMargins = self.width - self.margin * 2;
    self.textHeight = 31;

    // format the view
    UIColor *backgroundColor = RGB(213, 226, 246);
    [self.view setBackgroundColor:backgroundColor];

    // define the title
    UILabel *title= [UILabel new];
    title.frame = CGRectMake(0, self.top, self.width, self.textHeight);  // Next vertical location: 64 + 31 = 95
    title.text = [RARecipes titleAtIndex:self.index];
    title.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    title.textAlignment = NSTextAlignmentCenter;
    title.backgroundColor = [UIColor whiteColor];

    // add the title
    [self.view addSubview:title];

    // define the directions label (outside of the directions scroll view)
    UILabel *directionsLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.margin, 95, self.widthWithMargins, self.textHeight)];  // next vertical location: 95 + 31 = 126
    directionsLabel.text = @"Directions";
    directionsLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    [self.view addSubview:directionsLabel];

    // define the directions
    UILabel *directions = [[UILabel alloc] initWithFrame:CGRectMake(self.margin, 126, self.widthWithMargins, 93)];
    directions.text = [RARecipes descriptionAtIndex:self.index];
    directions.numberOfLines = 0;
    [directions sizeToFit];
    [self.view addSubview:directions];

    // define the ingredients label (outside of the ingredients scroll view)
    UILabel *ingredientsLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.margin, 219, self.widthWithMargins, self.textHeight)];  // next vertical location: 219 + 31 = 250
    ingredientsLabel.text = @"Ingredients";
    ingredientsLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    [self.view addSubview:ingredientsLabel];

    // define a scroll view for the ingredients
    UIScrollView *ingredientsScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(self.margin, 250, self.width, self.view.frame.size.height - 250)];  // frame height minus the already assigned space
    [self.view addSubview:ingredientsScrollView];
    ingredientsScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height); // use the entire size (w, h)

    // define the ingredients (origin is relative to ingredients scroll view, but grows with the number of ingredients)
    self.ingredientCount = [RARecipes ingredientCountAtIndex:self.index];

    CGFloat nextTop = 0.0;

    // do this for all the ingredients
    for (int i = 0; i < self.ingredientCount; i++) {

        UILabel *ingredient = [[UILabel alloc] initWithFrame:CGRectMake(0, nextTop, self.widthWithMargins, self.view.bounds.size.height)];

        NSMutableString *ingredientString = [[NSMutableString alloc] init];
        [ingredientString appendString:[RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.index]];
        [ingredientString appendString:@" "];
        [ingredientString appendString:[RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.index]];


        ingredient.text = ingredientString;
        //ingredient.font = [UIFont systemFontOfSize:12];
        ingredient.numberOfLines = 0;
        [ingredient sizeToFit];

        [ingredientsScrollView addSubview:ingredient];
        nextTop += self.textHeight;

    }


}

@end
