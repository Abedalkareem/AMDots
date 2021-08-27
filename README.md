<p align="center">
 <img src="https://raw.githubusercontent.com/Abedalkareem/AMDots/master/amdots_logo.png"  width="350">  </center>
</p>

[![CI Status](https://img.shields.io/travis/Abedalkareem/AMDots.svg?style=flat)](https://travis-ci.org/Abedalkareem/AMDots)
[![Version](https://img.shields.io/cocoapods/v/AMDots.svg?style=flat)](https://cocoapods.org/pods/AMDots)
[![License](https://img.shields.io/cocoapods/l/AMDots.svg?style=flat)](https://cocoapods.org/pods/AMDots)
[![Platform](https://img.shields.io/cocoapods/p/AMDots.svg?style=flat)](https://cocoapods.org/pods/AMDots)

<br>
AMDots is a loading indicator with dots moving like google loading, there are three types of the loading, scale, jump, and shake. 
<br>
<br>

## Screenshots

 <img src="https://raw.githubusercontent.com/Abedalkareem/AMDots/master/dots_demo.gif"  width="350">  </center>


## Example

### Code example

```swift
class CodeExampleViewController: UIViewController {

  private var dotsView: AMDotsView!

  override func viewDidLoad() {
    super.viewDidLoad()

    dotsView = AMDotsView(frame: CGRect(x: 20, y: 20, width: 150, height: 70),
                          colors: [.red, .blue, .yellow, .green])
    dotsView.backgroundColor = UIColor.white
    dotsView.animationType = .scale
    view.addSubview(dotsView)

    dotsView.start()
  }
}
```

### Storyboard example

```swift
class StoryboardExampleViewController: UIViewController {

  @IBOutlet weak var dotsView1: AMDotsView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    dotsView1.animationType = .jump
    dotsView1.aheadTime = 0.5
    dotsView1.animationDuration = 0.7
    dotsView1.start()
  }

}
```

## Installation

AMDots is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AMDots'
```

## Author

Abedalkareem, abedalkareem.omreyh@yahoo.com

## License

AMDots is available under the MIT license. See the LICENSE file for more info.
