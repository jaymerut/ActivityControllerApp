//
//  ViewController.swift
//  ActivityControllerApp
//
//  Created by Jayme Rutkoski on 8/21/23.
//

import UIKit

class ViewController: UIViewController {

    lazy var buttonSubmit: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("TEST ME", for: .normal)
        button.addTarget(self, action: #selector(buttonSubmit_TouchUpInside(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(self.buttonSubmit)
        buttonSubmit.widthAnchor.constraint(equalToConstant: 150).isActive = true
        buttonSubmit.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonSubmit.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonSubmit.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc private func buttonSubmit_TouchUpInside(_ sender: UIButton) {
        guard let image = UIImage(named: "globe")?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: [])
        self.present(activityVC, animated: true)
    }

}
