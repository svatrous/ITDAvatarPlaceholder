//
//  UIImage+ITDAvatarPlaceholder.swift
//  Pods
//
//  Created by Igor Kurylenko on 4/4/16.
//
//

import UIKit
import ChameleonFramework

public extension UIImage {
    
    public static func createAvatarPlaceholder(userFullName name: String, placeholderSize: CGSize, maxLettersCount: Int = 3,
                                                            font: UIFont = UIFont.systemFont(ofSize: 14)) -> UIImage {
        let text = name.toAvatarPlaceholderText(maxLettersCount)
        let bgColor = UIColor.forAvatarPlaceholderBackground(userFullName: name)
        
        return createAvatarPlaceholder(withText: text, withBackgroundColor: bgColor, placeholderSize: placeholderSize, font: font)
    }
    
    private static func createAvatarPlaceholder(withText text: String, withBackgroundColor bgColor: UIColor,
                                                         placeholderSize: CGSize, font: UIFont = UIFont.systemFont(ofSize: 14)) -> UIImage {
        let textColor = UIColor(contrastingBlackOrWhiteColorOn: bgColor, isFlat: true)
        let textImage = createTextImage(text: text, textColor: textColor!, font: font.withSize(placeholderSize.height))
        
        return createAvatarPlaceholder(textImage: textImage, bgColor: bgColor, placeholderSize: placeholderSize)
    }
    
    private static func createTextImage(text: String, textColor: UIColor, font: UIFont) -> UIImage? {
        guard text.characters.count > 0 else { return nil }
        
        let attr:[String:AnyObject] = [NSFontAttributeName: font, NSForegroundColorAttributeName: textColor]
        let textSize = text.size(attributes: attr)
        
        UIGraphicsBeginImageContext(textSize)
        
        text.draw(in: CGRect(origin: CGPoint.zero, size: textSize), withAttributes: attr)
        
        let textImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext()
        
        return textImage
    }
    
    private static func createAvatarPlaceholder(textImage: UIImage?, bgColor: UIColor, placeholderSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(placeholderSize)
        
        let context = UIGraphicsGetCurrentContext();
        
        context!.setFillColor(bgColor.cgColor)
        
        context!.fill(CGRect(origin: CGPoint.zero, size: placeholderSize))
        
        if let textImageRect = getAvatarPlaceholderTextImageRect(textImage: textImage, placeholderSize) {
            textImage?.draw(in: textImageRect)
        }
        
        let avatarPlaceholder = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return avatarPlaceholder!
    }
    
    private static func getAvatarPlaceholderTextImageRect(textImage: UIImage?, _ placeholderSize: CGSize) -> CGRect? {
        guard let textSize = textImage?.size else { return nil }
        
        let maxHeight = placeholderSize.height/kGoldenRatio
        let margin = placeholderSize.width * 0.05
        var width = placeholderSize.width - 2*margin
        var height = (textSize.height*width) / textSize.width
        
        if height > maxHeight {
            width = (maxHeight*width)/height
            height = maxHeight
        }
        
        let originX = (placeholderSize.width - width) / 2
        let originY = (placeholderSize.height - height) / 2
        
        return CGRect(origin: CGPoint(x: originX, y:originY),
                      size: CGSize(width: width, height: height))
    }
}
