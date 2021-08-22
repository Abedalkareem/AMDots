//
//  AMDots.swift
//  AMDots
//
//  Created by abedalkareem omreyh on 5/1/18.
//  Copyright © 2018 abedalkareem omreyh. All rights reserved.
//

import UIKit

@IBDesignable
public class AMDots: UIView {

  // MARK: - Properties

  /// Size of the dot, the default is calculated from the view `width`,
  /// E.g: if you have `4` dots and the view width is `400`, each one will be `(400/4) - (4*spacing)`
  @IBInspectable public var dotSize: CGFloat = 0
  /// Space between each dot, the default is `10`
  @IBInspectable public var spacing: CGFloat = 10
  /// Animation duration for each dot, it should be more than `0.1`, the default is `0.4`
  @IBInspectable public var animationDuration: CGFloat = 0.4

  /// The negative time you need the animation to run before the prevuse animation finish for each dot
  /// (If you set it for 0.2, the next animation will run before 0.2 second before the current animation finish).
  /// the default value is `0.2`.
  @IBInspectable public var aheadTime: CGFloat = 0.2
  /// A Boolean value that controls whether the must be hidden when the animation is stopped.
  @IBInspectable public var hidesWhenStopped: Bool = true

  /// The circles `color`, the number of dots will be the same as the number of colors,
  /// so if you have 3 colors, you will have 3 dots.
  ///
  public var colors = [UIColor]() {
    didSet {
      setup()
      updateDotsSizes()
    }
  }
  public var blinkingColor = UIColor()

  /// Animation type, do you want the dot to `jump`, `scale` or `shake`
  public var animationType: AnimationType = .scale

  // MARK: Private properties

  private var defaultsColors = [#colorLiteral(red: 0.2352941176, green: 0.7294117647, blue: 0.3294117647, alpha: 1),#colorLiteral(red: 0.9568627451, green: 0.7607843137, blue: 0.05098039216, alpha: 1),#colorLiteral(red: 0.8588235294, green: 0.1960784314, blue: 0.2117647059, alpha: 1),#colorLiteral(red: 0.2823529412, green: 0.5215686275, blue: 0.9294117647, alpha: 1)]
  private var defaultsBlinkingColor = #colorLiteral(red: 0.8588235294, green: 0.1960784314, blue: 0.2117647059, alpha: 1)
  private var currentViewIndex = 0
  private var timer: Timer?

  // MARK: - init

  public init(frame: CGRect, colors: [UIColor]? = nil, blinkingColor: UIColor? = nil) {
    super.init(frame: frame)
    self.colors = colors ?? defaultsColors
    self.blinkingColor = blinkingColor ?? self.defaultsBlinkingColor
    setup()
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    colors = defaultsColors
    blinkingColor = defaultsBlinkingColor
    setup()
  }

  public override init(frame: CGRect) {
    super.init(frame: frame)
    colors = defaultsColors
    blinkingColor = defaultsBlinkingColor
    setup()
  }

  // MARK: - Private Methods

  private func setup() {
    subviews.forEach({ $0.removeFromSuperview() })
    for color in colors {
      let view = UIView()
      view.backgroundColor = color
      addSubview(view)
    }
  }

  private func updateDotsSizes() {
    let width = frame.size.width - (CGFloat(colors.count-1)*spacing)
    dotSize = dotSize == 0 ? (width / CGFloat(colors.count)) : dotSize

    subviews.enumerated()
      .forEach({ index, view in
        view.layer.cornerRadius = dotSize/2
        view.frame = CGRect(x: ((spacing + dotSize) * CGFloat(index)),
                            y: (frame.height/2) - (dotSize/2) , width: dotSize, height: dotSize)
      })
  }

  // MARK: Animation

  @objc private func startAnimation() {

    currentViewIndex += 1
    if currentViewIndex >= subviews.count {
      currentViewIndex = 0
    }

    switch animationType {
    case .scale:
      scaleAnimation()
    case .jump:
      moveAnimation()
    case .shake:
      moveAnimation()
    case .blink:
      scaleAnimation()
    }
  }

  private func scaleAnimation() {
    let view = subviews[currentViewIndex]
    let defualtColor = view.backgroundColor
    UIView.animate(withDuration: TimeInterval(animationDuration/2), delay: 0.0, animations: {
      view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
      if self.animationType == .blink {
        view.backgroundColor = self.blinkingColor
      }
    }) { (finished) in
      UIView.animate(withDuration: TimeInterval(self.animationDuration/2), animations: {
        view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        view.backgroundColor = defualtColor
      })
    }
  }

  private func moveAnimation() {
    let view = subviews[currentViewIndex]
    let orginalFrame = view.frame
    var newFrame = orginalFrame
    if animationType == .jump {
      newFrame.origin.y += dotSize/2
    } else {
      newFrame.origin.x -= dotSize/2
    }
    UIView.animate(withDuration: TimeInterval(animationDuration/2), delay: 0.0, animations: {
      view.frame = newFrame
    }) { (finished) in
      UIView.animate(withDuration: TimeInterval(self.animationDuration/2), animations: {
        view.frame = orginalFrame
      })
    }
  }

  // MARK: - Public Methods

  public override func removeFromSuperview() {
    super.removeFromSuperview()
    stop()
  }

  // MARK: (Stop/Start)

  /// Use it to start the animation for the AMDots.
  public func start() {

    guard colors.count != 0 else {
      assertionFailure("Before starting the animation, make sure that the colors array is not empty")
      return
    }
    isHidden = false

    timer = Timer.scheduledTimer(timeInterval: Double(animationDuration-aheadTime), target: self, selector: #selector(startAnimation), userInfo: nil, repeats: true)
    startAnimation()
  }

  /// Use it to stop the animation for the AMDots.
  public func stop() {
    timer?.invalidate()
    timer = nil

    if hidesWhenStopped {
      isHidden = true
    }
  }

  // MARK: - View lifecycle

  public override func didMoveToSuperview() {
    super.didMoveToSuperview()
    updateDotsSizes()
  }

  // MARK: - deinit

  deinit {
    stop()
  }
}

// MARK: - Enum

public enum AnimationType {
  case jump
  case scale
  case shake
  case blink
}


