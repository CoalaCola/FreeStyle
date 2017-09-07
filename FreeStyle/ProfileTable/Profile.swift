//
//  Profile.swift
//  FreeStyle
//
//  Created by Vince Lee on 2017/8/17.
//  Copyright © 2017年 Vince Lee. All rights reserved.
//

import Foundation
import UIKit

struct Profile: Codable {
    
    var name: String?
    var type: String?
    var slang: String?
    var birthday: String?
    var imageName: String?
    
    var image: UIImage? {
        if let imageName = imageName {
            let url = Profile.documentsDirectory.appendingPathComponent(imageName)
            return UIImage(contentsOfFile: url.path)
        } else {
            return #imageLiteral(resourceName: "Tony")
        }
    }
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                                                      
    static func saveToFile(profile: Profile) {
        let propertyEncoder = PropertyListEncoder()
        if let data = try? propertyEncoder.encode(profile){
            let url = Profile.documentsDirectory.appendingPathComponent("profile")
            try? data.write(to: url)
        }
    }
    
    static func readFromFile() -> Profile? {
        let propertyDecoder = PropertyListDecoder()
        let url = Profile.documentsDirectory.appendingPathComponent("profile")
        if let data = try? Data(contentsOf: url), let profile = try? propertyDecoder.decode(Profile.self, from: data) {
            return profile
        }
        return Profile()
    }
    
}

struct PropertyKeys {
    static let BackToProfilePageSegue = "BackToProfilePageSegue"
    
}
