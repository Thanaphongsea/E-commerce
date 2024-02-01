//
//  ProductCart.swift
//  E-commerce-Coupon
//
//  Created by ธนพงษ์ แจ้งสว่าง on 2/2/2567 BE.
//

import SwiftUI

struct ProductCard: View {
    
    @EnvironmentObject var cartManager: CartViewModel
    var product: Product
    
    private var formattedPrice: String {
        String(format: "%.0f", product.price)
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .bold()
                    Text("\(formattedPrice) Bath")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                
            }
            .clipped()
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            
            Button {
                cartManager.addProduct(product: product)
            } label: {
                Image(systemName: "plus")
                    .font(.title3.bold())
                    .padding(10)
                    .background(.thickMaterial)
                    .cornerRadius(50)
                    .clipped()
                    .shadow(radius: 3)
                    .padding(10)
            }
        }
    }
}


#Preview {
    ProductCard(product: Product.productList[2])
        .environmentObject(CartViewModel())
}
