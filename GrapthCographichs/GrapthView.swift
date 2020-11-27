//
//  GrapthView.swift
//  GrapthCographichs
//
//  Created by admin on 10/29/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

@IBDesignable
class GrapthView: UIView {
    var dataGrapth = [0, 1, 1, 7, 8, 2]
   
    
    override func draw(_ rect: CGRect) {
        let grapthPath = UIBezierPath()
        let height = rect.height
        let width = rect.width
        let grapthHeight = height - Contains.bottomGrapth - Contains.topGrapth
        let grapthWidth = width - 2*Contains.margin
        //
        let columXGrapth = { (columX: Int) -> CGFloat in
            let spacingX = grapthWidth / CGFloat(self.dataGrapth.count)
            
            return CGFloat(columX)*spacingX + CGFloat(Contains.margin)
        }
        guard let valueMax = dataGrapth.max() else {
            return
        }
        //
        let columYGrapth = { (columY: Int) -> CGFloat in
            let spacingY = grapthHeight / CGFloat(valueMax)
//            print(grapthHeight)
//            print(spacingY)
            return CGFloat(columY)*spacingY + (height - CGFloat(columY)*2*spacingY) - Contains.bottomGrapth
        }
        grapthPath.move(to: CGPoint(x: columXGrapth(0), y: columYGrapth(dataGrapth[0])))
        for i in 1..<dataGrapth.count {
            grapthPath.addLine(to: CGPoint(x: columXGrapth(i), y: columYGrapth(dataGrapth[i])))
        }
        UIColor.blue.setStroke()
        grapthPath.stroke()
        
        
        // vẽ vòng tròn điểm
        for i in 0..<dataGrapth.count {
            var point = CGPoint(x: columXGrapth(i), y: columYGrapth(dataGrapth[i]))
            point.x -= Contains.cicleGrapth/2
            point.y -= Contains.cicleGrapth/2
            
            var pointmin = CGPoint(x: columXGrapth(i), y: columYGrapth(dataGrapth[i]))
            pointmin.x -= Contains.cicleGrapth/4
            pointmin.y -= Contains.cicleGrapth/4
            
            let cicleMax = UIBezierPath(ovalIn: CGRect(origin: point, size: CGSize(width: Contains.cicleGrapth, height: Contains.cicleGrapth)))
            UIColor.red.setFill()
            cicleMax.fill()
            
            let cicle = UIBezierPath(ovalIn: CGRect(origin: pointmin, size: CGSize(width: Contains.cicleGrapth/2, height: Contains.cicleGrapth/2)))
            UIColor.yellow.setFill()
            cicle.fill()
            
        }
        
        grapthPath.lineWidth = 2
        
        
    }
    
    private enum Contains {
        static let topGrapth: CGFloat = 30
        static let bottomGrapth: CGFloat = 40
        static let margin: CGFloat = 20
        static let cicleGrapth: CGFloat = 15
    }
    
    

}
