//
//  StationViewController.swift
//  Polaris
//
//  Created by 이씨안 on 2017. 4. 30..
//  Copyright © 2017년 이시안. All rights reserved.
//

import UIKit
import Kanna

class StationViewController: UITableViewController {
    
    var apiURLSource:String=""
    var checkSuccess:Bool=false
    var stationName = [String]()
    var stationCode = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor=UIColor.black
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes=[NSForegroundColorAttributeName : UIColor.white]
        
        do {
            let myHTMLString = try String(contentsOf: apiURL! as URL, encoding: .utf8)
            apiURLSource = myHTMLString
            print (apiURLSource)
        } catch let error {
            print("Error: \(error)")
            
        }
        
        if let doc = XML(xml: apiURLSource, encoding: .utf8) {
            checkSuccess = true
            for xmlStationCode in doc.xpath("//STATION_CD") {
                //print(xmlStationCode.text!)
                stationCode.append(Int(xmlStationCode.text!
                )!)
                
            }
            for xmlStationName in doc.xpath("//STATION_NM") {
                //print(xmlStationName.text!)
                stationName.append(xmlStationName.text!)
            }
            print("appended stationCodes:\(stationCode.count)")
        }else{
            checkSuccess = false
        }
        
        if checkSuccess
        {
            print("parse success!")
            //파싱 성공후의 액션 여기
        }else{
            print("parse failure!")
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stationName.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let cell = UITableViewCell()
        
        let cellNameIndex = stationName[indexPath.row]
        cell.textLabel?.text = cellNameIndex
        cell.textLabel?.textColor=UIColor.white
        cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size:28)
        cell.backgroundColor=UIColor.black
        return cell
    }
    
    private func getIndexSection(with indexPath: IndexPath) -> [String] {
        return stationName
    }
    
    /*
     
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
