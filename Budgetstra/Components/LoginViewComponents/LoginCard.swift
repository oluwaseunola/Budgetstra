//
//  LoginCard.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-06.
//

import SwiftUI

struct LoginCard: View {
    @State var currentState : LogState = .login
    var body: some View {
        VStack{
            Text("Welcome to Budgetstra").font(.custom(FontManager.extraBold, size: 20))
            
            HStack{
                
                Button {
                    currentState = .login
                } label: {
                    Text("Login")
                }

                Spacer()
                
                Button {
                    currentState = .signup
                } label: {
                    Text("Sign Up")
                }
                
                
            }.frame(maxWidth:.infinity)
                .frame(height: 50)
                .padding(.horizontal,100)
                
            
            if currentState == .login{
                LoginView()

            }else{
                SignUpCard()
                
            }
            
            
            
        }
    }
}

struct LoginCard_Previews: PreviewProvider {
    static var previews: some View {
        LoginCard()
    }
}
