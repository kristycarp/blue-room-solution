//
//  ComboViewController.m
//  test3
//
//  Created by Stephanie Wang on 2/5/17.
//  Copyright © 2017 hack@brown. All rights reserved.
//

#import "ComboViewController.h"
#import "ViewController.h"
#import "Fun.h"

@interface ComboViewController ()

@property (weak) IBOutlet UITableView* table;

@property (strong) NSArray * ComboArray;

@end

@implementation ComboViewController
{
    UITextView *_view1;
    UIButton *_button1;
    UIButton *_backButton;
}

- (id)initWithResults:(NSArray *)results {
    if ([self initWithNibName:@"ComboViewController" bundle:nil]) {
        self.ComboArray = results;
        NSLog(@"Displaying combinations: %@", results);
    }
    
    return self;
}

- (void)viewDidLoad {
    // Do any additional setup after loading the view, typically from a nib.
    _view1 = [[UITextView alloc] init];
    UIColor *color1 = [UIColor colorWithRed:102.0/255.0 green:130.0/255.0 blue:227.0/255.0 alpha:1.0];
    _view1.backgroundColor = color1;
    _view1.delegate = self;
    [_view1 setFont:[UIFont boldSystemFontOfSize:15]];
    _view1.textColor = [UIColor whiteColor];
    [self.view addSubview:_view1];
    
    _button1 = [[UIButton alloc] init];
    _button1.backgroundColor = color1;
    [_button1 setTitle:@"Restrict results" forState:UIControlStateNormal];
    [_button1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button1];
    
    _backButton = [[UIButton alloc] init];
     UIColor *color2 = [UIColor colorWithRed:142.0/255.0 green:170.0/255.0 blue:247.0/255.0 alpha:1.0];
    _backButton.backgroundColor = color2;
    [_backButton setTitle:@"Back" forState: UIControlStateNormal];
    [_backButton addTarget:self action: @selector(backClick:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.table.dataSource = self;
    self.table.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillLayoutSubviews {
    _view1.frame = (CGRect) {
        {
            .x = 161,
            .y = 400
        },
        {
            .width = 100,
            .height = 50
        }
    };
    
    _button1.frame = (CGRect) {
        {
            .x = 111,
            .y = 500
        },
        {
            .width = 200,
            .height = 100
        }
    };
    
    _backButton.frame = (CGRect) {
        {
            .x = 161,
            .y = 650
        },
        {
            .width = 100,
            .height = 50
        }
    };
}

@end

@implementation ComboViewController (UITableViewDataSource)

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.ComboArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* newTable = [[UITableViewCell alloc] init];
    
    UITextView* content = [[UITextView alloc] init];
    content.text = [NSString stringWithFormat: @"%ld", (long)(indexPath.item + 1)];
    content.text = [content.text stringByAppendingString:@".\n"];
    for (NSString *food in self.ComboArray[indexPath.item])
    {
        NSString *formattedFood = [food stringByAppendingString:@", "];
        content.text = [content.text stringByAppendingString:formattedFood];
    }
    content.text = [content.text substringToIndex:[content.text length] -2];
    [content sizeToFit];
    [newTable addSubview:content];
    
    return newTable;
}
- (void)btnClick:(id)blah {
    int i = 1;
    ++i;
    _view1.backgroundColor = [UIColor blackColor];
    NSLog(@"button clicked string: %@", _view1.text);
    
    NSString *restriction = _view1.text;
    NSLog(@"Restriction: %@", restriction);
    NSArray *restrictedCombinations = restrictAlgorithm(restriction, self.ComboArray);
    
    ComboViewController* comboView = [[ComboViewController alloc] initWithResults:restrictedCombinations];
    [self presentViewController:comboView animated:NO completion:nil];
    
}
- (void)backClick:(id)blah {
    int i = 1;
    ++i;
    
    ViewController* view = [[ViewController alloc] init];
    [self presentViewController:view animated:NO completion:nil];
    
}

@end