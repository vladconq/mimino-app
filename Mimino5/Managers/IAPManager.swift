//
//  IAPManager.swift
//  Mimino6
//
//  Created by Vladislav on 06.11.2021.
//

import Foundation
import StoreKit

class IAPManager: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    // MARK: - Properties
    
    static let shared = IAPManager()
    
    var products = [SKProduct]()
    
    // MARK: - Lifecycle
    
    private override init(){}
    
    // MARK: - Helpers
    
    func fetchProducts() {
        let request = SKProductsRequest(productIdentifiers: Set(Product.allCases.map({ $0.rawValue })))
        request.delegate = self
        request.start()
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        self.products = response.products
    }
    
    func purchase(product: Product) {
        guard SKPaymentQueue.canMakePayments() else { return }
        guard let storeKitProduct = products.first(where: { $0.productIdentifier == product.rawValue }) else { print("aha2"); return }
        
        let paymentRequest = SKPayment(product: storeKitProduct)
        SKPaymentQueue.default().add(paymentRequest)
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        transactions.forEach({
            switch $0.transactionState {
            case .purchasing:
                break
            case .purchased:
                break
            case .failed:
                break
            case .restored:
                break
            case .deferred:
                break
            @unknown default:
                break
            }
        })
    }
    
}
