//
//  ViewController.swift
//  carousel
//
//  Created by Bruno Lorenzo on 15/2/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Subvies
    
    private var carouselView: CarouselView?
    
    // MARK: - Properties
    
    private var carouselData = [CarouselView.CarouselData]()
    private let backgroundColors: [UIColor] = [#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.4826081395, green: 0.04436998069, blue: 0.2024421096, alpha: 1), #colorLiteral(red: 0.1728022993, green: 0.42700845, blue: 0.3964217603, alpha: 1)]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carouselView = CarouselView(pages: 3, delegate: self)
        carouselData.append(.init(image: UIImage(named: "Image_1"), text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"))
        carouselData.append(.init(image: UIImage(named: "Image_2"), text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"))
        carouselData.append(.init(image: UIImage(named: "Image_3"), text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"))
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        carouselView?.configureView(with: carouselData)
    }
}

// MARK: - Setups

private extension ViewController {
    func setupUI() {
        view.backgroundColor = backgroundColors.first
        
        guard let carouselView = carouselView else { return }
        view.addSubview(carouselView)
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        carouselView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        carouselView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        carouselView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        carouselView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

// MARK: - CarouselViewDelegate

extension ViewController: CarouselViewDelegate {
    func currentPageDidChange(to page: Int) {
        UIView.animate(withDuration: 0.7) {
            self.view.backgroundColor = self.backgroundColors[page]
        }
    }
}
