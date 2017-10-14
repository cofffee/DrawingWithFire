//
//  ViewController.swift
//  DrawingWithFire
//
//  Created by Kevin Remigio on 10/14/17.
//  Copyright © 2017 Kevin Remigio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var fireView: DWFParticleView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.yellow.withAlphaComponent(0.2)
        
        fireView = DWFParticleView(frame: view.frame)
        view.addSubview(fireView!)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
//        let location = touch.location(in: self.view)
        fireView?.setEmitterPositionFromTouch(t: touch)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        fireView?.setEmitterPositionFromTouch(t: touches.first!)
        fireView?.setIsEmitting(isEmitting: true)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        fireView?.setIsEmitting(isEmitting: false)
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        fireView?.setIsEmitting(isEmitting: false)
    }

}

