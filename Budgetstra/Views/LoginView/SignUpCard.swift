//
//  SignUpCard.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-06.
//

import SwiftUI

struct SignUpCard: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    @State var passwordConfirm = ""

    
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("backgroundColor1"),Color.indigo]), startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.3)
                .ignoresSafeArea()
            
            VStack(alignment:.leading){
                Text("Create Account")
                TextField("First Name", text: $firstName, prompt: Text("  First Name")).frame(maxWidth:.infinity)
                    .frame(height: 50)
                    .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke())
                
                TextField("Last Name", text: $lastName, prompt: Text("  Last Name")).frame(maxWidth:.infinity)
                    .frame(height: 50)
                    .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke())
                
                TextField("Email", text: $email, prompt: Text("  Email")).frame(maxWidth:.infinity)
                    .frame(height: 50)
                    .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke())
                
                SecureField("Password", text: $password, prompt: Text("  Password")).frame(maxWidth:.infinity)
                    .frame(height: 50)
                    .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke())
                
                SecureField("Confirm Password", text: $passwordConfirm, prompt: Text("  Confirm Password")).frame(maxWidth:.infinity)
                    .frame(height: 50)
                    .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke())
                
                Button {
                    
                } label: {
                    
                    Text("Sign Up").frame(maxWidth: .infinity)
                        .frame(height: 50).background(Color.indigo).mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    
                }

                
            }.frame(maxWidth:.infinity)
                .padding(.horizontal)
            
        }.frame(maxWidth:.infinity)
            .frame(height:500)

    }
}

struct SignUpCard_Previews: PreviewProvider {
    static var previews: some View {
        SignUpCard()
    }
}
