//
//  ContentView.swift
//  iExpense
//
//  Created by Kevin Pfefferle on 12/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView()
        }
    }
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    ContentView()
}
