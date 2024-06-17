//
//  ViewController.m
//  CurrencyConversion
//
//  Created by Slidecoder JS on 2024/06/14.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *audCurrencyLabel;
@property (weak, nonatomic) IBOutlet UILabel *gbpCurrencyLabel;
@property (weak, nonatomic) IBOutlet UILabel *zarCurrencyLabel;
@property (weak, nonatomic) IBOutlet UILabel *euroCurrencyLabel;
@property (weak, nonatomic) IBOutlet UILabel *krwCurrencyLabel;

@property (nonatomic) CRCurrencyRequest *req;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Added TapGesture to dismiss the keyboard
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEditing)];
        tap.cancelsTouchesInView = NO;
        [self.view addGestureRecognizer:tap];
    
}

- (IBAction)convertActionButton:(id)sender 
{
    self.convertButton.enabled = NO;
    
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
    
    
    
}

- (void)currencyRequest:(CRCurrencyRequest *)req retrievedCurrencies:(CRCurrencyResults *)currencies
{
    self.convertButton.enabled = YES;
    
    double inputValue = [self.inputTextField.text doubleValue];
    
    // fetch input value and match it to AUD value
    double audValue = inputValue * currencies.AUD;
    
    // fetch input value and match it with EUR currency value
    double euroValue = inputValue * currencies.EUR;
    
    // fetch input value and match it to BGP value
    double gbpValue = inputValue * currencies.GBP;
    
    // fetch input value and match it with KRW value
    double krwValue = inputValue * currencies.KRW;
    
    // fetch input value and match it to ZAR value
    double zarValue = inputValue * currencies.ZAR;
    
    // Convert those value to NSString format
    NSString *aussiDollars = [NSString stringWithFormat:@"%.2f", audValue];
    NSString *britishPounds = [NSString stringWithFormat:@"%.2f", gbpValue];
    NSString *rands = [NSString stringWithFormat:@"%.2f", zarValue];
    NSString *euros = [NSString stringWithFormat:@"%.2f", euroValue];
    NSString *koreanWons = [NSString stringWithFormat:@"%.2f", krwValue];
    
    // Assign values to corresponding labels
    self.audCurrencyLabel.text = aussiDollars;
    self.gbpCurrencyLabel.text = britishPounds;
    self.zarCurrencyLabel.text = rands;
    self.euroCurrencyLabel.text = euros;
    self.krwCurrencyLabel.text = koreanWons;
}

// MARK: - Defining endEditing method
- (void)endEditing 
{
    [self.view endEditing:YES];
}


@end
