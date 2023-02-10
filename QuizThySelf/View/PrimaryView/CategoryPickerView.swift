




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
                                .font(categories.contains(category) ? Font.title2: Font.title3)
                                .fontWeight(categories.contains(category) ? Font.Weight.bold: Font.Weight.medium)
                                .fontDesign(Font.Design.rounded)
                            Spacer()
                        }
                    }
                    .buttonStyle(BorderedSelectableButtonStyle(color: Color.indigo, isSelected: categories.contains(category), geometry: geometry))
                }
            }
            .padding()
            
            
            if categories.isEmpty {
                VStack {
                    Text("Select at least one category to continue")
                        .fontWeight(Font.Weight.light)
                        .fontDesign(Font.Design.rounded)
                        .foregroundColor(Color.secondary)
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
                    .disabled(true)
                }
                .padding()
            } else {
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
            }

            

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





