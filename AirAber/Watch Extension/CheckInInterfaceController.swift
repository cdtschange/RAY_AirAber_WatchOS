//
//  CheckInInterfaceController.swift
//  AirAber
//
//  Created by Mao on 26/10/2016.
//  Copyright © 2016 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class CheckInInterfaceController: WKInterfaceController {
  
  @IBOutlet var backgroundGroup: WKInterfaceGroup!
  @IBOutlet var originLabel: WKInterfaceLabel!
  @IBOutlet var destinationLabel: WKInterfaceLabel!
  
  var flight: Flight? {
    didSet {
      guard let flight = flight else { return }
      
      originLabel.setText(flight.origin)
      destinationLabel.setText(flight.destination)
    }
  }
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    
    if let flight = context as? Flight {
      self.flight = flight
    }
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
  @IBAction func checkInButtonTapped() {
    // 1
    let duration = 0.35
    let delay = DispatchTime.now() + Double(Int64((duration + 0.15) *
      Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    // 2
    backgroundGroup.setBackgroundImageNamed("Progress")
    // 3
    backgroundGroup.startAnimatingWithImages(in: NSRange(location: 0, length: 10),
                                             duration: duration,
                                             repeatCount: 1)
    // 4
    DispatchQueue.main.asyncAfter(deadline: delay) { [weak self] in
      // 5
      self?.flight?.checkedIn = true
      self?.dismiss()
    }
  }
}
