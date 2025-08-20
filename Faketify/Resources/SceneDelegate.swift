//
//  SceneDelegate.swift
//  Faketify
//
//  Created by NguyenDuc on 07.08.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

      func scene(_ scene: UIScene,
                 willConnectTo session: UISceneSession,
                 options connectionOptions: UIScene.ConnectionOptions) {
          guard let windowScene = (scene as? UIWindowScene) else { return }
          let window = UIWindow(windowScene: windowScene)

          if AuthManager.shared.isSignedIn {
              window.rootViewController = TabBarViewController()
          } else {
              let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let nav = storyboard.instantiateInitialViewController()
              window.rootViewController = nav
          }

          window.makeKeyAndVisible()
          self.window = window
      }
    
    func scene(_ scene: UIScene,
                   openURLContexts URLContexts: Set<UIOpenURLContext>) {
            guard let url = URLContexts.first?.url else {
                return
            }
            let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            if url.absoluteString.starts(with: AuthManager.Constants.redirectURI) {
                if let code = components?.queryItems?.first(where: { $0.name == "code" })?.value {
                    AuthManager.shared.exchangeCodeForToken(code: code) { success in
                        DispatchQueue.main.async {
                            if success {
                                let tabVC = TabBarViewController()
                                self.window?.rootViewController = tabVC
                                self.window?.makeKeyAndVisible()
                            }
                        }
                    }
                } else if let error = components?.queryItems?.first(where: { $0.name == "error" })?.value {
                    }
            }
        }


    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

extension URL {
    var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems else {
            return nil
        }
        var params = [String: String]()
        for item in queryItems {
            params[item.name] = item.value
        }
        return params
    }
}



