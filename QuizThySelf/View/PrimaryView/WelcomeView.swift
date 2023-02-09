




import SwiftUI





struct WelcomeView: View {
    
    @ObservedObject var router: Router
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                
                
                Spacer()
                Text("QuizThySelf")
                    .font(Font.title)
                    .fontWeight(Font.Weight.bold)
                    .fontDesign(Font.Design.rounded)
                Text("Are you ready to quiz yourself?")
                    .fontWeight(Font.Weight.light)
                    .fontDesign(Font.Design.rounded)
                Divider()
                Button {
                    router.push(Router.Path.categoryPickerView)
                } label: {
                    HStack {
                        Spacer()
                        Text("Start")
                            .fontWeight(Font.Weight.medium)
                            .fontDesign(Font.Design.rounded)
                            
                        Spacer()
                    }
                }
                .buttonStyle(BorderedProminentButtonStyle())
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
            .padding()
        }
        
    }
}





struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View { WelcomeView(router: Router()) }
}





