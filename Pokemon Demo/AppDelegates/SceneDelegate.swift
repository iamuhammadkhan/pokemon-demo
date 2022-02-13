//
//  SceneDelegate.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/10/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        window?.overrideUserInterfaceStyle = .light
        changeTheRoot(session: session, connectionOptions: connectionOptions)
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }

    private func changeTheRoot(session: UISceneSession, connectionOptions: UIScene.ConnectionOptions) {
        let rootVC = PokemonHomeViewController()
        let rootNC = UINavigationController(rootViewController: rootVC)
        let windowScene = UIWindowScene(session: session, connectionOptions: connectionOptions)
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = rootNC
        window?.makeKeyAndVisible()
    }
}
