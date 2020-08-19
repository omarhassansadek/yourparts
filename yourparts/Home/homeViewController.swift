//
//  homeViewController.swift
//  yourparts
//
//  Created by iMac1 on 8/10/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class homeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var chooseManufactureYearTf: UITextField!
    @IBOutlet weak var chooseModelTf: UITextField!
    @IBOutlet weak var chooseBrandTf: UITextField!
    @IBOutlet weak var chooseTypeTf: UITextField!
    @IBOutlet weak var grp4Name: UILabel!
    @IBOutlet weak var grp4PeiceNo: UILabel!
    @IBOutlet weak var grp3Name: UILabel!
    @IBOutlet weak var grp3PeiceNo: UILabel!
    @IBOutlet weak var grp2Name: UILabel!
    @IBOutlet weak var grp2PeiceNo: UILabel!
    @IBOutlet weak var grp1Name: UILabel!
    @IBOutlet weak var grp1PeiceNo: UILabel!
    @IBOutlet weak var missionTV: UITextView!
    @IBOutlet weak var LogoSlogin: UILabel!
    @IBOutlet weak var checkAllParts: UIButton!
    @IBOutlet weak var offerSlider: UICollectionView!
    @IBOutlet weak var chooseCarInfo: UILabel!
    @IBOutlet weak var chooseCarSlogin: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        
        var flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout();
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 0.0
        
        offerSlider = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let logo = UIImage(named: "navLogo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView

        
        
        self.chooseTypeTf.attributedPlaceholder = NSAttributedString(string: "Choose Type".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 14 )!
            ])
        
        self.chooseBrandTf.attributedPlaceholder = NSAttributedString(string: "Choose Brand".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 14 )!
            ])
        
        self.chooseModelTf.attributedPlaceholder = NSAttributedString(string: "Choose Model".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 14 )!
            ])
        
        self.chooseManufactureYearTf.attributedPlaceholder = NSAttributedString(string: "Manufacture Year".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 14 )!
            ])

        self.checkAllParts.setTitle("Check Parts".localized, for: .normal)
        self.checkAllParts.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 12)

        
        self.chooseCarInfo.text = "اختار بيانات المركبة"
        self.chooseCarInfo.font = UIFont(name: "Cairo-Bold", size: 16)
        
        
        self.LogoSlogin.text = "What is yourparts".localized
        self.LogoSlogin.font = UIFont(name: "Cairo-Bold", size: 14)

        
        self.chooseCarSlogin.text = "و تصفح جميع قطع الغيار المناسبة مع امكانية التركيب و التوصيل للمنزل"
        self.chooseCarSlogin.font = UIFont(name: "Cairo-Regular", size: 12)
        
        self.chooseCarSlogin.font = UIFont(name: "Cairo-Regular", size: 12)

        self.missionTV.text = "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام “هنا يوجد محتوى نصي، هنا يوجد محتوى نصي” فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء."
        self.missionTV.font = UIFont(name: "Cairo-Regular", size: 12)
        
        self.grp1Name.text = "السيور و الفلاتر"
        self.grp1Name.font = UIFont(name: "Cairo-Bold", size: 13)

        self.grp2Name.text = "العفشة و أنظمة الفرامل"
        self.grp2Name.font = UIFont(name: "Cairo-Bold", size: 13)
        
        self.grp3Name.text = "قطع المحرك و الحساسات"
        self.grp3Name.font = UIFont(name: "Cairo-Bold", size: 13)
        
        self.grp4Name.text = "الزيوت و الفلاتر"
        self.grp4Name.font = UIFont(name: "Cairo-Bold", size: 13)
        
        self.grp1PeiceNo.text = "٣٤٠ قطعة"
        self.grp1PeiceNo.font = UIFont(name: "Cairo-Regular", size: 12)

        self.grp2PeiceNo.text = "٣٤٠ قطعة"
        self.grp2PeiceNo.font = UIFont(name: "Cairo-Regular", size: 12)

        self.grp3PeiceNo.text = "٣٤٠ قطعة"
        self.grp3PeiceNo.font = UIFont(name: "Cairo-Regular", size: 12)

        self.grp4PeiceNo.text = "٣٤٠ قطعة"
        self.grp4PeiceNo.font = UIFont(name: "Cairo-Regular", size: 12)

        let nib = UINib(nibName: String(describing: homeSliderCollectionViewCell.self), bundle: nil)
        self.offerSlider.register(nib, forCellWithReuseIdentifier: "offerSlider")
        
        //productsCollectionView
        self.offerSlider.delegate = self
        self.offerSlider.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            let cellx = collectionView.dequeueReusableCell(withReuseIdentifier: "offerSlider", for: indexPath) as! homeSliderCollectionViewCell
            return cellx
            
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
            return CGSize(width: self.view.frame.width , height: 200.0)
        }
    
    
    @IBAction func checkSpartsBtn(_ sender: Any) {
    
        self.performSegue(withIdentifier: "gotoSpareParts", sender: self)
        
    }
    
    @IBOutlet weak var homeScrollView: UIScrollView!
    @IBAction func scrollToBottomBtn(_ sender: Any) {
        homeScrollView.setContentOffset(CGPoint(x: 0 , y: 885), animated: true)

    }
    
    @IBAction func gotoFluidsBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "gotoOil", sender: self)

    }
    
    var spartNameToGo :String = ""
    
    @IBAction func gotoAfshaBtn(_ sender: Any) {
        self.spartNameToGo = "العفشة"
        self.performSegue(withIdentifier: "gotoDetailSpart", sender: self)
    }
    
    @IBAction func gotoMotorBtn(_ sender: Any) {
        self.spartNameToGo = "المحرك"
        self.performSegue(withIdentifier: "gotoDetailSpart", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoDetailSpart"{
            let destVC = segue.destination as! detailSpartViewController
            destVC.spartName = self.spartNameToGo
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
