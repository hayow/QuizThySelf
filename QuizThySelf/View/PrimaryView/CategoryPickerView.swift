




import SwiftUI





struct CategoryPickerView: View {
    @ObservedObject var router: Router
    @State private var categories: Set<Quiz.Question.Category> = Set()
    let geometry: GeometryProxy
    var body: some View {
        
        VStack {
            Spacer()
            Text("Pick a category")
            LazyVGrid(columns: [GridItem(GridItem.Size.adaptive(minimum: geometry.size.width / 3))]) {
                
                ForEach(Quiz.Question.Category.allCases, id: \.rawValue) { category in
                    Button {
                        if categories.contains(category) {
                            categories.remove(category)
                        } else {
                            categories.insert(category)
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text(category.rawValue.capitalized)
                                .fontDesign(Font.Design.rounded)
                            Spacer()
                        }
                    }
                    .buttonStyle(BorderedProminentButtonStyle())
                }
            }
            .padding()
            
            Text("Categories: \(categories.description)")
            
            Button {
                router.push(Router.Path.difficultyPickerView(categories))
            } label: {
                HStack {
                    Spacer()
                    Text("Next")
                    Spacer()
                }
            }
            .buttonStyle(BorderedProminentButtonStyle())
            .padding()

            

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





struct CategoryPickerView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in CategoryPickerView(router: Router(), geometry: geometry) }
    }
}





