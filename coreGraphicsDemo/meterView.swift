//
//  meterView.swift
//  coreGraphicsDemo
//
//  Created by C711091 on 20/12/19.
//  Copyright © 2019 icici. All rights reserved.
//

import UIKit

@ IBDesignable class meterView: UIView {

    private struct Constants {
        static let numberOfGlasses = 15
        static let lineWidth: CGFloat = 5.0
        static let arcWidth: CGFloat = 100
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
    }
    
    @IBInspectable var counter: Int = 5 { didSet {
    if counter <=  Constants.numberOfGlasses {
    //the view needs to be refreshed
    setNeedsDisplay()
    }
    }
}
    
    @IBInspectable var outlineColor: UIColor = UIColor.blue
    @IBInspectable var counterColor: UIColor = UIColor.orange
    
    override func draw(_ rect: CGRect) {
        
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        // 2
        let radius: CGFloat = max(bounds.width, bounds.height)
        // 3
        
        let startAngle: CGFloat = 3 * .pi / 4
        let endAngle: CGFloat = .pi / 4
        print("center\(center)  \n radius\(radius) \n startAngle\(startAngle) \n endAngle\(endAngle)")
        // 4
        let path = UIBezierPath(arcCenter: center,
                                radius: radius/2 - Constants.arcWidth/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        // 5
        path.lineWidth = Constants.arcWidth
        counterColor.setStroke()
        path.stroke()
        
        let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
        //then calculate the arc for each single glass
        let arcLengthPerGlass = angleDifference / CGFloat(Constants.numberOfGlasses)
        //then multiply out by the actual glasses drunk
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        //2 - draw the outer arc
        let outlinePath = UIBezierPath(arcCenter: center,
                                       radius: bounds.width/2 - Constants.halfOfLineWidth,
                                       startAngle: startAngle,
                                       endAngle: outlineEndAngle,
                                       clockwise: true)
        
        //3 - draw the inner arc
        outlinePath.addArc(withCenter: center,
                           radius: radius/2 - Constants.arcWidth,
                           startAngle: outlineEndAngle ,
                           endAngle: startAngle,
                           clockwise: false)
        
        print("bounds.width\(bounds.width/2) \n  Constants.arcWidth\(Constants.arcWidth) +Constants.halfOfLineWidth \(Constants.halfOfLineWidth)")
        //4 - close the path
        outlinePath.close()
        outlineColor.setStroke()
        outlinePath.lineWidth = Constants.lineWidth
        outlinePath.stroke()
    }

    
}
