//
//  MovieDetailView.swift
//  MyMoviesTask
//
//  Created by Caludia Carrillo on 4/12/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import UIKit

class MovieDetailView: UIView {
  public override init(frame: CGRect) {
    super.init(frame: frame)
    self.setSubviewForAutoLayout(mainScrollView)
    mainScrollView.setSubviewForAutoLayout(contentStackView)
    setLayoutAnchors()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  let movieImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: Icon.reel.rawValue)
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    
    NSLayoutConstraint.activate([
      imageView.heightAnchor.constraint(equalToConstant: 220.0)
    ])
    
    return imageView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Font.medium.rawValue, size: 22.0)
    label.textColor = Color.lead
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.text = ""
    return label
  }()
  
  let tagLineLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Font.regular.rawValue, size: 20.0)
    label.textColor = Color.secondary
    label.textAlignment = .center
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.text = ""
    return label
  }()
  
  let sinopsisLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: Font.regular.rawValue, size: 17.0)
    label.textColor = Color.lead
    label.textAlignment = .justified
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
    label.text = ""
    return label
  }()
  
  let mainScrollView: UIScrollView = {
    let scrollView = UIScrollView(frame: UIScreen.main.bounds)
    scrollView.backgroundColor = Color.main
    return scrollView
  }()

  private lazy var contentStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [movieImageView, titleLabel, tagLineLabel, sinopsisLabel])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .center
    stackView.spacing = 20.0
    stackView.backgroundColor = .black
    return stackView
  }()

  private func setLayoutAnchors() {
    NSLayoutConstraint.activate([
      mainScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      mainScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      mainScrollView.topAnchor.constraint(equalTo: self.topAnchor),
      mainScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      mainScrollView.widthAnchor.constraint(equalTo: self.widthAnchor)
    ])

    NSLayoutConstraint.activate([
      contentStackView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
      contentStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
      contentStackView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
      contentStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
      contentStackView.widthAnchor.constraint(equalToConstant: mainScrollView.frame.width)
    ])
    
    NSLayoutConstraint.activate([
      movieImageView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor),
      movieImageView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor)
    ])
    
    NSLayoutConstraint.activate([
      tagLineLabel.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor, constant: 20.0),
      tagLineLabel.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor, constant: -20.0)
    ])
    
    NSLayoutConstraint.activate([
      sinopsisLabel.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor, constant: 15.0),
      sinopsisLabel.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor, constant: -15.0)
    ])
  }
}
