//
//  SceneDelegate.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene

        let taskListViewController = TaskListBuilder.make()
        setRootViewController(taskListViewController)
    }
    
    func setRootViewController(_ rootVc: UIViewController?) {
        guard let rootVc = rootVc,
              window?.rootViewController?.classForCoder != rootVc.classForCoder else {
            return
        }

        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
        }

        window?.rootViewController = rootVc
        window?.makeKeyAndVisible()

        UIView.transition(with: window!,
                          duration: 0.35,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

