//
//  AuthorViewController.swift
//  Recipest
//
//  Created by Данил Прокопенко on 28.08.2022.
//

import UIKit

class AuthorViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var authorFullNameLabel: UILabel!
    @IBOutlet var jobTitleLabel: UILabel!
    @IBOutlet var authorPictureImageView: UIImageView!
    @IBOutlet var textsStackView: UIStackView!
    @IBOutlet var textsAndPictureStackView: UIStackView!

    //MARK: - Public Properties
    var author: Author!
    
    //MARK: - VC Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        labelsSetup()
        imageSetup()
        navBarSetup()
    }

    //MARK: - Private Methods
    private func labelsSetup() {
        authorFullNameLabel.text = author.fullName
        authorFullNameLabel.font = .init(name: K.mainSystemFont, size: 20)
        authorFullNameLabel.textColor = UIColor(named: ColorSets.mainSysColor.rawValue)
        
        jobTitleLabel.text = author.jobTitle
        jobTitleLabel.font = .init(name: K.mainSystemFont, size: 14)
        jobTitleLabel.textColor = UIColor(named: ColorSets.mainSysColor.rawValue)
        
        textsStackView.alignment = .center
        textsAndPictureStackView.alignment = .center
    }
    
    private func imageSetup() {
        authorPictureImageView.image = UIImage(named: author.photo)
        authorPictureImageView.layer.cornerRadius = authorPictureImageView.frame.height / 2
        backgroundImageView.image = UIImage(named: K.backgroundPicture)
    }
    
    private func navBarSetup() {
        
        self.navigationController?.navigationBar.tintColor = UIColor(named: ColorSets.mainSysColor.rawValue)
    }
    
}
