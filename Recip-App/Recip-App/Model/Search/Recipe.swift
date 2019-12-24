/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

class Recipe : Mappable {
	var uri : String?
	var label : String?
	var image : String?
	var source : String?
	var url : String?
	var shareAs : String?
	var yield : Double?
	var dietLabels : [String]?
	var healthLabels : [String]?
	var cautions : [String]?
	var ingredientLines : [String]?
	var ingredients : [Ingredients]?
	var calories : Double?
	var totalWeight : Double?
	var totalTime : Double?
	var totalNutrients : TotalNutrients?
	var totalDaily : TotalDaily?
	var digest : [Digest]?

	required init?(map: Map) {

	}

	 func mapping(map: Map) {

		uri <- map["uri"]
		label <- map["label"]
		image <- map["image"]
		source <- map["source"]
		url <- map["url"]
		shareAs <- map["shareAs"]
		yield <- map["yield"]
		dietLabels <- map["dietLabels"]
		healthLabels <- map["healthLabels"]
		cautions <- map["cautions"]
		ingredientLines <- map["ingredientLines"]
		ingredients <- map["ingredients"]
		calories <- map["calories"]
		totalWeight <- map["totalWeight"]
		totalTime <- map["totalTime"]
		totalNutrients <- map["totalNutrients"]
		totalDaily <- map["totalDaily"]
		digest <- map["digest"]
	}

}
