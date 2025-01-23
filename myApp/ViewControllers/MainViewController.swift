//
//  ViewController.swift
//  myApp
//
//  Created by roxie.h on 10/16/24.
//

import UIKit
import Lottie

class MainViewController: UIViewController {
    // 제목
    let titleLabel : UILabel = {
        let label =  UILabel() // 인스턴스 생성 (메모리에 올라감)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "메인화면"
        label.font = UIFont.boldSystemFont(ofSize: 70)
        return label
        
    }() // 선언과 동시에 정의
    
    let animationView : LottieAnimationView = {
        let animView = LottieAnimationView(name : "heart")
        animView.frame = CGRect(x:0,y:0, width:400 , height:400 )
        animView.contentMode =  .scaleAspectFill // 이미지를 확대할것인지, 축소할것인지
        return animView
    }()
    
    // 뷰 생성되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(animationView)
        animationView.center = view.center
        
        //애니메이션 실행
        
        animationView.play{(finish) in
            print("애니메이션이 끝났어요")
            // 클로저 내부에서 view 호출 시 self 필요
            self.view.backgroundColor = .white
            self.animationView.removeFromSuperview() // animation 상위 부모(Superview)가 view ,
            // 애니메이션 뷰 제거
            
            self.view.addSubview(self.titleLabel)
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

        }
    }


}

