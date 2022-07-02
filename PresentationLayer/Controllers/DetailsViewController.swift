//
//  DetailsViewController.swift
//  MVCPlusWorkerUnsplashApp
//
//  Created by Stanislav Lezovsky on 02.07.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let detailsView = DetailsView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailsView)
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillLayoutSubviews() {
        detailsView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
    }
}
