//
//  ImageViewHelper.swift
//  17.LoadAndCashImageUrl
//
//  Created by Duy Nguyen on 24/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit

class ImageViewHelper {
    
    static let shared = ImageViewHelper()
    
    private init() {}
    
    func loadImage(url: URL, completed: @escaping (UIImage) -> Void) {
        print("concac 1")
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            print("concac 2")
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    print("Load image failed: " + (error?.localizedDescription ?? ""))
                    return
            }
            DispatchQueue.main.async {
                completed(image)
            }
        })
        task.resume()
    }
}
