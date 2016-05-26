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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Grab our testing JSON file
    let url = NSBundle.mainBundle().URLForResource("testing", withExtension: "json")
    let data = NSData(contentsOfURL: url!)
    
    // Parse the JSON file into an object.
    
    do {
    
    let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
    
    if let films = object["films"] as? [[String: AnyObject]] {
    
				for film in films {
    
				if let name = film["title"] as? String {
    
				let fullName = name.componentsSeparatedByString(" ")
    
				var clue = "";
    
    for names in fullName {
    
    let initial = String(names.characters.prefix(1));
    
    clue += initial;
    clue += " ";
    
    }
    
				var output = "";
    
				output = name + " intials are: " + clue;
    
				print(output);
    
				}
    
    }
    
    }
    
    } catch {
    
    // Handle Error
    
    }

}

