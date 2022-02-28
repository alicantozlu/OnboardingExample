//
//  ViewController.swift
//  Odev-1
//
//  Created by Ali Can Tozlu on 11.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var goBackBtn: UIButton!
    
    var slides = [PageModel]()
    
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count-1{
                nextBtn.setTitle("Get Started", for: .normal)
                nextBtn.setTitleColor(.black, for: .normal)
                nextBtn.backgroundColor = UIColor(displayP3Red: 208/255, green: 209/255, blue: 210/255, alpha: 1.0)
                goBackBtn.isHidden = false
            } else {
                nextBtn.setTitle("Next", for: .normal)
                nextBtn.backgroundColor = .black
                nextBtn.setTitleColor(.white, for: .normal)
                goBackBtn.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let page1 = PageModel(title: "Buy Cryptos Conveniently", description: "Using Credit Or Debit Card", image: #imageLiteral(resourceName: "btc"))
        let page2 = PageModel(title: "Multiple Investment Channels", description: "CASH / MARGIN / FUTURES \n\n Staking And More", image: #imageLiteral(resourceName: "eth"))
        let page3 = PageModel(title: "Secure Wallet", description: "Protected By Technical Experts", image: #imageLiteral(resourceName: "xrp") )
        
        slides = [page1, page2, page3]

        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
            self.currentPage += 1
            let indexPath = IndexPath(item: self.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)

            if self.currentPage == self.slides.count-1 {
                timer.invalidate()
            }
        }
        
    }

    @IBAction func nextBtnAction(_ sender: Any) {
        if(currentPage == slides.count - 1){
            // navigate to the next page
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    @IBAction func goBackBtnAction(_ sender: Any) {
        goBackBtn.isHidden = true
        currentPage = 0
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardingPages", for: indexPath) as! PageCells
        cell.titleLabel.text = slides[indexPath.row].title
        cell.descriptionLabel.text = slides[indexPath.row].description
        cell.imageView.image = slides[indexPath.row].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}


