//
//  SelectableLabelView.swift
//  QuizThySelf
//
//  Created by Abdikarim Hayow on 8/19/23
//  
//





import SwiftUI





struct SeletableLabelView: View {
    let text: String
    let color: Color
    let isSelected: Bool
    let size: CGSize
    
    var body: some View {
        VStack {
            if isSelected {
                VStack {
                    ZStack {
                        Circle()
                            .stroke()
                            .frame(width: size.width / 15, height: size.width / 15)
                        Circle()
                            .fill(color)
                            .frame(width: size.width / 30, height: size.width / 30)
                    }
                    
                    Text(text.uppercased())
                        .fontWeight(Font.Weight.regular)
                }
            } else {
                VStack {
                    Circle()
                        .stroke()
                        .frame(width: size.width / 15, height: size.width / 15)
                    
                    Text(text.uppercased())
                        .fontWeight(Font.Weight.light)
                }
            }
        }
        .font(Font.title3)
        .fontDesign(Font.Design.rounded)
        .padding()
        .frame(width: size.width / 2, height: size.width / 3)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: isSelected ? 2: 1)
        }
        .foregroundColor(color)
    }
}





struct SeletableLabelView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            
            VStack {
                SeletableLabelView(text: "Geography", color: Color.blue, isSelected: false, size: proxy.size)
                SeletableLabelView(text: "Geography", color: Color.blue, isSelected: true, size: proxy.size)
            }
            .padding()
        }
    }
}
