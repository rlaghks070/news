//
//  ViewController.swift
//  news
//
//  Created by Whan Kim on 2021/02/17.
//

import UIKit

//ViewController는 UIViewController,UITableViewDataSource, UITableViewDelegate를 상속받음.
class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    //tableViewMain란 화면자체.
    @IBOutlet weak var tableViewMain: UITableView!
    
    
    //UITableViewDelegate를 상속받았으므로 구현을 해야함.
    //numberOfRowsInSection:data몇개
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    //UITableViewDataSource를 상속받았으므로 구현을 해야함.
    //cellForRowAt:data무엇? 몇번?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //셀을 만드는 2가지 방법이 있다.
        //1. 임의의 셀을 직접 만들기.
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "tableCellType1")
        cell.textLabel?.text = "\(indexPath.row)"
        //2. storyboard + id부여
        
        
        return cell
    }
    
    //main.. 근데 어디서 호출되는거고 뭘 override한거지..?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("start news.app")
        
        //
        //delegate란?
        //self는 클래스 안에 있는 func들을 의미함.
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
    }

    //tableview의  : 여러개의 행이 모여있는 목록 뷰(화면)
    // 사용의 목적 1. 정갈하게 보여질 때 사용함.
    // 사용하기 위해 : 1. 테이터는 무엇인가, 2. 데이터는 몇개?, 3. 데이터의 이번트 동작
    
    

}//class

