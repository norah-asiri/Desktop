//
//  ShowQuotes.swift
//  MovieQuotes
//
//  Created by admin on 21/12/2021.
//

import UIKit


class ShowQuotes: UIViewController {
    
    var movieDetails = MovieItem(title: "", qouts:[""])

    @IBOutlet weak var quotes: UILabel!
    
    var indexPath : NSIndexPath?
   // var delegate : QuotesDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // if movieDetails.qouts.count >= 0 {
           // let quotesNumber = movieDetails.qouts.count
        quotes.text = movieDetails.qouts[0]
      //  } else {
        //    quotes.text = "No Quotes"
       // }
        
      

        // Do any additional setup after loading the view.
    }
}
