//
//  FavoritesTableViewCell.swift
//  MVCPlusWorkerUnsplashApp
//
//  Created by Stanislav Lezovsky on 28.06.2022.
//

import UIKit
import SDWebImage

class FavoritesTableViewCell: UITableViewCell {
    static let reuseId = "FavoritesTableCell"
    // MARK: - константы
    private enum Constants {
        enum FontConstants {
            static let noteNameFont: UIFont = .systemFont(ofSize: 16, weight: .bold)
            static let noteTextFont: UIFont = .systemFont(ofSize: 10, weight: .light)
            static let noteDateFont: UIFont = .systemFont(ofSize: 10, weight: .regular)
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

    // MARK: - создание эл-тов ячеек
    let authorName: UITextField = {
        let label = UITextField()
        label.font = Constants.FontConstants.noteNameFont
        label.placeholder = "Без названия"
        label.textColor = .black
        label.contentMode = .scaleAspectFit
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var photo: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 15
        return img
    }()
    
    var unsplashPhoto: UnsplashPhoto! {
        didSet {
            let photoUrl = unsplashPhoto.urls["regular"]
            guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
            photo.sd_setImage(with: url, completed: nil)
        }
    }

    // MARK: - инициализаторы
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - настройка ячейки
    func setupCell() {
        backgroundColor = .clear
        contentView.backgroundColor = .white
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 15
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = Constants.ViewConstants.viewBackColor
        contentView.addSubview(authorName)
        contentView.addSubview(photo)

        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 100),
            authorName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 84),
            photo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            photo.trailingAnchor.constraint(equalTo: authorName.leadingAnchor, constant: -4)
        ])
    }
}
