//
//  MyTableViewController.swift
//  DogParks
//
//  Created by Brian Fiala and David Gudeman on 10/16/15.
//  Copyright (c) 2015 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class MyTableViewController: UITableViewController, UISearchResultsUpdating {
  
  let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
  var myCSVContents = Array<Dictionary<String, String>>()
  var MyDogParks : [DogParksObject] = []
  var searchController : UISearchController!
  var searchResults : [DogParksObject] = []
  


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
      self.searchController = UISearchController(searchResultsController: nil)
      self.searchController.searchBar.sizeToFit()
      self.searchController.hidesNavigationBarDuringPresentation = false;
      searchController.searchResultsUpdater = self
      searchController.dimsBackgroundDuringPresentation = false
      self.tableView.tableHeaderView = self.searchController.searchBar
      
      // Mark - CSV scanner
      
      // scan the DogParkData CSV file and put data in a dictionary with 4 key Value pairs
      CSVScanner.runFunctionOnRowsFromFile(["name", "detail", "image", "hours"], withFileName: "DogParksData", withFunction: { (aRow:Dictionary<String, String>) in self.myCSVContents.append(aRow) })
     
      // iterate through the dictionary and use the keys to put values into a new DogParksObject
      for var index = 0; index < myCSVContents.count; ++index {
        
        // make a new ManagedObjectContext to monitor changes in data
        let myMOC = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

        // Assign the DogsParkObject attributes to the CoreData Entity
        let dpObject = NSEntityDescription.insertNewObjectForEntityForName("DogParksObject", inManagedObjectContext: myMOC!) as! DogParksObject

        // use keys to assign to appropriate EntityDescription attribute
        for (key, value) in  myCSVContents[index] {
          if key == "name" {
            dpObject.dogParkNames = value
          } else if key == "detail" {
            dpObject.dogParkDetails = value
          } else if key == "image" {
            dpObject.dogParkImages = value
          } else if key == "hours" {
            dpObject.dogParkHours = value
          } else {
            
            // now save the changes with the use of of the ManagedObjectContext
            var saveErr : NSError?
            if myMOC!.save(&saveErr) != true {
              println( "Insert to DB Error: \(saveErr?.localizedDescription)")
              return
            }
          }
        }
      
        let fr = NSFetchRequest(entityName: "DogParksObject")
        var e : NSError?
      
        MyDogParks = moc?.executeFetchRequest(fr, error: &e) as! [DogParksObject]
        if e != nil {
          println("viewDidLoad Failed to retrieve record: \(e!.localizedDescription)")
        }
      }
    }
  
  
    override func viewDidAppear(animated: Bool) {
      let fr = NSFetchRequest(entityName: "DogParksObject")
      var e : NSError?
    
      MyDogParks = moc?.executeFetchRequest(fr, error: &e) as! [DogParksObject]
    
      if e != nil {
        println("viewDidAppear Failed to retrieve record: \(e!.localizedDescription)")
      }
      else {
        self.tableView.reloadData()
      }
      
    }
    
 
//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
      if searchController.active {
        return searchResults.count
      } else {
        return MyDogParks.count
      }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
      let cellIdentifier = "DogParkCell"
      let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MyTableViewCell
      var dogParkItem : DogParksObject!

      if searchController.active {
        dogParkItem = searchResults[indexPath.row]
      }
      else {
        dogParkItem = MyDogParks[indexPath.row]
      }
      // Configure the cell...
      cell.dogParkTextView?.text = MyDogParks[indexPath.row].dogParkNames
      cell.dogParkImage?.image = UIImage(named: MyDogParks[indexPath.row].dogParkImages)
      NSLog(MyDogParks[indexPath.row].dogParkImages)
      
      return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
   
      var selectedPark = (searchController.active) ? searchResults[indexPath.row] :
        MyDogParks[indexPath.row]
        //let msgAlert = UIAlertView(title: "Santa Cruz Dog Park Selected", message: selectedPark, delegate: nil, cancelButtonTitle: "See Details")
        //msgAlert.show()
      self.tableView.deselectRowAtIndexPath(indexPath, animated : false)
    }

  
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
      // Return NO if you do not want the specified item to be editable.
      if searchController.active {
        return false
      } else {
        return true
      }

    }

//KEEP TABS ON THIS
/*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

//    
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using [segue destinationViewController].
//        // Pass the selected object to the new view controller.
//        
//        if segue.identifier == "ShowParkDetails" {
//            if let indPath = self.tableView.indexPathForSelectedRow() {
//                let detailViewController = segue.destinationViewController as! MyDetailViewController
//              
//              detailViewController.DogParkDetails = MyDogParks[indPath.row]
//              
//            }
//        }
//    }
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if segue.identifier == "ShowParkDetails"
    {
      if let indPath = self.tableView.indexPathForSelectedRow()
      {
        let detailViewController = segue.destinationViewController as! MyDetailViewController
        
        if searchController.active {
          detailViewController.DogParksDetail =
            searchResults[indPath.row]
        } else {
          detailViewController.DogParksDetail = MyDogParks[indPath.row]
        }
      }
    }
  }

  func filterContentForSearchText(searchText: String) {
    searchResults = MyDogParks.filter({(dogParkItem : DogParksObject) -> Bool in
      let nameMatch = dogParkItem.dogParkNames.rangeOfString(searchText, options:
        NSStringCompareOptions.CaseInsensitiveSearch)
      return nameMatch != nil
    })
  }
  
  func updateSearchResultsForSearchController(searchController:
    UISearchController) {
      if let searchText = searchController.searchBar.text {
        print("Search:Text ", searchText)
        filterContentForSearchText(searchText)
        tableView.reloadData()
        
      }
  }
  

}
