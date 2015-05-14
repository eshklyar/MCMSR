//
//  ViewController.m
//  MCMSR
//
//  Created by Edik Shklyar on 5/14/15.
//  Copyright (c) 2015 Edik Shklyar. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MagicalCreature *dragon =[[MagicalCreature alloc]init];
    dragon.name = @"Dragon";

    MagicalCreature *phoenix =[[MagicalCreature alloc]init];
    phoenix.name = @"Phoenix";

    MagicalCreature *unicorn =[[MagicalCreature alloc]init];
    unicorn.name = @"Unicorn";

    self.creatures =[[NSMutableArray alloc ] initWithObjects:@"Dragon", @"Phoenix", @"Unicorn", nil ];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

    cell.textLabel.text = [self.creatures objectAtIndex:indexPath.row];
    return cell;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.creatures.count;
}
@end
