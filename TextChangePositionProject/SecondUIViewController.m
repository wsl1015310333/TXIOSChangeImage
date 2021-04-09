//
//  SecondUIViewController.m
//  TextChangePositionProject
//
//  Created by wangsl on 2021/4/8.
//

#import "SecondUIViewController.h"

@interface SecondUIViewController ()
@property (weak, nonatomic) IBOutlet UIButton *headImageView;

@end

@implementation SecondUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIButton *btn=[[UIButton alloc] init];
    btn.frame =CGRectMake(20, 20, 100, 100);
//    btn.backgroundColor=[UIColor redColor];
    [btn setTitle:@"点我" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIImage *image =[UIImage imageNamed:@"btn_01"];

    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_02"] forState:UIControlStateHighlighted];

    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    //按钮的监听方法
   // [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)click:(id)sender{
    NSLog(@"就点你");
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
