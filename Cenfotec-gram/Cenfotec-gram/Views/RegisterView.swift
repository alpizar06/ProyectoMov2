//
//  RegisterView.swift
//  Cenfotec-gram
//
//  Created by Daniel Alpizar on 13/10/21.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var userName = ""
    @State private var userEmail = ""
    @State private var userNick = ""
    @State private var userAge = ""
    @State private var userPassword = ""
    @State private var userImage = ""
    
    @Environment(\.managedObjectContext) private var conexionBase
    
    @Environment(\.presentationMode) private var atrasView
   
    
    var body: some View {
        VStack{
            HStack{
                Image("logocenfo")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                    .cornerRadius(100)
            }
            
            VStack{
                HStack{
                    TextField("Nombre", text: self.$userName)
                        .autocapitalization(.none)
                }
                .padding()
                .padding(.horizontal)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(20)
                HStack{
                    TextField("Correo", text: self.$userEmail)
                        .autocapitalization(.none)
                }
                .padding()
                .padding(.horizontal)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(20)
                HStack{
                    TextField("Nick", text: self.$userNick)
                        .autocapitalization(.none)
                }
                .padding()
                .padding(.horizontal)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(20)
                HStack{
                    TextField("Edad", text: self.$userAge)
                        .autocapitalization(.none)
                        .keyboardType(.phonePad)
                }
                .padding()
                .padding(.horizontal)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(20)
                HStack{
                    TextField("Contraseña", text: $userPassword)
                        .autocapitalization(.none)
                }
                .padding()
                .padding(.horizontal)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(20)
                HStack{
                    TextField("Imagen", text: $userImage)
                        .autocapitalization(.none)
                }
                .padding()
                .background(Color.gray.opacity(0.5))
                .cornerRadius(20)
                
                HStack(alignment: .center){
                    Button(action:
                           addUser
                    ){
                        HStack{
                            Image(systemName: "person.badge.plus").foregroundColor(Color.white)
                            Text("Registrar").foregroundColor(Color.white)
                        }
                        
                    }
                    .frame(width: 300, height: 50, alignment: .center)
                    
                    .background(Color.blue)
                }
                .cornerRadius(100)
                .padding(.horizontal)
                HStack{
                    HStack{
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 150, height: 150, alignment: .center)
                            .cornerRadius(100)
                    }
                }
                
            }
            Spacer()
        }
        
    }
    
    func addUser(){
        let newUser = UserInformationBase(context: conexionBase )
        newUser.nombre = userName
        newUser.nickname = userNick
        newUser.correo = userEmail
        newUser.password = userPassword
        newUser.edad = userAge
        newUser.perfilImage = userImage
        
        PersistenceController.shared.saveContext()
        
        self.atrasView.wrappedValue.dismiss()
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
