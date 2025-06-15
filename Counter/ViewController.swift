//
//  ViewController.swift
//  Cunter
//
//  Created by Дмитрий Белов on 03.06.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var textHistory: UITextView!
    
    private var numberOfCounter: Int = 0
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy HH:mm:ss"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func setTextOnLabelAndAddHistory(stringForHistory: String) {
        
        countLabel.text = numberOfCounter == 0 ? "\(numberOfCounter)" : "Значение счетчика: \(numberOfCounter)"
        
        let dateString = dateFormatter.string(from: Date())
        textHistory.text.append("\n[\(dateString)]: \(stringForHistory)")
        textHistory.scrollToBottom()
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
    
}

extension UITextView {
    func scrollToBottom() {
        if self.text.count > 0 {
            let range = NSMakeRange(self.text.count - 1, 1)
            self.scrollRangeToVisible(range)
        }
    }
}
