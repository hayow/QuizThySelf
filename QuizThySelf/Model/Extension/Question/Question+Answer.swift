




import Foundation





extension Quiz.Question {
    
    struct Answer {
        let id: Int
        let answer: (String?, String?)
        let answerIsCorrect: Bool
        var answerIsSelected: Bool = false
    }
    
}





