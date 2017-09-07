//
//  ProfileTableViewController.swift
//  FreeStyle
//
//  Created by Vince Lee on 2017/8/17.
//  Copyright © 2017年 Vince Lee. All rights reserved.
//

import UIKit
import Social

class ProfileTableViewController: UITableViewController {

    @IBAction func shareButtonPressed(_ sender: Any) {
          let activityController = UIActivityViewController(activityItems: [self.view.toImage()], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    @IBOutlet weak var mainPlayerImageView: UIImageView!
    var profile = Profile()
    var mainPlayerImage = #imageLiteral(resourceName: "Chou")
   
    
    @IBOutlet weak var slangLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBAction func unwindToProfilePage(segue: UIStoryboardSegue) {
        let source = segue.source as? EditProfileTableViewController
        
        if let profileFromEdit = source?.profile, let mainPlayerImageFromEdit = source?.mainPlayerImage {
            mainPlayerImage = mainPlayerImageFromEdit
            profile = profileFromEdit
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profile.name = "Chou"
        profile.type = "Slang King"
        profile.slang = "You don't love me, you just love my doggy style."
        profile.birthday = "1990-02-14"
        
        if let profile = Profile.readFromFile(){
            self.profile = profile
            mainPlayerImage = profile.image!
        }
           
        nameLabel.text = profile.name
        typeLabel.text = profile.type
        slangLabel.text = profile.slang
        birthdayLabel.text = profile.birthday
        print(profile.imageName)
       
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = profile.name
        typeLabel.text = profile.type
        slangLabel.text = profile.slang
        birthdayLabel.text = profile.birthday
        mainPlayerImageView.image = mainPlayerImage
        
        Profile.saveToFile(profile: profile)
        print(profile.imageName)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
        let editProfileController = segue.destination as? EditProfileTableViewController
        editProfileController?.profile = profile
        editProfileController?.mainPlayerImage = mainPlayerImageView.image!
    }
}

extension UIView{
    func toImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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


