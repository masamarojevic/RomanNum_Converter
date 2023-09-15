//
//  ViewController.swift
//  TenTechfingers_Uppgift1
//
//  Created by Ana Marojevic on 2023-09-14.
//

import UIKit

class ViewController:
                            
   
    UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    let converter = Converter()
    
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var txtLoading: UILabel!
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet weak var StackRoman: UIStackView!
    @IBOutlet weak var txtFieldArabicNum: UITextField!
    @IBOutlet weak var txtFieldRomanNum: UITextField!
    
    @IBOutlet weak var StackArabic: UIStackView!
    @IBOutlet weak var lblToRoman: UILabel!
    @IBOutlet weak var lblToArabic: UILabel!
    
  
    @IBOutlet weak var btnConvertToRoman: UIButton!
    
    @IBOutlet weak var btnConvertToArabic: UIButton!
    
    var numbers = [1,5,10,50,100,500,1000]
    var roman = ["I","V","X","L","C","D","M"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPickerView.dataSource = self
        myPickerView.delegate = self
        mySwitch.isOn = false
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            
            let strValue = String(numbers[row])
            return "\(strValue)"
            
        }else {
            
            return roman[row]
        }
       
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let selectedValue = numbers[row]
        let selectedValue2 = roman[row]
        
        //if selected component is numbers it converts it to roman numbers else convert to arabic numbers
        if component == 0 {
            
            let RomanNum = converter.toRoman(arabicNumber: selectedValue)
            txtLoading.text = RomanNum
            
        } else {
            
            let ArabNum = converter.toArabic(romanNumber: selectedValue2)
            txtLoading.text = String(ArabNum)
        }
        
    }
    @IBAction func OnSwitch(_ sender: Any) {
        if mySwitch.isOn {
            StackRoman.isHidden = false
            StackArabic.isHidden = false
        } else{
            StackRoman.isHidden = true
            StackArabic.isHidden = true
        }

    }
    
    @IBAction func OnRomanConvert(_ sender: UIButton) {
        guard let arabicInput = txtFieldArabicNum.text, !arabicInput.isEmpty, let arabicValue = Int(arabicInput) else {
            lblToRoman.text = "Invalid"
            return
        }
        let romanNum = converter.toRoman(arabicNumber: arabicValue)
        lblToRoman.text = romanNum
    }
    
    @IBAction func OnArabicConvert(_ sender: UIButton) {
        guard let romanInput = txtFieldRomanNum.text, !romanInput.isEmpty else{ lblToArabic.text = "Enter a valid Number"
            return }
        let arabicNum = converter.toArabic(romanNumber: romanInput)
        if arabicNum == 0 {
            lblToArabic.text = "Invalid"
        }else{
            lblToArabic.text = String(arabicNum)
        }
        
        
      
    }
    
    
   
}


