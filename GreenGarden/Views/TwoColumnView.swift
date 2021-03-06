//
//  TwoColumnView.swift
//  GreenGarden
//
//  Created by Admin on 9/28/21.
//

import SwiftUI

struct TwoColumnView: View {
    
    let left: String
    let right: String
    
    var body: some View {
        HStack {
            Text(left)
            Spacer()
            Text(right)
        }
    }
}

struct TwoColumnView_Previews: PreviewProvider {
    static var previews: some View {
        TwoColumnView(left: "left string", right: "right string")
    }
}
