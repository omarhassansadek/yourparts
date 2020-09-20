//
//  productListViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Spring

class productListViewController: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var doneFilterBtn: UIButton!
    
    @IBOutlet weak var deleteFilterBtn: UIButton!
    
    @IBOutlet weak var view2Btn: UIView!
    
    @IBOutlet weak var view1Btn: UIView!
    
    @IBOutlet weak var optionalRequirementsBtn: UIButton!
    
    @IBOutlet weak var speedRateBtn: UIButton!
    
    @IBOutlet weak var filterView: SpringView!
    
    @IBOutlet weak var brandViewConstant: NSLayoutConstraint!
    
    @IBOutlet weak var brandView: UIView!
    
    @IBOutlet weak var brandCollectionView: UICollectionView!
    
    @IBOutlet weak var productsTableView: UITableView!
    
    @IBOutlet weak var productVM: productViewModel!
    
    var vcTitle: String?
    
    var pathToCall: String?
    
    @IBOutlet weak var activityindicator: NVActivityIndicatorView!
    
    @IBOutlet weak var filterTitleLbl: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        if self.pathToCall != nil {
            self.brandViewConstant.constant = 0
            self.brandView.layoutIfNeeded()
        }else{
            self.brandViewConstant.constant = 55
            self.brandView.layoutIfNeeded()

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configure()
        
        self.getProducts()
        
        let button1 = UIBarButtonItem(image: UIImage(named: "filter"), style: .plain, target: self, action: Selector("filterProducts")) // action:#selector(Class.MethodName) for swift 3
        self.navigationItem.rightBarButtonItem  = button1
        
        
        self.navigationController?.navigationBar.isHidden = false
        
        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController?.navigationBar.barTintColor = anotherGreyColor
        
        self.navigationController?.navigationBar.tintColor = primaryColor


        self.navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.darkGray,
         NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 16)!]


        self.title = vcTitle 
        
        self.brandCollectionView.delegate = self
        self.brandCollectionView.dataSource = self

        self.productsTableView.delegate = self
        self.productsTableView.dataSource = self

        
        let nib = UINib(nibName: String(describing: brandCollectionViewCell.self), bundle: nil)
        self.brandCollectionView.register(nib, forCellWithReuseIdentifier: "brandCell")

        let nib2 = UINib(nibName: String(describing: productCellTableViewCell.self), bundle: nil)
        self.productsTableView.register(nib2, forCellReuseIdentifier: "dataCell")

        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }

        
        
        // Do any additional setup after loading the view.
    }
    
    
    
      func numberOfSections(in collectionView: UICollectionView) -> Int {
          return 1
      }
      
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return 5
          
          
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          

              let cellCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "brandCell", for: indexPath) as! brandCollectionViewCell
              
              
              return cellCollection
          
          

      }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7.5
     }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:  UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
     }
    
    
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 125.0 , height: collectionView.frame.height)

     }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productVM.productsResponse?.results.count ?? 0
      }
      
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! productCellTableViewCell
          cell.productName.text = self.productVM.productsResponse?.results[indexPath.row].product_name
          cell.productDesc.text = self.productVM.productsResponse?.results[indexPath.row].created_at
          cell.productPrice.text =  "\(self.productVM.productsResponse?.results[indexPath.row].unit_price ?? "") جنيه"
        
         cell.productImage.sd_setImage(with: URL(string: self.productVM.productsResponse?.results[indexPath.row].image ?? "") , placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
                if ((error) != nil) {
                    // set the placeholder image here
                    cell.productImage.image = UIImage(named: "goodTire")
                } else {
                    // success ... use the image
                }
            })

         cell.productPriceDesc.text = "Price for unit".localized
        cell.productDeliveryDesc.text = "Price delivery and spare part price is different from each city".localized
          return cell
      }
      
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240.0
     }
    
    var indexChoosed = 0
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.indexChoosed = indexPath.row
        self.performSegue(withIdentifier: "gotoDetailProducts", sender: self)
    }
    
    
    func configure(){
        self.filterTitleLbl.text = "Filter Options".localized
        self.filterTitleLbl.font = UIFont(name: "Cairo-SemiBold", size: 15)
        self.speedRateBtn.setTitle("Speed Rate".localized, for: .normal)
        self.speedRateBtn.titleLabel?.font = UIFont(name: "Cairo-SemiBold", size: 13)
        self.speedRateBtn.setTitleColor(primaryColor, for: .normal)
        self.optionalRequirementsBtn.setTitle("Optional Requirements".localized, for: .normal)
        self.optionalRequirementsBtn.titleLabel?.font = UIFont(name: "Cairo-SemiBold", size: 13)
        self.optionalRequirementsBtn.setTitleColor(UIColor.black, for: .normal)
        
        self.deleteFilterBtn.setTitle("Delete Filters".localized, for: .normal)
        self.deleteFilterBtn.titleLabel?.font = UIFont(name: "Cairo-SemiBold", size: 13)
        self.deleteFilterBtn.setTitleColor(UIColor.black, for: .normal)

        self.doneFilterBtn.setTitle("Done".localized, for: .normal)
        self.doneFilterBtn.titleLabel?.font = UIFont(name: "Cairo-SemiBold", size: 13)
        self.doneFilterBtn.setTitleColor(primaryColor, for: .normal)


        
    }
    
    
    func getProducts(){
        
        self.activityindicator.startAnimating()
        
        self.productVM.getProductList(url: self.pathToCall ?? "", apiParameters: [:], onSuccess: { (isSuccess) in
            //
            if isSuccess{
                self.activityindicator.stopAnimating()
                self.productsTableView.isHidden = false
                self.productsTableView.reloadData()
            }
        }) { (errorMsg) in
            //
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoDetailProducts"{
            let destCont = segue.destination as! productDetailsViewController
            destCont.vcTitle = self.productVM.productsResponse?.results[self.indexChoosed].product_name
            destCont.product = self.productVM.productsResponse?.results[self.indexChoosed]
        }
        
    }
    
    
    var filterOpened = false
    
    @objc func filterProducts(){
        print("clicked")
        
        
        if !self.filterOpened {
            self.filterOpened = true
            self.filterView.isHidden = false
            self.filterView.animation = "slideUp"
            self.filterView.animate()
            
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

            
        }
    }

    @objc func updateCounter() {
        //example functionality
        self.filterView.backgroundColor = UIColor(displayP3Red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)

    }

    
    @IBAction func filterBtnsClicked(_ sender: UIButton) {
        if (sender.tag == 11){
            self.speedRateBtn.setTitleColor(primaryColor, for: .normal)
            self.view1Btn.backgroundColor = primaryColor
            
            self.optionalRequirementsBtn.setTitleColor(UIColor.black, for: .normal)
            self.view2Btn.backgroundColor = UIColor.white
        }else{
            self.speedRateBtn.setTitleColor(UIColor.black, for: .normal)
            self.view1Btn.backgroundColor = UIColor.white
            
            self.optionalRequirementsBtn.setTitleColor(primaryColor, for: .normal)
            self.view2Btn.backgroundColor = primaryColor

        }
    }
    
    @IBAction func doneFilter(_ sender: Any) {
        self.filterView.animation = "fadeOut"
        self.filterView.animate()
        self.filterOpened = false
        self.filterView.backgroundColor = UIColor.clear

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
