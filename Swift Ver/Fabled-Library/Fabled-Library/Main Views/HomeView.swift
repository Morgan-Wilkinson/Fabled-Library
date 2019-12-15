//
//  HomeView.swift
//  Fabled-Library
//
//  Created by Morgan Wilkinson on 12/14/19.
//  Copyright © 2019 Morgan Wilkinson. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            SideBar()
            BookShelf()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
