//
//  LoginPage.swift
//  lock-pickr
//
//  Created by Connor Norton on 3/31/23.
//

import SwiftUI

struct LoginPage: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @Binding var isLoginPage: Bool
    @State var showSignUpSheet = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Login")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            Spacer().frame(height: 20)
            styledFormInput(label: "Email", formValue: $email, isPassword: false)
            styledFormInput(label: "Password", formValue: $password, isPassword: true)
            Spacer().frame(height: 20)
            Button {
                // register user
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.white)
                    Text("Lock in")
                        .foregroundColor(.orange)
                        .font(.title)
                        .fontWeight(.bold)
                }.frame(height: 60)
            }
            Spacer().frame(height: 80)
            Button ("Don't have an Account? Sign up"){
                withAnimation {
                    showSignUpSheet.toggle()
                }
            }.offset(y: 50)
                .sheet(isPresented: $showSignUpSheet) {
                    
                    ZStack {
                        Color.white
                        Color.black.opacity(0.9).ignoresSafeArea()
                        SignUpPage()
                    }

                }
        }.padding()
    }
}

//struct LoginPage_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginPage()
//    }
//}
