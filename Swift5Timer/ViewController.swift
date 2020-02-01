//
//  ViewController.swift
//  Swift5Timer
//
//  Created by 佐藤翔馬 on 2019/12/19.
//  Copyright © 2019 Shoma Sato. All rights reserved.
//

import UIKit

//UIViewContollerクラスが親クラス
class ViewController: UIViewController {

    //UIButton型/クラスのstartButtonを作成した。
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageArray = [UIImage]()
    //Timer()クラスを実体化した。
    //Javaでいう、Class class = new Class();みたいな？
    var timer = Timer()
    //Int()クラスを実体化した。
    var countImage = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //初期表示時、
        //Viewが出た際に、ストップボタンを押せなくする。
        stopButton.isEnabled = false
        //isEnabledのことをプロパティ-
        //プロパティー:UIbuttonクラス・設計図から、実体化した時に使えるモノのこと
        
        countImage = 0
        
        //画像の読み込み
        for i in 0..<5{
            print(i)//0,1,2,3,4が表示される。
            
            let image = UIImage(named: "\(i)")
            //imageArrayに画像をappendしている。
            imageArray.append(image!)
        }
        
        //imageViewに初期imageをセットしている。
        imageView.image = UIImage(named: "0")
    }
    
    func startTimer(){
        
        //タイマーを回し、0.2秒ごとに、timerUpdate()メソッドを呼ぶ
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    //#selector(メソッド名)が書かれると、
    //下記のように@objcというように書かないといけないルール
    //0.2秒ごとに呼ばれる
    @objc func timerUpdate(){
        countImage = countImage + 1
        
        if(countImage > 4){
            countImage = 0
        }
        imageView.image = imageArray[countImage]
        
    }
    
    //@IBActionはボタンを押した時にしか反応しない。
    @IBAction func start(_ sender: Any) {
        //スタートボタンを押した時に、
        //imageViewのimageに画像を反映していく
        
        
        //startButtonは押せなくする。
        startButton.isEnabled = false
        //stopButtonを押せるように
        stopButton.isEnabled = true
        
        startTimer()
    }
    
    @IBAction func stop(_ sender: Any) {
        //stopボタンを押した時、
        // imageViewのimageに反映されている画像の流れをつストップする。
        
        //startButtonを押せるようにする。
        startButton.isEnabled = true
        
        stopButton.isEnabled = false
        
        //タイマーをを止める
        timer.invalidate()
        
        countImage = 0
        
        
    }
    
}

