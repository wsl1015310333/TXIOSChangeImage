//
//  TomViewController.m
//  TextChangePositionProject
//
//  Created by wangsl on 2021/4/9.
//

#import "TomViewController.h"

@interface TomViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tom;
@end

@implementation TomViewController

-(void)tomAnimation:(NSString *)img count:(int)count{
    if([self.tom isAnimating]) return;
    // 序列帧动画，所谓序列帧动画，就是让一组图片一张一张的顺序播放
    // 1. 图片的数组
    NSMutableArray *arrayM = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%@_%02d.jpg", img, i];
//        UIImage *image = [UIImage imageNamed:imageName];
        NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        
        [arrayM addObject:image];
    }
    [self.tom setAnimationImages:arrayM];
    
    // 2. 设置动画时长
    [self.tom setAnimationDuration:arrayM.count * 0.075];
    [self.tom setAnimationRepeatCount:1];
    
    // 3. 开始动画
    [self.tom startAnimating];
    
    // 4. 动画完成之后，再清除动画数组内容
//    [self performSelector:@selector(clearTom) withObject:nil afterDelay:self.tom.animationDuration];
    [self.tom performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.tom.animationDuration];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)rightFoot:(id)sender {
    [self tomAnimation:@"footRight" count:30];
}

- (IBAction)head
{
    [self tomAnimation:@"knockout" count:81];
}

- (IBAction)drink
{
    [self tomAnimation:@"drink" count:81];
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
