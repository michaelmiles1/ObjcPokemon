//
//  Pokemon.h
//  ObjcPokemon
//
//  Created by Michael Miles on 8/4/22.
//

#import <Foundation/Foundation.h>

@interface Pokemon : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) int pokedexNumber;

-(instancetype)initWithName:(NSString*)name pokedexNumber:(int)pokedexNumber;
+(void)getPokemonFromServer:(int)offset;

@end
