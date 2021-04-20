//
//  UIView+Extension.swift
//  RSWTools
//
//  Created by Richard Witherspoon on 5/19/19.
//  Copyright © 2019 Richard Witherspoon. All rights reserved.
//

import UIKit


public extension UIView {
    //MARK: Anchors
    @discardableResult
    func fillSuperview(padding: UIEdgeInsets = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        let anchoredConstraints = AnchoredConstraints()
        guard let superviewTopAnchor = superview?.topAnchor,
              let superviewBottomAnchor = superview?.bottomAnchor,
              let superviewLeadingAnchor = superview?.leadingAnchor,
              let superviewTrailingAnchor = superview?.trailingAnchor else {
            return anchoredConstraints
        }
        
        return anchor(top: superviewTopAnchor, bottom: superviewBottomAnchor, leading: superviewLeadingAnchor, trailing: superviewTrailingAnchor, padding: padding)
    }
    
    @discardableResult
    func fillSafeSuperview(safeTop: Bool,
                                safeBottom: Bool,
                                safeLeading: Bool,
                                safeTrialing: Bool,
                                padding: UIEdgeInsets = .zero)  -> AnchoredConstraints{
        var topAnchor = superview?.topAnchor
        var bottomAnchor = superview?.bottomAnchor
        var leadingAnchor = superview?.leadingAnchor
        var trailingAnchor = superview?.trailingAnchor
        
        if safeTop{
            topAnchor = superview?.safeAreaLayoutGuide.topAnchor
        }
        if safeBottom{
            bottomAnchor = superview?.safeAreaLayoutGuide.bottomAnchor
        }
        if safeLeading{
            leadingAnchor = superview?.safeAreaLayoutGuide.leadingAnchor
        }
        if safeTrialing{
            trailingAnchor = superview?.safeAreaLayoutGuide.trailingAnchor
        }
        
        return anchor(top: topAnchor,
                      bottom: bottomAnchor,
                      leading: leadingAnchor,
                      trailing: trailingAnchor,
                      padding: padding)
    }
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?,
                     bottom: NSLayoutYAxisAnchor?,
                     leading: NSLayoutXAxisAnchor?,
                     trailing: NSLayoutXAxisAnchor?,
                     padding: UIEdgeInsets = .zero,
                     size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    @discardableResult
    func constrainHeight(_ constant: CGFloat) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        anchoredConstraints.height = heightAnchor.constraint(equalToConstant: constant)
        anchoredConstraints.height?.isActive = true
        return anchoredConstraints
    }
    
    @discardableResult
    func constrainWidth(_ constant: CGFloat) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        anchoredConstraints.width = widthAnchor.constraint(equalToConstant: constant)
        anchoredConstraints.width?.isActive = true
        return anchoredConstraints
    }
    
    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func centerXToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
    }
    
    func centerYToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
    }
    
    
    //MARK: Misc
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
                                                            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
    
    func applyGradient(colors: [CGColor],
                              locations: [NSNumber],
                              startPoint: CGPoint = CGPoint(x: 0.5, y: 0),
                              endPoint: CGPoint = CGPoint(x: 0.5, y: 1)) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addSubviews(_ views: UIView...){
        views.forEach({addSubview($0)})
    }
    
    func roundAllCorners(radius: CGFloat){
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        layer.masksToBounds = true
        layer.cornerRadius  = radius
    }
    
    func roundTopCorners(radius: CGFloat){
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.masksToBounds = true
        layer.cornerRadius  = radius
    }
    
    func roundBottomCorners(radius: CGFloat){
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        layer.masksToBounds = true
        layer.cornerRadius  = radius
    }
    
    func setupShadow(opacity: Float = 0,
                          radius: CGFloat = 0,
                          offset: CGSize = .zero,
                          color: UIColor = .black) {
        layer.shadowOpacity = opacity
        layer.shadowRadius  = radius
        layer.shadowOffset  = offset
        layer.shadowColor   = color.cgColor
    }
    
    @discardableResult
    func withSize<T: UIView>(_ size: CGSize) -> T {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self as! T
    }
    
    @discardableResult
    func withHeight(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    func withWidth(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    @discardableResult
    func withBorder<T: UIView>(width: CGFloat, color: UIColor) -> T {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        return self as! T
    }
    
    
    //MARK: Stacking
    fileprivate func _stack(_ axis: NSLayoutConstraint.Axis = .vertical,
                            views: [UIView],
                            spacing: CGFloat = 0,
                            alignment: UIStackView.Alignment = .fill,
                            distribution: UIStackView.Distribution = .fill) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        addSubview(stackView)
        stackView.fillSuperview()
        return stackView
    }
    
    @discardableResult
    func stack(_ views: UIView...,
                    spacing: CGFloat = 0,
                    alignment: UIStackView.Alignment = .fill,
                    distribution: UIStackView.Distribution = .fill) -> UIStackView {
        return _stack(.vertical, views: views, spacing: spacing, alignment: alignment, distribution: distribution)
    }
    
    @discardableResult
    func hstack(_ views: UIView...,
                     spacing: CGFloat = 0,
                     alignment: UIStackView.Alignment = .fill,
                     distribution: UIStackView.Distribution = .fill) -> UIStackView {
        return _stack(.horizontal, views: views, spacing: spacing, alignment: alignment, distribution: distribution)
    }
}
