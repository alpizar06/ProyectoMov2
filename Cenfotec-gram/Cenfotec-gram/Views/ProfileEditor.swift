

import SwiftUI

struct ProfileEditor: View {
    
    @StateObject var User: UserInformationBase
    
    @State private var userName = ""
    @State private var userEmail = ""
    @State private var userNick = ""
    @State private var userAge = ""
    @State private var userPassword = ""
    @State private var userImage = ""
    
    @State var usuario: String
    
    @State var UserInformation = UserInformationBase(context: PersistenceController.preview.container.viewContext)
    
    @Environment(\.managedObjectContext) private var conexionBase
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \UserInformationBase.correo, ascending: true)], animation: .default)
    private var UserInfo: FetchedResults<UserInformationBase>
    
    @Environment(\.presentationMode) private var atrasView
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "person")
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
                    Button(action:updateUserInfo
                    ){
                        HStack{
                            Image(systemName: "arrowshape.turn.up.left").foregroundColor(Color.white)
                            Text("Actualizar").foregroundColor(Color.white)
                        }
                        
                    }
                    .frame(width: 300, height: 50, alignment: .center)
                    
                    .background(Color.blue)
                }
                .cornerRadius(100)
                .padding(.horizontal)
            }
            Spacer()
        }.onAppear(perform: loadProfile)
        
    }
    func loadProfile(){
        for number in 0..<UserInfo.count{
            if(usuario == UserInfo[number].correo){
                userName = UserInfo[number].nombre!
                userEmail = UserInfo[number].correo!
                userNick = UserInfo[number].nickname!
                userAge = UserInfo[number].edad!
                userPassword = UserInfo[number].password!
                userImage = UserInfo[number].perfilImage!
                UserInformation = UserInfo[number]
                break
            }
        }
    }
    
    func updateUserInfo(){
        withAnimation{
            UserInformation.nombre = userName
            UserInformation.correo = userEmail
            UserInformation.nickname = userNick
            UserInformation.edad = userAge
            UserInformation.password = userPassword
            UserInformation.perfilImage = userImage
            
            PersistenceController.shared.saveContext()
            
            self.atrasView.wrappedValue.dismiss()
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        
        let viewContext = PersistenceController.preview.container.viewContext
        //ProfileEditor(UserInformation: <#UserInformationBase#>, usuario: "alpizar0610@gmail.com")
        let newUser = UserInformationBase(context: viewContext)
        return ProfileEditor(User: newUser, usuario: "")
            .environment(\.managedObjectContext,PersistenceController.preview.container.viewContext)
    }
}
