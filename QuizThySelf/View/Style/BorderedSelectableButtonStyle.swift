




import SwiftUI





struct BorderedSelectableButtonStyle: ButtonStyle {
    let color: Color
    let isSelected: Bool
    let geometry: GeometryProxy
    
    func makeBody(configuration: Configuration) -> some View {
        return configuration
            .label
            .padding(isSelected ? geometry.size.width / 35: geometry.size.width / 50)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(color, lineWidth: isSelected ? 5: 1.5)
            }
            .foregroundColor(color)
    }
}





