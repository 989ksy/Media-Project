//
//  SceneDelegate.swift
//  Media Project
//
//  Created by Seungyeon Kim on 2023/08/12.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        //최초 앱 실행 여부
        
        let isLaunched = UserDefaults.standard.bool(forKey: "isLaunched")
        print(isLaunched)
        

        if !isLaunched {
            UserDefaults.standard.set(true, forKey: "isLaunched")
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "OnboardingViewController") as! OnboardingViewController
            window?.rootViewController = vc
        } else {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "TrendingViewController") as! TrendingViewController
            let nav = UINavigationController(rootViewController: vc)
            window?.rootViewController = nav
            
            //탭바
            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            let trendingViewController = storyboard.instantiateViewController(withIdentifier: "TrendingViewController") as! TrendingViewController
            let segmentViewController = storyboard.instantiateViewController(withIdentifier: "SegmentViewController") as! SegmentViewController
            let locationViewController = storyboard.instantiateViewController(withIdentifier: "LocationViewController") as! LocationViewController

            let firstViewController = UINavigationController(rootViewController: trendingViewController)
            let secondViewController = UINavigationController(rootViewController: segmentViewController)
            let thirdViewController = UINavigationController(rootViewController: locationViewController)

            let tabBarController = UITabBarController()
            tabBarController.setViewControllers([secondViewController, firstViewController, thirdViewController], animated: true)

            if let items = tabBarController.tabBar.items {

                items[0].selectedImage = UIImage(systemName: "star.fill")
                items[0].image = UIImage(systemName: "star")
                items[0].title = "Explore"
                items[0].tag = 1

                items[1].selectedImage = UIImage(systemName: "house.fill")
                items[1].image = UIImage(systemName: "house")
                items[1].title = "Home"
                items[1].tag = 0

                items[2].selectedImage = UIImage(systemName: "location.fill")
                items[2].image = UIImage(systemName: "location")
                items[2].title = "Location"
                items[2].tag = 2
            }
            tabBarController.selectedIndex = 1

            window?.rootViewController = tabBarController
            window?.makeKeyAndVisible()
            
        }
        
        window?.makeKeyAndVisible()
        
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



//탭바 설정
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(windowScene: windowScene)
//        let mainViewController = TrendingViewController()
//        let navigationController = UINavigationController(rootViewController: mainViewController)
//        window?.rootViewController = navigationController
//        window?.makeKeyAndVisible()

//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        let trendingViewController = storyboard.instantiateViewController(withIdentifier: "TrendingViewController") as! TrendingViewController
//        let segmentViewController = storyboard.instantiateViewController(withIdentifier: "SegmentViewController") as! SegmentViewController
//        let locationViewController = storyboard.instantiateViewController(withIdentifier: "LocationViewController") as! LocationViewController
//
//        let firstViewController = UINavigationController(rootViewController: trendingViewController)
//        let secondViewController = UINavigationController(rootViewController: segmentViewController)
//        let thirdViewController = UINavigationController(rootViewController: locationViewController)
//
//        let tabBarController = UITabBarController()
//        tabBarController.setViewControllers([secondViewController, firstViewController, thirdViewController], animated: true)
//
//        if let items = tabBarController.tabBar.items {
//
//            items[0].selectedImage = UIImage(systemName: "star.fill")
//            items[0].image = UIImage(systemName: "star")
//            items[0].title = "Explore"
//            items[0].tag = 1
//
//            items[1].selectedImage = UIImage(systemName: "house.fill")
//            items[1].image = UIImage(systemName: "house")
//            items[1].title = "Home"
//            items[1].tag = 0
//
//            items[2].selectedImage = UIImage(systemName: "location.fill")
//            items[2].image = UIImage(systemName: "location")
//            items[2].title = "Location"
//            items[2].tag = 2
//        }
//        tabBarController.selectedIndex = 1
//
//        window?.rootViewController = tabBarController
//        window?.makeKeyAndVisible()
