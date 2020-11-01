//
//  TicketOrderInventoryTableViewCell.m
//  ticketOrderDemo
//
//  Created by shi1234ww on 2020/10/28.
//

#import "TicketOrderInventoryTableViewCell.h"
#import "TicketOrderInventoryModeCollectionViewCell.h"
#import "TicketOrderChoosePeriodCollectionViewCell.h"

@interface TicketOrderInventoryTableViewCell ()<UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) UILabel *titleLabel;

@property(nonatomic, strong) UICollectionView *mainCollectionView;

@property(nonatomic, strong) UIImageView *img;

@property(nonatomic, strong) UILabel *moreDateLabel;

@property(nonatomic, strong) UIButton *moreDateBtn;



@property(nonatomic, strong) UILabel *choosePeriodLabel;


@property(nonatomic, strong) UICollectionView *choosePeriodCollectionView;

@property(nonatomic, strong) NSMutableArray *dateModelDataSourceArray;



@end


@implementation TicketOrderInventoryTableViewCell

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.text = @"使用日期";
        _titleLabel.textColor = HEXCOLOR_TextColor_Black;
    }
    return _titleLabel;
}





- (UICollectionView *)mainCollectionView{
    if(!_mainCollectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //  56.5+29.5
        [layout setItemSize: CGSizeMake(63, 70)];
        //        layout.headerReferenceSize = CGSizeMake(self.view.bounds.size.width, 128);
        layout.minimumLineSpacing = 8;
        layout.minimumInteritemSpacing = 5;
        
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        
        
        //        _mainCollectionView = [[UICollectionView alloc] initWithFrame: CGRectMake(0, 50, SCREEN_WIDTH,100) collectionViewLayout: layout];
        _mainCollectionView = [[UICollectionView alloc] initWithFrame: CGRectZero collectionViewLayout: layout];
        [_mainCollectionView setDataSource: self];
        [_mainCollectionView setDelegate: self];
        [_mainCollectionView setShowsHorizontalScrollIndicator:YES];
        _mainCollectionView.backgroundColor = [UIColor whiteColor];
        _mainCollectionView.bounces = NO;
        _mainCollectionView.scrollEnabled = YES;
        _mainCollectionView.alwaysBounceHorizontal = YES;
        [_mainCollectionView registerClass: [TicketOrderInventoryModeCollectionViewCell class] forCellWithReuseIdentifier: CELL_REUSEIDENTIFIER_COLLECTION];
        
    }
    return _mainCollectionView;
}


-(UIImageView *)img{
    if (!_img) {
        _img = [[UIImageView alloc] init];
        _img.image = [UIImage imageNamed:@"right_arrow_gray"];
    }
    return _img;
}

-(UILabel *)moreDateLabel{
    if (!_moreDateLabel) {
        _moreDateLabel = [[UILabel alloc] init];
        _moreDateLabel.text = @"更多\n日期";
        _moreDateLabel.textColor = HEXCOLOR_TextColor_Black;
        _moreDateLabel.numberOfLines = 0;
    }
    return _moreDateLabel;
}

-(UIButton *)moreDateBtn{
    if (!_moreDateBtn) {
        _moreDateBtn = [[UIButton alloc] init];
        //        [_moreDateBtn setBackgroundColor: [UIColor clearColor]];
        [_moreDateBtn addTarget:self action:@selector(moreDateBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _moreDateBtn;
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
        _choosePeriodCollectionView.scrollEnabled = NO;
        _choosePeriodCollectionView.alwaysBounceHorizontal = NO;
        [_choosePeriodCollectionView registerClass: [TicketOrderChoosePeriodCollectionViewCell class] forCellWithReuseIdentifier: CELL_REUSEIDENTIFIER_COLLECTION1];
        
    }
    return _choosePeriodCollectionView;
}


-(NSMutableArray *)dateModelDataSourceArray{
    if (!_dateModelDataSourceArray) {
        _dateModelDataSourceArray = [[NSMutableArray alloc] init];
        
    }
    return _dateModelDataSourceArray;
}

-(NSMutableArray *)periodDataSourceArray{
    if (!_periodDataSourceArray) {
        _periodDataSourceArray = [NSMutableArray arrayWithObjects:@"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", nil];
    }
    return _periodDataSourceArray;
}




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor yellowColor];
        
        [self setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        
        
        
    }
    return self;
}



