//
//  ContentView.swift
//  Instafilter
//
//  Created by Kevin Pfefferle on 12/21/23.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import StoreKit
import SwiftUI

struct ContentView: View {
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
    
    let context = CIContext()
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var processedImage: Image?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var showFilterIntensity = true
    @State private var filterIntensity = 0.5
    @State private var showFilterRadius = false
    @State private var filterRadius = 100.0
    @State private var showFilterScale = false
    @State private var filterScale = 5.0
    @State private var showingFilters = false
    
    var isNoImage: Bool {
        processedImage == nil
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)
                
                Spacer()

                VStack {
                    if showFilterIntensity {
                        HStack {
                            Text("Intensity")
                                .frame(width: 80)
                            Slider(value: $filterIntensity, in: 0...1)
                                .onChange(of: filterIntensity, applyProcessing)
                        }
                    }
                    if showFilterRadius {
                        HStack {
                            Text("Radius")
                                .frame(width: 80)
                            Slider(value: $filterRadius, in: 0...200)
                                .onChange(of: filterRadius, applyProcessing)
                        }
                    }
                    if showFilterScale {
                        HStack {
                            Text("Scale")
                                .frame(width: 80)
                            Slider(value: $filterScale, in: 0...10)
                                .onChange(of: filterScale, applyProcessing)
                        }
                    }
                }
                .padding(.vertical)
                .disabled(isNoImage)
                
                HStack {
                    Button("Change Filter", action: changeFilter)
                    
                    Spacer()
                    
                    if let processedImage {
                        ShareLink(item: processedImage, preview: SharePreview("Instafilter image", image: processedImage))
                    }
                }
                .disabled(isNoImage)
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .confirmationDialog("Select a filter", isPresented: $showingFilters) {
                Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                Button("Edges") { setFilter(CIFilter.edges()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                Button("Cancel", role: .cancel) { }
            }
        }
    }
    
    func changeFilter() {
        showingFilters = true
    }
    
    @MainActor func setFilter(_ filter: CIFilter) {
        currentFilter = filter

        let inputKeys = currentFilter.inputKeys
        showFilterIntensity = inputKeys.contains(kCIInputIntensityKey)
        showFilterRadius = inputKeys.contains(kCIInputRadiusKey)
        showFilterScale = inputKeys.contains(kCIInputScaleKey)

        loadImage()
        
        filterCount += 1
        
        if filterCount >= 20 {
            requestReview()
        }
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterRadius, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterScale, forKey: kCIInputScaleKey) }
        
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
}

#Preview {
    ContentView()
}
