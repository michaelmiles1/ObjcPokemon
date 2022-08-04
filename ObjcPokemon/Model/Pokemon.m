//
//  Pokemon.m
//  ObjcPokemon
//
//  Created by Michael Miles on 8/4/22.
//

#import "Pokemon.h"

@implementation Pokemon

-(instancetype)initWithName:(NSString *)name pokedexNumber:(NSInteger *)pokedexNumber {
    // have to initialize the NSObject first
    self = [super init];
    
    if (self) {
        self.name = name;
        self.pokedexNumber = pokedexNumber;
    }
    
    return self;
}

@end
