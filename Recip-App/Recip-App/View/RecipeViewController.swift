//
//  RecipeViewController.swift
//  SoftxpertTaskApp
//
//  Created by mohamed on 12/20/19.
//  Copyright © 2019 injaz. All rights reserved.
//

import UIKit
import SafariServices

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var openRecipeUrlButton: UIButton!
    @IBOutlet weak var likeRecipeButton: UIButton!
    @IBOutlet weak var shareRecipeButton: UIButton!
    @IBOutlet weak var recipePreparationButton: UIButton!
    @IBOutlet weak var recipeTableView: UITableView!
    var recipe : Recipe?
    fileprivate var url = ""
    
    var helper = UIHelper()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = recipe?.label!
        recipeTableView.tableFooterView = UIView(frame: .zero)
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        UIHelper.getImageFromUrl(urlImage: recipe?.image ?? "") { (image) in
            self.recipeImage.image = image
        }
        recipeNameLabel.text = recipe?.label
        DispatchQueue.main.async {
            self.recipeTableView.reloadData()
        }
        
        openRecipeUrlButton.setTitle(recipe?.source ?? "" , for: .normal)
        if self.helper.checkLikedRecipe(uri: (self.recipe?.uri!)!) {
            likeRecipeButton.setImage(UIImage(named: "like-heart-100-3"), for: .normal)
        }
    }
    
    @IBAction func openUrlActionBTN(_ sender: Any) {
        
        let sfSafari = SFSafariViewController(url: URL(string: recipe?.url ?? "")!  )
        sfSafari.delegate = self
        present(sfSafari , animated: true)
    }
    
    @IBAction func onlikeProductButtonActionBTN(_ sender: UIButton) {
        do{
            
            if sender.isSelected != true {
                UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
                    sender.isSelected = true
                    self.helper.addLikedRecipeToArray(uri: self.recipe?.uri!)
                    sender.transform = CGAffineTransform(translationX: 0, y: 2)
                    sender.setImage(UIImage(named: "like-heart-100-3"), for: .normal)
                })
            }else{
                UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
                    sender.isSelected = false
                    self.helper.removeLikedRecipeFromArray(uri: self.recipe?.uri!)
                    sender.transform = CGAffineTransform(translationX: 0, y: 0)
                    sender.setImage(UIImage(named: "add-heart-100-2"), for: .normal)
                })
            }
        }catch{
            print(error)
        }
    }
    
    @IBAction func onShareButtonActionBTN(_ sender: Any) {
        do{
            
            
            if self.recipe?.shareAs == nil {
                
            }
            // set up activity view controller
            let urlToShare = [ self.recipe?.shareAs! ]
            let activityViewController = UIActivityViewController(activityItems: urlToShare, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
            
            // exclude some activity types from the list (optional)
            activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
            
            // present the view controller
            self.present(activityViewController, animated: true, completion: nil)
            
        }catch{
            print(error)
        }
    }
    
}
extension RecipeViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.recipe?.ingredients!.count)!
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = self.recipe?.ingredients?[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(60)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "header_cell") as! RecipeHeaderTableViewCell
        cell.setup(count: (self.recipe?.ingredients!.count)!)
        return cell.contentView
    }
    
}

extension RecipeViewController : SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true, completion: nil)
    }
}
