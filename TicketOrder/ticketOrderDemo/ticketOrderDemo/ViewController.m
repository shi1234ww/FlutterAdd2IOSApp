//
//  ViewController.m
//  ticketOrderDemo
//
//  Created by shi1234ww on 2020/10/28.
//

#import "ViewController.h"
#import "TicketOrderViewController.h"
#import "testViewController.h"
#import "HYStepper.h"
#import <Flutter/Flutter.h>
#import <Flutter/FlutterEngine.h>
#import "AppDelegate.h"

@interface ViewController ()
@property(nonatomic, strong) HYStepper *stepper;


@end

@implementation ViewController

-(HYStepper *)stepper{
    if (!_stepper) {
        _stepper = [[HYStepper alloc] init];
    }
    return _stepper;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
//    self.stepper.frame = CGRectMake(100, 100, 115, 35);
//    [self.view addSubview:self.stepper];
    
//    self.stepper.sd_layout.leftSpaceToView(self.view, 100 ).topSpaceToView(self.view, 100).widthIs(115).heightIs(35);
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    TicketOrderViewController *vc = [[TicketOrderViewController alloc] init];
////    testViewController *vc = [[testViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
    
    FlutterEngine *flutterEngine = [(AppDelegate *)[[UIApplication sharedApplication] delegate] flutterEngine];
//    FlutterViewController *flutterVC = [[FlutterViewController alloc] initWithEngine:self.flutterEngine nibName:nil bundle:nil];
    
    FlutterViewController *flutterVC = [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    [self.navigationController pushViewController:flutterVC animated:YES];
    
}

@end
