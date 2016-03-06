//
//  AddAedPhotoVC.swift
//  AED Locator
//
//  Created by Sean Hickey on 3/5/16.
//  Copyright © 2016 GeoCode2016. All rights reserved.
//

import UIKit
import AVFoundation

class AddAedPhotoVC: UIViewController {

    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var stillImageOutput : AVCaptureStillImageOutput? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        
        let session = AVCaptureSession()
        session.sessionPreset = AVCaptureSessionPresetHigh
        
        let viewLayer = cameraView.layer
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = viewLayer.bounds
        viewLayer.addSublayer(previewLayer)
        
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        // TODO : Handle camera not found error
        let input = try! AVCaptureDeviceInput(device: device)
        
        session.addInput(input)
        
        stillImageOutput = AVCaptureStillImageOutput()
        let outputSettings = [ AVVideoCodecKey : AVVideoCodecJPEG ]
        stillImageOutput!.outputSettings = outputSettings
        
        session.addOutput(stillImageOutput)
        
        session.startRunning()
    }
    
    @IBAction func takePhotoTapped(sender: AnyObject) {
        
        var videoConnection : AVCaptureConnection?
        for c in stillImageOutput!.connections {
            let connection = c as! AVCaptureConnection
            for p in connection.inputPorts {
                let port = p as! AVCaptureInputPort
                if port.mediaType == AVMediaTypeVideo {
                    videoConnection = connection
                    break
                }
            }
            if (videoConnection != nil) { break }
        }
        
        stillImageOutput!.captureStillImageAsynchronouslyFromConnection(videoConnection!) { (sampleBuffer, error) -> Void in
            let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
            let image = UIImage(data: imageData)
            self.imageView.image = image
        }
        
    }
    
}
