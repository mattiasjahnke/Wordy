//
//  InterfaceController.swift
//  Wordy WatchKit Extension
//
//  Created by Mattias Jähnke on 2018-08-16.
//  Copyright © 2018 Engineerish. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var skInterface: WKInterfaceSKScene!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let scene = ClockScene(size: self.contentFrame.size)
        scene.scaleMode = .aspectFill
        self.skInterface.presentScene(scene)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
