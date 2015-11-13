//
//  CSVScanner.swift
//  DogParks
//
//  Created by David Gudeman on 11/13/15.
//  Copyright (c) 2015 DeAnza. All rights reserved.
//

import Foundation

class CSVScanner {
  
  class func debug(string:String){
    
    println("CSVScanner: \(string)")
  }
  
  class func runFunctionOnRowsFromFile(theColumnNames:Array<String>, withFileName theFileName:String, withFunction theFunction:(Dictionary<String, String>)->()) {
    
    if let strBundle = NSBundle.mainBundle().pathForResource(theFileName, ofType: "csv") {
      
      var encodingError:NSError? = nil
      
      if let fileObject = NSString(contentsOfFile: strBundle, encoding: NSUTF8StringEncoding, error: &encodingError){
        
        var fileObjectCleaned = fileObject.stringByReplacingOccurrencesOfString("\r", withString: "\n")
        
        fileObjectCleaned = fileObjectCleaned.stringByReplacingOccurrencesOfString("\n\n", withString: "\n")
        
        let objectArray = fileObjectCleaned.componentsSeparatedByString("\n")
        
        for anObjectRow in objectArray {
          
          let objectColumns = anObjectRow.componentsSeparatedByString("/")
          
          var aDictionaryEntry = Dictionary<String, String>()
          NSLog("aDictionaryEntry: ",  aDictionaryEntry)
          
          var columnIndex = 0
          
          for anObjectColumn in objectColumns {
            
            aDictionaryEntry[theColumnNames[columnIndex]] = anObjectColumn.stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
            NSLog(aDictionaryEntry[theColumnNames[columnIndex]]!)
            columnIndex++
          }
          
          if aDictionaryEntry.count>1{
            theFunction(aDictionaryEntry)
          }else{
            
            CSVScanner.debug("No data extracted from row: \(anObjectRow) -> \(objectColumns)")
          }
        }
      }else{
        CSVScanner.debug("Unable to load csv file from path: \(strBundle)")
        
        if let errorString = encodingError?.description {
          
          CSVScanner.debug("Received encoding error: \(errorString)")
        }
      }
    }else{
      CSVScanner.debug("Unable to get path to csv file: \(theFileName).csv")
    }
  }
}
