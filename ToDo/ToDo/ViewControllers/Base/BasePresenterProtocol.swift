//
//  BasePresenterProtocol.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import UIKit

protocol BasePresenterProtocol: class {
    associatedtype InteractorProtocol
    associatedtype ViewProtocol
    associatedtype RouterProtocol

    var interactor: InteractorProtocol? { get set }
    var view: ViewProtocol? { get set }
    var router: RouterProtocol? { get set }
    
    init(interactor: InteractorProtocol, view: ViewProtocol, router: RouterProtocol)
}
