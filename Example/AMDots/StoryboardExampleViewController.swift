//
//  StoryboardExampleViewController.swift
//  AMDots_Example
//
//  Created by abedalkareem omreyh on 5/3/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import AMDots
import UIKit

class StoryboardExampleViewController: UIViewController {

  @IBOutlet private weak var dotsView1: AMDots!
  @IBOutlet private weak var dotsView2: AMDots!
  @IBOutlet private weak var dotsView3: AMDots!
  @IBOutlet private weak var dotsView4: AMDots!

  override func viewDidLoad() {
    super.viewDidLoad()

    dotsView1.animationType = .scale
    dotsView1.start()

    dotsView2.animationType = .blink
    dotsView2.colors = [#colorLiteral(red: 0.9725490196, green: 0.7333333333, blue: 0.8156862745, alpha: 1), #colorLiteral(red: 0.9725490196, green: 0.7333333333, blue: 0.8156862745, alpha: 1), #colorLiteral(red: 0.9725490196, green: 0.7333333333, blue: 0.8156862745, alpha: 1), #colorLiteral(red: 0.9725490196, green: 0.7333333333, blue: 0.8156862745, alpha: 1)]
    dotsView2.blinkingColor = #colorLiteral(red: 0.9137254902, green: 0.1176470588, blue: 0.3882352941, alpha: 1)
    dotsView2.start()

    dotsView3.animationType = .shake
    dotsView3.animationDuration = 0.3
    dotsView3.start()

    dotsView4.animationType = .jump
    dotsView4.aheadTime = 0.5
    dotsView4.animationDuration = 0.7
    dotsView4.start()
  }

}
