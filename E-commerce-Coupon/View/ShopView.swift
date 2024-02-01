//
//  ShopView.swift
//  E-commerce-Coupon
//
//  Created by ธนพงษ์ แจ้งสว่าง on 2/2/2567 BE.
//

import SwiftUI

struct ShopView: View {
    @StateObject var cartManager = CartViewModel()
    
    let columns = [GridItem(.adaptive(minimum: 160), spacing: Constants.gridSpacing)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: Constants.gridSpacing) {
                    ForEach(Product.productList) { product in
                        ProductCard(product: product)
                            .environmentObject(cartManager)
                    }
                }
                .padding()
            }
            .navigationTitle("Shop")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    cartButtonView
                }
            }
        }
        .navigationViewStyle(.stack)
    }
    
    private var cartButtonView: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .padding(.top, Constants.cartIconTopPadding)
            if cartManager.count > 0 {
                Text("\(cartManager.count)")
                    .font(.caption2.bold())
                    .foregroundColor(.white)
                    .frame(width: Constants.badgeWidth, height: Constants.badgeHeight)
                    .background(Color.pink)
                    .cornerRadius(Constants.badgeCornerRadius)
            }
        }
    }
    
    private struct Constants {
        static let gridSpacing: CGFloat = 20.0
        static let cartIconTopPadding: CGFloat = 5.0
        static let badgeWidth: CGFloat = 15.0
        static let badgeHeight: CGFloat = 15.0
        static let badgeCornerRadius: CGFloat = 20.0
    }
}

#Preview {
    ShopView()
}
