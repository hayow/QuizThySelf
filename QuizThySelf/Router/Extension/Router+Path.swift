




import Foundation





extension Router {
    
    enum Path: Hashable {
        case categoryPickerView
        case difficultyPickerView(Set<Quiz.Question.Category>)
    }
}





