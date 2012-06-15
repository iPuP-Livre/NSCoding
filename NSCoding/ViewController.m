//
//  ViewController.m
//  NSCoding
//
//  Created by Marian Paul on 02/04/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import "ViewController.h"
#import "Subject.h"
#import "ArchiverHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)addNewSubject:(id)sender 
{
    // À chaque fois qu'on ajoute une matière, on lit le fichier entièrement, on ajout la matière, on affiche la liste obtenue depuis la sauvegarde, puis on sauve
    // Attention cependant, ce n'est pas du tout la méthode à suivre : minimisez le nombre de lectures (normalemement juste dans le viewDidLoad) ainsi que le nombre d'écritures et gardez en cache RAM le tableau des matières
    
    NSMutableArray *array = [ArchiverHelper unarchiveData];
    if (!array) {
        array = [NSMutableArray array];
    }
    
    Subject *subj = [[Subject alloc] initWithNumber:array.count + 1
                                              color:[UIColor redColor]
                                               date:[NSDate date]
                                            teacher:@"Toto"
                                            subject:[NSString stringWithFormat:@"Subject %d", array.count + 1]
                                               room:@"204"];
    [array addObject:subj];
    NSLog(@"%@", array);
    [ArchiverHelper archiveArray:array];
}

@end
