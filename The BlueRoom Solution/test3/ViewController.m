#import "ViewController.h"

#import "Fun.h"
#import "ComboViewController.h"

@interface ViewController ()
<
UITextViewDelegate
>

@property (strong) NSArray* menu;

- (void)loadCsv;

@end

@implementation ViewController
{
    UITextView *_view;
    UIButton *_button;
    UILabel *_label1;
    UILabel *_label2;
    UILabel *_label3;
}

#pragma lifestyle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadCsv];
    
    // Do any additional setup after loading the view, typically from a nib.
    _view = [[UITextView alloc] init];
    _view.backgroundColor = [UIColor orangeColor];
    _view.textColor = [UIColor whiteColor];
    _view.delegate = self;
    [_view setFont:[UIFont boldSystemFontOfSize:20]];
    [self.view addSubview:_view];
    
    _button = [[UIButton alloc] init];
    _button.backgroundColor = [UIColor orangeColor /*colorwithRed:0.25 green:0.39 blue:0.87 alpha:1.0*/];
    [_button setTitle:@"Get Combinations!" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    _label1 = [[UILabel alloc] init];
    _label1.backgroundColor = [UIColor clearColor];
    _label1.text = @"The";
    _label1.textColor = [UIColor whiteColor];
    [_label1 setFont:[UIFont boldSystemFontOfSize:75]];
    [self.view addSubview:_label1];

    _label2 = [[UILabel alloc] init];
    _label2.backgroundColor = [UIColor clearColor];
    _label2.text = @"Blue Room";
    _label2.textColor = [UIColor whiteColor];
    [_label2 setFont:[UIFont boldSystemFontOfSize:75]];
    [self.view addSubview:_label2];
    
    _label3 = [[UILabel alloc] init];
    _label3.backgroundColor = [UIColor clearColor];
    _label3.text = @"Solution";
    _label3.textColor = [UIColor whiteColor];
    [_label3 setFont:[UIFont boldSystemFontOfSize:75]];
    [self.view addSubview:_label3];
}

- (void)loadCsv {
    NSMutableArray *data = [NSMutableArray array];
//    NSString *fileContents = [NSString stringWithContentsOfFile:@"menu.csv"];
    NSString* fileContents = [NSString stringWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"menu" withExtension:@"csv"] encoding:NSUTF8StringEncoding error:nil];
    NSArray *rows = [fileContents componentsSeparatedByString:@"\n"];
    for (NSString *row in rows){
        NSArray *Columns = [row componentsSeparatedByString:@","];
        [data addObject:Columns];
        
    }
    self.menu = data;
    UIColor *bgColor = [UIColor colorWithRed:142.0/255.0 green:190.0/255.0 blue:297.0/255.0 alpha:1.0];
    self.view.backgroundColor = bgColor;
    NSLog(@"Parsed : %@", self.menu);
}

- (void)viewWillLayoutSubviews {
    _view.frame = (CGRect) {
        {
            .x = 161,
            .y = 400
        },
        {
            .width = 100,
            .height = 50
        }
    };
    
    _button.frame = (CGRect) {
        {
            .x = 111,
            .y = 500
        },
        {
            .width = 200,
            .height = 100
        }
    };
    
    _label1.frame = (CGRect) {
        {
            .x = 30,
            .y = 30
        },
        {
            .width = 500,
            .height = 200
        }
    };

    _label2.frame = (CGRect) {
        {
            .x = 30,
            .y = 85
        },
        {
            .width = 500,
            .height = 200
        }
    };
    
    _label3.frame = (CGRect) {
        {
            .x = 30,
            .y = 140
        },
        {
            .width = 500,
            .height = 200
        }
    };
}

- (void)viewWillDisappear:(BOOL)animated
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnClick:(id)blah {
    int i = 1;
    ++i;
    _view.backgroundColor = [UIColor blackColor];
    NSLog(@"button clicked string: %@", _view.text);
    
    float target = [[NSDecimalNumber decimalNumberWithString:_view.text] floatValue];
    NSLog(@"Target price: %f", target);
    NSLog(@"Menu: %@", self.menu);
    NSArray* combinations = sumAlgorithm(self.menu, target);
    
    ComboViewController* comboView = [[ComboViewController alloc] initWithResults:combinations];
    [self presentViewController:comboView animated:NO completion:nil];
    
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView
{
    NSLog(@"this is a formated string: %@", textView.text);
}

@end
