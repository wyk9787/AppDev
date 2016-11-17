//
//  ViewController.m
//  Directory
//
//  Created by Garrett Wang on 11/7/16.
//  Copyright © 2016 Garrett Wang. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

static NSString *dataURL = @"https://appdev.grinnell.edu/members.json";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tabelView;

@end

@implementation ViewController{
    NSMutableArray<Person *> *people;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshContent];

    people = [NSMutableArray new];
}

- (void)refreshContent {
    NSURL *properDataURL = [NSURL URLWithString:dataURL];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:properDataURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray<NSString *> *names = [dict allKeys];
        for(NSString *key in names){
            NSDictionary *personDict = dict[key];
            NSString *title = personDict[@"title"];
            Person *person = [Person new];
            person.name = key;
            person.title = title;
            
            [people addObject:person];
        }
        [self.tabelView reloadData];
    }];
    [task resume];
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
