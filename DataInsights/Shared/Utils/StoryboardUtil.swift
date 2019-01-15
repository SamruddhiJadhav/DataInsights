//
//  StoryboardUtil.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 14/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class StoryboardUtil {
    
    // MARK: - Helper Methods
    static func instantiateView<ViewController: UIViewController>(_ storyboardID: String, _ viewStoryboardID: String) -> ViewController {
        guard let view = UIStoryboard(name: storyboardID, bundle: nil).instantiateViewController(withIdentifier: viewStoryboardID) as? ViewController else {
            fatalError("Failed to initaite for \(storyboardID) and \(viewStoryboardID)")
        }
        return view
    }
    
    static func instantiateNavigationView(_ storyboardID: String, _ viewStoryboardID: String) -> UINavigationController {
        guard let navigationController = UIStoryboard(name: storyboardID, bundle: nil).instantiateViewController(withIdentifier: viewStoryboardID) as? UINavigationController else {
            fatalError("Failed to initaite for \(storyboardID) and \(viewStoryboardID)")
        }
        return navigationController
    }
}
