//
//  MyViewController.m
//  RGCategoryView
//
//  Created by 123 on 15/10/30.
//  Copyright (c) 2015年 com.roroge. All rights reserved.
//

#import "MyViewController.h"
#import "CategoryTableCell.h"
//#import "Cell/CollectionCell.xib"

#define CategoryIdentifier           @"CategoryIdentifier"
#define CollectionCell               @"CollectionCell"

@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

{
    NSArray *array;
    NSArray *titleArray;
}
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    array= @[@{@"image":@"11.png",@"name":@"手机"},@{@"image":@"12.png",@"name":@"手机"},@{@"image":@"13.png",@"name":@"手机"},@{@"image":@"14.png",@"name":@"手机"},@{@"image":@"15.png",@"name":@"手机"},@{@"image":@"16.png",@"name":@"手机",},@{@"image":@"11.png",@"name":@"手机"},@{@"image":@"12.png",@"name":@"手机"},@{@"image":@"13.png",@"name":@"手机"},@{@"image":@"14.png",@"name":@"手机"},@{@"image":@"15.png",@"name":@"手机"},@{@"image":@"16.png",@"name":@"手机",}];
    
    titleArray=@[@"水果",@"数码",@"分类1" ];
    
    
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"CategoryTableCell" bundle:nil] forCellReuseIdentifier:CategoryIdentifier];
    [self.collectView registerNib:[UINib nibWithNibName:@"CollectionCell" bundle:nil] forCellWithReuseIdentifier:CollectionCell];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionCell forIndexPath:indexPath];
    
//    if(cell==nil)
//    {
//     cell=
//    }
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:301];
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:101];
    NSDictionary *dic = [array objectAtIndex:indexPath.row];
    imageView.image = [UIImage imageNamed:[dic objectForKey:@"image"]];
    nameLabel.text = [dic objectForKey:@"name"];
    return cell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    CategoryTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CategoryIdentifier];
//    [cell configCellWithTitle:[titleArray objectAtIndex:indexPath.row] andIndexPath:indexPath andSelectIndexPath:indexPath];
    
    UITableViewCell *cell=(UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CategoryIdentifier ];
    
    if(cell==nil)
    {
        cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CategoryIdentifier];
        
    }
    
    cell.textLabel.text=[titleArray objectAtIndex:indexPath.row];
    return cell;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titleArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
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
