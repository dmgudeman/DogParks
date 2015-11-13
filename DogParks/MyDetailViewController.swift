//
//  MyDetailViewController.swift
//  DogParks
//
//  Created by Brian Fiala on 10/20/15.
//  Copyright (c) 2015 DeAnza. All rights reserved.
//

import UIKit

class MyDetailViewController: UIViewController {

    @IBOutlet weak var dogParkImage: UIImageView!
    @IBOutlet weak var dogParkName: UITextView!
    @IBOutlet weak var dogParkDetails: UITextView!
    @IBOutlet weak var dogParkHours: UITextView!
  

  
//    var dogParkImageText: String!
//    var dogParkNameText: String!
//    var dogParkDetailsText: String!
  
  var DogParksDetail : DogParksObject!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
        self.dogParkName.text = self.DogParksDetail.dogParkNames
        self.dogParkDetails.text = self.DogParksDetail.dogParkDetails
        self.dogParkImage.image = UIImage(named: self.DogParksDetail.dogParkImages)
        self.dogParkHours.text = "Hours:\n" + self.DogParksDetail.dogParkHours
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
