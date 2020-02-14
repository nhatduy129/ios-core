//
//  UIImage+.swift
//  35.AddTextToImage
//
//  Created by Duy Nguyen on 19/1/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import UIKit

extension UIImage {
    
    func addText(drawText: NSString, atPoint: CGPoint) -> UIImage {

        // Setup the font specific variables
        let textColor = UIColor.black
        let textFont = UIFont(name: "Helvetica Bold", size: 12)!

        // Setup the image context using the passed image
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(self.size, false, scale)

        // Setup the font attributes that will be later used to dictate how the text should be drawn
        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
        ]

        // Put the image into a rectangle as large as the original image
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))

        // Create a point within the space that is as bit as the image
        let rect = CGRect(x: atPoint.x, y: atPoint.y, width: self.size.width, height: self.size.height)

        // Draw the text into an image
        drawText.draw(in: rect, withAttributes: textFontAttributes)

        // Create a new image out of the images we have created
        let res = UIGraphicsGetImageFromCurrentImageContext()

        // End the context now that we have the image we need
        UIGraphicsEndImageContext()
        return res!
    }
}
