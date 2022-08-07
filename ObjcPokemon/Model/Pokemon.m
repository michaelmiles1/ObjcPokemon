//
//  Pokemon.m
//  ObjcPokemon
//
//  Created by Michael Miles on 8/4/22.
//

#import "Pokemon.h"

@implementation Pokemon

-(instancetype)initWithName:(NSString *)name pokedexNumber:(int)pokedexNumber {
    // have to initialize the NSObject first
    self = [super init];
    
    if (self) {
        self.name = name;
        self.pokedexNumber = pokedexNumber;
    }
    
    return self;
}

+(void)getPokemonFromServer:(int)offset completionHandler:(void (^)(NSMutableArray * array))completionHandler {
    NSURL *dataURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://pokeapi.co/api/v2/pokemon?offset=%ld", (long) offset]];
    NSURLSessionDataTask *pokeListTask = [[NSURLSession sharedSession] dataTaskWithURL:dataURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == NULL && data != NULL) {
            NSError *jsonError = nil;
            NSDictionary *resultArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
            if (!resultArray) {
                NSLog(@"Error parsing JSON: %@", jsonError);
            }
            else {
                NSArray *pokeArray = resultArray[@"results"];
                NSLog(@"%@", pokeArray);
            }
        }
    }];
    
    [pokeListTask resume];
}

@end
