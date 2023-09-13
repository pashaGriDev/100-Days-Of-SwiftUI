//
//  DetailView.swift
//  Bookworm
//
//  Created by Павел Грицков on 13.09.23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    
    let book: Book
    
    @State private var showingDeleteAlert = false
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            Text(book.author ?? "Unknow Author")
                .font(.title)
                .foregroundColor(.secondary)
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unknow Title")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete book?", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
    }
    
    func deleteBook() {
        moc.delete(book)
        
//        try? moc.save()
        dismiss()
    }
}

