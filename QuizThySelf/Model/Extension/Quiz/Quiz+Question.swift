




import Foundation





extension Quiz {
    
    struct Question {
        let id: Int
        let question: (String?, String?)
        let questionType: QuestionType
        let answerContentType: AnswerContentType
        let category: Category
        let difficulty: Difficulty
        var answers: [Answer]
        let questionIsAnswered: Bool = false
    }
    
}





