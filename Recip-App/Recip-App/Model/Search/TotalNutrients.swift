/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

class TotalNutrients : Mappable {
	var eNERC_KCAL : ENERC_KCAL?
	var fAT : FAT?
	var fASAT : FASAT?
	var fATRN : FATRN?
	var fAMS : FAMS?
	var fAPU : FAPU?
	var cHOCDF : CHOCDF?
	var fIBTG : FIBTG?
	var sUGAR : SUGAR?
	var pROCNT : PROCNT?
	var cHOLE : CHOLE?
	var nA : NA?
	var cA : CA?
	var mG : MG?
	var k : K?
	var fE : FE?
	var zN : ZN?
	var p : P?
	var vITA_RAE : VITA_RAE?
	var vITC : VITC?
	var tHIA : THIA?
	var rIBF : RIBF?
	var nIA : NIA?
	var vITB6A : VITB6A?
	var fOLDFE : FOLDFE?
	var fOLFD : FOLFD?
	var vITB12 : VITB12?
	var vITD : VITD?
	var tOCPHA : TOCPHA?
	var vITK1 : VITK1?
	var wATER : WATER?

	required init?(map: Map) {

	}

	 func mapping(map: Map) {

		eNERC_KCAL <- map["ENERC_KCAL"]
		fAT <- map["FAT"]
		fASAT <- map["FASAT"]
		fATRN <- map["FATRN"]
		fAMS <- map["FAMS"]
		fAPU <- map["FAPU"]
		cHOCDF <- map["CHOCDF"]
		fIBTG <- map["FIBTG"]
		sUGAR <- map["SUGAR"]
		pROCNT <- map["PROCNT"]
		cHOLE <- map["CHOLE"]
		nA <- map["NA"]
		cA <- map["CA"]
		mG <- map["MG"]
		k <- map["K"]
		fE <- map["FE"]
		zN <- map["ZN"]
		p <- map["P"]
		vITA_RAE <- map["VITA_RAE"]
		vITC <- map["VITC"]
		tHIA <- map["THIA"]
		rIBF <- map["RIBF"]
		nIA <- map["NIA"]
		vITB6A <- map["VITB6A"]
		fOLDFE <- map["FOLDFE"]
		fOLFD <- map["FOLFD"]
		vITB12 <- map["VITB12"]
		vITD <- map["VITD"]
		tOCPHA <- map["TOCPHA"]
		vITK1 <- map["VITK1"]
		wATER <- map["WATER"]
	}

}
