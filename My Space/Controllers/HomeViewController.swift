//
//  ViewController.swift
//  My Space
//
//  Created by unthinkable-mac-0025 on 28/05/21.
//

import UIKit

class HomeViewController: UIViewController {

    var webSeriesImages : [String] = ["ws1", "ws2", "ws3", "ws4", "ws5"]
    
    @IBOutlet var webSeriesPageContoller: UIPageControl!
    @IBOutlet var webSeriesCollectionView: UICollectionView!
    
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        startWebSeriesSlideShow()
       
    }
    
    
    
    
    func startWebSeriesSlideShow() {
        //seting the pageControl and timer to make the images slide automatically.
        webSeriesPageContoller.numberOfPages = webSeriesImages.count
        webSeriesPageContoller.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.imageChanger), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func button(_ sender: UIButton) {
        print("lol")
    }
    
    @objc func imageChanger()  {
        if counter < webSeriesImages.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.webSeriesCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            webSeriesPageContoller.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.webSeriesCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            webSeriesPageContoller.currentPage = counter
            counter = 1
        }
        
    }


}

extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return webSeriesImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "webSeriesCell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView {
            vc.image = UIImage(named:webSeriesImages[indexPath.row])
            vc.layer.cornerRadius = 30.0
        }
        return cell
    }
    
    
    //describing the size of the cells in the collectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = webSeriesCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

