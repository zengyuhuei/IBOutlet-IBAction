//
//  startViewController.swift
//  IBOutlet
//
//  Created by User16 on 2019/4/9.
//  Copyright © 2019 User16. All rights reserved.
//

import UIKit

class startViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var chooseButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.isEnabled = false;

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var birthday: UITextField!
    @IBOutlet weak var NameField: UITextField!
    var number = 0;
    
    @IBAction func chooseNumber(_ sender: UIButton) {
        let pre_number = number;
        while(pre_number == number)
        {
            number = Int.random(in: 0...2);
        }
        
        pokamonSsgment.selectedSegmentIndex = 0;
        pokamonImage.image = UIImage(named: "animal-" + String(number) + "-0") //顯示幼仔
        NameField.isEnabled = true;
        NameField.text = "";
        birthday.isEnabled = true;
        birthday.text = "";
        slider.isEnabled = true;
        slider.setValue(0, animated: true);
        age.text = "0";
        danger.text = "";
        datePicker.isEnabled = true;
        pokamonSsgment.isEnabled = true;
        
        
        
    }
    var Over: Int = 0;
    var isOver = false;
    @IBOutlet weak var danger: UILabel!
    @IBAction func aging(_ sender: UISlider)
    {
        age.text = String(Int(sender.value));
        number = Int.random(in: 50...100);
        if Int(sender.value) >= number{
            sender.isEnabled = false;
            Over = number;
            isOver = true;
            pokamonImage.image = UIImage(named: "die");
            danger.text = "你把他弄死掉了，請重抽一隻QQ";
            danger.textColor = UIColor.red;
            danger.font = UIFont.boldSystemFont(ofSize: 23)
            NameField.isEnabled = false;
            birthday.isEnabled = false;
            datePicker.isEnabled = false;
            pokamonSsgment.isEnabled = false;
        }
        
    }
    @IBAction func pickingDate(_ sender: UIDatePicker) {
        let dateValue = DateFormatter()
        dateValue.dateFormat = "yyyy-MM-dd" // 設定要顯示在Text Field的日期時間格式
        birthday.text = dateValue.string(from: datePicker.date) // 更新Text Field的內容
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }

    
    @IBOutlet weak var pokamonSsgment: UISegmentedControl!
    @IBOutlet weak var pokamonImage: UIImageView!
    @IBAction func mtSegmentedAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            pokamonImage.image = UIImage(named: "animal-" + String(number) + "-0") //顯示幼仔
        }
        else if sender.selectedSegmentIndex == 1 {
            pokamonImage.image = UIImage(named: "animal-" + String(number) + "-1") //顯示進化
        }
        else{
            pokamonImage.image = UIImage(named: "animal-" + String(number) + "-2") //顯示終極進化
        }

    }
    @IBAction func DisableButton(_ sender: UISwitch) {
        if sender.isOn == true //按鈕可以點
        {
            chooseButton.isEnabled = true;
        }
        else //按鈕關閉
        {
            chooseButton.isEnabled = false;
        }
    }
    
}
