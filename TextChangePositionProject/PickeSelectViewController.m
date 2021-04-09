//
//  PickeSelectViewController.m
//  TextChangePositionProject
//
//  Created by wangsl on 2021/4/8.
//

#import "PickeSelectViewController.h"
typedef enum {
    ZERO=0,
    ONE,
    TWO,
    THREE,
    FOUR
} kNumber;
@interface PickeSelectViewController ()
//序号标签
@property(nonatomic,strong)UILabel *noLabel;
//图片
@property(nonatomic,strong)UIImageView *icon;
//图片描述
@property(nonatomic,strong)UILabel *descLabel;
//左边按钮
@property(nonatomic,strong)UIButton *leftButton;
//右边按钮
@property(nonatomic,strong)UIButton *rightButton;

//图像索引
@property(nonatomic,assign)int  index;

@end

@implementation PickeSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //序号标签
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 40)];
 //   label.text=@"1/5";
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    self.noLabel=label;
    
    //2 图片试图
    CGFloat imageW=200;
    CGFloat imageX=(self.view.frame.size.width-imageW)/2;
    CGFloat imaegH=200;
    CGFloat imageY=80;
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(imageX, imageY, imageW, imaegH)];
    
    //实力化一个图像
//    UIImage *image=[UIImage imageNamed:@"biaoqingdi"];
//    //
//    imageView.image=image;
    
    [self.view addSubview:imageView];
    self.icon=imageView;
    //3 描述标签
    UILabel *label1=[[UILabel alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 80)];
//    label1.text=@"神马表情都假的";
    label1.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label1];
    self.descLabel=label1;
    //4 左边按钮
    UIButton *leftBtn=[[UIButton alloc] init];
//    leftBtn.backgroundColor=[UIColor redColor];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"left_normal"] forState: UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"left_highlighted"] forState: UIControlStateHighlighted];
    
    leftBtn.frame=CGRectMake(0, 0, 40, 40);
    leftBtn.center=CGPointMake(self.icon.frame.origin.x/2,self.icon.center.y);
    [self.view addSubview:leftBtn];
    [leftBtn addTarget:self action:@selector(leftClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.leftButton=leftBtn;
    
    //右侧按钮
    
    //5右边
    UIButton *rightBtn=[[UIButton alloc] init];
//    rightBtn.backgroundColor=[UIColor redColor];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"right_normal"] forState: UIControlStateNormal];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"right_highlighted"] forState: UIControlStateHighlighted];
    rightBtn.frame=CGRectMake(0, 0, 40, 40);
    rightBtn.center=CGPointMake(self.view.frame.size.width- self.icon.frame.origin.x/2,self.icon.center.y);
    [self.view addSubview:rightBtn];
    [rightBtn addTarget:self action:@selector(rightClick) forControlEvents:(UIControlEventTouchUpInside)];
    self.rightButton=rightBtn;
    
    [self changeImageView];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)leftClick{
    NSLog(@"左边点击事件");
    self.index--;
//根据self.index显示序号标签、图像
    [self changeImageView];

}
-(void)rightClick{
    NSLog(@"右边点击事件");
    self.index++;
    
    [self changeImageView];

   // }
}

-(void)changeImageView{
    self.noLabel.text=[NSString stringWithFormat:@"%d/%d",self.index+1,5 ];
    switch (self.index) {
        case ZERO:
            self.icon.image=[UIImage imageNamed:@"biaoqingdi"];
            self.descLabel.text=@"表情";
            break;
        case ONE:
            self.icon.image=[UIImage imageNamed:@"bingli"];
            self.descLabel.text=@"病例";
            break;
        case TWO:
            self.icon.image=[UIImage imageNamed:@"chiniupa"];
            self.descLabel.text=@"chiniupa";
            break;
        case THREE:
            self.icon.image=[UIImage imageNamed:@"danteng"];
            self.descLabel.text=@"蛋疼";
            break;
        case FOUR:
            self.icon.image=[UIImage imageNamed:@"wangba"];
            self.descLabel.text=@"王八";
            break;
        default:
            break;
    }
   // if(self.index==FOUR){
        self.rightButton.enabled=(self.index!=4);
    self.leftButton.enabled=(self.index!=0);
}

@end
