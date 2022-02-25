// FupsService.swift by Gokhan Mutlu on 25.02.2022

import Foundation

enum FupsServiceError:Error{
	case anyError(String)
	case serviceRelatedError
	case userRelatedError	//invalid country code etc
}

final class FupsService{

	private init(){ }
	static let shared = FupsService()
	
	func login(countryCode:Int, phoneNumber:String, userPassword:String, completion:@escaping (Result<Bool,FupsServiceError>)->()){
		
		//service call - I can also use combine here (publish-subscribe)
		DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
			if countryCode == 90, phoneNumber == "1234567890", userPassword == "1234"{
				
				DispatchQueue.main.async {
					completion(Result.success(true))
				}
			}else{
				
				//log it
				
				//show user proper feedback which defined the spec
				DispatchQueue.main.async {
					completion(Result.failure(FupsServiceError.userRelatedError))
				}
			}
		}
	}
}
