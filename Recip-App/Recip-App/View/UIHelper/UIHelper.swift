//
//  UIHelper.swift
//  SoftxpertTaskApp
//
//  Created by mohamed on 12/19/19.
//  Copyright © 2019 injaz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class UIHelper {
    static let AppId = "89193820"
    static let AppKey = "b0c4f8afaa13f79ee3219775e0d90d23"
    
    /// get the url with the value of search
    static func getApiUrlWithSearchValue(searchValue : String) -> String {
        return "https://api.edamam.com/search?q=\(searchValue)&app_id=\(AppId)&app_key=\(AppKey)"
    }
    
    static func getImageFromUrl(urlImage : String , complection : @escaping (UIImage) -> () ){
        do{
            if urlImage == "" {
                complection(UIImage(named: "120x120")!)
                return
            }
            Alamofire.request(urlImage).responseImage { response in
                debugPrint(response)
                
                print(response.request)
                print(response.response)
                debugPrint(response.result)
                
                guard let image = response.result.value else {
                    complection(UIImage(named: "120x120")!)
                    return
                }
                complection(image)
                //                if let image = response.result.value {
                //                    complection(response.result.value ?? UIImage(named: "120x120")!)
                //                }
                
            }
            
        }catch{
            print(error)
        }
    }
    
    func checkLikedRecipe(uri : String) -> Bool {
        do{
            return GlobalVariable.recipeLiked.contains(uri)
            
        }catch{
            print(error)
            return false
        }
        
    }
    func addLikedRecipeToArray(uri : String!){
        do{
            GlobalVariable.recipeLiked.append(uri)
            UserDefaults.standard.setValue(GlobalVariable.recipeLiked, forKey: "likedRecipe")
        }catch{
            print(error)
        }
    }
    func removeLikedRecipeFromArray(uri : String!){
        do{
            
            // to remove item
            GlobalVariable.recipeLiked = GlobalVariable.recipeLiked.filter(){$0 != uri}
            
            UserDefaults.standard.setValue(GlobalVariable.recipeLiked, forKey: "likedRecipe")
        }catch{
            print(error)
        }
    }
}


