//
//  ViewController.swift
//  lumosity Color Match
//
//  Created by Dana Goldberg on 4/6/17.
//  Copyright © 2017 Dana Goldberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    let colors = [UIColor.red,UIColor.black,UIColor.brown,UIColor.yellow,UIColor.orange,UIColor.purple]
    
    let colorTitle = ["RED","BLACK","BROWN","YELLOW","ORANGE","PURPLE"]
    
    var leftColorIndex = 0
    var leftTitleIndex = 0
    var rightColorIndex = 0
    var rightTitleIndex = 0
    
    
    var score = 0
    var timer : Timer!
    var time = 20
    //var results = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {(timer) in
            self.timeCount ()
    })
            setupViews()
        
    }
        func timeCount (){
            
            time -= 1
            timeLabel.text = "Time:\(time)"
            
            if (time <= 0) {
                
                
                var results = UserDefaults.standard.value(forKey: "results") as? [Int]
                if results != nil {
                    
                    results?.append(score)
                UserDefaults.standard.set(results, forKey: "results")
                    
                }else {
                    
                    let res = [score]
                    UserDefaults.standard.set(res, forKey: "results")
                }
                timer.invalidate()
                
        let alert = UIAlertController(title: "Time is Over!", message: "Your score is \(score)", preferredStyle: .alert)
        
        let restartGame = UIAlertAction (title: "Restart", style: .default, handler: { (action) in
            
            self.score = 0
            self.scoreLabel.text = "Score:\(self.score)"
            self.time = 10
            self.timeLabel.text = "Time:\(self.time)"
            self.timer = Timer(timeInterval: 1.0, repeats: true, block: {(timer) in self.timeCount()
            
                })
        })
           alert.addAction(restartGame)
                self.present(alert, animated: true, completion: nil)
            }
            
            
            
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupViews () {
        
        leftColorIndex = Int(arc4random_uniform(UInt32(colors.count)))
        leftTitleIndex = Int(arc4random_uniform(UInt32(colors.count)))
        
        rightColorIndex = Int(arc4random_uniform(UInt32(colors.count)))
        rightTitleIndex = Int(arc4random_uniform(UInt32(colors.count)))
        
        leftLabel.text = colorTitle[leftTitleIndex]
        leftLabel.backgroundColor = colors [leftColorIndex]
        
        rightLabel.text = colorTitle[rightTitleIndex]
        rightLabel.backgroundColor = colors [rightColorIndex]
    }

    
    @IBAction func yesBTNpressed(_ sender: UIButton) {
        
        if (leftTitleIndex == rightColorIndex){
            
            score = score + 1
            scoreLabel.text = "Score:\(score)"
            
            self.statusLabel.text = "RIGHT!"
        } else {
            self.statusLabel.text = "WRONG!"
        }
        
        setupViews()
    }

    @IBAction func noBTNpressed(_ sender: UIButton) {
        
        if (leftTitleIndex != rightColorIndex){
            
            score = score + 1
            scoreLabel.text = "Score:\(score)"
            
            self.statusLabel.text = "RIGHT!"
        } else {
            self.statusLabel.text = "WRONG!"
        }

        
        setupViews()
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  //      if (segue.identifier == "toResults"){
 //           let viewController = segue.destination as! SecondVC
 //           viewController.results = results
   //     }
    }
}

