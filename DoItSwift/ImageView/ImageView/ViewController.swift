//
//  ViewController.swift
//  ImageView
//
//  Created by 한재혁 on 2023/08/16.
//

import UIKit

class ViewController: UIViewController {
    var isZoom = false // 이미지 확대 여부를 나타내는 bool 타입의 변수
    var imgOn: UIImage? // 켜진 전구 이미지를 가지고 있는 UIImage 타입의 변수
    var imgOff: UIImage? // 꺼진 전구 이미지를 가지고 있는 UIImage 타입의 변수
    
    @IBOutlet var imgView: UIImageView! // 이미지 뷰에 대한 아웃렛 변수
    @IBOutlet var btnResize: UIButton! // 버튼에 대한 아웃렛 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png") // imgOn에 "lamp_on.png" 이미지를 할당
        imgOff = UIImage(named: "lamp_off.png") // imgOff에 "lamp_off.png" 이미지를 할당
        
        imgView.image = imgOn // 위에서 할당한 imgOn 이미지를 imgView에 할당
    }
    @IBAction func bynResizeImage(_ sender: UIButton) {
        let scale: CGFloat = 2.0 // 확대할 배율 값
        var newWidth: CGFloat, newHeight: CGFloat // 확대할 크기의 계산 값을 보관할 변수
        
        if (isZoom) { // 현재 확대된 그림일 경우
            // 이미지 뷰의 프레임 너빗값을 scale 값으로 나눔
            newWidth = imgView.frame.width / scale
            // 이미지 뷰의 프레임 높잇값을 scale 값으로 나눔
            newHeight = imgView.frame.height / scale
            // 버튼의 타이틀을 확대로 변경
            btnResize.setTitle("확대", for: .normal)
        }
        
        else { // 현재 축소된 그림일 경우
            // 이미지 뷰의 프레임 너빗값을 scale 값으로 곱함
            newWidth = imgView.frame.width * scale
            // 이미지 뷰의 프레임 높잇값을 scale 값으로 곱함
            newHeight = imgView.frame.height * scale
            // 버튼의 타이틀을 축소로 변경
            btnResize.setTitle("축소", for: .normal)
        }
        // 이미지 뷰의 프레임 크기를 수정된 너비와 높이로 변경
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom // isZoom 변수의 상태를 ! 연산자를 사용하여 반전시킴
    }
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn { // 만일 스위치가 On이면
            imgView.image = imgOn // 이미지 뷰의 이미지에 imgOn 이미지를 할당
        }
        
        else { // 만일 스위치가 Off이면
            imgView.image = imgOff // 이미지 뷰의 이미지에 imgOff 이미지를 할당
        }
    }
    

}

