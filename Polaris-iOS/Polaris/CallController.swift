//
//  ViewController.swift
//  Polaris
//
//  Created by 이씨안 on 2017. 4. 29..
//  Copyright © 2017년 이시안. All rights reserved.
//

import UIKit

class CallController: UIViewController {
    
    
    @IBOutlet weak var lineNumLabel: UILabel!
    
    var lineNum:Int = 1
    
    @IBAction func plusButtonClicked(_ sender: UIButton) {
        
        if lineNum < 9{
            lineNum += 1
            lineNumLabel.text = String(lineNum)
        }else{
            
        }
    }
    @IBAction func minusButtonClicked(_ sender: UIButton) {
        if lineNum > 1{
            lineNum -= 1
            lineNumLabel.text = String(lineNum)
        }else{
            
        }
    }
    
    @IBAction func departureButtonClicked(_ sender: Any) {
    }
    
    @IBAction func arrivalButtonClicked(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes=[NSForegroundColorAttributeName : UIColor.white]
        // Do any additional setup after loading the view
    }
    
    override func viewDidAppear(_ animated: Bool) {
        lineNum = 1
        lineNumLabel.text = String(lineNum)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

