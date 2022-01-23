//
//  ViewController.swift
//  UrlSessionRewind
//
//  Created by Maxim Mitin on 23.01.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var getImageButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
    }

    @IBAction func getImagePressed(_ sender: Any) {
        label.isHidden = true
        getImageButton.isEnabled = false
        activityIndicator.isHidden = true
        activityIndicator.startAnimating()
        
        guard let url = URL(string: "https://sun9-6.userapi.com/sun9-31/impf/c303314/v303314275/4312/x5z1ehgczp4.jpg?size=600x584&quality=96&sign=fb5338f1d87b54a1ec10682015fbf82c&type=album") else {return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.imageView.image = image
                }
            }
        }.resume()
    }
    
}

