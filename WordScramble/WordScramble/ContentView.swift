//
//  ContentView.swift
//  WordScramble
//
//  Created by Павел Грицков on 28.07.23.
//

import SwiftUI

struct ContentView: View {
    @State private var userWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score = 0
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your text", text: $newWord)
                        .textInputAutocapitalization(.never)
                    Text("Score: \(score)")
                }
                
                Section {
                    ForEach(userWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count - 1).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord) // почитать доку
            .onAppear(perform: startgame) // почитать доку
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
            .toolbar {
                // кнопка для новой игры
                Button {
                    startgame()
                } label: {
                    Text("new game")
                }
            }
        }
    }
    
    func startgame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Could not load file start.txt from bundle")
    }
    // подсчет количества букв и количества слов
    func calculate() -> Int {
        userWords.reduce(userWords.count - 1) { $0 + $1.count }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // ответы короче трех букв
        guard answer.count > 3 else { return }
        // ответы которые являются корневым словом
        guard answer != rootWord else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation {
            userWords.insert(newWord, at: 0)
        }
        newWord = ""
        // подсчет количества букв и количества слов
        score = calculate()
    }
    
    func isOriginal(word: String) -> Bool {
        !userWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(
            in: word,
            range: range,
            startingAt: 0,
            wrap: false,
            language: "en")

        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
