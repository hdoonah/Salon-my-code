//
//  ViewController.swift
//  Final
//
//  Created by HUDA ALSHAMMARI on 03/08/1443 AH.
//

import UIKit

class HomeVC: UIViewController{
    
    
    @IBOutlet weak var posterView: UIView!{
        didSet{
            posterView.layer.shadowColor = UIColor.gray.cgColor
            posterView.layer.shadowOpacity = 0.3
            posterView.layer.shadowOffset =
            CGSize(width: 5, height: 5)
        }
    }
    
    @IBOutlet weak var search: UIButton!{
                didSet{
                    search.layer.masksToBounds = false
//                    search.layer.cornerRadius = search.frame.height/3
                    search.clipsToBounds = true
                    search.layer.borderColor = UIColor(named: "Buttons")!.cgColor
                }
            }
    @IBAction func search(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Search") as? SearchVC
        present(vc!, animated: true, completion: nil)
//        navigationController?.pushViewController(vc!, animated: true)
        
    }
    

    
    @IBOutlet weak var Explore: UIButton!
    
    @IBOutlet weak var Services: UICollectionView!
    
    @IBOutlet weak var Salon: UICollectionView!
    
    @IBOutlet weak var topServices: UICollectionView!
    
    let ServicesCell = "cell1"
    let salonCell = "cell2"
    let topCell = "cell3"
    
    //service collection
    var serviceArry = [UIImage(named:"Hair"), UIImage(named:"nail"), UIImage(named:"facial"), UIImage(named:"coloring"), UIImage (named:"spa"), UIImage(named:"waxing"),UIImage (named:"makeup"), UIImage(named:"message")]
    var serviceNameArry:[String] = ["Haircut","Nails","Facial","Coloring","Spa","Waxing", "Makeup","Message"]
    
    //salon collection
    var salonArry = [UIImage(named:"11"), UIImage(named:"22"), UIImage(named:"33"), UIImage(named:"44")]
    var salonNameArry:[String] = ["Vernis","Vogue","Rojina","ALo"]
    
    //top collection
    
    var topImageArry = [UIImage(named:"wavy"), UIImage(named:"Manicure"),UIImage(named:"Manicure")]
    var centerArry:[String] = ["Vernis","Vogue","hello"]
    var topNameArry:[String] = ["Wavy Hair","Manicure","Hair Cut"]
    var priceArry: [String] = ["150 SAR","75 SAR", "40 SAR"]
    var rateArry: [String] = ["★4.8","★5","★7"]
    var reviewArry: [String] = ["(365)" , "(117)" , "(100)"]
    
    
    var lastIndexActive: IndexPath = [1,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Services.delegate = self
        Services.dataSource = self
        Salon.delegate = self
        Salon.dataSource = self
        topServices.delegate = self
        topServices.dataSource = self
    }
}

extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.Services {
            return serviceArry.count
        } else if collectionView == self.Salon {
            return salonArry.count
        } else if collectionView == self.topServices {
            return topImageArry.count
        } else {
            return 0
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.Services {
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! ServicesCell
            cell1.serviceImage.image = serviceArry[indexPath.row]
            cell1.serviceName.text = serviceNameArry[indexPath.row]
            return cell1
            
        } else if collectionView == self.Salon {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! salonCell
            cell2.salonImage.image = salonArry[indexPath.row]
            cell2.salonName.text = salonNameArry[indexPath.row]
            return cell2
            
        } else if collectionView == self.topServices {
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! topCell
            cell3.topImage.image = topImageArry[indexPath.row]
            cell3.salonName.text = centerArry[indexPath.row]
            cell3.topName.text = topNameArry[indexPath.row]
            cell3.Price.text = priceArry[indexPath.row]
            cell3.Rate.text = rateArry[indexPath.row]
            cell3.Review.text = reviewArry[indexPath.row]
            return cell3
            
        } else {
            return UICollectionViewCell()
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.topServices {
            return CGSize(width: 196, height: 318)
        } else {
            return CGSize(width: 82, height: 85)
            
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.lastIndexActive != indexPath {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "NailVC") as? NailVC
//            present(vc!, animated: true, completion: nil)
            navigationController?.pushViewController(vc!, animated: true)

            
            self.lastIndexActive = indexPath
            
            print(lastIndexActive)
        }
    }
}

