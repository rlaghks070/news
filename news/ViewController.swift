//
//  ViewController.swift
//  news
//
//  Created by Whan Kim on 2021/02/17.
//

import UIKit

//ViewController는 UIViewController,UITableViewDataSource, UITableViewDelegate를 상속받음.
class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    //newsApi   96fe1e29cd1f4a53a595bfbeafa549ab
    
    //tableViewMain란 화면자체.
    @IBOutlet weak var tableViewMain: UITableView!
    
    // http 통신 방법. - urlsession함수를 통해서 가져옴.
    // Json 데이터 {"돈":"10000"}
    
    // news를 가져오는 function
    func getNews(){
        let task = URLSession.shared.dataTask(with: URL(string: "http://newsapi.org/v2/top-headlines?country=kr&apiKey=96fe1e29cd1f4a53a595bfbeafa549ab")!) { (data, urlResponse, error) in
            
            if let dataJson = data{
                print(dataJson);
            }
            
        }
        task.resume()
        
    }
    
    
    //main.. 근데 어디서 호출되는거고 뭘 override한거지..?
    override func viewDidLoad() {
        super.viewDidLoad()
        //let photoAuthorizationStatus = PHPhotoLibrary.au
        print("start news.app")
        
        //delegate란?
        //self는 클래스 안에 있는 func들을 의미함.
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        
        getNews()
    }
    
    //tableview의  : 여러개의 행이 모여있는 목록 뷰(화면)
    // 사용의 목적 1. 정갈하게 보여질 때 사용함.
    // 사용하기 위해 : 1. 테이터는 무엇인가, 2. 데이터는 몇개?, 3. 데이터의 이번트 동작
    
    //UITableViewDelegate를 상속받았으므로 구현을 해야함.
    //numberOfRowsInSection:data몇개
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("numberOfRowsInSection")
        return 100
    }
    
    //UITableViewDataSource를 상속받았으므로 구현을 해야함.
    //cellForRowAt:data무엇? 몇번?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print("cellForRowAt")
        //셀을 만드는 2가지 방법이 있다.
        //1. 임의의 셀을 직접 만들기.
        //let cell = UITableViewCell.init(style: .default, reuseIdentifier: "tableCellType1")
        //type1을 지정하는 class가 필요하다.
        //cell.textLabel?.text = "\(indexPath.row)"
        
        //2. storyboard + id부여  -> 실전에서 더 많이 사용한다.
        // dequeueReusableCell(다시 정의한다) 다시 재사용할 수 있는 셀을 정의해서 tableViewMain에 꽂아넣는다.
        let cell = tableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        //as? as! 부모, 자식간의 친자확인
        
        cell.LabelText.text="\(indexPath.row)";
        
        return cell
    }
    // 클릭 event
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click event");
        print("click : \(indexPath.row)")
        
        
    }
    
    //카메라 권한 -> 지금 불가능... 아마 버젼에 문제가 있는것 같은데..
    //info.plist에서 권한은 추가함.
    //    func requestCameraPermission(){
    //        AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
    //            if granted {
    //                print("Camera: 권한 허용")
    //            } else {
    //                print("Camera: 권한 거부")
    //            }
    //        })
    //    }
    
    
}//class

