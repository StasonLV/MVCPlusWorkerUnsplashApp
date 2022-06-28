//
//  MainTabViewController.swift
//  MVCPlusWorkerUnsplashApp
//
//  Created by Stanislav Lezovsky on 26.06.2022.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let photoVC = NetworkCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let favoritesVC = FavpritesTableViewController(style: .insetGrouped)

        viewControllers = [
            createNavigationController(
                rootViewController: photoVC,
                title: "Онлайн",
                image: UIImage(systemName: "network")
            ),
            createNavigationController(
                rootViewController: favoritesVC,
                title: "Избранное",
                image: UIImage(systemName: "bolt.heart.fill")
            )
        ]
    }

    private func createNavigationController(rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
