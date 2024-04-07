import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var timer = Timer()
    var secondsPassed = 0
    var totalTime = 0
    var playSound = PlaySound()
    var selectedHardness = ""
    var backgroundColour: UIColor?
    var orgCOlourText: UIColor?
    var selectedButton: UIButton?
    
    
    @IBOutlet weak var softBtn: UIButton!
    @IBOutlet weak var medBtn: UIButton!
    @IBOutlet weak var hardBtn: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var hardButton: UIButton!
    @IBOutlet weak var softButton: UIButton!
    @IBOutlet weak var medButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    
//MARK: viewDidLoad & ButtonTapped
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
             
        selectedHardness = sender.currentTitle!
        label.text = selectedHardness
        
        
        playSound.playSound(soundName: "pick-92276")
        
        selectedButton?.isSelected = false
        sender.isSelected = true
        selectedButton = sender
    }
    
    
//MARK: Start button IBAction
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!

        timer.invalidate()
        self.backgroundColour = self.view.backgroundColor
        self.orgCOlourText = label.textColor
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            [weak self] timer in self?.updateTimer()
        }
        
        progressBar.progress = 0
        secondsPassed = 0
        label.text = hardness
        label.textColor = UIColor.white
    }
    
    
//MARK: Update timer function
    
    
    func updateTimer(){
        if secondsPassed <= eggTimes[selectedHardness]! {
            
            let percentageProgress = Float(secondsPassed) / Float(eggTimes[selectedHardness]!)
//                        print(percentageProgress)
            progressBar.progress = percentageProgress
            view.backgroundColor = UIColor.purple
            secondsPassed += 1
        } else {
            timer.invalidate()
            playSound.playSound(soundName: "alarm_sound")
            label.text = "Timer is up"
            label.textColor = self.orgCOlourText
            view.backgroundColor = self.backgroundColour
        }
    }
}
