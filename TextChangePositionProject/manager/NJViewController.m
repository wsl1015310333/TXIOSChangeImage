//
//  NJViewController.m
//  TextChangePositionProject
//
//  Created by wangsl on 2021/4/12.
//

#import "NJViewController.h"
#import "NJApp.h"
#import "NJAppCell.h"

@interface NJViewController ()<MJAppCellDelegate>
@property(strong,nonatomic)NSArray *apps;
@end

@implementation NJViewController
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
- (NSArray *)apps
{
    if (_apps == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apps_full.plist" ofType:nil]];
        
        NSMutableArray *appArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            NJApp *app = [NJApp appWithDict:dict];
            [appArray addObject:app];
//            NSLog(@"%@ %@",app,app.name);
        }
        _apps = appArray;
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     
    return self.apps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier =@"app";
 
    NJAppCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
//    if(cell==nil){
//        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    }
//    NJApp *app=self.apps[indexPath.row];
//    cell.textLabel.text=app.name;
//    cell.imageView.image=[UIImage imageNamed:app.icon];
//    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@ %@",app.size,app.downloaded];
    NJApp *app=self.apps[indexPath.row];
    cell.delegate = self;

    cell.app=app;
    
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)appCellDidClickedDownloadBtn:(NJAppCell *)cell
{
    // 1.取出模型
    NJApp *app = cell.app;
    
    // 2.添加标签
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"成功下载%@", app.name];
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    label.frame = CGRectMake(0, 0, 150, 25);
    label.center = CGPointMake(160, 240);
    label.alpha = 0.0;
    label.layer.cornerRadius = 5;
    label.clipsToBounds = YES;
    [self.view addSubview:label];
    
    // 3.动画
    [UIView animateWithDuration:0.5 animations:^{
        label.alpha = 0.5;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
            label.alpha = 0.0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
}
@end
