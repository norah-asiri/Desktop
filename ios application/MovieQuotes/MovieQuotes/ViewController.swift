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
    
    var movieDectionary : [MovieItem] = [MovieItem(title: "Gone With the Wind", imageURL: URL(string: "https://www.infoplease.com/sites/infoplease.com/files/inline-images/rhettbutler.jpg")!),
      MovieItem(title:"Taxi Driver", imageURL: URL(string: "https://www.infoplease.com/sites/infoplease.com/files/inline-images/taxidriver-min.png")!),
     MovieItem(title:"Silence of the Lambs",imageURL: URL(string: "https://www.infoplease.com/sites/infoplease.com/files/inline-images/silence_of_the_lambs-min.png")!),
      MovieItem(title:"Casablanca", imageURL:URL(string: "https//www.infoplease.com/sites/infoplease.com/files/inline-images/round-up-the-usual-suspects--min.png")!),
      MovieItem(title: "Titanic",imageURL:URL(string: "https://www.infoplease.com/sites/infoplease.com/files/inline-images/sei_51177181-66f6-min.png")!)
                                    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieDectionary.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MovieCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MovieCell.self), for: indexPath) as! MovieCell
        let url = movieDectionary[indexPath.row].imageURL
        
        print (url)
        
       // let urlData = try? Data(contentsOf: url)
        
      //  print (urlData)
        
        cell.movieTitle.text = movieDectionary[indexPath.row].title
    
//    cell.movieImage.image = UIImage(data: url//!)
        
        //kingfisher
        //let url = URL(string: "url_of_your_image")
        // this downloads the image asynchronously if it's not cached yet
        cell.movieImage.kf.setImage(with: url)
        
        
   return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    }
    
    
}

