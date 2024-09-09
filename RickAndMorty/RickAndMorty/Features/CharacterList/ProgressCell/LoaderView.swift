//
//  LoaderView.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(.black)
            .padding(.all, 16)
    }
}

#Preview {
    LoaderView()
}
