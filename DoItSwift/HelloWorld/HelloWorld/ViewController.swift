//
//  ViewController.swift
//  HelloWorld
//
//  Created by 한재혁 on 2023/08/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblHello: UILabel! // 출력 레이블용 아웃렛 변수
    @IBOutlet var txtName: UITextField! // 이름 입력용 아웃렛 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnSend(_ sender: UIButton) {
        // "Hello, " 라는 문자열과 txtName.text 의 문자열을 결합하여 lblHello.txt 에 넣음.
        lblHello.text = "Hello, " + txtName.text!
    }
    

}

