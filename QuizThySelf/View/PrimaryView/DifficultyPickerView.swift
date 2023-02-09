




import SwiftUI





struct DifficultyPickerView: View {
    @ObservedObject var router: Router
    let categories: Set<Quiz.Question.Category>
    @State private var difficulties: Set<Quiz.Question.Difficulty> = Set()
    let geometry: GeometryProxy
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Pick a difficulty")
            
            LazyVGrid(columns: [GridItem(GridItem.Size.adaptive(minimum: geometry.size.width / 3))]) {
                
                ForEach(Quiz.Question.Difficulty.allCases, id: \.rawValue) { difficulty in
                    Button {
                        if difficulties.contains(difficulty) {
                            difficulties.remove(difficulty)
                        } else {
                            difficulties.insert(difficulty)
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text(difficulty.rawValue.capitalized)
                                .fontDesign(Font.Design.rounded)
                            Spacer()
                        }
                    }
                    .buttonStyle(BorderedProminentButtonStyle())
                }
            }
            .padding()
            
            
            Button {
                
            } label: {
                HStack {
                    Spacer()
                    Text("Next")
                    Spacer()
                }
            }
            .buttonStyle(BorderedProminentButtonStyle())
            .padding()
            
            Button {
                router.popToRoot()
            } label: {
                HStack {
                    Spacer()
                    Text("Back to home")
                    Spacer()
                }
            }
            .buttonStyle(BorderedProminentButtonStyle())
            .padding()
            
            Text("Categories: \(categories.description)")
            Text("Difficulties: \(difficulties.description)")
            
            Spacer()
        }
        .navigationDestination(for: Router.Path.self) { path in
            switch path {
            case .categoryPickerView:
                CategoryPickerView(router: router, geometry: geometry)
            case .difficultyPickerView(let categories):
                DifficultyPickerView(router: router, categories: categories, geometry: geometry)
            }
        }
        
    }
}





struct DifficultyPickerView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in DifficultyPickerView(router: Router(), categories: [], geometry: geometry) }
    }
}





