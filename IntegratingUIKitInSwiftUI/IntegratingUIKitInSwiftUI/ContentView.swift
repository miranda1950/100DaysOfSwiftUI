//
//  ContentView.swift
//  IntegratingUIKitInSwiftUI
//
//  Created by COBE on 20.09.2022..
//

import SwiftUI

struct ContentView: View {
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingImagePicker = true
            }
            Button("Save image") {
                guard let inputImage = inputImage else {
                    return
                }
                let imageSaver = ImageSaver()
                imageSaver.writeToPhotoAlbum(image: inputImage)
            }
        }.sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) {
            _ in loadImage()
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else {
            return
        }
        image = Image(uiImage: inputImage)
        
        //second object, third paramethher name of the method to the first
        //UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
