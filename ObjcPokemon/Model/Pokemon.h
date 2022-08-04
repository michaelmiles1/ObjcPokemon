//
//  Pokemon.h
//  ObjcPokemon
//
//  Created by Michael Miles on 8/4/22.
//

#import <Foundation/Foundation.h>

@interface Pokemon : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSInteger *pokedexNumber;

-(instancetype)initWithName:(NSString*)name pokedexNumber:(NSInteger*)pokedexNumber;

@end
