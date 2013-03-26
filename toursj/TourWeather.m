//
//  TourWeather.m
//  toursj
//
//  Created by lk on 13-2-11.
//  Copyright (c) 2013年 yipin. All rights reserved.
//

#import "TourWeather.h"

@interface TourWeather ()

@property (weak, nonatomic) IBOutlet UILabel *dateTomorrow;
@property (weak, nonatomic) IBOutlet UILabel *tempratureTomorrow;
@property (weak, nonatomic) IBOutlet UILabel *weatherTomorrow;
@property (weak, nonatomic) IBOutlet UILabel *windTomorrow;
@property (nonatomic,retain) NSDictionary *tourData;
@property (weak, nonatomic) IBOutlet UILabel *tempratureToday;
@property (weak, nonatomic) IBOutlet UILabel *weatherToday;
@property (weak, nonatomic) IBOutlet UILabel *windToday;
@property (weak, nonatomic) IBOutlet UILabel *dateToday;
@property (nonatomic,retain) NSString *baseUrlStr;

-(void)initWeather;
-(void)initWeather : (NSString*) zeroOrOne;
-(NSString *)getStringFrom: (NSString *) string ByKey : (NSString *) key;

@end

@implementation TourWeather

@synthesize dateTomorrow=_dateTomorrow;
@synthesize tempratureTomorrow=_tempratureTomorrow;
@synthesize weatherTomorrow=_weatherTomorrow;
@synthesize windTomorrow=_windTomorrow;
@synthesize tempratureToday=_tempratureToday;
@synthesize weatherToday=_weatherToday;
@synthesize windToday=_windToday;
@synthesize dateToday=_dateToday;
@synthesize baseUrlStr=_baseUrlStr;
@synthesize tourData=_tourData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title=[self.tourData valueForKey:@"name"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.baseUrlStr=@"http://php.weather.sina.com.cn/";
    [self initWeather];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setDateToday:nil];
    [self setTempratureToday:nil];
    [self setWeatherToday:nil];
    [self setWindToday:nil];
    [self setDateTomorrow:nil];
    [self setTempratureTomorrow:nil];
    [self setWeatherTomorrow:nil];
    [self setWindTomorrow:nil];
    [super viewDidUnload];
}

-(void)initWeather
{
    [self initWeather:@"0"];
    [self initWeather:@"1"];
}

-(void)initWeather : (NSString*) zeroOrOne
{
    NSString *path=@"http://php.weather.sina.com.cn/xml.php?city=%cb%c9%bd%ad&password=DJOYnieT8234jlsK&day=0";
    if ([zeroOrOne isEqualToString:@"1"]) {
        path=@"http://php.weather.sina.com.cn/xml.php?city=%cb%c9%bd%ad&password=DJOYnieT8234jlsK&day=1";
    }
    NSURL *url=[[NSURL alloc] initWithString:path];
    NSData *data=[[NSData alloc]initWithContentsOfURL:url];
    NSString *dataStr=[[ NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSString *date=[[NSString alloc] initWithFormat:@"日期：%@",[self getStringFrom:dataStr ByKey:@"savedate_weather"] ];
    NSString *weather = [[NSString alloc] initWithFormat:@"%@转%@",[self getStringFrom:dataStr ByKey:@"status1"],[self getStringFrom:dataStr ByKey:@"status2"]];
    NSString *temp = [[NSString alloc] initWithFormat:@"%@℃~%@℃",[self getStringFrom:dataStr ByKey:@"temperature1"],[self getStringFrom:dataStr ByKey:@"temperature2"]];
    NSString *wind = [[NSString alloc] initWithFormat:@"%@%@级",[self getStringFrom:dataStr ByKey:@"direction1"],[self getStringFrom:dataStr ByKey:@"power1"]];
    if ([zeroOrOne isEqualToString:@"0"]) {
        [self.dateToday setText:date];
        [self.weatherToday setText:weather];
        [self.tempratureToday setText:temp];
        [self.windToday setText:wind];
    } else if([zeroOrOne isEqualToString:@"1"]){
        [self.dateTomorrow setText:date];
        [self.weatherTomorrow setText:weather];
        [self.tempratureTomorrow setText:temp];
        [self.windTomorrow setText:wind];
    }
}
-(NSString *)getStringFrom: (NSString *) string ByKey : (NSString *) key
{
    NSString *value=nil;
    NSString *keyStart=[[NSString alloc] initWithFormat:@"<%@>",key];
    NSString *keyEnd=[[NSString alloc] initWithFormat:@"</%@>",key];
    NSRange arStart=[string rangeOfString:keyStart];
    NSRange arEnd=[string rangeOfString:keyEnd];
    if (arStart.length>0) {
        NSRange ar;
        ar.location=arStart.location+arStart.length;
        ar.length=arEnd.location-ar.location;
        value = [string substringWithRange:ar];
    }
    return value;
}
@end
