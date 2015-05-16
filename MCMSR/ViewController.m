//
//  ViewController.m
//  MCMSR
//
//  Created by Edik Shklyar on 5/14/15.
//  Copyright (c) 2015 Edik Shklyar. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"


@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSString* returnedCreature;
@property NSIndexPath *returnedIndex;

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
    MagicalCreature *python = [[MagicalCreature alloc]initWithName:@"Ka"];
    NSLog(@"%@",python.name);

    self.creatures =[[NSMutableArray alloc ] initWithObjects:@"Dragon", @"Phoenix", @"Unicorn", nil ];
//    self.creatures =[[NSMutableArray alloc ] init];
    [self.creatures addObject:python.name];


}
//    -(void)viewWillAppear:(BOOL)animated{
//        [super viewWillAppear:animated];
//        [self.tableView reloadData];
//    }
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    if (self.returnedCreature !=nil) {
        NSLog(@" not empty");
         NSLog(@"not empty creature %@", self.returnedCreature);
        NSLog(@"returned row was %ld", self.returnedIndex.row);
        [self.creatures replaceObjectAtIndex:self.returnedIndex.row withObject:self.returnedCreature];
        NSLog(@"what a creature %@", [self.creatures objectAtIndex:self.returnedIndex.row]);
        [self.tableView reloadData];
    }
    else
           NSLog(@"empty  creature");
}

- (IBAction)onAddBtnPrsd:(UIButton *)sender {

    NSString *name = self.textField.text;

    MagicalCreature *creature = [[MagicalCreature new]initWithName:name];

    [self.creatures addObject:creature.name];

    [self.textField resignFirstResponder];

    [self.tableView reloadData];
}

#pragma mark -tebleView


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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    self.someProperty = [self.someArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"ShowCreatureSegue" sender:self];
}
#pragma mark -textField

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.textField resignFirstResponder];

    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
//    ????
    self.textField.clearsOnBeginEditing = YES;
     return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.textField.text =@"";
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.textField.text = @"";
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell*)cell {
    CreatureViewController *creatureController = segue.destinationViewController; // instantiate Controller and attach to desitination view controller segue

    NSIndexPath *ip = [self.tableView indexPathForSelectedRow]; // grabs index path that was touched

    creatureController.creature = [self.creatures objectAtIndex:ip.row]; // grab creature using row number as index, and pass to mcreature forward
    NSLog(@"creature %@", creatureController.creature );


//   creatureController.navigationItem.title = cell.textLabel.text;
    creatureController.navigationItem.title = [self.creatures objectAtIndex:ip.row];


//     creatureController.creature  = [self.creatures objectAtIndex:[self.tableView indexPathForCell:cell].row];
    self.returnedCreature =[NSString new];
    self.returnedIndex = [NSIndexPath new];

    self.returnedCreature = creatureController.creature;
    self.returnedIndex = ip;
     NSLog(@"from segue creature %@", self.returnedCreature);
}
@end








