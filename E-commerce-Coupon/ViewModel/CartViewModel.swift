//
//  CartViewModel.swift
//  E-commerce-Coupon
//
//  Created by ธนพงษ์ แจ้งสว่าง on 2/2/2567 BE.
//

import SwiftUI

class CartViewModel: ObservableObject {
    
    @Published private(set) var products: [Product] = []
    @Published private(set) var count = 0
    @Published var fixAmount: Bool = false
    @Published var percentDiscount: Bool = false
    @Published var discountByCate: Bool = false
    @Published var byPoints: Bool = false
    @Published var specialCampaigns: Bool = false
    @Published var userPoints: Int = 0
    
    private var originalFixAmount: Bool = false
    private var originalPercentDiscount: Bool = false
    private var originalDiscountByCate: Bool = false
    private var originalByPoints: Bool = false
    private var originalSpecialCampaigns: Bool = false
    
    func addProduct(product: Product) {
        products.append(product)
        count += 1
    }
    
    func removeFromCart(product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products.remove(at: index)
            count -= 1
        }
    }
    
    func selectFixAmount() {
        originalFixAmount = fixAmount
        fixAmount = true
    }
    
    func selectPercentDiscount() {
        originalPercentDiscount = percentDiscount
        percentDiscount = true
    }
    
    func selectDiscountBycate() {
        originalDiscountByCate = discountByCate
        discountByCate = true
    }
    
    func selectByPoint(userPoint: Int) {
        originalByPoints = byPoints
        userPoints = userPoint
        byPoints = true
    }
    
    func selectSpecial() {
        originalSpecialCampaigns = specialCampaigns
        specialCampaigns = true
    }
    
    
    func restoreFixAmount() {
        fixAmount = originalFixAmount
    }
    func restorePercentDiscount() {
        percentDiscount = originalPercentDiscount
    }
    func restoreByCate() {
        discountByCate = originalDiscountByCate
    }
    func restoreByPoint() {
        byPoints = originalByPoints
    }
    func restoreSpecial() {
        specialCampaigns = originalSpecialCampaigns
    }
    
    func calculateTotalPrice() -> Double {
        var totalPrice = products.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
        
        if discountByCate {
            let categoryCounts = Dictionary(grouping: products, by: { $0.category })
            for (_, productsInCategory) in categoryCounts {
                if productsInCategory.count >= 2 {
                    let discount = 0.1
                    let discountedPrice = productsInCategory.reduce(0) { $0 + ($1.price * Double($1.quantity) * (1.0 - discount)) }
                    let pieceByCate = productsInCategory.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
                    totalPrice -= pieceByCate
                    totalPrice += discountedPrice
                }
            }
        }
        
        
        if fixAmount {
            let fastShippingCost = 5.0
            totalPrice -= fastShippingCost
        }
        
        if percentDiscount {
            totalPrice *= (1.0 - 0.10)
        }
        
        if byPoints {
            let maxPointsDiscount = 0.2 * totalPrice
            let pointsDiscount = min(Double(userPoints), maxPointsDiscount)
            totalPrice -= pointsDiscount
        }
        
        if specialCampaigns {
            let bulkDiscountAmount = 10.0
            let discountForEvery100 = 100.0
            let bulkDiscount = floor(totalPrice / discountForEvery100) * bulkDiscountAmount
            totalPrice -= bulkDiscount
        }
        
        return totalPrice
    }
}
