//
//  File.swift
//  news
//
//  Created by Whan Kim on 2021/02/23.
//

import UIKit

// Type1 클래스의 역확은 storyboard에서 만든 셀을 연결할 수 있다.
//storyboard와 cell을 연결 할 수 있다.
class Type1 : UITableViewCell{
    // label을 연결
    
    @IBOutlet weak var LabelText: UILabel!
}
