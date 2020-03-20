//
//  formulae.swift
//  financeApp
//
//  Created by Van Quang Nguyen on 18/02/2020.
//  Copyright © 2020 Van Quang Nguyen. All rights reserved.
//

import Foundation

var n = 12.0
var t = 10.0
var rate = 0.05
var p = 1000.0
var xx = pow((1+rate/n),n*t)
var domn = xx-1
var num = p*(rate/n)*xx

var pmt = num/domn

class Formulae
{
    


public struct Mortgage
{
    var loanAmount:Double = 0.0
    var interestRate: Double = 0.05
    var numOfYears: Double = 12.0
    var yy : Double = 0.0
    var domain = 0.0
}

public struct Saving
{
    var interestRate: Double = 0.05
    var montlyPayment: Double = 50.0
    var numOfYears: Double = 12.0
    var yy2 : Double = 0.0
    var domain2 = 0.0
}

class func calculateMortgage(mortgageDetail:Mortgage)-> Double
{
   var yy =  pow((1+mortgageDetail.interestRate/n),n*mortgageDetail.numOfYears)
   var domain = yy-1
    return (yy*mortgageDetail.loanAmount*(mortgageDetail.interestRate/12))/domain
    
    }

    class func calculateSavings(savingsDetail:Saving)-> Double{
      var  yy2 = pow((1+savingsDetail.interestRate/12),12*savingsDetail.numOfYears) - 1
     var  domain2 = savingsDetail.interestRate/12
        var a = pmt * (yy2/domain2)
        return a
    }
    

}

