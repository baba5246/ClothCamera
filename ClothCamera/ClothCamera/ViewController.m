
#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *picView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    picView = [[UIImageView alloc] initWithFrame:self.view.frame];
    picView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:picView];
    

    [self launchIPC];
}

// カメラ起動
-(void)launchIPC
{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
        ipc.delegate = self;
        ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
        ipc.allowsEditing = YES;
        [self presentViewController:ipc animated:YES completion:nil];
    }
}

// 撮影後
-(void)imagePickerController:(UIImagePickerController*)picker
       didFinishPickingImage:(UIImage*)image editingInfo:(NSDictionary*)editingInfo
{
    [self dismissModalViewControllerAnimated:YES];
    picView.image = image;
}

// 保存
-(void)targetImage:(UIImage*)image
didFinishSavingWithError:(NSError*)error contextInfo:(void*)context{
    
    if(error){
        NSLog(@"Save error:%@", error);
    }else{
        NSLog(@"Save completed!!");
    }
}
// キャンセル
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
