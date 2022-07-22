//
//  CameraViewController.swift
//  Ctrl C, Ctrl Free
//
//  Created by KoolPGHome on 7/22/22.
//

import UIKit
import AVFoundation
import SafariServices



class CameraViewController: UIViewController {
    

    @IBOutlet var textLabel: UILabel!
    
    
    let firstViewController = FirstViewController()
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    public var barcode: String  = ""
   
    init(){
        barcode = "testing barcode"
        super.init(nibName: nil, bundle: nil)
    }
    init(barcode:String){
        self.barcode = barcode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.barcode = "Error"
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        captureSession =  AVCaptureSession()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else{
                print("Your device is not applicable for video processing")
                return
            }
            let videoInput: AVCaptureDeviceInput
            
            do {
                videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
            }
            catch{
                print("Your device cannot give Video Input!")
                return
            }
            
            if (self.captureSession.canAddInput(videoInput)) {
                self.captureSession.addInput(videoInput)
            }
            else {
                print("Your device cannot add input in capture session")
                return
            }
            
            let metadataOutput = AVCaptureMetadataOutput()
            
            if(self.captureSession.canAddOutput(metadataOutput)) {
                self.captureSession.addOutput(metadataOutput)
                
                metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                metadataOutput.metadataObjectTypes = [.ean8, .ean13, .pdf417, .qr, .upce]
            }
            else {
                return
            }
            
            self.previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
            self.previewLayer.frame = self.view.layer.bounds
            self.view.layer.addSublayer(self.previewLayer)
            self.captureSession.startRunning()
        }
        //firstViewController.inputBarcode = CameraViewController.barcode
        
    }
    func failed(){
        let ac = UIAlertController(title: "Scanner not supported", message: "Please use a device with a camera. Because this device does not support scanning a code", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        if(captureSession?.isRunning == false){
            captureSession.startRunning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        
        if(captureSession?.isRunning == true){
            captureSession.stopRunning()
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }

}

extension CameraViewController : AVCaptureMetadataOutputObjectsDelegate {
    
    public func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        captureSession.stopRunning()

        if let metadataObject = metadataObjects.first {

            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject

            else { return }

            guard let stringValue = readableObject.stringValue

            else { return }

            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(barcode: stringValue)
            
        }

        dismiss(animated: true)
    }

  public func found(barcode: String) {
      var barCode = barcode
      Barcode.barcode = barcode
       //print("first\(barCode)")
      var dict = ["06877353052":"Pacifica Vegan Longwear Eyeliner",
                   "068773530523":"Pacifica Vegan Waterproof Eyeliner",
                   "068773530524":"Pacifica Vegan Care Balm",
                   "068773530525":"Pacifica Enlightened Gloss",
                   "0071748921025":"Milani Flora Tinted Lip Balm",
                   "0071748921026":"Milani Easy Brow Pencil",
                   "0071748921027":"Milani Precision Brow Pencil",
                   "0071748921028":"Milani Baked Blush",
                   "0609332833258":"e.l.f. Tinted Lip Oil",
                   "0609332833259":"e.l.f. BB Cream SPF 20",
                   "0609332833257":"e.l.f. Pure Skin Toner",
                   "0609332833256":"e.l.f. Pure Skin Moisturizer",
                   "0609332833255":"e.l.f. Blush",
                   "0609332833254":"e.l.f. Putty Bronzer",
                   "0609332833253":"e.l.f. Putty Blush",
                   "5060544973494":"Ciaté London Wonderland Mascara",
                   "079625013115":"Eco Tools makeup brush shampoo"  ]                                              
      
      var keys: Dictionary<UIKey, NSValue>.Keys
      for (key, value) in dict {
          if barCode == key{
              if let text: String = textLabel.text{
                  textLabel.text = "Product is cruelty free"
                  self.view.bringSubviewToFront(textLabel)
              }
              
          }
      }

    }
       

    
    
        
    }
    
    
    

