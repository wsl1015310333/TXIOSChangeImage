//
//  NJAppCell.h
//  TextChangePositionProject
//
//  Created by wangsl on 2021/4/12.
//

#import <UIKit/UIKit.h>
@class NJApp,NJAppCell;
@protocol MJAppCellDelegate <NSObject>
@optional
-(void) appCellDidClickedDownloadBtn:(NJAppCell *)cell;
@end

@interface NJAppCell : UITableViewCell
@property(nonatomic,strong) NJApp *app;
@property (weak, nonatomic) id<MJAppCellDelegate> delegate;

@end

