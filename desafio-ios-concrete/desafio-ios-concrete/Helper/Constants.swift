//
//  Constants.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 30/05/21.
//

import Foundation
import UIKit


// MARK: - API
enum Api_url: String {
	case baseUrl 	= "https://api.themoviedb.org/3/"
	case movie 		= "movie/"
	case genre 		= "genre/"
	case popular 	= "popular?"
	case list      = "list?"
	case apiKey 	= "api_key=f0ca6496aecedd1cfc6487c0d9849760"
	case language 	= "language=en-US"
	case page 		= "page=1"
	case imageW500 = "https://image.tmdb.org/t/p/w500&1"
}


// MARK: - Segue
enum Segue: String {
	case detail 	= "movieDetail"
}


// MARK: - Name Image
enum NameImage: String {
	case favorite	 = "favorite_full_icon"
	case unfavorite = "favorite_gray_icon"
}


// MARK: - Error
enum ErrorDescription: String {
	case notFound =
			"""
	Sua busca por "&1", não resultou em nenhum resultado.
	"""
}

class LoadImage {
	
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
	
	static func setImageCache(urlString: String) -> UIImage? {
		let cache = NSCache<NSString, UIImage>()
		cache.name = "Remote Image Cache"
		cache.totalCostLimit = 50_000_000
		
		let cacheID = NSString(string: urlString)
		guard let url = URL(string: urlString) else { return nil }
		
		if let cachedImage = cache.object(forKey: cacheID) {
			print("Using a cached image for item: \(cacheID)")
			return cachedImage
			
		} else {
			
			do {
				let imageData = try Data(contentsOf: url)
				
				if let imageCache = UIImage(data: imageData) {
					cache.setObject(imageCache, forKey: cacheID)
					return imageCache
				}
				
			} catch {
				return nil
			}
		}
		
		return nil
	}
	
	
}
