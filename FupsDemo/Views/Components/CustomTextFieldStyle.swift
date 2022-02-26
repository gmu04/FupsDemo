// CustomTextFieldStyle.swift by Gokhan Mutlu on 26.02.2022

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle{
	func _body(configuration: TextField<Self._Label>) -> some View {
		configuration
			.padding(.leading, 10)
			.font(.custom("Helvetica", size: 16))
			.frame(maxWidth: .infinity, minHeight: 56)
			.cornerRadius(10)
	}
}
