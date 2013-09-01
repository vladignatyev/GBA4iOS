//
//  GBAControllerSkinPreviewCell.h
//  GBA4iOS
//
//  Created by Yvette Testut on 8/31/13.
//  Copyright (c) 2013 Riley Testut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBAController.h"

@interface GBAControllerSkinPreviewCell : UITableViewCell

@property (strong, nonatomic) GBAController *controller;

- (void)setController:(GBAController *)controller orientation:(GBAControllerOrientation)orientation;

@end