#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView == self.mainCollectionView) {
        return 6;
    }else if (collectionView == self.choosePeriodCollectionView ){
        return self.periodDataSourceArray.count;
    }
    return 0;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == self.mainCollectionView) {
        TicketOrderInventoryModeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: CELL_REUSEIDENTIFIER_COLLECTION forIndexPath: indexPath];
        //    DestinationModel *model = self.dateModelDataSourceArray[indexPath.item];
        //    [cell updateViewWithModel:model];
        
        return cell;
        
    }else if (collectionView == self.choosePeriodCollectionView){
        TicketOrderChoosePeriodCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: CELL_REUSEIDENTIFIER_COLLECTION1 forIndexPath: indexPath];
        //    DestinationModel *model = self.dateModelDataSourceArray[indexPath.item];
        //    [cell updateViewWithModel:model];
        return cell;
        
    }
    return nil;
}




#pragma mark -UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@", indexPath);
}




- (void)moreDateBtnClick{
    //    if (self.delegate && [self.delegate respondsToSelector:@selector(moreDateBtnDidClick)]) {
    //        [self.delegate moreDateBtnDidClick];
    //    }
    
    if (self.moreButtonClickedBlock) {
        self.moreButtonClickedBlock(self.indexPath);
    }
    //    [self configChoosePeriodView];
    
    
}


-(void)setModel:(OptionModel *)model{
    
    
    // 标题
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.sd_layout.leftSpaceToView(self.contentView, MARGIN_15).topSpaceToView(self.contentView, 39.5).widthIs(80).heightIs(15);
    
    
    
    [self.contentView addSubview:self.img];
    self.img.sd_layout.rightSpaceToView(self.contentView, MARGIN_15).topSpaceToView(self.contentView, 83.5).widthIs(8.5).heightIs(15.5);
    
    
    
    [self.contentView addSubview:self.moreDateLabel];
    self.moreDateLabel.sd_layout.rightSpaceToView(self.img, MARGIN_10).centerYEqualToView(self.img).widthIs(40).autoHeightRatio(0);
    
    
    [self.contentView addSubview:self.moreDateBtn];
    self.moreDateBtn.sd_layout.leftEqualToView(self.moreDateLabel).rightEqualToView(self.img).centerYEqualToView(self.img).heightIs(40);
    
    
    
    [self.contentView addSubview:self.mainCollectionView];
    self.mainCollectionView.sd_layout.leftSpaceToView(self.contentView, 5).topSpaceToView(self.titleLabel, MARGIN_10).rightSpaceToView(self.moreDateBtn, MARGIN_10).heightIs(80);
    
    
    UIView *bottomView;
    
    if (model.isPeriodMode == YES) {
        [self.contentView addSubview:self.choosePeriodLabel];
        self.choosePeriodLabel.sd_layout.leftSpaceToView(self.contentView, MARGIN_15).topSpaceToView(self.mainCollectionView, MARGIN_20).rightSpaceToView(self.contentView, MARGIN_15).heightIs(15);
        
        
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
        
        [self.contentView addSubview:self.choosePeriodCollectionView];
        self.choosePeriodCollectionView.sd_layout.leftSpaceToView(self.contentView, MARGIN_15).topSpaceToView(self.choosePeriodLabel, MARGIN_10).rightSpaceToView(self.contentView, MARGIN_15).heightIs((50 + 10) * lines);
        
        bottomView  = self.choosePeriodCollectionView;
    }else{
        
        
        bottomView  = self.mainCollectionView;
    }
    
    [self setupAutoHeightWithBottomView:bottomView bottomMargin:MARGIN_20];

}

@end
