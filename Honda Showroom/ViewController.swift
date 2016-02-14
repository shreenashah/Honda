//
//  ViewController.swift
//  Honda Showroom
//
//  Created by Rami Taibah on 2/4/16.
//  Copyright © 2016 Studio 966. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate
{
    @IBOutlet weak var btnRed: UIButton!
    @IBOutlet weak var btn2: UIButton!

    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var pgc: UIPageControl!
    @IBOutlet weak var btnBlack: UIButton!
    @IBOutlet weak var btnGreen: UIButton!
    @IBOutlet weak var btnGrey: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnWhite: UIButton!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var btnLang: UIBarButtonItem!
    
    var selectedCarIndex=0
    var crvArray=["crv-01-000000","crv-02","crv-03","crv-04","crv-05","crv-06","crv-07","crv-09","crv-10","crv-11","crv-12","crv-13","crv-14","crv-15"]
   
    var pilotArray=["pilot-01-0A103E","pilot-02","pilot-03","pilot-04","pilot-05","pilot-06","pilot-07","pilot-08","pilot-09","cpilot-10","pilot-11","pilot-12","pilot-13","pilot-14","pilot-15"]
    
    @IBAction func LanguageAction(sender: AnyObject)
    {
        let alertController = UIAlertController(title: "", message: "", preferredStyle: .ActionSheet)
        let ok = UIAlertAction(title: "English", style: .Default, handler: { (action) -> Void in
            print("English Button Pressed")
        })
        let cancel = UIAlertAction(title: "Urdu", style: .Default, handler: { (action) -> Void in
            print("Urdu Button Pressed")
        })
        
        
        alertController.addAction(ok)
        alertController.addAction(cancel)
        
        
        if let popoverController = alertController.popoverPresentationController
        {
            popoverController.barButtonItem = sender as? UIBarButtonItem
        }
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    var selectedColorIndex=1
    
    @IBAction func ColorAction(sender: AnyObject)
    {
        self.ToresetAllButton()
        
        sender.layer.borderWidth=2.0
        sender.layer.borderColor=UIColor.redColor().CGColor
        
        selectedColorIndex=sender.tag
        
        dispatch_async(dispatch_get_main_queue(),{
        
        self.ToSetImages()
        self.collectionView.reloadData()
        
        self.ToLoadPdf()
            
    })
        
    }
    func ToLoadPdf()
    {
        let pdfLoc = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("honda-CR-V LX-2WD", ofType:"pdf")!)
        let request = NSURLRequest(URL: pdfLoc);
        self.webView.loadRequest(request);
    }
    func ToresetAllButton()
    {
        btn3.layer.borderColor=UIColor.lightGrayColor().CGColor
        btn3.layer.borderWidth=1.0
        
        btnRed.layer.borderWidth=0.0
        btnGreen.layer.borderWidth=0.0
        btnGrey.layer.borderWidth=0.0
        btnBlack.layer.borderWidth=0.0
        btnWhite.layer.borderWidth=0.0
        btn1.layer.borderWidth=0.0
        btn2.layer.borderWidth=0.0
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.ToSetButtonColors()
        self.ToSetCornerRadius()
        self.ToSetImages()
        self.ToLoadPdf()
        
        if selectedCarIndex==0
        {
            self.pgc.numberOfPages=crvArray.count
        }
        else
        {
            self.pgc.numberOfPages=pilotArray.count
        }
    }
    func ToSetButtonColors()
    {
        if selectedCarIndex==0
        {
            
            btnWhite.backgroundColor=UIColor(netHex:0x000000)
            btnGrey.backgroundColor=UIColor(netHex:0x2B2B2B)
            btnRed.backgroundColor=UIColor(netHex:0xc4F4642)
            btnGreen.backgroundColor=UIColor(netHex:0x6C87A4)
            btnBlack.backgroundColor=UIColor(netHex:0x440A07)
            btn1.backgroundColor=UIColor(netHex:0x742511)
            btn2.backgroundColor=UIColor(netHex:0x767676)
            btn3.backgroundColor=UIColor(netHex:0xFBFBFB)
        }
        else
        {
            btnWhite.backgroundColor=UIColor(netHex:0x0A103E)
            btnGrey.backgroundColor=UIColor(netHex:0x2B2B2B)
            btnRed.backgroundColor=UIColor(netHex:0x2B3D2B)
            btnGreen.backgroundColor=UIColor(netHex:0x3A191C)
            btnBlack.backgroundColor=UIColor(netHex:0x4E4E4E)
            btn1.backgroundColor=UIColor(netHex:0x6C87A4)
            btn2.backgroundColor=UIColor(netHex:0x767676)
            btn3.backgroundColor=UIColor(netHex:0xFBFBFB)
        }
    }
    func ToSetCornerRadius()
    {
        btnWhite.layer.cornerRadius=btnWhite.frame.size.height/2
        btnBlack.layer.cornerRadius=btnWhite.frame.size.height/2
        btnRed.layer.cornerRadius=btnWhite.frame.size.height/2
        btnGrey.layer.cornerRadius=btnWhite.frame.size.height/2
        btnGreen.layer.cornerRadius=btnWhite.frame.size.height/2
        btn1.layer.cornerRadius=btnWhite.frame.size.height/2
        btn2.layer.cornerRadius=btnWhite.frame.size.height/2
        btn3.layer.cornerRadius=btnWhite.frame.size.height/2
        
        btn3.layer.borderColor=UIColor.lightGrayColor().CGColor
        btn3.layer.borderWidth=1.0
        
    }
    func ToSetImages()
    {
        if selectedCarIndex==0
        {
            switch (selectedColorIndex)
            {
            case 1:
                crvArray[0]="crv-01-000000"
                break
            case 2:
               crvArray[0]="crv-01-2B2B2B"
                break
            case 3:
              crvArray[0]="crv-01-4F4642"
                break
            case 4:
              crvArray[0]="crv-01-6C87A4"
                break
            case 5:
                crvArray[0]="crv-01-440A07"
                break
            case 6:
                crvArray[0]="crv-01-742511"
                break
            case 7:
                crvArray[0]="crv-01-767676"
                break
            case 8:
                crvArray[0]="crv-01-FBFBFB"
                break
                
            default: break
                
            }

        }
        else
        {
            switch (selectedColorIndex)
            {
            case 1:
                pilotArray[0]="pilot-01-0A103E"
                break
            case 2:
                pilotArray[0]="pilot-01-2B2B2B"
                break
            case 3:
                pilotArray[0]="pilot-01-2B3D2B"
                break
            case 4:
                pilotArray[0]="pilot-01-3A191C"
                break
            case 5:
                pilotArray[0]="pilot-01-4E4E4E"
                break
            case 6:
                pilotArray[0]="pilot-01-6C87A4"
                break
            case 7:
                pilotArray[0]="pilot-01-767676"
                break
            case 8:
                pilotArray[0]="pilot-01-FBFBFB"
                break
                
            default: break
                
            }
 
        }
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if selectedCarIndex==0
        {
        return crvArray.count
        }
        else
        {
          return pilotArray.count
        }
        
        
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell:ImageCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ImageCollectionViewCell
       
        var name=""
        
        if selectedCarIndex==0
        {
             name=crvArray[indexPath.row]
        }
        else
        {
             name=pilotArray[indexPath.row]
        }
        
        if indexPath.row==0
        {
            name=name+".png"
        }
        else
        {
            name=name+".jpg"
        }
        cell.imgCar.image=UIImage(named: name)
        return cell
        
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        let gal:GalleryCollectionViewController=self.storyboard?.instantiateViewControllerWithIdentifier("GalleryCollectionViewController") as! GalleryCollectionViewController
        if selectedCarIndex==0
        {
            gal.arr=crvArray
        }
        else
        {
           gal.arr=pilotArray
        }
        
        self.navigationController?.pushViewController(gal, animated: true)
    }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        print(page)
        self.pgc.currentPage = page
    }
    
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

