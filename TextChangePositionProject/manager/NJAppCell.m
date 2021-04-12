//
//  NJAppCell.m
//  TextChangePositionProject
//
//  Created by wangsl on 2021/4/12.
//

#import "NJAppCell.h"
#import "NJApp.h"
@interface NJAppCell()
@property (weak, nonatomic) IBOutlet UIButton *downloadBtn;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
- (IBAction)downloadBtnOnclick:(UIButton *)sender;

@end

@implementation NJAppCell
- (void)setApp:(NJApp *)app{
    _app=app;
    self.iconView.image = [UIImage imageNamed:app.icon];
    self.nameLabel.text = app.name;
    self.introLabel.text = [NSString stringWithFormat:@"大小:%@ | 下载量:%@", app.size, app.download];
    
    self.downloadBtn.enabled = !app.isDownloaded;
}



- (IBAction)downloadBtnOnclick:(UIButton *)btn {
    // 1.按钮失效
    self.downloadBtn.enabled = NO;
    //self.app.downloaded = YES;
    
    // 2.通知代理
    if ([self.delegate respondsToSelector:@selector(appCellDidClickedDownloadBtn:)]) {
        [self.delegate appCellDidClickedDownloadBtn:self];
    }
}
@end
