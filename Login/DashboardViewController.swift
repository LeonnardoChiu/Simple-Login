//
//  DashboardViewController.swift
//  Login
//
//  Created by Leonnardo Benjamin Hutama on 19/06/20.
//  Copyright © 2020 Leonnardo Benjamin Hutama. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    
    @IBOutlet var lblGreeting: UILabel!
    
    @IBOutlet var lblDate: UILabel!
    
    @IBOutlet var lblTime: UILabel!
    
    @IBOutlet var lblEmail: UILabel!
    
    var email = String()
        
    var timeChanger: Timer?
    
    var name = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        name = email.components(separatedBy: "@")
        
        timeChanger = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
        
        lblEmail.text = "Your email is \(email)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let formatter = DateFormatter()
        updateTime()
        formatter.dateFormat = "EEEE, dd MMMM yyyy"
        let currDate = formatter.string(from: Date())
        lblDate.text = currDate
        
        let currentHour = Calendar.current.component(.hour, from: Date())
        
        if currentHour >= 6 && currentHour < 12 {
            lblGreeting.text = "Good Morning, \(name[0])"
        }
        else if currentHour >= 12 && currentHour < 17 {
            lblGreeting.text = "Good Afternoon, \(name[0])"
        }
        else if currentHour >= 17 && currentHour < 20 {
            lblGreeting.text = "Good Evening, \(name[0])"
        }
        else{
            lblGreeting.text = "Good Night, \(name[0])"
        }
    }
    
    @objc func updateTime() {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm:ss"
        let currTime = formatter.string(from: Date())
        lblTime.text = currTime
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
