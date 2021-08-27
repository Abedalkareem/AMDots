//
//  ViewController.swift
//  AMDots
//
//  Created by abedalkareem omreyh on 5/1/18.
//  Copyright © 2018 abedalkareem omreyh. All rights reserved.
//

import AMDots
import UIKit

class CodeExampleViewController: UIViewController {

  var dotsView: AMDotsView!

  override func viewDidLoad() {
    super.viewDidLoad()

    dotsView = AMDotsView(frame: CGRect(x: 20, y: 20, width: 150, height: 70),
                          colors: [#colorLiteral(red: 0.9725490196, green: 0.7333333333, blue: 0.8156862745, alpha: 1), #colorLiteral(red: 0.9568627451, green: 0.5607843137, blue: 0.6941176471, alpha: 1), #colorLiteral(red: 0.9411764706, green: 0.3843137255, blue: 0.5725490196, alpha: 1), #colorLiteral(red: 0.9254901961, green: 0.2509803922, blue: 0.4784313725, alpha: 1), #colorLiteral(red: 0.9137254902, green: 0.1176470588, blue: 0.3882352941, alpha: 1)])
    dotsView.backgroundColor = UIColor.white
    dotsView.animationType = .scale
    view.addSubview(dotsView)

    dotsView.start()
  }
}
