




import SwiftUI





@main struct QuizThySelfApp: App {
    @StateObject private var router: Router = Router()
    var body: some Scene {
        WindowGroup {
            
            NavigationStack(path: $router.path) { WelcomeView(router: router) }
        }
    }
}





