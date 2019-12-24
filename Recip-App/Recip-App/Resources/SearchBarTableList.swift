//
//  SearchBarWithTable.swift
//  CustomSearchField
//
//  Created by mohamed on 12/23/19.
//  Copyright © 2019 Emrick Sinitambirivoutin. All rights reserved.
//

import UIKit
import CoreData

class SearchBarTableList : UISearchBar {
    //@IBOutlet weak var searchBar: UISearchBar!
    var dataList : [SearchData] = [SearchData]()
    var resultsList : [SearchItem] = [SearchItem]()
    var tableView: UITableView?
    //var text = ""
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
//    override func willMove(toWindow newWindow: UIWindow?) {
//        buildSearchTableView()
//    }
    override func layoutSubviews() {
        super.layoutSubviews()
        buildSearchTableView()
    }
    
    func textFieldDidChange(){
        print("Text changed ...")
        filter()
        updateSearchTableView()
        tableView?.isHidden = false
    }
    
    func saveItems() {
        print("Saving items")
        do {
            try context.save()
        } catch {
            print("Error while saving items: \(error)")
        }
    }
    
    func loadItems(withRequest request : NSFetchRequest<SearchData>) {
        print("loading items")
        do {
            dataList = try context.fetch(request)
        } catch {
            print("Error while fetching data: \(error)")
        }
    }
    
    // MARK: Filtering methods
    
    fileprivate func filter() {
        let predicate = NSPredicate(format: "search_title CONTAINS[cd] %@", self.text ?? "")
        let request : NSFetchRequest<SearchData> = SearchData.fetchRequest()
        request.predicate = predicate
        
        loadItems(withRequest : request)
        
        resultsList = []
        
        for i in 0 ..< dataList.count {
            
            let item = SearchItem(searchTitle: dataList[i].search_title!)
            
            let cityFilterRange = (item.searchTitle as NSString).range(of: text ?? "", options: .caseInsensitive)
            
            
            if cityFilterRange.location != NSNotFound {
                item.attributedSearchTitle = NSMutableAttributedString(string: item.searchTitle)
                
                item.attributedSearchTitle!.setAttributes([.font: UIFont.boldSystemFont(ofSize: 17)], range: cityFilterRange)
                
                resultsList.append(item)
            }
            
        }
        
        tableView?.reloadData()
    }
    
}


extension SearchBarTableList: UITableViewDelegate, UITableViewDataSource {

    // MARK: TableView creation and updating
    
    // Create SearchTableview
    func buildSearchTableView() {
        
        if let tableView = tableView {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CustomSearchTextFieldCell")
            tableView.delegate = self
            tableView.dataSource = self
            //self.window?.addSubview(tableView)
            
        } else {
            addData()
            print("tableView created")
            tableView = UITableView(frame: CGRect.zero)
        }
        
        updateSearchTableView()
    }
    
    // Updating SearchtableView
    func updateSearchTableView() {
        
        if let tableView = tableView {
            self.bringSubviewToFront(tableView)
            //view.bringSubviewToFront(tableView)
            var tableHeight: CGFloat = CGFloat(0) //0
            if dataList.count < 5 {
                tableHeight = tableView.contentSize.height
            }else {
                tableHeight = CGFloat(250)
            }
            
            //tableHeight = CGFloat(250) //tableView.contentSize.height
            
            // Set a bottom margin of 10p
            if tableHeight < tableView.contentSize.height {
                tableHeight -= 10
            }
            
            // Set tableView frame
            var frame  = self.frame.origin //searchBar.frame.origin
            var tableViewFrame = CGRect(x: 0, y:frame.y  , width: self.frame.width - 4, height: tableHeight)
            //tableViewFrame.origin = searchBar.convert(tableViewFrame.origin, to: nil)
            tableViewFrame.origin.x += 2
            tableViewFrame.origin.y += frame.x + self.frame.height
            UIView.animate(withDuration: 0.2, animations: { [weak self] in
                self?.tableView?.frame = tableViewFrame
            })
            
            //Setting tableView style
            tableView.layer.masksToBounds = true
            tableView.separatorInset = UIEdgeInsets.zero
            tableView.layer.cornerRadius = 5.0
            tableView.separatorColor = UIColor.lightGray
            tableView.backgroundColor = UIColor.white.withAlphaComponent(1) // 0.4
            tableView.separatorStyle = .none
            
            if self.isFirstResponder {
                self.bringSubviewToFront(self)
                //view.bringSubviewToFront(searchBar)
                
            }
            tableView.reloadData()
        }
    }
    
    
    
    // MARK: TableViewDataSource methods
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(resultsList.count)
        return resultsList.count
    }
    
    // MARK: TableViewDelegate methods
    
    //Adding rows in the tableview with the data from dataList
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomSearchTextFieldCell", for: indexPath) as UITableViewCell
        cell.backgroundColor = UIColor.clear
        print(resultsList[indexPath.row].getFormatedText())
        cell.textLabel?.attributedText = resultsList[indexPath.row].getFormatedText()
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row")
        self.text = resultsList[indexPath.row].getStringText()
        self.text = self.text
        tableView.isHidden = true
        self.endEditing(true)
    }
    
    
    // MARK: Early testing methods
    func addData(){
        let a = SearchData(context: context)
        a.search_title = self.text!
        dataList.append(a)
        
        saveItems()
        
        
        
    }
    
}
