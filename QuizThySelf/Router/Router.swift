




import Foundation
import SwiftUI





class Router: ObservableObject, Hashable {
    
    static func == (lhs: Router, rhs: Router) -> Bool { ObjectIdentifier(lhs) == ObjectIdentifier(rhs) }
    func hash(into hasher: inout Hasher) { hasher.combine(self) }
    @Published var path: NavigationPath = NavigationPath()
    
    func popToRoot() { path = NavigationPath() }
    func push(_ view: Router.Path) { path.append(view) }
    func pop(_ k: Int = 1) { path.removeLast(k) }
}





