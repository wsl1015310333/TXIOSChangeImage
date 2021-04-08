//
//  ViewController.m
//  TextChangePositionProject
//
//  Created by wangsl on 2021/4/7.
//

#import "ViewController.h"
typedef enum {
    kMovingDirTop=1,
    kMovingDirLeft,
    kMovingDirBottom,
    kMovingDirRight
} kMoveingDir;
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *headImageView;
@property (nonatomic, assign) int delta;
@end

@implementation ViewController
//- (IBAction)left:(id)sender {

//}
//- (IBAction)left:(UIButton *)sender {
//    NSLog(@"====");
//}
//
//- (IBAction)top:(id)sender {
//    CGRect rect=self.headImageView.frame;
//    rect.origin.y-=20;
//
//    self.headImageView.frame=rect;
//    //self.headImageView.frame.origin.y =self.headImageView.frame.origin.y+20;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(IBAction)move:(UIButton*)button{
//    CGRect rect=self.headImageView.frame;
//
//    switch (button.tag) {
//        case kMovingDirTop:
//            rect.origin.y-=20;
//            break;
//        case kMovingDirLeft:
//            rect.origin.x-=20;
//            break;
//        case kMovingDirBottom:
//            rect.origin.y+=20;
//            break;
//        case kMovingDirRight:
//            rect.origin.x+=20;
//
//            break;
//
//        default:
//            break;
//    }
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:2.0];
//    self.headImageView.frame =rect;
//    [UIView commitAnimations];
    //方法二
    //基于对象初始化位置的形变
//    self.delta-=20;
//    self.headImageView.transform=CGAffineTransformMakeTranslation(0, self.delta);
    
    self.headImageView.transform=CGAffineTransformTranslate(self.headImageView.transform,0, -20);
    
}
- (IBAction)zoom:(UIButton *)sender {
    CGRect rect=self.headImageView.bounds;
//    if(sender.tag==14){
//    rect.size.width+=20;
//    rect.size.height+=20;
//    }
//    else{
//        rect.size.width-=20;
//        rect.size.height-=20;
//    }
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:2.0];
//    self.headImageView.bounds=rect;
////    self.headImageView.alpha=0;
//    [UIView commitAnimations];
    
    //第二种方法
    self.headImageView.transform=CGAffineTransformScale(self.headImageView.transform,1.2, 1.2);
}
- (IBAction)rorate:(UIButton *)sender {
    //提示 在OGC中，所有跟角度相关的数值，都是弧度值
    self.headImageView.transform=CGAffineTransformRotate(self.headImageView.transform,M_PI_4);
    
}

@end
