//
//  AuthView.swift
//  lock-pickr
//
//  Created by Connor Norton on 3/31/23.
//

import SwiftUI

//struct AuthView<Page: View>: View {
struct AuthView: View {
//    var pages: [Page]
    
    
    @State private var scale = 0.90
    @State private var isLoginPage = true
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack {
                Spacer(minLength: 50)
                Image(systemName: "lock.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 100, maxHeight: 120)
                    .foregroundColor(.white)
                    .scaleEffect(scale)
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 0.5)
                        let repeated = baseAnimation.repeatCount(3, autoreverses: true)

                        withAnimation(repeated) {
                            scale = 1
                        }
                    }
                Spacer(minLength: 10)
                if isLoginPage == true {
                    LoginPage(isLoginPage: $isLoginPage)
                } else {
                    SignUpPage()
                }
                Spacer(minLength: 50)
            }
        }
    }
}

//struct AuthView_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthView()
//    }
//}
