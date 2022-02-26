// CountryCodeView.swift by Gokhan Mutlu on 24.02.2022

import SwiftUI

struct CountryCodeView: View {
	@ObservedObject var loginVM:LoginViewModel
	
	var body: some View {
		HStack(alignment:.center, spacing:25) {
			VStack {
				Text("Ülke Kodu")
					.font(.custom("Helvetica", size: 12))
					.foregroundColor(Color("inactive"))
					//.padding(.top, 5)
					.offset(y: 8)
					
				
				Picker("CountryCode", selection: $loginVM.countryCode) {
					ForEach(loginVM.countryCodes, id:\.code){ (_, code) in
						Text("+ \(code)")
							.tag(code)
							.foregroundColor(.black)
							.font(.custom("Helvetica-Bold", size: 16))
							.zIndex(1)
					}
					.padding(.bottom, 5)
				}
				.pickerStyle(.menu)
			}
			Image(systemName: "chevron.up.chevron.down")
		}
		.frame(minWidth:128, minHeight: 56)
		.background(Color.white)
		.cornerRadius(10)
		.clipShape(RoundedRectangle(cornerRadius: 10))
	}
}

struct CountryCodeView_Previews: PreviewProvider {
    static var previews: some View {
		CountryCodeView(loginVM:LoginViewModel())
			.previewLayout(.sizeThatFits)

		
    }
}
