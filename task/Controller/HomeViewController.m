//
//  HomeViewController.m
//  task
//
//  Created by new on 23.02.2019.
//  Copyright © 2019 new. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "ImageListDataModel.h"
#import "NetworkService.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>
{
    RLMResults *dataArray;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ImageListDataModel* imageListDataModel;
@property (nonatomic, strong) UIRefreshControl *refreshControl;




@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _refreshControl = [[UIRefreshControl alloc]init];
    [_refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
    
    if (@available(iOS 10.0, *)) {
        self.tableView.refreshControl = _refreshControl;
    } else {
        [self.tableView addSubview:_refreshControl];
    }

    self.imageListDataModel = [[ImageListDataModel alloc] init];
    dataArray = [self.imageListDataModel getData];
    
    [self getData];
}

- (void)refreshTable {
    [self getData];
    [_refreshControl endRefreshing];
}

-(void)getData{
    [NetworkService getDatasuccess:^(id  _Nonnull object) {
        NSDictionary *dict = object[@"response"];
        [self reloadData:dict[@"results"]];
        
    } failure:^(id  _Nonnull bject) {
        NSLog(@"%@", bject);
    }];
}

-(void)reloadData:(NSArray *)array{
    
    DBManager *manager = [[DBManager alloc] init];
    [manager deleteAllObjects];
    
    for (NSDictionary *dict in array) {
        NSString *identifier = dict[@"id"];
        NSDictionary *dictionary = dict[@"fields"];
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:dictionary[@"thumbnail"]]];
        NSString *tagTexst = dict[@"webTitle"];
        NSString *data = dict[@"webPublicationDate"];
        if (imageData != nil) {
            NSDictionary *dict = @{@"identifier": identifier, @"imageData": imageData, @"tagTexst": tagTexst, @"data": data};
            [manager insertImageItem:dict];
        }
        
    }
    self.imageListDataModel = [[ImageListDataModel alloc] init];
    dataArray = [self.imageListDataModel getData];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    ImageItem *item = dataArray[indexPath.row];
    [cell configurByImageItem:item];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    static HomeTableViewCell *cell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cell = [tableView dequeueReusableCellWithIdentifier: @"cell"];
    });
    [cell configurByImageItem:dataArray[indexPath.row]];
    return [cell.contentView systemLayoutSizeFittingSize: UILayoutFittingCompressedSize].height + 1;
}

@end
