//
//  Extensions.swift
//  GreenGarden
//
//  Created by Admin on 9/27/21.
//

import Foundation

import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView {   self  }
    }
}
