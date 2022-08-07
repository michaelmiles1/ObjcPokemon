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
    [Pokemon getPokemonFromServer:20];
    self.pokemonData = [NSMutableArray arrayWithObjects:
                        [[Pokemon alloc] initWithName:@"Bulbasaur" pokedexNumber:1],
                        [[Pokemon alloc] initWithName:@"Ivysaur" pokedexNumber:2],
                        [[Pokemon alloc] initWithName:@"Venasaur" pokedexNumber:3],
                        [[Pokemon alloc] initWithName:@"Charmander" pokedexNumber:4],
                        [[Pokemon alloc] initWithName:@"Charmeleon" pokedexNumber:5],
                        nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
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
