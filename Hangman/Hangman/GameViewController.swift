//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {
    var letter : UITextField = UITextField()
    var labelString : String = String()
    var word : UILabel = UILabel()
    var submit : UIButton = UIButton()
    var button : UIButton = UIButton()
    var hangman : String = String()
    var image : UIImage = UIImage()
    var imageView : UIImageView = UIImageView()
    var count = 0
    var phrase : String = String()
    @IBAction func back() {
        let vc = StartScreenViewController()
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func edit(sender : UIButton) {
        //do stuff
        let ch = sender.currentTitle!
        if phrase.characters.contains(Character(ch)) {
            for (index, element) in phrase.characters.enumerated() {
                if (element == Character(ch)) {
                    //let i = 2 * index
                    replace(index: 2*index, newChar: element)
                }
            }
        } else {
            count += 1;
            if count <= 7 {
                updatePicture()
            }
            if count == 7 {
                loseScreen()
            }
        }
        if !labelString.characters.contains("_") {
            winScreen();
        }
        word.text = labelString
        sender.isEnabled = false
    }
    func loseScreen() {
        print("lose screen")
        let alertController = UIAlertController(title: "iOScreator", message:
            "You Lose! The dude is ded", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Start Over", style: UIAlertActionStyle.default,handler:  {
            alert -> Void in
            self.home()
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    func home() {
        let vc = StartScreenViewController()
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func winScreen() {
        print("Win screen")
        let alertController = UIAlertController(title: "iOScreator", message:
            "Congrats! The dud is alive!", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Start Over", style: UIAlertActionStyle.default,handler:  {
            alert -> Void in
            self.home()
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    func replace(index: Int, newChar: Character){
        var chars = Array(labelString.characters)     // gets an array of characters
        //print(index)
        chars[index] = newChar
        let modifiedString = String(chars)
        labelString = modifiedString
    }
    func updatePicture() {
        let path = "hangman" + String(count) + ".gif"
        image = UIImage(named: path)!
        hangman = path
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: UIScreen.main.bounds.size.width/3, y: 20, width: 100, height: 200)
        view.addSubview(imageView)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        
        let newLength = text.utf16.count + string.utf16.count - range.length
        return newLength <= 2 // Bool
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor.init(red: 0, green: 1, blue: 0.1, alpha: 0)
        //self.view.backgroundColor = UIColor.init(red: 1, green: 165/255, blue: 0, alpha: 1)
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        let hangmanPhrases = HangmanPhrases()
        phrase = hangmanPhrases.getRandomPhrase()
        print(phrase)
        labelString = ""
        convertPhrase(input: phrase);
        print(labelString)
    
        word = UILabel(frame: CGRect(x: 0, y: 250, width: UIScreen.main.bounds.size.width, height: 40))
        word.textAlignment = .center;
        word.text = labelString
        word.font = UIFont.boldSystemFont(ofSize: 16)
        self.view.addSubview(word)
        
        /*
        letter = UITextField(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height/2, width: UIScreen.main.bounds.size.width, height: 40))
        letter.placeholder = "a"
        letter.font = UIFont.systemFont(ofSize: 15)
        letter.borderStyle = UITextBorderStyle.roundedRect
        letter.autocorrectionType = UITextAutocorrectionType.no
        letter.keyboardType = UIKeyboardType.default
        letter.returnKeyType = UIReturnKeyType.done
        letter.clearButtonMode = UITextFieldViewMode.whileEditing;
        //letter.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        letter.delegate = self
        self.view.addSubview(letter)
        */
        
        /*
        submit = UIButton(frame: CGRect(x: UIScreen.main.bounds.size.width/4, y: 200, width: UIScreen.main.bounds.size.width/2, height:30))
        submit.backgroundColor = UIColor.lightGray
        submit.setTitle("Guess", for: .normal)
        submit.setTitleColor(UIColor.black, for: UIControlState.normal)
        //submit.addTarget(self, action: #selector(GameViewController.edit), for: .touchUpInside)
        self.view.addSubview(submit)
         */
        // create Done button
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(GameViewController.back))
        // Do any additional setup after loading the view.
        
        /* set up buttons!!! */
        makeButtons();
        hangman = "hangman1.gif"
        image = UIImage(named: hangman)!
        imageView = UIImageView(image: image)
        count = 1
        
        imageView.frame = CGRect(x: UIScreen.main.bounds.size.width/3, y: 20, width: 100, height: 200)
        view.addSubview(imageView)
    }
    func convertPhrase(input: String) {
        
        for ch in input.characters {
            if (ch != " ") {
                labelString = labelString + "_"
            } else {
                labelString = labelString + " "
            }
            labelString = labelString + " "
        }
    }
    func makeButtons() {
        let str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let arr =  Array(str.characters)
        //print(arr)
        var dx = 30
        var dy = 30
        for letter in arr {
            button = CustomButton(frame: CGRect(x: dx, y: 300 + dy, width: 30, height:30))
            button.backgroundColor = UIColor.yellow
            button.setTitle(String(letter), for: .normal)
            button.setTitleColor(UIColor.black, for: UIControlState.normal)
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.addTarget(self, action: #selector(GameViewController.edit), for: .touchUpInside)
            self.view.addSubview(button)
            if CGFloat(dx+30) > UIScreen.main.bounds.size.width - 30{
                dx = 0;
                dy += 30;
            }
            dx += 30;
        }
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
