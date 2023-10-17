//
//  ViewController.swift
//  Mission_pageControl
//
//  Created by 한재혁 on 2023/08/24.
//

import UIKit

let MAX_PAGE = 10

class ViewController: UIViewController {
    @IBOutlet var lblCurrentPage: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = MAX_PAGE
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        lblCurrentPage.text = String(pageControl.currentPage + 1)
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        lblCurrentPage.text = String(pageControl.currentPage + 1)
    }
    
}

