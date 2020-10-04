//
//  BaseRouterProtocol.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import UIKit

protocol BaseRouterProtocol {
    associatedtype View
    
    var view: View? { get set }
    
    init(view: View)
}
