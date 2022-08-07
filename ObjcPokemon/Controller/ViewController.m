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

@property (nonatomic) BOOL isLoading;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.isLoading = YES;
    [Pokemon getPokemonFromServer:0 completionHandler:^(NSMutableArray *array) {
        self.isLoading = NO;
        self.pokemonData = array;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pokemonData.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    if (indexPath.row <= self.pokemonData.count - 1) {
        Pokemon *poke = [self.pokemonData objectAtIndex:indexPath.row];
        cell.textLabel.text = poke.name;
    } else {
        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
        spinner.center = cell.center;
        [cell addSubview:spinner];
        [spinner startAnimating];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.pokemonData.count && !self.isLoading) {
        self.isLoading = YES;
        [Pokemon getPokemonFromServer:(int)self.pokemonData.count + 1 completionHandler:^(NSMutableArray *array) {
            self.isLoading = NO;
            [self.pokemonData addObjectsFromArray:array];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }];
    }
}


@end
