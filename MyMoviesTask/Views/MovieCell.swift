//
//  MovieCell.swift
//  MyMoviesTask
//
//  Created by Caludia Carrillo on 4/12/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCell: UITableViewCell {
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.accessoryType = .disclosureIndicator
    contentView.setSubviewForAutoLayout(stackView)
    setLayoutAnchors()
  }
  
  private let movieImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: Icon.reel.rawValue)
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    
    NSLayoutConstraint.activate([
      imageView.widthAnchor.constraint(equalToConstant: 58.0),
      imageView.heightAnchor.constraint(equalToConstant: 86.0)
    ])
    
    return imageView
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Font.medium.rawValue, size: 20.0)
    label.textColor = Color.lead
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    return label
  }()
  
  private let yearLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Font.regular.rawValue, size: 13.0)
    label.textColor = Color.secondary
    label.numberOfLines = 1
    return label
  }()
  
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [movieImageView, labelsStackView])
    stackView.axis = .horizontal
    stackView.distribution = .fill
    stackView.alignment = .center
    stackView.spacing = 10.0
    return stackView
  }()
  
  private lazy var labelsStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [titleLabel, yearLabel])
    stackView.axis = .vertical
    stackView.distribution = .equalCentering
    stackView.alignment = .leading
    stackView.spacing = 5.0
    return stackView
  }()
  
  private func setLayoutAnchors() {
    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
      stackView.topAnchor.constraint(equalTo: self.topAnchor),
      stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
  
  func configure(withMovie movie: Movie) {
    titleLabel.text = movie.title
    yearLabel.text = movie.releaseDate.toString(withFormat: "YYYY")
    if let url = URL(string: APIManager.ImageSizePath.getImageURLString(.thumbnail) + movie.posterPath) {
      movieImageView.af_setImage(withURL: url)
    }
  }
  
  override func prepareForReuse() {
    movieImageView.image = nil
  }
}
