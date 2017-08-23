//
//  EditProfileTableViewController.swift
//  FreeStyle
//
//  Created by Vince Lee on 2017/8/17.
//  Copyright © 2017年 Vince Lee. All rights reserved.
//

import UIKit

class EditProfileTableViewController: UITableViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    var profile: Profile?
    var mainPlayerImage: UIImage?
    
    var formatter: DateFormatter! = nil
    
    
    
    
    
    @IBOutlet weak var mainPlayerImageView: UIButton!
    
    @IBOutlet weak var slangTextView: UITextView!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
  
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBAction func birthdayEdit(_ sender: Any) {
        
    }
    @IBAction func doneButtonPressed(_ sender: Any) {
        
         let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
         guard (nameTextField.text?.characters.count)! < 20 && (nameTextField.text?.characters.count)! > 0 else {
            func nameLengthWrong(){
                let alertController = UIAlertController(title: "Name length wrong", message: "Name length should between 0 ~ 20 characters.", preferredStyle: .alert)
                alertController.addAction(cancelAction)
                present(alertController, animated: true, completion: nil)
            }
           nameLengthWrong()
            return
        }
        guard (typeTextField.text?.characters.count)! < 20 && (typeTextField.text?.characters.count)! > 0 else {
            func typeLengthWrong(){
                let alertController = UIAlertController(title: "Type length wrong", message: "Type length should between 0 ~ 20 characters.", preferredStyle: .alert)
                alertController.addAction(cancelAction)
                present(alertController, animated: true, completion: nil)
            }
            typeLengthWrong()
            return
        }
        performSegue(withIdentifier: PropertyKeys.BackToProfilePageSegue, sender: nil)
    }
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("info \(info)")
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        mainPlayerImageView.setImage(image, for: .normal)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainPlayerImageView.imageView?.contentMode = .scaleAspectFill
        slangTextView.layer.borderWidth = 1
        slangTextView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        slangTextView.layer.cornerRadius = 10
        
        navigationItem.title = profile?.name
        
        nameTextField.text = profile?.name
        nameTextField.clearsOnInsertion = true
        nameTextField.clearButtonMode = .whileEditing
        typeTextField.text = profile?.type
        typeTextField.clearsOnInsertion = true
        typeTextField.clearButtonMode = .whileEditing
        slangTextView.text = profile?.slang
        birthdayTextField.text = profile?.birthday
        
        

        mainPlayerImageView.setImage(mainPlayerImage, for: .normal)
        
        formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let myDatePicker = UIDatePicker()
        
        myDatePicker.datePickerMode = .date
        myDatePicker.date = NSDate() as Date
        
        // 設置 UIDatePicker 改變日期時會執行動作的方法
        myDatePicker.addTarget(
            self,
            action: #selector(EditProfileTableViewController.datePickerChanged),
            for: .valueChanged)
        
        // 將 UITextField 原先鍵盤的視圖更換成 UIDatePicker
        birthdayTextField.inputView = myDatePicker
        
        birthdayTextField.tag = 200
        
        
        
        
        
   
        
    }
        
   
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    @objc func hideKeyboard(tap:UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    // UIDatePicker 改變選擇時執行的動作
    @objc func datePickerChanged(datePicker:UIDatePicker) {
        // 依據元件的 tag 取得 UITextField
        let myTextField =
            self.view?.viewWithTag(200) as? UITextField
        
        // 將 UITextField 的值更新為新的日期
        myTextField?.text =
            formatter.string(from: datePicker.date)
    }
    
    
    
    @IBAction func changePhotoButton(_ sender: Any) {
        
        func chooseHowToPhoto() {
       // setting alertController
            let alertController = UIAlertController(title: "Photo", message: "Choose from", preferredStyle: .actionSheet)
       // getting photo by camera
            let cameraAction = UIAlertAction(title: "Camera", style: .default) {(action: UIAlertAction!) -> Void  in
                
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = true
                imagePicker.sourceType = .camera
                imagePicker.delegate = self
                
                self.present(imagePicker, animated: true, completion: nil)

            }
        // getting photo by photo library
            let photolibraryAction = UIAlertAction(title: "Photo Library", style: .default) {(action: UIAlertAction!) -> Void  in
                
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = true
                imagePicker.sourceType = .photoLibrary
                
                imagePicker.delegate = self
                
                self.present(imagePicker, animated: true, completion: nil)
                
            }
         // add additional cancel button
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alertController.addAction(cameraAction)
            alertController.addAction(photolibraryAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
             }
        chooseHowToPhoto()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        profile?.name = nameTextField.text ?? ""
        profile?.type = typeTextField.text ?? ""
        profile?.slang = slangTextView.text ?? ""
        profile?.birthday = birthdayTextField.text ?? ""
        mainPlayerImage = mainPlayerImageView.imageView?.image
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

}
