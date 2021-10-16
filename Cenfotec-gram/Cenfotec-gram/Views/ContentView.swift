
import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var conexionDatosBase
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \UserInformationBase.correo, ascending: true)], animation: .default)
    private var UserInfo: FetchedResults<UserInformationBase>
    
    @State var userName = ""
    @State var password = ""
    @State var User = UserInformationBase(context: PersistenceController.preview.container.viewContext)
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(UserInfo){ Uinfo in
                        Text(Uinfo.correo ?? "default")
                        Text(Uinfo.password ?? "default")
                    }
                }
                Image("logocenfo")
                    .resizable()
                    .cornerRadius(100)
                    .frame(width: 220, height: 220, alignment: .center)
                
                
                HStack{
                    VStack(alignment: .leading, spacing: 12){
                        HStack{
                            TextField("EMAIL", text: $userName)
                                .autocapitalization(.none)
                        }
                        .padding()
                        .cornerRadius(30)
                        .padding(.horizontal)
                        .background(Color.gray.opacity(0.5))
                        HStack{
                            SecureField("PASSWORD", text: $password)
                                .autocapitalization(.none)
                        }
                        .padding()
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .background(Color.gray.opacity(0.5))
                    }
                    Spacer(minLength: 0)
                }
                .padding()
                HStack(alignment: .center){
                    Button(action:{
                        
                    }){
                        if(validateUser()){
                            NavigationLink(destination: FeedView(User: User, usuario: userName).navigationBarBackButtonHidden(true)){
                                HStack{
                                    Text("Log in")
                                        .foregroundColor(Color.white)
                                }
                                .frame(width: 300, height: 50, alignment: .center)
                                .cornerRadius(100)
                                .background(Color.blue)
                            }
                        }else{
                            HStack{
                                Text("Log in")
                                    .foregroundColor(Color.white)
                            }
                            .frame(width: 300, height: 50, alignment: .center)
                            .cornerRadius(100)
                            .background(Color.blue)
                        }
                        
                    }
                }
                .padding()
                .padding(.horizontal)
                Button(action:{
                    
                }){
                    NavigationLink(destination: RegisterView()){
                        HStack{
                            Text("Sign in")
                                .foregroundColor(Color.blue)
                        }
                        .frame(width: 300, height: 50, alignment: .center)
                        .cornerRadius(100)
                    }
                }
            }
        }
    }
    
    func validateUser() -> Bool{
        var valido = false
        for number in 0..<UserInfo.count{
            if(UserInfo[number].correo == userName && UserInfo[number].password == password){
                valido = true
                break
            }
        }
        
        return valido
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
