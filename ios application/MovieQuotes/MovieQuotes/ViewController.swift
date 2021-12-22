//
//  ViewController.swift
//  MovieQuotes
//
//  Created by admin on 21/12/2021.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    

    @IBOutlet weak var MovieCollectionView: UICollectionView!
    
    var movieList : [MovieItem] = [MovieItem(title: "Gone With the Wind", imageURL: URL(string: "https://www.infoplease.com/sites/infoplease.com/files/inline-images/rhettbutler.jpg")!,qouts: ["Frankly, my dear, I don't give a damn.","I'm going to make him an offer he can't refuse."]),
  MovieItem(title:"Taxi Driver", imageURL: URL(string: "https://www.infoplease.com/sites/infoplease.com/files/inline-images/taxidriver-min.png")!,qouts: ["You talking to me?", "What we've got here is failure to communicate."]),
    MovieItem(title:"Silence of the Lambs",imageURL: URL(string: "https://www.infoplease.com/sites/infoplease.com/files/inline-images/silence_of_the_lambs-min.png")!,qouts:["There's no place like home." ,"After all, tomorrow is another day!"]),
    MovieItem(title: "Titanic",imageURL:URL(string: "https://www.infoplease.com/sites/infoplease.com/files/inline-images/sei_51177181-66f6-min.png")!,qouts: ["I'm king of the world!","Just keep swimming" ,"I drink your milkshake"]) ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MovieCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MovieCell.self), for: indexPath) as! MovieCell
        let url = movieList[indexPath.row].imageURL
        
        print (url)
        
       // let urlData = try? Data(contentsOf: url)
        
      //  print (urlData)
        
        cell.movieTitle.text = movieList[indexPath.row].title
    
//    cell.movieImage.image = UIImage(data: url//!)
        
        //kingfisher
        //let url = URL(string: "url_of_your_image")
        // this downloads the image asynchronously if it's not cached yet
        cell.movieImage.kf.setImage(with: url)
        
        
   return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ShowQuotes") as? ShowQuotes
        if let view = vc {
        let numOfQuot = movieList[indexPath.row].qouts.count
       // let random = Int.random(in: 0..<numOfQuot-1)
            view.movieDetails.qouts = movieList[indexPath.row].qouts
            
            present(view, animated: true, completion: nil)
        }
    
    }
    
    
}

