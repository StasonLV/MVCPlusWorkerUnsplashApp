//
//  DetailsView.swift
//  MVCPlusWorkerUnsplashApp
//
//  Created by Stanislav Lezovsky on 02.07.2022.
//

import UIKit

class DetailsView: UIView {
    
    // MARK: - константы
    private enum Constants {
        enum FontConstants {
            static let authorFont: UIFont = .systemFont(ofSize: 26, weight: .bold)
            static let locationFont: UIFont = .systemFont(ofSize: 14, weight: .light)
            static let dateAndLoadsFont: UIFont = .systemFont(ofSize: 16, weight: .bold)
        }
        enum ViewConstants {
            static let viewBackColor = CGColor(
                red: 0.898,
                green: 0.898,
                blue: 0.898,
                alpha: 1
            )
        }
    }

    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let authorLabel: UILabel = {
        let author = UILabel()
        author.text = "TestText"
        author.textColor = .black
        author.font = Constants.FontConstants.authorFont
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()

    let dateLabel: UILabel = {
        let date = UILabel()
        date.text = "Date: 01.33.3333"
        date.textColor = .black
        date.font = Constants.FontConstants.dateAndLoadsFont
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()

    let numberOfDownloads: UILabel = {
        let downloads = UILabel()
        downloads.text = "Downloads: 1516454"
        downloads.textColor = .black
        downloads.font = Constants.FontConstants.dateAndLoadsFont
        downloads.translatesAutoresizingMaskIntoConstraints = false
        return downloads
    }()

    let location: UILabel = {
        let location = UILabel()
        location.text = "Location: Nevada"
        location.textColor = .black
        location.font = Constants.FontConstants.locationFont
        location.translatesAutoresizingMaskIntoConstraints = false
        return location
    }()

    let topStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.distribution = .fill
        stack.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let bottomStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .top
        stack.distribution = .fillProportionally
        stack.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews() {
        addSubview(photoImageView)
        addSubview(topStackView)
        addSubview(bottomStackView)
        topStackView.addArrangedSubview(authorLabel)
        topStackView.addArrangedSubview(location)
        bottomStackView.addArrangedSubview(numberOfDownloads)
        bottomStackView.addArrangedSubview(dateLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            topStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            topStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            photoImageView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 8),
            photoImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            photoImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -16),
            photoImageView.heightAnchor.constraint(equalToConstant: 350),
            
            bottomStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 8),
            bottomStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            bottomStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
    }
}
