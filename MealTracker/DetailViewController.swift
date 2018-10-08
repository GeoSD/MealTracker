//
//  DetailViewController.swift
//  MealTracker
//
//  Created by Georgy Dyagilev on 07/10/2018.
//  Copyright © 2018 Georgy Dyagilev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        
        performSegue(withIdentifier: "ScrollView", sender: nil)
    }
    var selectedMeal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }
    
    func updateLabels() {
        guard let selectedMeal = selectedMeal else { return }
        imageView.image = selectedMeal.photo
        nameLabel.text = selectedMeal.name
        descriptionLabel.text = selectedMeal.notes
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ScrollView" {
            if let scrollVC = segue.destination as? ScrollViewController {
                scrollVC.image = selectedMeal?.photo
            }
        }
    }
}
