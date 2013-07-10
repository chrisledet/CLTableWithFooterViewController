## CLTableWithFooterViewController

Easily add a stationary footer image when you reach the bottom of your UIScrollView or UITableView. It will remain put when the content bounces up and hide when scrolling up.

## Usage

* Just import the `CLTableWithFooterViewController.h` header file into your UIViewController class.
* Create a UIViewController that is a subclass of CLTableWithFooterViewController.
* Now just sent the footer image by calling the `footerImage` property.

Here's an example

```objective-c
#import "CLTableWithFooterViewController.h"

@interface MyViewController : CLTableWithFooterViewController
@end

@implementation MyViewController

- (void)viewDidLoad {
    self.footerImage = [UIImage imageNamed:@"my_footer.png"];
}

@end

```


### Example

![image](https://raw.github.com/chrisledet/CLTableWithFooterViewController/master/Example.gif)

Also, I included an example app. Just open the Xcode project, build, and run.

### Installation

Simply add all the files in the [Src](https://github.com/chrisledet/CLTableWithFooterViewController/tree/master/Src) directory to your project.

### License

Released under the MIT license.
