////
////  Canvas.swift
////  HW - 7 drawing app
////
////  Created by Iryna Mishyna on 30.10.2021.
////
//
//import UIKit
//
//class Canvas: UIView {
//    
//    func undo() {
//        _ = lines.popLast()
//        setNeedsDisplay()
//    }
//    
//    func clear() {
//        lines.removeAll()
//        setNeedsDisplay()
//        
//    }
//    var lines = [[CGPoint]]()
//    
//    var startPoint: CGPoint = .zero
//    var endPoint: CGPoint = .zero
//    
//    override func draw(_ rect: CGRect) {
//        
//        super.draw(rect)
//        
//        guard let context = UIGraphicsGetCurrentContext() else { return }
//        
//        context.setStrokeColor(UIColor.red.cgColor)
//        context.setLineWidth(10)
//        context.setLineCap(.butt)
//        context.setLineCap(.round)
//        
//        lines.forEach { line in
//            for (index, point) in line.enumerated() {
//                if index == 0 {
//                    context.move(to: point)
//                } else {
//                    context.addLine(to: point)
//                }
//            }
//        }
//        
//        context.strokePath()
//        
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        //touchesBegan the lastPoint variable is initialized to the current touch point
//        guard let firstTouch = touches.first else {
//            return
//        }
//        
//        let firstPoint = firstTouch.location(in: self)
//        startPoint = firstPoint
//        endPoint = firstPoint
//        
//        lines.append([firstPoint])
//    }
//    
//    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        //get the current touch point and then draw a line
//        guard let point = touches.first?.location(in: nil) else { return }
//        
//        guard var lastLine = lines.popLast() else { return }
//        lastLine.append(point)
//        
//        lines.append(lastLine)
//        print(lines)
//        setNeedsDisplay()
//    }
//    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        //check if mouse was swiped
//        if endPoint == startPoint, lines.last?.count == 1 {
//            guard var lastLine = lines.popLast() else { return }
//            
//            lastLine.append(endPoint)
//            
//            lines.append(lastLine)
//            
//            setNeedsDisplay()
//        }
//    }
//    
//}
//
//
//
