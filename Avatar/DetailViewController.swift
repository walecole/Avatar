//
//  DetailViewController.swift
//  Avatar
//
//  Created by WALE on 05/09/2017.
//  Copyright © 2017 AppSoul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var imaegView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    
    var data = Array<Dictionary<String,String>>()
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        authorLabel.text = data[number]["author"]
        avatarImageView.image = UIImage(named: data[number]["avatar"]!)
        imaegView.image = UIImage(named: data[number]["image"]!)
        
    }

    @IBAction func returnButton(_ sender: Any) {
        performSegue(withIdentifier: "detailToHome", sender: sender)
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "detailToHome" {
            let controller  = segue.destination as! HomeViewController
            controller.data = data
            controller.number = number
        }
    }
    

}
