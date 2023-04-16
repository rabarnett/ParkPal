//
//  ViewRouter.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import Foundation

class ViewRouter: ObservableObject {
    
    @Published private(set) var view = AppView.start
    
    func changeView(to view: AppView) {
        self.view = view
    }
    
    func goBack() {
        
        switch view {
        case .login, .signUp:
            view = .start
        default:
            view = .home
        }
        
    }
    
    enum AppView {
        case start
        case signUp
        case login
        case home
    }
    
}
