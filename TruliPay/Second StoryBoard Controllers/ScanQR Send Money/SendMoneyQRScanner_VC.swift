//
//  SendMoneyQRScanner_VC.swift
//  TruliPay
//
//  Created by Mobile on 13/04/22.
//

import UIKit
import AVKit
import MercariQRScanner
class SendMoneyQRScanner_VC: UIViewController,AVCaptureVideoDataOutputSampleBufferDelegate, QRScannerViewDelegate {
    func qrScannerView(_ qrScannerView: QRScannerView, didFailure error: QRScannerError) {
        print("error in scanner-=-",error,qrScannerView)
    }
    
    func qrScannerView(_ qrScannerView: QRScannerView, didSuccess code: String) {
        print("code in scanner-=-",code)
    }
    
    func qrScannerView(_ qrScannerView: QRScannerView, didChangeTorchActive isOn: Bool) {
        print("code in scanner-=-",isOn)
    }
    

    @IBOutlet weak var qrScannerView: QRScannerView!
    @IBOutlet weak var uniqueIdTextField: UITextField!
    @IBOutlet weak var payNowButton: UIButton!
    
    let captureSession = AVCaptureSession()
        var previewLayer:CALayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        setActions()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "Send Money")
//        scannerView()
        DispatchQueue.main.async {
            self.QRScanner()
        }
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUi()
    }
    func setUi(){
        setRoundCorners(view: payNowButton)
        //scannerView()
    }
    
    func setActions(){
        payNowButton.actionBlock {
            self.pushOnly(Controllers.OtherWalletSendMoneyTo_EnterAmount_VC)
        }
        
    }
    func scannerView(){
        let captureSession = AVCaptureSession()

            guard let captureDevice = AVCaptureDevice.default(for: .video),
                let input = try? AVCaptureDeviceInput(device: captureDevice) else {return}

            captureSession.addInput(input)
            captureSession.startRunning()

            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            previewLayer.frame = qrScannerView.frame
        
           // previewLayer.videoGravity = .resizeAspectFill
        
        qrScannerView.layer.addSublayer(previewLayer)
        self.previewLayer.frame = self.qrScannerView.layer.bounds
    }
    func QRScanner(){
        
        let qrScanner = QRScannerView(frame: self.qrScannerView.bounds)
                   self.qrScannerView.addSubview(qrScanner)
                   qrScanner.configure(delegate: self)
                   qrScanner.focusImage = nil
        
                   qrScanner.startRunning()
    }
}
