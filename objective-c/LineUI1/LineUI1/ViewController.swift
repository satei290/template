//
//  ViewController.swift
//  LineUI1
//
//  Created by ishikura keisuke on 2016/09/15.
//  Copyright © 2016年 ishikura keisuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIScrollViewDelegate {
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var textFieldBackView: UIView!
    @IBOutlet weak var sendBtn: UIButton!
    let scView = UIScrollView()
    var txtActiveField = UITextField()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scView.frame = self.view.frame
        scView.backgroundColor = UIColor.redColor()
        scView.delegate = self
        scView.contentSize = CGSize(width: 250, height: 100)
        self.view.addSubview(scView)
        
        self.view.bringSubviewToFront(sendBtn)
        
        self.view.bringSubviewToFront(textFieldBackView)
        
        textField1.delegate = self
        self.view.bringSubviewToFront(textField1)
        
        self.view.bringSubviewToFront(label1)
        
        //textField1.inputView
        //stackView
        //UIScrollView UIStackView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: #selector(ViewController.handleKeyboardWillShowNotification(_:)), name: UIKeyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(ViewController.handleKeyboardWillHideNotification(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func handleKeyboardWillShowNotification(notification: NSNotification) {
        
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let myBoundSize: CGSize = UIScreen.mainScreen().bounds.size
        let txtLimit = txtActiveField.frame.origin.y + txtActiveField.frame.height + 8.0
        let kbdLimit = myBoundSize.height - keyboardScreenEndFrame.size.height
        
        print(txtLimit);
        print(kbdLimit);
        
        if txtLimit >= kbdLimit {
            scView.contentOffset.y = txtLimit - kbdLimit
        }
    }
    
    func handleKeyboardWillHideNotification(notification: NSNotification) {
        scView.contentOffset.y = 0
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        txtActiveField = textField
        return true
    }
}

