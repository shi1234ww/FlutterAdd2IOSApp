//
//  TicketOrderCalendarViewController.m
//  ticketOrderDemo
//
//  Created by shi1234ww on 2020/10/30.
//

#import "TicketOrderCalendarViewController.h"
#import "FSCalendar.h"
#import "PeriodCalenderSubTitleFomatter.h"
#import "TicketOrderChoosePeriodCollectionViewCell.h"

@interface TicketOrderCalendarViewController ()<FSCalendarDataSource,FSCalendarDelegate, FSCalendarDelegateAppearance, UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) FSCalendar *calendar;

@property (strong, nonatomic) NSCalendar *gregorian;


@property(nonatomic, strong) PeriodCalenderSubTitleFomatter *periodCalenderSubTitleFomatter;


@property(nonatomic, strong) UILabel *choosePeriodLabel;
@property(nonatomic, strong) UICollectionView *choosePeriodCollectionView;
@property(nonatomic, strong) NSMutableArray *periodDataSourceArray;
@property(nonatomic, strong) UIView *orderBackgroundView;
@property(nonatomic, strong) UILabel *orderLabel;
@end

@implementation TicketOrderCalendarViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"FSCalendar";
        self.gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    }
    return self;
}

-(PeriodCalenderSubTitleFomatter *)periodCalenderSubTitleFomatter{
    if (!_periodCalenderSubTitleFomatter) {
        _periodCalenderSubTitleFomatter = [[PeriodCalenderSubTitleFomatter alloc] init];
    }
    return _periodCalenderSubTitleFomatter;
}

-(FSCalendar *)calendar{
    if (!_calendar) {
        _calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, NAVIGATIONBAR_HEIGHT, SCREEN_WIDTH, 390)];
        _calendar.dataSource = self;
        _calendar.delegate = self;
        _calendar.backgroundColor = [UIColor whiteColor];
        _calendar.appearance.headerMinimumDissolvedAlpha = 0;
        _calendar.appearance.caseOptions = FSCalendarCaseOptionsWeekdayUsesSingleUpperCase;
        _calendar.locale =  [NSLocale localeWithLocaleIdentifier:@"zh-CN"];
        _calendar.firstWeekday = 2;
        
        // shi
        _calendar.appearance.headerTitleFont = [UIFont boldSystemFontOfSize:18];
        _calendar.appearance.weekdayFont = [UIFont systemFontOfSize:14];
        _calendar.appearance.headerTitleColor = [UIColor blackColor];
        _calendar.appearance.weekdayTextColor = [UIColor blackColor];
        _calendar.appearance.headerTitleAlignment = NSTextAlignmentCenter;
    }
    return _calendar;
}

-(UIView *)orderBackgroundView{
    if (!_orderBackgroundView) {
        _orderBackgroundView = [[UIView alloc] init];
        CAGradientLayer *gl = [CAGradientLayer layer];
        gl.frame = CGRectMake(0,0,SCREEN_WIDTH,50);
        gl.startPoint = CGPointMake(0, 0);
        gl.endPoint = CGPointMake(1, 1);
        gl.colors = @[(__bridge id)[UIColor colorWithRed:252/255.0 green:74/255.0 blue:124/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:255/255.0 green:84/255.0 blue:17/255.0 alpha:1.0].CGColor];
        gl.locations = @[@(0.0),@(1.0f)];

        [_orderBackgroundView.layer addSublayer:gl];
        _orderBackgroundView.layer.shadowColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:215/255.0 alpha:1.0].CGColor;
        _orderBackgroundView.layer.shadowOffset = CGSizeMake(0,0);
        _orderBackgroundView.layer.shadowOpacity = 1;
        _orderBackgroundView.layer.shadowRadius = 0;

    }
    return _orderBackgroundView;
}


- (UILabel *)orderLabel{
    if (!_orderLabel) {
        _orderLabel = [[UILabel alloc] init];
        _orderLabel.textColor = HEXCOLOR(0xFFFFFF);
        _orderLabel.font = [UIFont systemFontOfSize:16];
        _orderLabel.text = @"立即预订";
        _orderLabel.textAlignment = NSTextAlignmentCenter;
        _orderLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(orderLabelTap)];
        [_orderLabel addGestureRecognizer:tap];
    }
    return _orderLabel;
}


- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.view = view;
    
    // 450 for iPad and 300 for iPhone
    CGFloat height = [[UIDevice currentDevice].model hasPrefix:@"iPad"] ? 450 : 300;
    FSCalendar *calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, 64, view.frame.size.width, height)];
    calendar.dataSource = self;
    calendar.delegate = self;
    calendar.backgroundColor = [UIColor whiteColor];
    calendar.appearance.headerMinimumDissolvedAlpha = 0;
    calendar.appearance.caseOptions = FSCalendarCaseOptionsWeekdayUsesSingleUpperCase;
    calendar.locale =  [NSLocale localeWithLocaleIdentifier:@"zh-CN"];
    calendar.firstWeekday = 2;
    
    
    // shi
    calendar.appearance.headerTitleFont = [UIFont boldSystemFontOfSize:18];
    calendar.appearance.weekdayFont = [UIFont systemFontOfSize:14];
    calendar.appearance.headerTitleColor = [UIColor blackColor];
    calendar.appearance.weekdayTextColor = [UIColor blackColor];
    calendar.appearance.headerTitleAlignment = NSTextAlignmentCenter;
    
    
    [self.view addSubview:calendar];
    self.calendar = calendar;
}


