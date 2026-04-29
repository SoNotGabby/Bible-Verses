//
//  ContentView.swift
//  APIVerses
//
//  Created by gabrielle on 3/12/26.
//

import SwiftUI

// JSON STRUCTS
struct BibleResponse: Codable {
    let verses: [BibleVerse]
}

struct BibleVerse: Codable, Identifiable {
    var id: Int { verse }
    let book_name: String
    let chapter: Int
    let verse: Int
    let text: String
}

// MAIN VIEW
struct ContentView: View {
    @State private var verses: [BibleVerse] = []
    @State private var showAlert = false
    var body: some View {
        NavigationStack {
            VStack {
                List(verses) { verse in
                    NavigationLink(destination: DetailView(verse: verse)) {
                        VStack(alignment: .leading) {
                            Text("\(verse.book_name) \(verse.chapter):\(verse.verse)")
                                .font(.headline)
                            Text(verse.text)
                                .font(.caption)
                                .lineLimit(2)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Bible Verses")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink("About", destination: AboutView())
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Reload") {
                        loadVerses()
                    }
                }
            }
            .onAppear {
                loadVerses()
            }
            .alert("Failed to load verses", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }
        }
    }
    
    // API CALL
    func loadVerses() {
        guard let url = URL(string: "https://bible-api.com/john+3:1-20")
        else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoded: BibleResponse = try JSONDecoder().decode(BibleResponse.self, from: data)
                    DispatchQueue.main.async {
                        verses = decoded.verses
                    }
                } catch {
                    DispatchQueue.main.async {
                        showAlert = true
                    }
                }
            } else {
                DispatchQueue.main.async {
                    showAlert = true
                }
            }
        }
        .resume()
    }
}

#Preview {
    ContentView()
}
