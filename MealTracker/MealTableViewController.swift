//
//  MealTableViewController.swift
//  MealTracker
//
//  Created by Georgy Dyagilev on 07/10/2018.
//  Copyright © 2018 Georgy Dyagilev. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    var meals: [Meal] = [
        Meal(name: "Биг Мак", photo: UIImage(named: "big_mac.jpg")!, notes: "ккал 503, жиры 25г, углеводы 42г, белки 26г", rating: 9),
        Meal(name: "Биг Тэйсти", photo: UIImage(named: "big_tasty.jpg")!, notes: "ккал 812, жиры 48г, углеводы 50г, белки 44г", rating: 8),
        Meal(name: "Чизбургер", photo: UIImage(named: "cheeseburger.jpg")!, notes: "ккал 302, жиры 12г, углеводы 31г, белки 16г", rating: 7),
        Meal(name: "Двойной чизбургер", photo: UIImage(named: "double_cheeseburger.jpg")!, notes: "ккал 442, жиры 23г, углеводы 32г, белки 26г", rating: 9),
        Meal(name: "Гриль гурмэ", photo: UIImage(named: "GourmetGrill.jpg")!, notes: "ккал 896, жиры 55г, углеводы 51г, белки 47г", rating: 7),
        Meal(name: "Вестерн гурмэ", photo: UIImage(named: "GourmetWestern.jpg")!, notes: "ккал 673, жиры 37г, углеводы 52г, белки 34г", rating: 10),
        Meal(name: "Гамбургер", photo: UIImage(named: "hamburger.jpg")!, notes: "ккал 253, жиры 8.5г, углеводы 30г, белки 13г", rating: 8),
        Meal(name: "МакЧикен", photo: UIImage(named: "McChicken.jpg")!, notes: "ккал 463, жиры 21г, углеводы 51г, белки 18г", rating: 9)]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath)
        cell.imageView?.image = meals[indexPath.row].photo
        cell.textLabel?.text = meals[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            if let detailVC = segue.destination as? DetailViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                let selectedMeal = meals[indexPath.row]
                detailVC.selectedMeal = selectedMeal
//                detailVC.imageView.image = selectedMeal.photo
//                detailVC.nameLabel.text = selectedMeal.name
//                detailVC.descriptionLabel.text = selectedMeal.notes
            }
        }
    }
}
