import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
        @IBOutlet weak var option1Button: UIButton!
        @IBOutlet weak var option2Button: UIButton!
        @IBOutlet weak var option3Button: UIButton!
        @IBOutlet weak var option4Button: UIButton!
        
        var currentQuestionIndex = 0
        var score = 0
        
        let questions: [Question] = [
            Question(text: "What is the capital of France?", options: ["Berlin", "Madrid", "Paris", "Rome"], correctAnswerIndex: 2),
            Question(text: "Which planet is known as the Red Planet?", options: ["Earth", "Mars", "Jupiter", "Venus"], correctAnswerIndex: 1),
            Question(text: "What is the largest mammal?", options: ["Elephant", "Blue Whale", "Giraffe", "Hippopotamus"], correctAnswerIndex: 1),
            Question(text: "Which programming language is this app written in?", options: ["Swift", "Java", "Python", "C++"], correctAnswerIndex: 0),
            Question(text: "What is the capital of Japan?", options: ["Beijing", "Seoul", "Tokyo", "Bangkok"], correctAnswerIndex: 2)
        ]

        override func viewDidLoad() {
            super.viewDidLoad()
            showQuestion()
        }

        func showQuestion() {
            let currentQuestion = questions[currentQuestionIndex]
            questionLabel.text = currentQuestion.text
            option1Button.setTitle(currentQuestion.options[0], for: .normal)
            option2Button.setTitle(currentQuestion.options[1], for: .normal)
            option3Button.setTitle(currentQuestion.options[2], for: .normal)
            option4Button.setTitle(currentQuestion.options[3], for: .normal)
        }

        @IBAction func optionSelected(_ sender: UIButton) {
            let currentQuestion = questions[currentQuestionIndex]
            if sender.tag == currentQuestion.correctAnswerIndex {
                score += 1
            }

            // Move to the next question or show the score if all questions have been answered
            if currentQuestionIndex < questions.count - 1 {
                currentQuestionIndex += 1
                showQuestion()
            } else {
                showScore()
            }
        }

        func showScore() {
            let alertController = UIAlertController(title: "Quiz Completed", message: "Your score is \(score) out of \(questions.count)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
}

