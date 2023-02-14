




import SwiftUI





struct TextAnswerView: View {

    let question: Quiz.Question
    let answer: Quiz.Question.Answer
    let geometry: GeometryProxy
    
    var body: some View {
        
        
        VStack {
            Button {
                
            } label: {
                HStack {
                    Spacer()
                    if let answerContent: String = answer.answer.0 {
                        Text(answerContent)
                            .font(answer.answerIsSelected ? Font.title2: Font.title3)
                            .fontWeight(answer.answerIsSelected ? Font.Weight.semibold: Font.Weight.medium)
                    }
                    Spacer()
                }
            }
            .buttonStyle(BorderedSelectableButtonStyle(color: answer.answerIsSelected ? answer.answerIsCorrect ? Color.green: Color.red: Color.indigo, isSelected: answer.answerIsSelected, geometry: geometry))
        }
    }
}





struct TextAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader { geometry in TextAnswerView(question: Quiz.Question.questions[0], answer: Quiz.Question.questions[0].answers[0], geometry: geometry)}
    }
}





