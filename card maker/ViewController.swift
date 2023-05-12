//
//  ViewController.swift
//  card maker
//
//  Created by 陳佩琪 on 2023/5/11.
//

import UIKit

class ViewController: UIViewController{

//input page
    @IBOutlet weak var inputPageView: UIView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var signatureTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet var buttonCollections: [UIButton]!
    
    let dateFormat = DateFormatter()
    let fulfilledContent = ["謝謝您在我生命中的每一個時刻都陪伴在我身邊，您的愛與關懷是我人生中最珍貴的寶藏。","謝謝您為我所做的一切，您的關愛和付出讓我感到溫暖和幸福。您是我永遠的榜樣和支柱。","您是世界上最偉大的母親，我永遠感激您為我所做的一切，並且深深地愛您。","在這個特別的日子裡，我想讓您知道我有多麼感激您對我的愛和支持。您是我人生中最重要的人，我永遠愛您。","母親節快樂！感謝您一直以來對我的愛與支持，您是我永遠的榜樣。","母親節快樂！您的愛是我永遠的後盾，讓我在人生的道路上勇往直前。","您是我人生中最美好的回憶，每一次想起您對我的愛和關懷，都會讓我感到溫暖和幸福。母親節快樂！","您是我生命中最重要的人，沒有您的支持和鼓勵，我無法成為現在的自己。感謝您一直以來的付出。","在這個特別的日子裡，我想讓您知道我多麼珍惜我們之間的關係。您是我的母親，也是我的朋友和良師益友。"]

    
//message preview
    
    @IBOutlet weak var messagePreviewView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var signatureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet var messageLabelsCollection: [UILabel]!
    @IBOutlet weak var textCountLanel: UILabel!
    
    
//background views
    @IBOutlet var backgroundViewCollection: [UIImageView]!
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
           view.endEditing(true)
       }
    
    override var prefersStatusBarHidden: Bool {
           return true
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleTextField.placeholder = "親愛的媽媽,"
        signatureTextField.placeholder = "最愛您的女兒"
        titleLabel.text = titleTextField.placeholder
        contentLabel.text = "母親節快樂！"
        signatureLabel.text = signatureTextField.placeholder
        
        //date
        datePicker.date = Date()
        dateFormat.dateFormat = "yyyy/MM/dd"
        dateLabel.text = dateFormat.string(from: datePicker.date)
        
        for label in messageLabelsCollection {
            label.font = UIFont.systemFont(ofSize: 18)
            label.numberOfLines = 0
        }
        

        for buttons in buttonCollections {
            buttons.tintColor = UIColor(red: 202/255, green: 104/255, blue: 117/255, alpha: 1)
        }
        
        var index = 1
        for backgroundView in backgroundViewCollection {
            backgroundView.image = UIImage(named: "\(index)")
            index += 1
        }
        
        
        updateTextCount ()
        
        
    }
    
    //update text count
    func updateTextCount () {
        var textCount = 0
        textCount = Int(titleLabel.text!.count)
        + Int(contentLabel.text!.count) + Int(signatureLabel.text!.count) + Int(dateLabel.text!.count)
        textCountLanel.text = "字數：\(textCount)字"
    }
    
    

    @IBAction func inputTitle(_ sender: Any) {
        titleLabel.text = "\(titleTextField.text!),"
        updateTextCount ()
    }
    
    
    @IBAction func fullfillTheContent(_ sender: Any) {
        
        if contentTextView.text.contains("謝謝") {
            let index = Int.random(in: 0...1)
            contentLabel.text = fulfilledContent[index]
        } else if contentTextView.text.contains("愛") {
            let index = Int.random(in: 2...3)
            contentLabel.text = fulfilledContent[index]
        } else if contentTextView.text.contains("母親節快樂") {
            let index = Int.random(in: 4...6)
            contentLabel.text = fulfilledContent[index]
        } else if contentTextView.text.contains("重要") {
            contentLabel.text = fulfilledContent[7]
        } else if contentTextView.text.contains("特別") {
            contentLabel.text = fulfilledContent[8]
        } else {
            let index = Int.random(in: 0...8)
            contentLabel.text = fulfilledContent[index]
        }
        updateTextCount ()
    }

    
    @IBAction func addContentToPreview(_ sender: Any) {
        contentLabel.text = contentTextView.text
        contentLabel.numberOfLines = 0
        updateTextCount ()
    }

    @IBAction func inputSignature(_ sender: Any) {
        signatureLabel.text = signatureTextField.text
        updateTextCount ()
    }
    

    @IBAction func signDate(_ sender: Any) {
        //value changed
        dateLabel.text = dateFormat.string(from: datePicker.date)
        updateTextCount ()
    }
    
    @IBAction func adjustFontSize(_ sender: UISlider) {
        let fontSize = CGFloat(sender.value)
        for label in messageLabelsCollection {
            label.font = UIFont.systemFont(ofSize: fontSize)
            label.adjustsFontSizeToFitWidth = true
            label.numberOfLines = 0
        }
        
    }
    
    @IBAction func hideInputView(_ sender: Any) {
        inputPageView.isHidden = true
    }
    
    
    @IBAction func showInputView(_ sender: Any) {
        inputPageView.isHidden = false
    }
}

