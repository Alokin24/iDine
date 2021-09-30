//
//  CheckoutView.swift
//  iDine
//
//  Created by Nikola Anastasovski on 30.9.21.
//

import SwiftUI

struct CheckoutView: View {
    // MARK: - State properties
    @State private var paymentType = "Credit Card"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    
    // MARK: - Environment objects
    @EnvironmentObject var order: Order
    
    // MARK: - Properties
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let tipAmounts = [10, 15, 20, 25, 0]
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let total = Double(order.total)
        let tipValue = total * Double(tipAmount) / 100
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
   
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType.animation()) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("TOTAL: \(totalPrice)").font(.largeTitle)) {
                Button("Confirm order") {
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"),
                  message: Text("Your total was \(totalPrice) - thank you"),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView()
                .environmentObject(Order())
        }
    }
}
