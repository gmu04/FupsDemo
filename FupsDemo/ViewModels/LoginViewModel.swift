// LoginViewModel.swift by Gokhan Mutlu on 24.02.2022

import Foundation
import Combine

class LoginViewModel:ObservableObject{
	
	private let service = FupsService.shared
	private let limit:Int = 10
	let phoneRegex = "^[0-9]{10}$"
	@Published var gsmNumber = "" {
		didSet {
			if gsmNumber.count > self.limit {
				//gsmNumber = String(gsmNumber.prefix(self.limit))
				//gsmNumber.removeLast()
				self.gsmNUmberHasReachedLimit = true
			} else {
				self.gsmNUmberHasReachedLimit = false
			}
		}
	}
	@Published var countryCode:String = "90"
	@Published var password:String = ""
	@Published var isUserLoggedIn:Bool = false
	@Published var gsmNUmberHasReachedLimit = false

	
	func login(){
		guard isUserInputValid() else { return }
		
		service.login(countryCode: Int(countryCode)!, phoneNumber: gsmNumber, userPassword: password) { [weak self] result in
			guard let self = self else{ return }
			
			switch(result){
				case .failure:
					//give user a proper feedback
					()
				case .success:
					self.isUserLoggedIn = true
			}
		}
	}
	
	
}

extension LoginViewModel{
	fileprivate func isUserInputValid() -> Bool{
		let result = gsmNumber.range(of: phoneRegex, options: .regularExpression)
		if result == nil  { return false }
		if password.count < 4{ return false }
		return true
	}
	
	var countryCodes:[(country:String,code:Int)]{
		var tmp = [(String,Int)]()
		for country in CountryCode.allCases{
			if country == .turkey { continue }
			tmp.append(("\(country.rawValue)", country.rawValue))
		}
		//Turkey is at the top
		tmp.insert(("90", 90), at: 0)
		
		return tmp
	}
}
