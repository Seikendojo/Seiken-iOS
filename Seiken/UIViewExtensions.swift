//
//  UIViewExtensions.swift
//  Seiken
//
//  Created by Shahin on 2017-10-07.
//  Copyright © 2017 98chimp. All rights reserved.
//

import Foundation

extension UIView
{
    // MARK: - Animation
    func shake()
    {
        let shakeAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        shakeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        shakeAnimation.duration = 0.6
        // lose momentum after time, looks nice
        shakeAnimation.values = [-20, 20, -15, 15, -10, 10, -5, 5, 0]
        layer.add(shakeAnimation, forKey: "shake")
    }
    
    // MARK: - Blurs
    func blur(using effectStyle: UIBlurEffectStyle)
    {
        removeBlurEffect()
        
        let blurEffect = UIBlurEffect(style: effectStyle)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = bounds
        
        addSubview(blurredEffectView)
        sendSubview(toBack: blurredEffectView)
        blurredEffectView.autoPinEdgesToSuperviewEdges()
        
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyEffectView.frame = bounds
        
        blurredEffectView.contentView.addSubview(vibrancyEffectView)
        vibrancyEffectView.autoPinEdgesToSuperviewEdges()
    }
    
    private func removeBlurEffect()
    {
        for view in subviews
        {
            if view is UIVisualEffectView
            {
                view.removeFromSuperview()
            }
        }
    }
    
    // MARK: - Borders
    func addTopBorder(with color: UIColor, andWidth width: CGFloat)
    {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        layer.addSublayer(border)
    }
    
    func addRightBorder(with color: UIColor, andWidth width: CGFloat)
    {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        layer.addSublayer(border)
    }
    
    func addBottomBorder(with color: UIColor, andWidth width: CGFloat)
    {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        layer.addSublayer(border)
    }
    
    func addLeftBorder(with color: UIColor, andWidth width: CGFloat)
    {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        layer.addSublayer(border)
    }
    
    func applyEvenStroke(with color: UIColor, width: CGFloat, andCornerRadius radius: CGFloat)
    {
        addTopBorder(with: color, andWidth: width)
        addRightBorder(with: color, andWidth: width)
        addBottomBorder(with: color, andWidth: width)
        addLeftBorder(with: color, andWidth: width)
        layer.cornerRadius = radius
    }
    
    func applyLeftHeavyStroke(with color: UIColor, andWidth width: CGFloat)
    {
        addTopBorder(with: color, andWidth: width/2)
        addRightBorder(with: color, andWidth: width/2)
        addBottomBorder(with: color, andWidth: width/2)
        addLeftBorder(with: color, andWidth: width)
    }
    
    func applyRightHeavyStroke(with color: UIColor, andWidth width: CGFloat)
    {
        addTopBorder(with: color, andWidth: width/2)
        addRightBorder(with: color, andWidth: width)
        addBottomBorder(with: color, andWidth: width/2)
        addLeftBorder(with: color, andWidth: width/2)
    }
    
    func applyTopHeavyStroke(with color: UIColor, andWidth width: CGFloat)
    {
        addTopBorder(with: color, andWidth: width)
        addRightBorder(with: color, andWidth: width/2)
        addBottomBorder(with: color, andWidth: width/2)
        addLeftBorder(with: color, andWidth: width/2)
    }
    
    func applyBottomHeavyStroke(with color: UIColor, andWidth width: CGFloat)
    {
        addTopBorder(with: color, andWidth: width/2)
        addRightBorder(with: color, andWidth: width/2)
        addBottomBorder(with: color, andWidth: width)
        addLeftBorder(with: color, andWidth: width/2)
    }
    
    func applyTopAndRightHeavyStroke(with color: UIColor, andWidth width: CGFloat)
    {
        addTopBorder(with: color, andWidth: width)
        addRightBorder(with: color, andWidth: width)
        addBottomBorder(with: color, andWidth: width/2)
        addLeftBorder(with: color, andWidth: width/2)
    }
    
    func applyTopAndLeftHeavyStroke(with color: UIColor, andWidth width: CGFloat)
    {
        addTopBorder(with: color, andWidth: width)
        addRightBorder(with: color, andWidth: width/2)
        addBottomBorder(with: color, andWidth: width/2)
        addLeftBorder(with: color, andWidth: width)
    }
    
    func applyBottomAndRightHeavyStroke(with color: UIColor, andWidth width: CGFloat)
    {
        addTopBorder(with: color, andWidth: width/2)
        addRightBorder(with: color, andWidth: width)
        addBottomBorder(with: color, andWidth: width)
        addLeftBorder(with: color, andWidth: width/2)
    }
    
    func applyBottomAndLeftHeavyStroke(with color: UIColor, andWidth width: CGFloat)
    {
        addTopBorder(with: color, andWidth: width/2)
        addRightBorder(with: color, andWidth: width/2)
        addBottomBorder(with: color, andWidth: width)
        addLeftBorder(with: color, andWidth: width)
    }
}
