//
//  Order.swift
//  CupcakeCorner
//
//  Created by Kevin Pfefferle on 12/16/23.
//

import SwiftUI

@Observable
class Order: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = "" {
        didSet {
            UserDefaults.standard.set(name, forKey: "name")
        }
    }
    var streetAddress = "" {
        didSet {
            UserDefaults.standard.set(streetAddress, forKey: "streetAddress")
        }
    }
    var city = "" {
        didSet {
            UserDefaults.standard.set(city, forKey: "city")
        }
    }
    var zip = "" {
        didSet {
            UserDefaults.standard.set(zip, forKey: "zip")
        }
    }
    
    init() {
        if let nameString = UserDefaults.standard.value(forKey: "name") as? String {
            name = nameString
        }
        if let streetAddressString = UserDefaults.standard.value(forKey: "streetAddress") as? String {
            streetAddress = streetAddressString
        }
        if let cityString = UserDefaults.standard.value(forKey: "city") as? String {
            city = cityString
        }
        if let zipString = UserDefaults.standard.value(forKey: "zip") as? String {
            zip = zipString
        }
    }
    
    var hasValidAddress: Bool {
        let isNameEmpty = name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let isStreetAddressEmpty = streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let isCityEmpty = city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let isZipEmpty = zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        if isNameEmpty || isStreetAddressEmpty || isCityEmpty || isZipEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // complicated cakes cost more
        cost += Double(type) / 2
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
}
