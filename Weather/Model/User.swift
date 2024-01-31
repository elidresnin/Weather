//
//  User.swift
//  Weather
//
//  Created by Eli Dresnin (student LM) on 1/9/24.
//

import SwiftUI

class User: ObservableObject {
    @Published var latitude: Double = 40.0102
    @Published var longitude: Double = 75.2797
}
