//
//  StartScreenViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {
    @IBAction func begin() {
        let vc = GameViewController()
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black;
        var start : UILabel = UILabel()
        start = UILabel(frame: CGRect(x: 0, y: 80, width: UIScreen.main.bounds.size.width, height: 40))
        start.textAlignment = .center;
        start.text = "HANGMAN"
        start.textColor = UIColor.white;
        start.font = UIFont.boldSystemFont(ofSize: 32)
        self.view.addSubview(start)
        
        var button : UIButton = UIButton()
        button = UIButton(frame: CGRect(x: UIScreen.main.bounds.size.width/4, y: 500, width: UIScreen.main.bounds.size.width/2, height:30))
        button.backgroundColor = UIColor.white
        button.setTitle("New Game", for: .normal)
        button.setTitleColor(UIColor.black, for: UIControlState.normal)
        button.addTarget(self, action: #selector(StartScreenViewController.begin), for: .touchUpInside)
        self.view.addSubview(button)
        
        let imageName = "hangman7.gif"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.frame = CGRect(x: UIScreen.main.bounds.size.width/4, y: 200, width: 100, height: 200)
        imageView.backgroundColor = UIColor.white
        view.addSubview(imageView)
        //find completed number
/*
        var number : UILabel = UILabel()
        number = UILabel(frame: CGRect(x: 0, y: 120, width: UIScreen.main.bounds.size.width, height: 40))
        number.textAlignment = .center;
        number.text = String(count)
        number.font = UIFont.boldSystemFont(ofSize: 32)
        self.view.addSubview(number)
  */
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
