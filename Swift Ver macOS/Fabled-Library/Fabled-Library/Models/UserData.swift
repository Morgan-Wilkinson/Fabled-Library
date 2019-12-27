//
//  UserData.swift
//  Fabled-Library
//
//  Created by Morgan Wilkinson on 11/9/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

/*
Abstract:
A model object that stores app data.
*/

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var novels = novelData
}
