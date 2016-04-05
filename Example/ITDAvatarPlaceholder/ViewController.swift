//
//  ViewController.swift
//  ITDAvatarPlaceholder
//
//  Created by Igor Kurylenko on 04/04/2016.
//  Copyright (c) 2016 Igor Kurylenko. All rights reserved.
//

import UIKit
import ITDAvatarPlaceholder

class ViewController: UIViewController {
    static let AvatarPlaceholderImageSize = CGSize(width: 256, height: 256)
    
    @IBOutlet weak var richardHendricks: UIImageView!
    @IBOutlet weak var erlichBachman: UIImageView!
    @IBOutlet weak var jaredDuhn: UIImageView!
    @IBOutlet weak var dineshChugtai: UIImageView!
    @IBOutlet weak var bertramGilfoyle: UIImageView!
    @IBOutlet weak var carlaWalton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        richardHendricks.image = UIImage.createAvatarPlaceholder(
            userFullName: "Richard Hendricks", placeholderSize: ViewController.AvatarPlaceholderImageSize)
        
        erlichBachman.image = UIImage.createAvatarPlaceholder(
            userFullName: "Erlich Bachman", placeholderSize: ViewController.AvatarPlaceholderImageSize)
        
        jaredDuhn.image = UIImage.createAvatarPlaceholder(
            userFullName: "Jared (Donald) Duhn", placeholderSize: ViewController.AvatarPlaceholderImageSize)
        
        dineshChugtai.image = UIImage.createAvatarPlaceholder(
            userFullName: "Dinesh Chugtai", placeholderSize: ViewController.AvatarPlaceholderImageSize)
        
        bertramGilfoyle.image = UIImage.createAvatarPlaceholder(
            userFullName: "Bertram Gilfoyle", placeholderSize: ViewController.AvatarPlaceholderImageSize)
        
        carlaWalton.image = UIImage.createAvatarPlaceholder(
            userFullName: "Carla Walton", placeholderSize: ViewController.AvatarPlaceholderImageSize)
    }
}