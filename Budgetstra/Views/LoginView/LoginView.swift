//
//  LoginViwe.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-06.
//

import SwiftUI

struct LoginView: View {
    @State var userName  = ""
    @State var password = ""
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("backgroundColor1"),Color.indigo]), startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.3)
                .ignoresSafeArea()
            
            VStack(alignment:.leading){
                Text("Please login to your account")
                TextField("Username", text: $userName, prompt: Text("  Enter your email")).frame(maxWidth:.infinity)
                    .frame(height: 50)
                    .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke())
                
                SecureField("Password", text: $password, prompt: Text("  Password")).frame(maxWidth:.infinity)
                    .frame(height: 50)
                    .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke())
                
                Button {
                    
                } label: {
                    
                    Text("Sign In").frame(maxWidth: .infinity)
                        .frame(height: 50).background(Color.indigo).mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    
                }
                
                HStack{
                    
                    Text("Forgot your password?")
                    Button {
                        
                    } label: {
                        Text("Reset password")
                    }

                }

                
            }.frame(maxWidth:.infinity)
                .padding(.horizontal)
            
        }.frame(maxWidth:.infinity)
            .frame(height:500)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
