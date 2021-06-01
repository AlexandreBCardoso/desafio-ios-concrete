//
//  Utils.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 31/05/21.
//

import UIKit

class Utils {
	
	static func setImageLoad(urlString: String) -> UIImage? {
		guard let url = URL(string: urlString) else { return nil }
		
		if let teste = UserDefaults.standard.object(forKey: urlString) as? Data {
			return UIImage(data: teste)
		}
		
		do {
			let imageToCache = try Data(contentsOf: url)
			UserDefaults.standard.setValue(imageToCache, forKey: urlString)
			return UIImage(data: imageToCache)
		} catch {
			return nil
		}
		
	}
	
}
