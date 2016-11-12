//
//  CustomButton.swift
//
//  Created by Zach Zeleznick on 9/21/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    // MARK: Stores text content for later use
    var content: String = ""
    //var b = false
    var color: UIColor!
    convenience init(content: String? = "") {
        self.init(frame: .zero)
        self.content = content!
    }
    override init(frame: CGRect) {
        self.content = ""
        self.color = UIColor.darkGray
        super.init(frame: frame)
        // Do any additional setup here.
        self.layer.borderColor = UIColor.black.cgColor
        self.tintColor = UIColor.darkGray
    }
    // TODO: Custom Button Behavior for Styling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Add any code for customization.
        //color = self.backgroundColor!
        //self.backgroundColor = UIColor.white
        color = self.backgroundColor
        self.backgroundColor = UIColor.lightGray
        super.touchesBegan(touches, with: event)
    }
    // TODO: Custom Button Behavior for Styling
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Add any code for customization.
        //self.backgroundColor = UIColor.black
        //self.backgroundColor = color
        self.backgroundColor = UIColor.black
        super.touchesEnded(touches, with: event)
    }
    // MARK: Required inits are required
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
