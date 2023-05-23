//
//  ContentView.swift
//  accessingTheCamera
//
//  Created by Claire Williams on 5/23/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isImagePickerShowing = false
    
    @State var selectedImage: UIImage?
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
    
        VStack {
            Image(uiImage: selectedImage ?? UIImage(named: "pink camera")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                
            HStack {
                
                Button("Select a Photo") {
                    self.sourceType = .photoLibrary
                    isImagePickerShowing = true
                }
                .padding()
                
                
                Button("Take a Photo") {
                    self.sourceType = .camera
                    isImagePickerShowing = true
                }
                .padding()
                
            }
            
            
        }
        .padding()
        .sheet(isPresented: $isImagePickerShowing) {
            ImagePicker(selectedImage: $selectedImage, isImagePickerShowing: $isImagePickerShowing, sourceType: self.sourceType)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
