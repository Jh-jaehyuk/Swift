//
//  ViewController.swift
//  Mission_AlarmClock
//
//  Created by 한재혁 on 2023/08/19.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var pickerTime: String?
    var isAlert = false
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func changePickerTime(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택 시간: " + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "hh:mm aaa"
        pickerTime = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재 시간: " + formatter.string(from: date as Date)
        
        formatter.dateFormat = "hh:mm aaa"
        var currentTime = formatter.string(from: date as Date)
        
        if (pickerTime == currentTime) {
            if !isAlert {
                let timeAlert = UIAlertController(title: "알림", message: "설정된 시간입니다 !!!", preferredStyle: UIAlertController.Style.alert)
                
                let alertAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: {
                    ACTION in self.isAlert = true
                })
                timeAlert.addAction(alertAction)
                present(timeAlert, animated: true, completion: nil)
                isAlert = true
            }
        }
        
        else {
            isAlert = false
        }
    }
}

