//
//  ViewController.swift
//  GETfilms
//
//  Created by admin on 22/12/2021.
//

import UIKit

class ViewController:UIViewController , UITableViewDataSource {
    
    let identifier = "MovieCell"
    var finalResult : [Movie] = []
    var movie: Movie?
    let url = "https://swapi.dev/api/films/?format=json"

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movie?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = self.movie?.results[indexPath.row].title
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
  
    override func viewDidLoad() {
            super.viewDidLoad()
        
        tableView.dataSource = self
        getApi()
    }
//
    func getApi() {
        ApiManager.getApiResponse(urlPath: url) { data, error in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                if let data = data {
                    print("response received")
                    self.movie = self.parseLogic(data: data)
                    DispatchQueue.main.async {
                        // main thread
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    private func parseLogic(data:Data) -> Movie? {
        do {
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            print(movie.results.first!.title)
            return movie
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
