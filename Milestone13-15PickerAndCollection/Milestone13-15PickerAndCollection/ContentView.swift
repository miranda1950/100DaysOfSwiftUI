//
//  ContentView.swift
//  Milestone13-15PickerAndCollection
//
//  Created by COBE on 28.09.2022..
//

import SwiftUI

struct ContentView: View {
    
    @State private var images: ListImage?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State public var listImages: [ListImage]
    @State private var image: Image?
    
    var body: some View {
        NavigationView {
            List {
              
                ForEach(listImages) { image in
                    
                    
                    image.images
                        
                        
                    
               
                Spacer()
                Text("Name")
                
                
                }
                
            }
            .navigationTitle("Memories")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingImagePicker.toggle()
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .onChange(of: inputImage) {
                _ in loadImage()
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else {
            return
        }
         images?.images = Image(uiImage: inputImage)
        
        listImages.append(images ?? ListImage(id: UUID(), images: image))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var listImages = [ListImage]()
    static var previews: some View {
        ContentView(listImages: listImages)
    }
}

