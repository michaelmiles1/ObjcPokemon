//
//  ViewController.m
//  ObjcPokemon
//
//  Created by Michael Miles on 8/3/22.
//

#import "ViewController.h"
#import "Pokemon.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSMutableArray *pokemonData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [Pokemon getPokemonFromServer:0 completionHandler:^(NSMutableArray *array) {
        self.pokemonData = array;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pokemonData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    Pokemon *poke = [self.pokemonData objectAtIndex:indexPath.row];
    cell.textLabel.text = poke.name;
    return cell;
}


@end
