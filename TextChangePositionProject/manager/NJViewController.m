//
//  NJViewController.m
//  TextChangePositionProject
//
//  Created by wangsl on 2021/4/12.
//

#import "NJViewController.h"
#import "NJApp.h"
#import "NJAppCell.h"

@interface NJViewController ()
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

@end
