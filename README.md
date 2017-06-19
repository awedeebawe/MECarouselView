Carousel View
============

## About
This project is mantained by **Massa Entertainment**.<br>
The team is composed by

**Gabriel B. Valério**
iOS Developer

**Kayan Lucas**
Mobile Designer

## What is it?
This framework is a easy-to-use CarouselView focused on iOS UIKit-based applications. The code was written entirely in Swift 3.

## Installation
The ```MECarouselView``` is avaliable via CocoaPods.

```
    pod 'MECarouselView', :git => 'https://github.com/massaentertainment/MECarouselView.git'
```

## How to use?

First, we started by creating a new Xcode Project and setting the following layout inside the ```Main.storyboard``` file:

![](https://github.com/massaentertainment/MECarouselView/blob/master/Screenshots/Step1.png?raw=true)

Then we set the custom class ```MECarouselView``` for the view that will be the carousel:

![](https://github.com/massaentertainment/MECarouselView/blob/master/Screenshots/Step2.png?raw=true)

Finally we link the MECarouselView to the view controller

![](https://github.com/massaentertainment/MECarouselView/blob/master/Screenshots/Step3.png?raw=true)

In this case, we will be using the datasource and the delegate on the ViewController.

```swift
class ViewController: UIViewController {

    @IBOutlet weak var carouselView: MECarouselView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carouselView.dataSource = self
        carouselView.delegate = self
    }
    
    //The .touchUpInside action for the 3 buttons present on the layout.   
    @IBAction func onSnapButton(_ sender: Any) {
        carouselView.snapToView(at: Int((sender as! UIButton).titleLabel!.text!)! - 1)
    }


}

extension ViewController : MECarouselViewDataSource {
    
    //The total number of views that the carouselView will have
    //Required
    func numberOfViewsInMECarouselView(_ carouselView: MECarouselView) -> Int {
        return 3
    }
    
    //The view for the given index
    //Required
    func carouselView(_ carouselView: MECarouselView, viewForIndex index: Int) -> UIView {
        let vw = UIView(frame: CGRect(origin: .zero, size: carouselView.frame.size))
        let colors = [UIColor.red, .blue, .black]
        vw.backgroundColor = colors[index]
        return vw
    }
    
    //The multiplier of width of the views related to the carousel
    //Required
    func standardItemWidthMultiplierInMECarouselView(_ carouselView:MECarouselView) -> CGFloat {
        return 0.95
    }
    
    //The users can scroll by himself? In this case they can't!
    //Optional
    func isScrollAvaliableInMECarouselView(_ carouselView:MECarouselView) -> Bool {
        return false
    }

    //The standard view scale for the views out of the center
    //Optional
    func standardItemScaleInMECarouselView(_ carouselView:MECarouselView) -> CGFloat {
        return 0.9
    }
    
}
```

Setting the delegate up and also remembering that all the methods are optionals:

```swift
extension ViewController : MECarouselViewDelegate {
    
    //Called before the Scrollview snaps to view
    func carouselView(_ carouselView:MECarouselView, willSnapTo index:Int) {
        print("Will snap to \(index)")
    }
    
    //Called after the Scrollview snaps to view
    func carouselView(_ carouselView:MECarouselView, DidSnapTo index:Int) {
        print("Did snap to \(index)")
    }
    
}
```

You should have something like this:

![](https://github.com/massaentertainment/MECarouselView/blob/master/Screenshots/MECarouselView_gif.gif?raw=true)

## Contributing

Feel free to contact us and give some forks, feedbacks and patches.

## Contact

Email:
massaentertainmentdev@gmail.com

## License

This FW is distributed under MIT License.
