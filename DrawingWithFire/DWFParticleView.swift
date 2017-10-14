//
//  DWFParticleView.swift
//  DrawingWithFire
//
//  Created by Kevin Remigio on 10/14/17.
//  Copyright © 2017 Kevin Remigio. All rights reserved.
//

import UIKit

class DWFParticleView: UIView {

    var fireEmitter: CAEmitterLayer? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        fireEmitter = CAEmitterLayer(layer: self.layer)
        
        fireEmitter?.emitterPosition = CGPoint(x: 0, y: 0)
        fireEmitter?.emitterSize = CGSize(width: 100, height: 100)
        fireEmitter?.renderMode = kCAEmitterLayerAdditive
        
        let fire: CAEmitterCell = CAEmitterCell()
//        fire.birthRate = 200
        fire.birthRate = 200
        fire.lifetime = 3.0
        fire.lifetimeRange = 0.5
        fire.color = UIColor(displayP3Red: 0.8, green: 0.4, blue: 0.2, alpha: 0.1).cgColor
        fire.contents = UIImage(named: "particles_fire")?.cgImage
        fire.name = "fire"
        
        fire.velocity = 10
        fire.velocityRange = 20
        fire.emissionRange = CGFloat(Double.pi / 2)
        fire.scaleSpeed = 0.3
        fire.spin = 0.5
        
        fireEmitter?.emitterCells = [fire]
        
        self.layer.addSublayer(fireEmitter!)
        
    }
    func setEmitterPositionFromTouch(t: UITouch) {
        
        fireEmitter?.emitterPosition = t.location(in: self)
    }
    func setIsEmitting(isEmitting: Bool) {
        var value:Float = 0
        if isEmitting {
            value = 200
        }
        fireEmitter?.birthRate = value

//        fireEmitter?.setValue(value, forKey: "emitterCells.fire.birthRate")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
