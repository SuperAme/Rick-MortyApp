//
//  LoadingView.swift
//  RickAndMorty
//
//  Created by Americo Meneses on 22/02/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20) {
            ProgressView()
            Text("Getting the characters ...")
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    LoadingView()
}
