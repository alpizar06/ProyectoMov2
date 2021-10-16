//
//  picker.swift
//  Cenfotec-gram
//
//  Created by Daniel Alpizar on 16/10/21.
//

import SwiftUI

struct picker: View {
    
    @State var showActionSheet = false
    @State var showImagePicker = false
    
    @State var sourceType:UIImagePickerController.SourceType = .camera
    
    @State var image:UIImage?
    
    var body: some View {
        VStack{
            Button(action: {
                self.showActionSheet = true
            }) {
                Image(systemName: "camera")
            }.actionSheet(isPresented: $showActionSheet){
                ActionSheet(title: Text("Add a picture to your post"), message: nil, buttons: [
                    //Button1
                    
                    .default(Text("Camera"), action: {
                        self.showImagePicker = true
                        self.sourceType = .camera
                    }),
                    //Button2
                    .default(Text("Photo Library"), action: {
                        self.showImagePicker = true
                        self.sourceType = .photoLibrary
                    }),
                    
                    //Button3
                    .cancel()
                    
                ])
            }.sheet(isPresented: $showImagePicker){
                imagePicker(image: self.$image, showImagePicker: self.$showImagePicker, sourceType: self.sourceType)
            }
        }
    }
}

struct picker_Previews: PreviewProvider {
    static var previews: some View {
        picker()
    }
}
