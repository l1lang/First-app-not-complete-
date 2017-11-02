//
//  ViewController.swift
//  Now Playing
//
//  Created by Lixuan Lang on 10/21/17.
//  Copyright © 2017 Lixuan Lang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier:"MovieCell") as! MovieCellTableViewCell
        
        let index = indexPath.row
        let title = movies![index]["title"] as! String
        cell.titleLable.text = title
        return cell
    }
    
    
    var movies: [NSDictionary]?{
        didSet{
            DispatchQueue.main.async{
            self.moviesTableView.reloadData()
        }
        }
    }
    
    @IBOutlet weak var moviesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        moviesTableView.rowHeight = 144.8
        moviesTableView.dataSource = self
        loadMovieData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //download data about movies currently in theaters.
    func loadMovieData(){
        
        let endpoint = "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
        
        let url = URL(string: endpoint)!
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            // parse the result as JSON
            
            if let data = data {
                
                if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    
                    self.movies = (dataDictionary["results"] as! [NSDictionary])
                    
                    print(self.movies!)
                    
                }
                
            }
            
        })
        
        task.resume()
    }
    
    //insert moveis title into each cell
    
    
}

