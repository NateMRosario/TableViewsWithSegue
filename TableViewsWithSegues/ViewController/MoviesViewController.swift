//
//  MoviesViewController.swift
//  TableViewsWithSegues
//
//  Created by C4Q on 11/2/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var movies = [Movie]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
        // Do any additional setup after loading the view.
    }

    func loadData() {
        self.movies = MovieData.movies
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = self.movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Movie Cell", for: indexPath)
        cell.textLabel?.text = movie.name
        cell.detailTextLabel?.text = String(movie.year)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        if let destination = segue.destination as? MovieDetailsViewController {
            let selectedRow = tableView.indexPathForSelectedRow!.row
            let selectedMovie = self.movies[selectedRow]
            destination.movie = selectedMovie
        }
        
        // Pass the selected object to the new view controller.
    }
    

}