-(UILabel *)choosePeriodLabel{
    if (!_choosePeriodLabel) {
        _choosePeriodLabel = [[UILabel alloc] init];
        _choosePeriodLabel.numberOfLines = 0;
        _choosePeriodLabel.text = @"选择时段";
        _choosePeriodLabel.textColor = HEXCOLOR_TextColor_Black;
    }
    return _choosePeriodLabel;
}


- (UICollectionView *)choosePeriodCollectionView{
    if(!_choosePeriodCollectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        CGFloat width = (SCREEN_WIDTH - 15*4) / 3;
        [layout setItemSize: CGSizeMake(width, 50)];
        //        layout.headerReferenceSize = CGSizeMake(self.view.bounds.size.width, 128);
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        
        
        //        _choosePeriodCollectionView = [[UICollectionView alloc] initWithFrame: CGRectMake(0, 50, SCREEN_WIDTH,100) collectionViewLayout: layout];
        _choosePeriodCollectionView = [[UICollectionView alloc] initWithFrame: CGRectZero collectionViewLayout: layout];
        [_choosePeriodCollectionView setDataSource: self];
        [_choosePeriodCollectionView setDelegate: self];
        [_choosePeriodCollectionView setShowsHorizontalScrollIndicator:NO];
        _choosePeriodCollectionView.backgroundColor = [UIColor whiteColor];
        _choosePeriodCollectionView.bounces = NO;
        _choosePeriodCollectionView.scrollEnabled = YES;
        _choosePeriodCollectionView.alwaysBounceHorizontal = NO;
        [_choosePeriodCollectionView registerClass: [TicketOrderChoosePeriodCollectionViewCell class] forCellWithReuseIdentifier: CELL_REUSEIDENTIFIER_COLLECTION1];
        
    }
    return _choosePeriodCollectionView;
}


-(NSMutableArray *)periodDataSourceArray{
    if (!_periodDataSourceArray) {
        _periodDataSourceArray = [NSMutableArray arrayWithObjects:@"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", nil];
    }
    return _periodDataSourceArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:self.calendar];
    [self.view addSubview:self.choosePeriodLabel];
    self.choosePeriodLabel.sd_layout.leftSpaceToView(self.view, MARGIN_15).topSpaceToView(self.calendar, MARGIN_20).rightSpaceToView(self.view, MARGIN_15).heightIs(15);
    
    
    self.choosePeriodCollectionView.backgroundColor = [UIColor redColor];
    
            
//        倍数  +   1( 余数大于0 , 小于等于 2)
    NSUInteger remainder = self.periodDataSourceArray.count % 3;
    NSUInteger multiple = self.periodDataSourceArray.count / 3;
    NSUInteger lines;// 行数
    if (remainder > 0 && remainder <= 2) {
        lines = multiple + 1;
    }else{
        lines = multiple;
    }
    
    [self.view addSubview:self.choosePeriodCollectionView];
    self.choosePeriodCollectionView.sd_layout.leftSpaceToView(self.view, MARGIN_15).topSpaceToView(self.choosePeriodLabel, MARGIN_10).rightSpaceToView(self.view, MARGIN_15).maxHeightIs((50 + 10) * 3);
    
    
    
    [self.view addSubview:self.orderBackgroundView];
    self.orderBackgroundView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view , 0).bottomSpaceToView(self.view, 0).heightIs(50);
    
    
    [self.view addSubview:self.orderLabel];
    self.orderLabel.sd_layout.centerXEqualToView(self.orderBackgroundView).centerYEqualToView(self.orderBackgroundView).widthRatioToView(self.orderBackgroundView, 1).heightRatioToView(self.orderBackgroundView, 1);
}


#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.periodDataSourceArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TicketOrderChoosePeriodCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: CELL_REUSEIDENTIFIER_COLLECTION1 forIndexPath: indexPath];
    //    DestinationModel *model = self.dateModelDataSourceArray[indexPath.item];
    //    [cell updateViewWithModel:model];
    return cell;
}




#pragma mark -UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@", indexPath);
}



#pragma mark -FSCalendarDataSource&& Delegate
-(NSString *)calendar:(FSCalendar *)calendar titleForDate:(NSDate *)date{
    if ([self.gregorian isDateInToday:date]) {
        return @"今";
    }
    return nil;
}


-(NSString *)calendar:(FSCalendar *)calendar subtitleForDate:(NSDate *)date{
    return [self.periodCalenderSubTitleFomatter periodStringFromDate:date];
}


- (nullable UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance titleDefaultColorForDate:(NSDate *)date{
    return RandomColor;
}



- (void)orderLabelTap{
    NSLog(@"%s", __func__);
}


@end
