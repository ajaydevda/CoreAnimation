//
//  ViewController.swift
//  coreGraphicsDemo
//
//  Created by C711091 on 20/12/19.
//  Copyright © 2019 icici. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circularView: meterView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func subtractButton(_ sender: Any) {
        
        print("SUB")
        circularView.counter -= 1
    }
    @IBAction func addButton(_ sender: Any) {
    
        print("ADD")
         circularView.counter += 1
    }
    
    @IBAction func webControllerBtn(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "webcontroller") as! WebViewController
        self.present(nextViewController, animated:true, completion:nil)
        
    }
}

