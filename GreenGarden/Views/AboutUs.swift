//
//  AboutUs.swift
//  GreenGarden
//
//  Created by Admin on 9/28/21.
//

import SwiftUI

struct AboutUs: View {
    
    let vegetable: VegetableViewModel
    
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            
            Text(vegetable.description)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Sowing Description")
                .font(.headline)
            VStack {
                TwoColumnView(left: "Seed Depth", right: vegetable.seedDepth)
                TwoColumnView(left: "Germination Soil Temperature", right: vegetable.growingSoilTemperature)
            }
            
            DescriptionView(heading: "Sowing", content: vegetable.sowingDescription)
                //.modifications()
                .padding()
                .foregroundColor(.black)
                .background(Constants.Colors.lightGreyRowColor)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                
                
            
            DescriptionView(heading: "Growing", content: vegetable.growingDescription)
            //.modifications()
            .padding()
            .foregroundColor(.black)
            .background(Constants.Colors.lightBlueRowColor)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            
            
            Spacer()
        }.padding()
    }
}

struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        AboutUs(vegetable: VegetableViewModel.default())
    }
}


