// CountryCode.swift by Gokhan Mutlu on 24.02.2022

import Foundation

enum CountryCode: Int, CaseIterable, Identifiable {
	case
		netherlands = 31,
		germany = 49,
		turkey = 90

//		a = 1,
//		b = 2,
//		c = 3,
//		d = 4,
//		e = 5,
//		f = 6,
//		g = 7


	var id: Int { self.rawValue }
}
