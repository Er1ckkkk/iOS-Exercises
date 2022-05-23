//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Erick Lopez on 5/22/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView();
        imageView.contentMode = .scaleAspectFill;
        imageView.backgroundColor = .white;
        
        return imageView;
    }()
    
    private let randomButton: UIButton = {
        let randomButton = UIButton();
        randomButton.backgroundColor = .white;
        randomButton.setTitle("Random Photo", for: .normal)
        randomButton.setTitleColor(.black, for: .normal)
        return randomButton;
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink;
        view.addSubview(imageView);
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center;
        
        view.addSubview(randomButton);
        getRandomPhoto();
        randomButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemCyan,
        .systemMint,
        .systemGray,
        .systemYellow,
        .systemRed,
        .systemGreen
    ]
    
   @objc func didTapButton(){
        getRandomPhoto()
       view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        randomButton.frame = CGRect(
            x: 30,
            y: view.frame.size.height - 150 - view.safeAreaInsets.bottom,
            width: view.frame.size.width - 60,
            height: 55)
        
    }
    
    func getRandomPhoto(){
        let urlString =
        "https://source.unsplash.com/random/600x600";
        let url = URL(string: urlString)!
        guard let data3 = try? Data(contentsOf: url) else{
            return;
        }
        imageView.image = UIImage(data: data3)
    }


}

