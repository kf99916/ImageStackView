# ImageStackView

ImageStackView is a beautiful image stack view to show your selected images..

[![GitHub stars](https://img.shields.io/github/stars/kf99916/ImageStackView.svg)](https://github.com/kf99916/ImageStackView/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/kf99916/ImageStackView.svg)](https://github.com/kf99916/ImageStackView/network)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/ImageStackView.svg)](https://cocoapods.org/pods/ImageStackView)
[![Platform](https://img.shields.io/cocoapods/p/ImageStackView.svg)](https://github.com/kf99916/ImageStackView)
[![GitHub license](https://img.shields.io/github/license/kf99916/ImageStackView.svg)](https://github.com/kf99916/ImageStackView/blob/master/LICENSE)

![ImageStackView](/screenshots/imageStackView-1.png 'ImageStackView')
![ImageStackView](/screenshots/imageStackView-2.png 'ImageStackView')

## Requirements

- iOS 9.0 or higher
- Swift 5

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate Alamofire into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'ImageStackView'
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding ImageStackView as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/kf99916/ImageStackView.git")
]
```

## Usage

### Import

```swift
import ImageStackView
```

### Integration

- Add the UIView into your storyboard and set the UIView's class as `ImageStackView` or initialize `ImageStackView` programmatically.
- Invoke `add(imageView: gestureRecognizers:)` to add a imageView to `ImageStackView`.
- Invoke `remove(imageView:)` to remove a imageView to `ImageStackView`.

### ImageStackView

The image stack view.

`var imageViews: [UIImageView]` All imageViews in the stack view. (default `[]`)  
`var maxNumViews: Int` the maximum of #views in the image stack view. A count text is added to the stack view when #views is larger than this number. (default `5`)  
`var numViewsInFirstStack: Int` #views in the first stack. If #views in the stack view is larger than this number, The different axis stack will be added. (default `1`)  
`var spacing: CGFloat` The spacing of the stack view. (default `5`)

#### Member Methods

```swift
add(imageView: UIImageView, gestureRecognizers: [UIGestureRecognizer] = [])
```

Add a imageView with gestureRecognizers into the stack view.

```swift
remove(imageView: UIImageView)
```

Remove a imageView from the stack view.

## Apps using ImageStackView

If you are using ImageStackView in your app and want to be listed here, simply create a pull request.

I am always curious who is using my projects :)

[Hikingbook](https://itunes.apple.com/app/id1067838748) - by Zheng-Xiang Ke

![Hikingbook](apps/Hikingbook.png)

## Demo

ImageStackViewDemo is a simple demo app which shows the usage of ImageStackView in a storyboard.

## Author

Zheng-Xiang Ke, kf99916@gmail.com

## License

ImageStackView is available under the MIT license. See the LICENSE file for more info.
