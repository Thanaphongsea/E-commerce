//
//  Product.swift
//  E-commerce-Coupon
//
//  Created by ธนพงษ์ แจ้งสว่าง on 2/2/2567 BE.
//

import SwiftUI

struct Product : Identifiable {
    var id = UUID()
    var name: String
    var category: String
    var price: Double
    var image: String
    var quantity: Int
}
extension Product {
    static var productList = [
        Product(name: "airpodsPro", category: "Electronics", price: 50.0, image: "airpodpro", quantity: 1),
        Product(name: "airpodsmax", category: "Electronics", price: 30.0, image: "airpodsmax", quantity: 1),
        Product(name: "iMac", category: "Electronics", price: 70.0, image: "imac", quantity: 1),
        Product(name: "Nike JD", category: "shoes", price: 70.0, image: "shoes1", quantity: 1),
        Product(name: "Vans", category: "shoes", price: 50.0, image: "shoes2", quantity: 1),
        Product(name: "Nike Air", category: "shoes", price: 30.0, image: "shoes3", quantity: 1),
        Product(name: "Nike Sport", category: "shoes", price: 70.0, image: "shoes4", quantity: 1),
        Product(name: "Ring", category: "ring", price: 70.0, image: "ring02", quantity: 1),
        Product(name: "Ring", category: "ring", price: 50.0, image: "ring03", quantity: 1),
        Product(name: "Hat", category: "hat", price: 30.0, image: "hat1", quantity: 1),
        Product(name: "Hat blue", category: "hat", price: 70.0, image: "hat2", quantity: 1),
        Product(name: "Hat black", category: "hat", price: 70.0, image: "hat3", quantity: 1),
    ]
}
