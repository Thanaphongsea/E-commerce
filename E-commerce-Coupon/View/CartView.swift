//
//  CartView.swift
//  E-commerce-Coupon
//
//  Created by ธนพงษ์ แจ้งสว่าง on 2/2/2567 BE.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: CartViewModel
    @State private var isAddProductPresented = false
    @State private var fixAmountSelected = false
    @State private var percentDiscountSelected = false
    @State private var discountByCateSelected = false
    @State private var byPointsSelected = false
    @State private var specialCampaignsSelected = false
    @State private var byPointsInput = ""
    
    var body: some View {
        VStack {
            NavigationView {
                ScrollView {
                    if cart.count > 0 {
                        ForEach(cart.products) { item in
                            ProductRow(cartItem: item)
                                .environmentObject(cart)
                        }
                        
                        configureToggles()
                        
                        HStack {
                            Text("Total Payment")
                            Spacer()
                            let doubleStr = String(format: "%.2f", cart.calculateTotalPrice())
                            Text("\(doubleStr) Bath")
                                .bold()
                                .font(.headline)
                                .padding()
                        }
                        .padding()
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Payment")
                        })
                        
                    } else {
                        emptyCartView()
                    }
                    Spacer()
                }
            }
            .padding()
            .navigationTitle("Cart")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func configureToggles() -> some View {
        VStack {

            Toggle("Fix Amount", isOn: $fixAmountSelected)
                .onChange(of: fixAmountSelected) { newValue in
                    if newValue {
                        cart.selectFixAmount()
                    } else {
                        cart.restoreFixAmount()
                    }
                }

            Toggle("Percent Discount", isOn: $percentDiscountSelected)
                .onChange(of: percentDiscountSelected) { newValue in
                    if newValue {
                        cart.selectPercentDiscount()
                    } else {
                        cart.restorePercentDiscount()
                    }
                }
            
            Toggle("Discount By Category", isOn: $discountByCateSelected)
                .onChange(of: discountByCateSelected) { newValue in
                    if newValue {
                        cart.selectDiscountBycate()
                    } else {
                        cart.restoreByCate()
                    }
                }

            GroupBox {
                
                TextField("Enter Points", text: $byPointsInput)
                Text("* The amount will be capped at 20% of total price")
                    .font(.footnote)
                    .foregroundColor(Color.red)
                
                Toggle("By Points", isOn: $byPointsSelected)
                    .onChange(of: byPointsSelected) { newValue in
                        if newValue, let userPoint = Int(byPointsInput) {
                            cart.selectByPoint(userPoint: userPoint)
                        } else {
                            cart.restoreByPoint()
                        }
                    }
            }
            
            Toggle("Special Campaigns", isOn: $specialCampaignsSelected)
                .onChange(of: specialCampaignsSelected) { newValue in
                    if newValue {
                        cart.selectSpecial()
                    } else {
                        cart.restoreSpecial()
                    }
                }
        }
        .padding()
        
    }
    
    private func emptyCartView() -> some View {
        VStack {
            Spacer()
            ZStack(alignment: .center) {
                Image(systemName: "cart")
                    .font(.largeTitle)
                    .padding()
                    .overlay(Circle().stroke(lineWidth: 2))
            }
            
            Text("Cart is empty!")
            Spacer()
        }
        .foregroundColor(.gray)
    }
}

#Preview {
    ShopView()
}
