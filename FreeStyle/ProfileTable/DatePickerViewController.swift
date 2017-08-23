//
//  DatePickerViewController.swift
//  FreeStyle
//
//  Created by Vince Lee on 2017/8/23.
//  Copyright © 2017年 Vince Lee. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let week = ["1", "2", "3", "4"]
    let meals = ["chicken", "beef"]
    var whatday = "1"
    var whatmeal = "chicken"
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // 設置第一列時
        if component == 0 {
            // 返回陣列 week 的成員數量
            return week.count
        }
        
        // 否則就是設置第二列
        // 返回陣列 meals 的成員數量
        return meals.count
    }
    
    // UIPickerView 每個選項顯示的資料
    func pickerView(pickerView: UIPickerView,
                    titleForRow row: Int, forComponent component: Int)
        -> String? {
            // 設置第一列時
            if component == 0 {
                // 設置為陣列 week 的第 row 項資料
                return week[row]
            }
            
            // 否則就是設置第二列
            // 設置為陣列 meals 的第 row 項資料
            return meals[row]
    }

    // UIPickerView 改變選擇後執行的動作
    func pickerView(pickerView: UIPickerView,
                    didSelectRow row: Int, inComponent component: Int) {
        // 改變第一列時
        if component == 0 {
            // whatDay 設置為陣列 week 的第 row 項資料
            whatday = week[row]
        } else {
            // 否則就是改變第二列
            // whatMeal 設置為陣列 meals 的第 row 項資料
            whatmeal = meals[row]
        }
        
        // 將改變的結果印出來
        print("選擇的是 \(whatday) ， \(whatmeal)")
    }
    
    var date: String!
    
    @IBAction func doneButonPressed(_ sender: Any) {
        
        
        
        
    }
    
    @IBAction func cancelButonPressed(_ sender: Any) {
    }
    
    @IBOutlet var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    func datePicker(datePicker: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"
        date = formatter.string(from: datePicker.date)
        print(date)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
