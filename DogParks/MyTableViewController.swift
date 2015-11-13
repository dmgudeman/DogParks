//
//  MyTableViewController.swift
//  DogParks
//
//  Created by Brian Fiala and David Gudeman on 10/16/15.
//  Copyright (c) 2015 DeAnza. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    let dogParkNames = ["Big Basin Redwoods State Park", "The Forest of Nisene Marks State Park", " Henry Cowell Redwoods State Park", "ITS Beach", "Lighthouse Field Interior", "Manresa State Beach", "New Brighton State Beach", "Palm Beach", "Seabright Beach", "Seacliff and Rio Del Mar Beaches", "Twin Lakes State Beach", "Pogonip State Park", "City of Scotts Valley Sky Park Dog Park", "Delavega Park", "Fredrick Street Park", "Grant Street Park", "Mitchell's Cove Beach", "Ocean View Park", "Pacheco Dog Off-leash Area", "Pinto Lake County Park", "Polo Grounds County Park", "University Terrace Park"]
    let dogParkDetails = ["Dogs are allowed only on paved roads within the developed campgrounds and picnic areas, but not on park trails and dirt service roads. No dogs are allowed in Rancho Del Oso. 21600 Big Basin Way, Boulder Creek",
        
        "Leashed dogs are allowed only in the picnic areas and on Aptos Creek Road up to the Porter Picnic Area. Aptos Creek Road past Soquel Drive, Aptos",
        
        "Dogs are allowed on the park entrance road adjacent to Highway 9 and in the picnic area on the day-use side. They are also allowed on the Meadow Trail, Graham Hill Trail, and the 3.3-mile Pipeline Road that runs throught the middle of the park. Dogs and owners may use the paved roads in the campground adjacent to Graham Hill Road. Dogs may not be taken on any other trails, including all of the Fall Creek unit. Day Use: 101 North Big Trees Park Road, Felton. Campground: 2591 Graham Hill Road, Scotts Valley",
        
        "Dogs are allowed on the first beach up coast from the lighthouse on West Cliff Drive.",
        
        "Leashed dogs are allowed across the street from the lighthouse on West Cliff Drive.",
        
        "Take the San Adreas Road exit off Highway 1 and follow San Andreas Road to the beach.",
        
        "In Capitola, take the Park Avenue exit off Highway 1. Turn left on McGregor and right into the park.",
        
        "Leashed dogs are allowed only on the beach between the Pajaro Dunes condos and the Pajaro Dunes houses, but not up coast or down coast from the residences. Go past Manresa State Beach on San Andreas Road and continue past Sunset State Beach. Turn right on Beach Road toward the ocean",
        
        "Dogs are allowed on the north side of the yacht harbor in Santa Cruz.",
        
        "In Aptos, take the State Park Drive exit off Highway 1",
        
        "Dogs are allowed on the east side of the harbor at 7th Avenue in Santa Cruz",
        
        "Dogs are allowed only on designated trails. 333 Glf Club Dr., below UC Santa Cruz",
        
        "Dogs are allowed off leash. 361 Kings Village Road, Scotts Valley (831)438-3251",
        
        "Dogs are allowed off leash on the service road into lower DeLaveaga Park. Take Market Street past Gruenwald Court.",
        
        "Dogs are allowed off leash. 168 Fredrick Street",
        
        "Dogs are allowed off leash. 180 Grant Street",
        
        "Dogs are allowed off leash before 10 a.m. and after 4 p.m. The beach is located at intersection of West Cliff Drive and Almar.",
        
        "Dogs are allowed off leash. 102 Ocean View Avenue",
        
        "Dogs are allowed off leash. Pacheco Avenue and Prospect Heights",
        
        "Dogs are allowed off leash at the dog park located at 757 Green Valley Road in Watsonville",
        
        "Dogs are allowed off leash. The dog park is located at 2255 Huntington Drive in Aptos.",
        
        "Dogs are allowed off leash at the second entrance at Nobel Drive and Meder Street"]
    let dogParkImages = ["bigbasin.jpg", "nisenemarksstatepark.jpg", "henrycowellpark.jpg", "itsbeach.jpg", "lighthousefieldinterior.jpg", "manresastatebeach.jpg", "newbrightonstatebeach.jpg", "palmbeach.jpg", "seabrightbeach.jpg", "seacliffandriodelmarbeaches.jpg", "twinlakesstatebeach.jpg", "pogonipcitypark.jpg", "skyparkdogpark.jpg", "delavegapark.jpg", "frederickstreetpark.jpg", "grantstreetpark.jpg", "mitchellscovebeach.jpg", "oceanviewpark.jpg", "pachecodogpark.jpg", "pintolakecountypark.jpg", "pologroundscountypark.jpg", "universityterracepark.jpg"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

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
        return dogParkNames.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "DogParkCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MyTableViewCell

        // Configure the cell...
        cell.dogParkTextView?.text = dogParkNames[indexPath.row]
        cell.dogParkImage?.image = UIImage(named: dogParkImages[indexPath.row])

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var selectedPark = dogParkNames[indexPath.row]
        //let msgAlert = UIAlertView(title: "Santa Cruz Dog Park Selected", message: selectedPark, delegate: nil, cancelButtonTitle: "See Details")
        //msgAlert.show()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ShowParkDetails" {
            if let indPath = self.tableView.indexPathForSelectedRow() {
                let detailViewController = segue.destinationViewController as! MyDetailViewController
                detailViewController.dogParkNameText = self.dogParkNames[indPath.row]
                detailViewController.dogParkDetailsText = self.dogParkDetails[indPath.row]
                detailViewController.dogParkImageText = self.dogParkImages[indPath.row]
                            
            }
        }
    }
    

}