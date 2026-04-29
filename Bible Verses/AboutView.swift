//
//  aboutview.swift
//  APIVerses
//
//  Created by gabrielle on 3/12/26.
//

import Foundation
import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "book.fill")
                .font(.system(size: 80))
                .foregroundColor(.purple)
            Text("Bible Verses App")
                .font(.largeTitle)
                .bold()
            Text("This app loads Bible verses from an online API and displays them in a list. Tap a verse to see the full text and details.")
                .multilineTextAlignment(.center)
                .padding()
            Text("You can also reload the verses to see different passages.")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .navigationTitle("About")
    }
}

#Preview {
}
