//
//  ViewController.swift
//  Initialiser
//
//  Created by Will Davison on 25/05/2016.
//  Copyright © 2016 Will Davison. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var films: [[String: AnyObject]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Grab our testing JSON file
        let url = NSBundle.mainBundle().URLForResource("testing", withExtension: "json")
        let data = NSData(contentsOfURL: url!)
        
        // Parse the JSON file into an object.
        do {
            let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
        
            // Store JSON data to class variable of films
            films = object["films"] as! [[String: AnyObject]]
        } catch {
            
        }
        
        print(films)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let tableViewController = segue.destinationViewController as? TableViewController
        
        // Pass films to TableViewController
        tableViewController?.films = films
    }
}
