//
//  HondaModelTableViewController.swift
//  Honda Showroom
//
//  Created by Rami Taibah on 2/4/16.
//  Copyright © 2016 Studio 966. All rights reserved.
//

import UIKit

class HondaModelTableViewController: UITableViewController {
    
    @IBAction func LanguageAction(sender: AnyObject)
    {
        let alertController = UIAlertController(title: "", message: "", preferredStyle: .ActionSheet)
        let ok = UIAlertAction(title: "English", style: .Default, handler: { (action) -> Void in
            print("English Button Pressed")
        })
        let cancel = UIAlertAction(title: "Urdu", style: .Default, handler: { (action) -> Void in
            print("Urdu Button Pressed")
        })
        
        
        alertController.addAction(ok)
        alertController.addAction(cancel)
        
        
        if let popoverController = alertController.popoverPresentationController
        {
            popoverController.barButtonItem = sender as? UIBarButtonItem
        }
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    var modelLines : [ModelLine] { //Use modelLines instead so you have access to ALL cars of all modelLines.
        return ModelLine.modelLines()
    }
    var models: [Model]{
        var modelLines = ModelLine.modelLines()
        return modelLines[0].models
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("modelCell", forIndexPath: indexPath) as UITableViewCell

        let model = models[indexPath.row]  
        cell.textLabel?.text = model.title
        cell.detailTextLabel?.text = model.description
        cell.imageView?.image = model.image

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc:ViewController=self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        vc.selectedCarIndex=indexPath.row
        self.navigationController?.showViewController(vc, sender: self)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
