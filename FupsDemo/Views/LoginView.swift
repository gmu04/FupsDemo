// LoginView.swift by Gokhan Mutlu on 24.02.2022

import SwiftUI
import Combine

struct LoginView: View {
	
	@StateObject var loginVM = LoginViewModel()
	
    var body: some View {
		NavigationView {
			ZStack {
				Color("sceneBg")
					.ignoresSafeArea()
				
				VStack{
					Image("fups")
						.padding(.bottom)
						
					
					Text("GSM numaranı ve şifreni girerek")
					Text("FUPS hesabına giriş yapabilirsin.")
						.font(.custom("Helvetica", size: 16))
					
					HStack{
						CountryCodeView(loginVM: loginVM)
							.padding([.vertical, .leading], 20)
						

						let isEditingValue =
							loginVM.gsmNumber.count > 0 && $loginVM.gsmNUmberHasReachedLimit.wrappedValue
						
						TextField("GSM Numaran", text: $loginVM.gsmNumber)
							.keyboardType(.phonePad)
							.textFieldStyle(CustomTextFieldStyle())

							.foregroundColor(isEditingValue ? .white : .black)
							.background(isEditingValue ? Color("errorBg").opacity(0.7) : Color.white)
							.overlay(
							  RoundedRectangle(cornerRadius: 10)
								  .stroke(Color.red, lineWidth: isEditingValue ? 1 : 0))
							.padding()
							.onChange(of: loginVM.gsmNumber, perform: {
								//phone number is supposed to be 10 char long
								loginVM.gsmNumber = String($0.prefix(10))
								
								//check if phone number is valid
								let result = loginVM.gsmNumber.range(of: loginVM.phoneRegex, options: .regularExpression)
								if result == nil  {
									loginVM.gsmNUmberHasReachedLimit = true
								}
						   	})
						
					}
					
					SecureField("Şifren", text: $loginVM.password)
						.textFieldStyle(CustomTextFieldStyle())
						.background(Color.white)
						.padding(.horizontal, 20)
											
					
					HStack{
						NavigationLink {
							Text("Şifremi unuttum")
						} label: {
							Text("Şifremi unuttum")
								.foregroundColor(Color("buttonNormal"))
								.font(.custom("Helvetica", size: 14))

						}

						Spacer()
						
						NavigationLink {
							Text("Info")
						} label: {
							Image(systemName: "info.circle")
								.foregroundColor(Color("buttonNormal"))
						}

					}
					//.padding(.vertical, 20)
					.padding(.horizontal, 24)
					
					
					Button {
						loginVM.login()
					} label: {
						Text("GİRİŞ")
							.padding()
							.foregroundColor(Color.white)
							.font(.custom("Helvetica", size: 14))
							.frame(maxWidth: .infinity, minHeight: 56)
							.background(Color("buttonNormal"))
							.cornerRadius(10)
					}
					.padding([.horizontal, .top], 20)
					
					
					Spacer()

				}
				.safeAreaInset(edge: .bottom, spacing: 0) {
//					GeometryReader { geo in
						ScrollingBannersView()
							.padding(.leading)
							.padding(.bottom, 5)
				
//							.frame(width: .infinity,
//								   height: UIScreen.main.bounds.height * 0.25)
//							.background(.yellow)
//					}
				}

				NavigationLink(destination: ContentView(), isActive: $loginVM.isUserLoggedIn) { EmptyView() }
			}
			.navigationBarHidden(true)
		}
    }
	

	
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
		Group{
			LoginView()
				.previewDevice("iPhone 13 Pro")
			LoginView()
				.previewDevice("iPhone 8")
			LoginView()
				.previewDevice("iPod touch (7th generation)")
		}
    }
}



