//
//  ViewController.swift
//  Initialiser
//
//  Created by Will Davison on 25/05/2016.
//  Copyright © 2016 Will Davison. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Grab our testing JSON file
        let url = NSBundle.mainBundle().URLForResource("testing", withExtension: "json")
        let data = NSData(contentsOfURL: url!)
        
        // Function for messing about with the JSON contents
        func readJSONObject(object: [String: AnyObject]) {
            
            for film in films {
                guard let title = user["title"] as? String,
                    let date = user["year"] as? Int else { break }
                    _ = title + " released \(date)."
            }
        }
        
        // Parse the JSON file into an object.
        do {
            let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            if let dictionary = object as? [String: AnyObject] {
                readJSONObject(dictionary)
            }
        } catch {
            // Handle Error
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

