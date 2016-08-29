//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let containerView = UIView(frame: CGRectMake(0,0,500,300))
containerView.backgroundColor = UIColor.lightGrayColor()

XCPlaygroundPage.currentPage.liveView = containerView
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

let blueUpperSquare = UIView()
blueUpperSquare.backgroundColor = UIColor.blueColor()
blueUpperSquare.translatesAutoresizingMaskIntoConstraints = false

containerView.addSubview(blueUpperSquare)

let blueUpperSquareLeading = NSLayoutConstraint(item: blueUpperSquare, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)

containerView.addConstraint(blueUpperSquareLeading)

let blueUpperSquareTop = NSLayoutConstraint(item: blueUpperSquare, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)

containerView.addConstraint(blueUpperSquareTop)

let blueUpperSquareHeight = NSLayoutConstraint(item: blueUpperSquare, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Height, multiplier: 0.5, constant: 0)

containerView.addConstraint(blueUpperSquareHeight)

let blueUpperSquareWidth = NSLayoutConstraint(item: blueUpperSquare, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: blueUpperSquare, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)

blueUpperSquare.addConstraint(blueUpperSquareWidth)

let starView = StarView()
starView.backgroundColor = UIColor.clearColor()
starView.translatesAutoresizingMaskIntoConstraints = false

blueUpperSquare.addSubview(starView)

let starViewCenterX = NSLayoutConstraint(item: starView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: blueUpperSquare, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)

blueUpperSquare.addConstraint(starViewCenterX)

let starViewCenterY = NSLayoutConstraint(item: starView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: blueUpperSquare, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)

blueUpperSquare.addConstraint(starViewCenterY)

let starViewHeight = NSLayoutConstraint(item: starView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: blueUpperSquare, attribute: NSLayoutAttribute.Height, multiplier: 0.6, constant: 0)

blueUpperSquare.addConstraint(starViewHeight)

let starViewWidth = NSLayoutConstraint(item: starView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: starView, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)

blueUpperSquare.addConstraint(starViewWidth)

let whiteUpperRectangle = UIView()
whiteUpperRectangle.backgroundColor = UIColor.whiteColor()
whiteUpperRectangle.translatesAutoresizingMaskIntoConstraints = false

containerView.addSubview(whiteUpperRectangle)

let whiteUpperRectangleTop = NSLayoutConstraint(item: whiteUpperRectangle, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)

containerView.addConstraint(whiteUpperRectangleTop)

let whiteUpperRectangleLeading = NSLayoutConstraint(item: whiteUpperRectangle, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: blueUpperSquare, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)

containerView.addConstraint(whiteUpperRectangleLeading)

let whiteUpperRectangleTrailing = NSLayoutConstraint(item: whiteUpperRectangle, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)

containerView.addConstraint(whiteUpperRectangleTrailing)

let whiteUpperRectangleHeight = NSLayoutConstraint(item: whiteUpperRectangle, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: blueUpperSquare, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)

containerView.addConstraint(whiteUpperRectangleHeight)


let redLowerRectangle = UIView()
redLowerRectangle.backgroundColor = UIColor.redColor()
redLowerRectangle.translatesAutoresizingMaskIntoConstraints = false

containerView.addSubview(redLowerRectangle)

let redLowerRectangleTop = NSLayoutConstraint(item: redLowerRectangle, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: blueUpperSquare, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)

containerView.addConstraint(redLowerRectangleTop)

let redLowerRectangleBottom = NSLayoutConstraint(item: redLowerRectangle, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)

containerView.addConstraint(redLowerRectangleBottom)

let redLowerRectangleLeading = NSLayoutConstraint(item: redLowerRectangle, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)

containerView.addConstraint(redLowerRectangleLeading)

let redLowerRectangleTrailing = NSLayoutConstraint(item: redLowerRectangle, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: containerView, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)

containerView.addConstraint(redLowerRectangleTrailing)


class StarView: UIView, Estrellable {
    
    override func drawRect(rect: CGRect) {
        drawStar()
    }
    
}

public protocol Estrellable {}

extension Estrellable where Self: UIView {
    
    public func drawStar() {
        
        //https://www.weheartswift.com/bezier-paths-gesture-recognizers/
        
        UIColor.whiteColor().setFill()
        
        let path = UIBezierPath()
        
        let starExtrusion:CGFloat = 17.0
        
        let center = CGPointMake(self.frame.width / 2.0, self.frame.height / 2.0)
        
        let pointsOnStar = 5
        
        var angle:CGFloat = -CGFloat(M_PI / 2.0)
        let angleIncrement = CGFloat(M_PI * 2.0 / Double(pointsOnStar))
        let radius = self.frame.width / 2.0
        
        var firstPoint = true
        
        for _ in 1...pointsOnStar {
            
            let point = pointFrom(angle, radius: radius, offset: center)
            let nextPoint = pointFrom(angle + angleIncrement, radius: radius, offset: center)
            let midPoint = pointFrom(angle + angleIncrement / 2.0, radius: starExtrusion, offset: center)
            
            if firstPoint {
                
                firstPoint = false
                path.moveToPoint(point)
            }
            
            path.addLineToPoint(midPoint)
            path.addLineToPoint(nextPoint)
            angle += angleIncrement
        }
        
        path.closePath()
        path.fill()
    }
    
    private func pointFrom(angle: CGFloat, radius: CGFloat, offset: CGPoint) -> CGPoint {
        return CGPointMake(radius * cos(angle) + offset.x, radius * sin(angle) + offset.y)
    }

    
}













