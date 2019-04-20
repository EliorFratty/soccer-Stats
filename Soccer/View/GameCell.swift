//
//  UserCell.swift
//  Soccer
//
//  Created by User on 06/04/2019.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {
    
    var Game: Game? {
        didSet{
            if let game = Game {
            textLabel?.text = game.date + "          " + game.hour
            detailTextLabel?.text = game.place
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textLabel?.frame = CGRect(x: 20, y: textLabel!.frame.origin.y-2, width: textLabel!.frame.width, height: textLabel!.frame.height)
        detailTextLabel?.frame = CGRect(x: 20, y: detailTextLabel!.frame.origin.y+2, width: detailTextLabel!.frame.width, height: detailTextLabel!.frame.height)
    }
    
    let confirmButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("No", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var confirmButtonTapped: (() -> Void)? = nil
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        addSubview(confirmButton)
        confirmButtonAnchor()
        confirmButton.addTarget(self, action: #selector(confirmGame), for: .touchUpInside)
  
    }
    

    func confirmButtonAnchor() {
        
        confirmButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -18) .isActive = true
        confirmButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        confirmButton.widthAnchor.constraint(equalToConstant: 38).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 38).isActive = true
    }
    
    var isComing = false
    
    @objc func confirmGame(){

        if isComing {
            confirmButton.backgroundColor = .red
            confirmButton.setTitle("No", for: .normal)
        } else {
            confirmButton.backgroundColor = .green
            confirmButton.setTitle("Yes", for: .normal)
        }
        isComing = !isComing
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}