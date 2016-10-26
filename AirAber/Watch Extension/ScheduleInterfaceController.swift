//
//  ScheduleInterfaceController.swift
//  AirAber
//
//  Created by Mao on 26/10/2016.
//  Copyright © 2016 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class ScheduleInterfaceController: WKInterfaceController {
  @IBOutlet var flightsTable: WKInterfaceTable!
  
  var flights = Flight.allFlights()
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    flightsTable.setNumberOfRows(flights.count, withRowType: "FlightRow")
    
    for index in 0..<flightsTable.numberOfRows {
      guard let controller = flightsTable.rowController(at: index) as? FlightRowController else { continue }
      
      controller.flight = flights[index]
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
  
}
