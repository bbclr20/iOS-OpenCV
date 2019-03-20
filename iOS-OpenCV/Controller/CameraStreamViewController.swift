//
//  CameraStreamViewController.swift
//  iOS-OpenCV
//
//  Created by ben on 2019/3/18.
//  Copyright © 2019 ben. All rights reserved.
//

import UIKit
import AVFoundation

class CameraStreamViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let session = AVCaptureSession()
    let deviceInput = DeviceInput()
    let output = AVCaptureVideoDataOutput()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set imageView
        imageView.contentMode = .scaleAspectFill
        let rotationAngle = CGFloat(Double.pi/2)
        imageView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        
        // set input, output and session
        output.setSampleBufferDelegate(self, queue: DispatchQueue(label: "video-stream"))
        output.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String : kCVPixelFormatType_32BGRA]
        
//        session.sessionPreset = AVCaptureSession.Preset.hd1280x720
        session.sessionPreset = AVCaptureSession.Preset.vga640x480
//        session.sessionPreset = AVCaptureSession.Preset.cif352x288
        
        session.addInput(deviceInput.backWildAngleCamera!)
        session.addOutput(output)
        session.startRunning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func toggledevice(_ sender: UISwitch) {
        session.beginConfiguration()
        session.removeInput(session.inputs.last!)
        
        if sender.isOn {
            session.addInput(deviceInput.backWildAngleCamera!)
        } else {
            session.addInput(deviceInput.frontWildAngleCamera!)
        }
        
        session.commitConfiguration()
    }
}

// MARK: - AVCaptureVideoDataOutputSampleBufferDelegate

extension CameraStreamViewController: AVCaptureVideoDataOutputSampleBufferDelegate {

    func captureOutput(_ output: AVCaptureOutput,
                       didOutput sampleBuffer: CMSampleBuffer,
                       from connection: AVCaptureConnection) {
        
        guard let buffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            print("Fail to get pixel buffer")
            return
        }
        
        // MARK: - process the buffer with OpenCVWrapper
        if let captureImage = buffer.toUIImage() {
            DispatchQueue.main.async {
                let grayImage = OpenCVWrapper.color2Gray(captureImage, alphaExist: true)
                self.imageView.image = grayImage
//                self.imageView.image = captureImage
            }
        }
    }
}

