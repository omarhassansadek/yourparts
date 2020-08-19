//
//  productViewController.swift
//  yourparts
//
//  Created by iMac1 on 8/4/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class productViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var thirdTabConjunction: UIImageView!
    @IBOutlet weak var secondTabConjunction: UIImageView!
    @IBOutlet weak var firstTabConjunction: UIImageView!
    @IBOutlet weak var thirdTabDataImg: UIImageView!
    @IBOutlet weak var secondTabDataImg: UIImageView!
    @IBOutlet weak var firstTabDataImg: UIImageView!
    @IBOutlet weak var firstTabView: UIView!
    @IBOutlet weak var secondTabView: UIView!
    @IBOutlet weak var thirdTabView: UIView!
    @IBOutlet weak var thirdTabBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondTabBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var firstTabBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var priceContainerView: UIView!
    @IBOutlet weak var egpLbl: UILabel!
    @IBOutlet weak var productPriceLbl: UILabel!
    @IBOutlet weak var seeAll: UIButton!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var similarProductsLbl: UILabel!
    @IBOutlet weak var rateBtn: UIButton!
    @IBOutlet weak var viewReviewsBtn: UIButton!
    @IBOutlet weak var reviewsCollectionView: UICollectionView!
    @IBOutlet weak var productDetailsTableView: UITableView!
    @IBOutlet weak var productDetails: UILabel!
    @IBOutlet weak var addtoFavLbl: UILabel!
    @IBOutlet weak var addtoCartLbl: UILabel!
    @IBOutlet var roundedView: [UIView]!
    @IBOutlet weak var productType: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var reviewsLbl: UILabel!
    
    
    var dataArr : [[String]] = []

    
    override func viewDidAppear(_ animated: Bool) {
        var flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout();
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        
        var flowLayoutProducts:UICollectionViewFlowLayout = UICollectionViewFlowLayout();
        flowLayoutProducts.minimumInteritemSpacing = 0.0
        flowLayoutProducts.minimumLineSpacing = 0.0

        reviewsCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        
        productsCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayoutProducts)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataArr = Array(repeating: Array(repeating: "", count: 8), count: 8)

        self.dataTypeArr = [1,2,2,4, 0, 0, 0, 0 ,0 ,0 ,0 , 0]

        
        dataArr[0][0] = "Brand".localized
        dataArr[1][0] = "Model".localized
        dataArr[2][0] = "Lzooga".localized
        dataArr[3][0] = "Size".localized
        dataArr[4][0] = "Stock".localized
        dataArr[5][0] = "Number".localized
        dataArr[6][0] = "Supplier".localized
        dataArr[7][0] = "Details".localized

        dataArr[0][1] = "Mobil"
        dataArr[1][1] = "Delvac MX"
        dataArr[2][1] = "5W30"
        dataArr[3][1] = "4L"
        dataArr[4][1] = "متوفر ٤ قطع"
        dataArr[5][1] = "222344565HN78"
        dataArr[6][1] = "المتحدة للأستيرادو التصدير"
        dataArr[7][1] = "تفاصيل المنتج بالتفصيل الممل"
        
        
        //registering cells
        let nib = UINib(nibName: String(describing: productCellTableViewCell.self), bundle: nil)
        self.productDetailsTableView.register(nib, forCellReuseIdentifier: "dataCell")
        
        let nib4 = UINib(nibName: String(describing: extraProductsTitleTableViewCell.self), bundle: nil)
        self.productDetailsTableView.register(nib4, forCellReuseIdentifier: "addressCell")
        
        let nib5 = UINib(nibName: String(describing: extraProductTableViewCell.self), bundle: nil)
        self.productDetailsTableView.register(nib5, forCellReuseIdentifier: "extraProductCell")
        
        let nib6 = UINib(nibName: String(describing: addToCartBtnTableViewCell.self), bundle: nil)
        self.productDetailsTableView.register(nib6, forCellReuseIdentifier: "addToCartBtn")

        let nib7 = UINib(nibName: String(describing: chooseAdrressTitleTableViewCell.self), bundle: nil)
        self.productDetailsTableView.register(nib7, forCellReuseIdentifier: "chooseAddressCell")

        let nib2 = UINib(nibName: String(describing: userReviewCollectionViewCell.self), bundle: nil)
        self.reviewsCollectionView.register(nib2, forCellWithReuseIdentifier: "reviewCell")

        let nib3 = UINib(nibName: String(describing: productCollectionViewCell.self), bundle: nil)
        self.productsCollectionView.register(nib3, forCellWithReuseIdentifier: "productCollection")

        //productsCollectionView
        self.reviewsCollectionView.delegate = self
        self.reviewsCollectionView.dataSource = self
        
        self.productsCollectionView.delegate = self
        self.productsCollectionView.dataSource = self

        self.productDetailsTableView.delegate = self
        self.productDetailsTableView.dataSource = self
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        
        self.navigationController?.navigationBar.tintColor = primaryColor

        self.productPriceLbl.text = "٧٥٠"
        self.productPriceLbl.font = UIFont(name: "Cairo-Bold", size: 24)

        self.egpLbl.text = "جنيه"
        self.egpLbl.font = UIFont(name: "Cairo-SemiBold", size: 12)

        self.priceContainerView.layer.cornerRadius = self.priceContainerView.frame.width / 2.0
        
        self.productName.text = "Potanza بريذج ستون"
        self.productName.font = UIFont(name: "Cairo-Bold", size: 16)

        self.productPrice.text = "٨٥٠ جنيه"
        self.productPrice.font = UIFont(name: "Cairo-SemiBold", size: 14)

        self.productType.text = "كاوتش"
        self.productType.font = UIFont(name: "Cairo-SemiBold", size: 14)

        self.addtoCartLbl.text = "Add to Cart".localized
        self.addtoCartLbl.font = UIFont(name: "Cairo-SemiBold", size: 11)
        
        self.addtoFavLbl.text = "Add to Favorites".localized
        self.addtoFavLbl.font = UIFont(name: "Cairo-SemiBold", size: 11)
        
        self.productDetails.text = "Product Details".localized
        self.productDetails.font = UIFont(name: "Cairo-SemiBold", size: 14)
       
        self.similarProductsLbl.text = "Similar Products".localized
        self.similarProductsLbl.font = UIFont(name: "Cairo-SemiBold", size: 14)

        self.reviewsLbl.text = "Reviews".localized
        self.reviewsLbl.font = UIFont(name: "Cairo-SemiBold", size: 14)

        
        self.viewReviewsBtn.setTitle("View all Reviews".localized, for: .normal)
        self.viewReviewsBtn.titleLabel!.font = UIFont(name: "Cairo-Regular", size: 12)
        
        
        //self.rateBtn.setTitle("Rate Product".localized, for: .normal)
        self.rateBtn.titleLabel!.font = UIFont(name: "Cairo-Semibold", size: 12)
        
        let attrs = [
            NSAttributedString.Key.font :  UIFont(name: "Cairo-Regular", size: 12),
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.underlineStyle : 1] as [NSAttributedString.Key : Any]
        var attributedString = NSMutableAttributedString(string:"")

        let buttonTitleStr = NSMutableAttributedString(string:"Rate Product".localized, attributes:attrs)
        attributedString.append(buttonTitleStr)
        rateBtn.setAttributedTitle(buttonTitleStr, for: .normal)

        let attrs2 = [
            NSAttributedString.Key.font :  UIFont(name: "Cairo-Regular", size: 12),
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.underlineStyle : 1] as [NSAttributedString.Key : Any]
        var attributedString2 = NSMutableAttributedString(string:"")
        
        let buttonTitleStr2 = NSMutableAttributedString(string:"See All Products".localized, attributes:attrs)
        attributedString2.append(buttonTitleStr2)
        seeAll.setAttributedTitle(buttonTitleStr2, for: .normal)

        
        
        for view in roundedView{
            view.layer.cornerRadius = 9.5
        }
        
        self.firstTabView.layer.cornerRadius = 10.0
        self.secondTabView.layer.cornerRadius = 10.0
        self.thirdTabView.layer.cornerRadius = 10.0
        //Cairo-SemiBold
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataTypeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch self.dataTypeArr[indexPath.row] {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! productCellTableViewCell

                if indexPath.row % 2 != 0{
                    cell.contentView.backgroundColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
                }else{
                    cell.contentView.backgroundColor = UIColor.white

                }
                
                cell.cellKey.text = dataArr[indexPath.row - 4][0]
                cell.cellValue.text = dataArr[indexPath.row - 4][1]
                
                cell.selectionStyle  = .none
                
                return cell
            case 1:
                let cell1 = tableView.dequeueReusableCell(withIdentifier: "addressCell") as! extraProductsTitleTableViewCell
                cell1.selectionStyle = .none
                return cell1
            case 2:
                let cell2 = tableView.dequeueReusableCell(withIdentifier: "extraProductCell") as! extraProductTableViewCell
                cell2.selectionStyle = .none
                return cell2
            case 3:
                let cell3 = tableView.dequeueReusableCell(withIdentifier: "chooseAddressCell") as! chooseAdrressTitleTableViewCell
                cell3.selectionStyle = .none
            return cell3
            case 4:
                let cell4 = tableView.dequeueReusableCell(withIdentifier: "addToCartBtn") as! addToCartBtnTableViewCell
                cell4.selectionStyle = .none
                return cell4
            default:
                return UITableViewCell()
        }
        
        
       
       

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch self.dataTypeArr[indexPath.row] {
        case 0:
            return 35.0

        case 1:
            return 45.0

        case 2:
            return 90.0

        case 3:
            return 165.0
            
        case 4:
            return 82.5

        default:
            return 0.0

        }
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print(collectionView.tag)
        switch collectionView.tag {
            
            case 11:
                let cellx = collectionView.dequeueReusableCell(withReuseIdentifier: "reviewCell", for: indexPath) as! userReviewCollectionViewCell
                cellx.userName.text = "احمد عبد اللطيف"
                cellx.userReview.text = "القطعة ممتازة لكن أضطريت اغيرها بعد أول أسبوع عشان جودتها سيئة و كمان سعرها غالي جدا و فوق و أدائها عالي جدا"
                return cellx
            case 22:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCollection", for: indexPath) as! productCollectionViewCell
                
                return cell
            default:
                return UICollectionViewCell()
            
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == productsCollectionView{
            return CGSize(width: 200.0 , height: 200.0)
        }else{
            return CGSize(width: self.view.frame.width  , height: collectionView.frame.height)
        }
        
    }
    
    
    var dataTypeArr : [Int] = []
    
    @IBAction func selectTabsBtn(_ sender: UIButton) {
        if sender.tag == 11{
            self.firstTabView.backgroundColor = cyanColor
            self.firstTabDataImg.image = UIImage(named: "firstTabDataHighlighted")
            self.firstTabBottomConstraint.constant = 0
            self.firstTabView.updateConstraintsIfNeeded()
            self.firstTabConjunction.isHidden = false
            
            self.secondTabView.backgroundColor = anotherGreyColor
            self.secondTabDataImg.image = UIImage(named: "secondTabData")
            self.secondTabBottomConstraint.constant = 12.5
            self.secondTabView.updateConstraintsIfNeeded()
            self.secondTabConjunction.isHidden = true

            self.thirdTabView.backgroundColor = anotherGreyColor
            self.thirdTabDataImg.image = UIImage(named: "secondTabData")
            self.thirdTabBottomConstraint.constant = 12.5
            self.thirdTabView.updateConstraintsIfNeeded()
            self.thirdTabConjunction.isHidden = true
            
            self.dataTypeArr = [1,2,2,4, 0, 0, 0, 0 ,0 ,0 ,0 , 0]
            self.productDetailsTableView.reloadData()
            self.tableViewHeightConstraint.constant = 590
            self.productDetailsTableView.updateConstraintsIfNeeded()
            
            
        }else if sender.tag == 22{
            self.secondTabView.backgroundColor = cyanColor
            self.secondTabDataImg.image = UIImage(named: "secondTabDataHighlighted")
            self.secondTabBottomConstraint.constant = 0
            self.secondTabView.updateConstraintsIfNeeded()
            self.secondTabConjunction.isHidden = false
            
            self.firstTabView.backgroundColor = anotherGreyColor
            self.firstTabDataImg.image = UIImage(named: "firstTabData")
            self.firstTabBottomConstraint.constant = 12.5
            self.firstTabView.updateConstraintsIfNeeded()
            self.firstTabConjunction.isHidden = true
            
            self.thirdTabView.backgroundColor = anotherGreyColor
            self.thirdTabDataImg.image = UIImage(named: "secondTabData")
            self.thirdTabBottomConstraint.constant = 12.5
            self.thirdTabView.updateConstraintsIfNeeded()
            self.thirdTabConjunction.isHidden = true
            
            
            self.dataTypeArr = [1,2,2,3, 0, 0, 0, 0 ,0 ,0 ,0 , 0]
            self.productDetailsTableView.reloadData()
            self.tableViewHeightConstraint.constant = 675
            self.productDetailsTableView.updateConstraintsIfNeeded()

            
        }else{
            self.thirdTabView.backgroundColor = primaryColor
            self.thirdTabDataImg.image = UIImage(named: "thirdTabDataHighlighted")
            self.thirdTabBottomConstraint.constant = 0
            self.thirdTabView.updateConstraintsIfNeeded()
            self.thirdTabConjunction.isHidden = false
            
            self.firstTabView.backgroundColor = anotherGreyColor
            self.firstTabDataImg.image = UIImage(named: "firstTabData")
            self.firstTabBottomConstraint.constant = 12.5
            self.firstTabView.updateConstraintsIfNeeded()
            self.firstTabConjunction.isHidden = true
            
            self.secondTabView.backgroundColor = anotherGreyColor
            self.secondTabDataImg.image = UIImage(named: "secondTabData")
            self.secondTabBottomConstraint.constant = 12.5
            self.secondTabView.updateConstraintsIfNeeded()
            self.secondTabConjunction.isHidden = true
            
            
            self.dataTypeArr = [1,2,2,4, 0, 0, 0, 0 ,0 ,0 ,0 , 0]
            self.productDetailsTableView.reloadData()
            self.tableViewHeightConstraint.constant = 590
            self.productDetailsTableView.updateConstraintsIfNeeded()
        }
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
