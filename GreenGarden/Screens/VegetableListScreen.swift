//
//  VegetableListScreen.swift
//  GreenGarden
//
//  Created by Admin on 9/27/21.
//

import SwiftUI

struct VegetableListScreen: View {
    
    @StateObject private var vegetableListVM = VegetableListViewModel()
    
    var body: some View {
        
        VStack {
            List {
                ForEach(vegetableListVM.vegetables, id: \.id) { vegetable in
                    
                    NavigationLink(destination: VegetableDetailScreen(vegetable: vegetable)) {
                        VegetableCell(vegetable: vegetable)
                            .background(Constants.Colors.lightGreyRowColor)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                    }
                    
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Green Garden")
            .task {
                await vegetableListVM.getAll()
            }
        }
    }
}

struct VegetableListScreen_Previews: PreviewProvider {
    static var previews: some View {
        VegetableListScreen()
            .navigationTitle("Green Garden")
            .embedInNavigationView()
    }
}

struct VegetableCell: View {
    //extracted subview - since it relys on vegetableVM - we declare property of vegetable... then when called we pass vegetable: vegetable in closure
    let vegetable: VegetableViewModel
    var body: some View {
        HStack {
            AsyncImage(url: vegetable.thumbnailUrl) { image in
                image.resizable()
                    .frame(maxWidth: 75, maxHeight: 75)
            } placeholder: {
                ProgressView()
            }
            Text(vegetable.name)
            Spacer()
        }
        .frame(maxWidth: UIScreen.main.bounds.width)
        
    }
}
