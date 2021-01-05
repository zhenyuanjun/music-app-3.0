//
//  extentions.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/11/24.
//

import SwiftUI
struct SearchTextField: View {
    @State var input: String = ""
    @Binding var searchText: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search word", text: $input, onCommit: {
                self.searchText = self.input
            })
        }
    }
}

final class SearchViewModel: ObservableObject {
        @Published var searchText = ""
}
extension Color{
    static func rgb(r:Double,g:Double,b:Double)->Color{
        return Color(red : r / 255, green: g / 255, blue: b / 255)
    }
    static let backgroundColor = Color.rgb(r:21,g:22,b:33)
    static let buttonColor = Color.rgb(r:15, g:175, b:220)
}
