//
//  ViewController.m
//  Directory
//
//  Created by Garrett Wang on 11/7/16.
//  Copyright © 2016 Garrett Wang. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSArray<Person *> *people;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *alex = [Person new];
    alex.name = @"Alex";
    alex.title = @"instructor";
    
    Person *bob = [Person new];
    bob.name = @"bob";
    bob.title = @"example";
    
    people = @[alex, bob];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return people.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    Person *person = people[indexPath.row];
    cell.textLabel.text = person.name;
    cell.detailTextLabel.text = person.title;
    return cell;
}
@end
