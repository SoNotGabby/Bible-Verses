//
//  detail view.swift
//  APIVerses
//
//  Created by gabrielle on 3/12/26.
//

import Foundation
    
import SwiftUI

struct DetailView: View {
    let verse: BibleVerse
    var body: some View {
        VStack(spacing: 25) {
            Text("\(verse.book_name) \(verse.chapter):\(verse.verse)")
                .font(.title)
            Text(verse.text)
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding()
        }
        .padding()
        .navigationTitle("Verse")
    }
}
