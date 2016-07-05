import Foundation
import UIKit

class CameraViewController: UIViewController {

	var picker = UIImagePickerController()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationController?.navigationBarHidden = true

//		self.picker = UIImagePickerController()
//		self.picker.sourceType = .Camera
//		self.picker.cameraCaptureMode = .Photo;
//		self.picker.cameraDevice = .Rear;
//		self.picker.showsCameraControls = false
//		self.picker.navigationBarHidden = true
//		self.picker.toolbarHidden = true
////		self.picker.fullscre = true
//		self.picker.cameraOverlayView = self.view;
//		self.presentViewController(self.picker, animated: false, completion: nil)
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

	}
	@IBAction func back(sender: AnyObject) {
		self.navigationController?.navigationBarHidden = false
		self.navigationController?.popViewControllerAnimated(true)
	}
}

class CircleView: UIView {
	override func layoutSubviews() {
		super.layoutSubviews()
		self.layer.cornerRadius = self.frame.width/2
	}
}
