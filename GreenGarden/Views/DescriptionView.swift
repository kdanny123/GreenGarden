//
//  DescriptionView.swift
//  GreenGarden
//
//  Created by Admin on 9/28/21.
//

import SwiftUI

struct DescriptionView: View {
    
    let heading: String
    let content: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            Text(heading)
                .font(.headline)
            Text(content)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(heading: "heading", content: "content")
    }
}

extension DescriptionView {
    func modifications() -> some View {
        self
//            .padding()
//            .foregroundColor(.black)
    }
}
