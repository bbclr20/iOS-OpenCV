//
//  DrawView.swift
//  iOS-OpenCV
//
//  Created by ben on 2019/3/19.
//  Copyright © 2019 ben. All rights reserved.
//

class DrawView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        drawLine(rect)
        drawPath(rect)
        drawArc(rect)
        drawImage(rect)
    }
    
    private func drawLine(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(10.0)
        
        context.move(to: CGPoint(x: 0, y: 0))
        context.addLine(to: CGPoint(x: 0, y: 100))
        context.addLine(to: CGPoint(x: 100, y: 100))
        
        context.strokePath()
    }
    
    private func drawPath(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setLineWidth(10.0)
        
        let path = CGMutablePath()
        path.addRect(CGRect(x: 100, y: 100, width: 50, height: 50))
        path.addEllipse(in: CGRect(x: 200, y: 200, width: 50, height: 50))
        
        context.addPath(path)
        context.strokePath()
    }
    
    private func drawArc(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(UIColor.gray.cgColor)
        context.setLineWidth(10.0)
        
        context.addArc(center: CGPoint(x: 100, y: 300),
                       radius: 100, startAngle: 0, endAngle: 90,
                       clockwise: true)
        
        context.strokePath()
    }

    private func drawImage(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        guard let image = UIImage(named: "candy"),
              let cgImage = image.cgImage else { return }
        
        context.draw(cgImage, in: CGRect(x: 100, y: 400, width: 200, height: 150))
    }
    
    
}

