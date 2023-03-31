//
//  SignUpPage.swift
//  lock-pickr
//
//  Created by Connor Norton on 3/30/23.
//

import SwiftUI

struct SignUpPage: View {
//    var pages: [Page]
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
//        PageViewController(pages: pages)        
        VStack {
            Spacer()
            HStack{
                Text("Signup")
                    .foregroundColor(Color.white)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            Spacer().frame(height: 50)
            Group {
                styledFormInput(label: "Full Name", formValue: $fullName, isPassword: false)
                styledFormInput(label: "Email", formValue: $email, isPassword: false)
                styledFormInput(label: "Password", formValue: $password, isPassword: true)
            }
            Spacer().frame(height: 20)
            Button {
                // register user
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.orange)
                    Text("Register")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                }.frame(height: 60)
            }
            Spacer()
            Button ("I have an Account Already"){
                withAnimation {
                    dismiss()
                }
            }.offset(y: 50)
            Spacer()
        }.padding()
    }
}

struct styledFormInput: View {
 
    @State var label: String
    @Binding var formValue: String
    @State var isPassword: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.white)
                
                if isPassword == false {
                    TextField(label, text: $formValue){
                        // do something?
                    }
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .padding()
                } else {
                    SecureField(label, text: $formValue){
                        // do something?
                    }
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .padding()
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }.frame(height: 60)
    }
}

//struct SignUpPage_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpPage()
//    }
//}
