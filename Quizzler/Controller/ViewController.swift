import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()

        let answerChoices = quizBrain.getAnswers()
        choiceOneButton.setTitle(answerChoices[0], for: .normal)
        choiceTwoButton.setTitle(answerChoices[1], for: .normal)
        choiceThreeButton.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizBrain.gerProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        choiceOneButton.backgroundColor = .clear
        choiceTwoButton.backgroundColor = .clear
        choiceThreeButton.backgroundColor = .clear        
    }
    
}

