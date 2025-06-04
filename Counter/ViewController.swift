//
//  ViewController.swift
//  Cunter
//
//  Created by Дмитрий Белов on 03.06.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CountLabel: UILabel!
    @IBOutlet weak var ButtonPlus: UIButton!
    @IBOutlet weak var ButtonMinus: UIButton!
    @IBOutlet weak var ButtonZero: UIButton!
    @IBOutlet weak var TextHistory: UITextView!
    
    var numberOfCounter: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPlusDidTap(_ sender: Any) {
        
        numberOfCounter += 1
        setTextOnLabelAndAddHistory(stringForHistory: "значение изменено на +1")
        
    }
    
    @IBAction func buttonMinusDidTap(_ sender: Any) {
        
        var stringHistory = ""
        
        if numberOfCounter > 0 {
            numberOfCounter -= 1
            stringHistory = "значение изменено на -1"
        }
        else {
            stringHistory = "попытка уменьшить значение счётчика ниже 0"
        }
        
        setTextOnLabelAndAddHistory(stringForHistory: stringHistory)
    }
    
    @IBAction func buttonZeroDidTap(_ sender: Any) {
       
        numberOfCounter = 0
        setTextOnLabelAndAddHistory(stringForHistory: "значение сброшено")

    }

//  Посмотрел прием работы с DateFormatter, но использовал встроенную функцию
    
//    func formattedDate() -> String {
//        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        return formatter.string(from: Date())
//    }
    
    func setTextOnLabelAndAddHistory(stringForHistory: String) {
        
        CountLabel.text = numberOfCounter == 0 ? "\(numberOfCounter)" : "Значение счетчика: \(numberOfCounter)"
        TextHistory.text.append("\n [\(Date().formatted())]: " + stringForHistory)
        TextHistory.scrollToBottom()
    }
    
}

extension UITextView {
    func scrollToBottom() {
        if self.text.count > 0 {
            let range = NSMakeRange(self.text.count - 1, 1)
            self.scrollRangeToVisible(range)
        }
    }
}
