//
//  ViewController.swift
//  Recip-App
//
//  Created by mohamed on 12/25/19.
//  Copyright © 2019 Mohamed Abdul-Raouf. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper



class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: SearchBarTableList!
    @IBOutlet weak var searchTableView: UITableView!
    
    var tableViewBar = UITableView()
    var searchResult = EdamamModel()
    //fileprivate var loadMoreControl = LoadMoreControl()
    fileprivate var loadMoreControl: LoadMoreControl!
    
    var from = 0
    var to = 10
    var startScroll = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.tableFooterView = UIView(frame: .zero)
        
        let nib = UINib(nibName: "SearchTableViewCell", bundle: nil)
        searchTableView.register(nib, forCellReuseIdentifier: "cell")
        
        loadMoreControl = LoadMoreControl(scrollView: searchTableView, spacingFromLastCell: 10, indicatorHeight: 60)
        loadMoreControl.delegate = self
        searchBar.becomeFirstResponder()
        
        
        // search list table
        tableViewBar.frame = CGRect(x: 10, y: 10, width: 100, height: 500)
        tableViewBar.isHidden = true
        self.view.addSubview(tableViewBar)
        searchBar.tableView = tableViewBar
        searchBar.buildSearchTableView()
        
        
    }
    
    func search(text : String){
        do{
            var url:String = UIHelper.getApiUrlWithSearchValue(searchValue: text)
            if startScroll == true {
                url = UIHelper.getApiUrlWithSearchValue(searchValue: text) + "&from=\(from)&to=\(to)"
            }
            print(url)
            Alamofire.request(url)
                .responseObject {  (response: DataResponse<EdamamModel>) in
                    
                    guard response.result.error == nil else {
                        // got an error in getting the data, need to handle it
                        print("error calling POST on /todos/1")
                        print(response.result.error!)
                        return
                    }
                    if self.startScroll == true {
                        let newHitsLoad = response.result.value?.hits
                        guard  let hits = newHitsLoad else {
                            return
                        }
                        
                        for data in hits{
                            self.searchResult.hits?.append(data)
                        }
                        
                    }else{
                        self.searchResult = (response.result.value)!
                        
                    }
                    DispatchQueue.main.async {
                        self.searchTableView.reloadData()
                    }
                    
            }
            
        }catch{
            print(error)
        }
    }
    
}


extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DispatchQueue.main.async {
            self.searchBar.text = searchText
            self.searchBar.textFieldDidChange()
            if searchText == "" {
                self.tableViewBar.isHidden = true
            }
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.tableViewBar.isHidden = true
        view.endEditing(true)
        self.searchResult = EdamamModel()
        searchTableView.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text == "" {
            return
        }
        self.startScroll = false
        self.tableViewBar.isHidden = true
        self.view.endEditing(true)
        DispatchQueue.main.async {
            self.search(text: searchBar.text!)
            self.searchBar.addData()
            
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        DispatchQueue.main.async {
            self.tableViewBar.isHidden = true
            self.search(text: searchBar.text!)
        }
    }
    
}


extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.hits?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchTableViewCell
        //cell.textLabel?.text = searchResult.hits?[indexPath.row].recipe?.label
        cell.setup(data: (searchResult.hits?[indexPath.row])!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(88)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print(indexPath.row)
        print(self.to)
        if self.startScroll != true {
            return
        }
        if indexPath.row == self.to - 1 {
            loadMoreControl.didScroll()
            print(indexPath.row)
            print(self.to)
            self.from += 10
            self.to += 10
            self.search(text: self.searchBar.text!)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RecipeViewController") as! RecipeViewController
        vc.recipe = searchResult.hits![indexPath.row].recipe
        navigationController?.pushViewController(vc, animated: true)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        self.startScroll = true
        
    }
}


extension ViewController: LoadMoreControlDelegate {
    func loadMoreControl(didStartAnimating loadMoreControl: LoadMoreControl) {
        print("didStartAnimating")
        
    }
    
    func loadMoreControl(didStopAnimating loadMoreControl: LoadMoreControl) {
        print("didStopAnimating")
    }
}

