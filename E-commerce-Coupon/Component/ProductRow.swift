//
//  ProductRow.swift
//  E-commerce-Coupon
//
//  Created by ธนพงษ์ แจ้งสว่าง on 2/2/2567 BE.
//

import SwiftUI

struct ProductRow: View {
    
    @EnvironmentObject var cartManager: CartViewModel
    var cartItem: Product
    
    var body: some View {
        HStack(spacing: 20) {
            Image(cartItem.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(cartItem.name)
                    .bold()
                Text(cartItem.category)
                let doubleStr = String(format: "%.0f", cartItem.price)
                Text("\(doubleStr) Bath")
            }
            
            Spacer()
            
            Image(systemName: "trash")
                .onTapGesture {
                    cartManager.removeFromCart(product: cartItem)
                }
                .accessibility(label: Text("Remove from Cart"))
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


#Preview {
    ProductRow(cartItem: Product.productList[2])
        .environmentObject(CartViewModel())
}
