import Foundation
import UIKit

class NewViewController: UIViewController {

	@IBOutlet weak var foodImage: UIImageView!
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var creditCardField: UITextField!
	@IBOutlet weak var date1: UITextField!
	@IBOutlet weak var date2: UITextField!

	@IBOutlet weak var cameraButton: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()

		self.navigationController?.navigationBarHidden = false
		self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.translucent = true
		self.navigationController?.view.backgroundColor = UIColor.clearColor()
		self.navigationController?.navigationBar.backgroundColor = UIColor.clearColor()

		self.creditCardField.secureTextEntry = true

		self.scrollView.keyboardDismissMode = .Interactive
		self.scrollView.contentSize.height = 300
		self.scrollView.contentInset.bottom = 300


		let datePicker = UIDatePicker()
		datePicker.setDate(NSDate(), animated: false)
		datePicker.datePickerMode = .Date;
		datePicker.addTarget(self, action: #selector(NewViewController.dateTextField(_:)), forControlEvents: .ValueChanged)
		date1.inputView = datePicker

		let datePicker2 = UIDatePicker()
		datePicker2.setDate(NSDate(), animated: false)
		datePicker2.datePickerMode = .Date;
		datePicker2.addTarget(self, action: #selector(NewViewController.dateTextField2(_:)), forControlEvents: .ValueChanged)
		date2.inputView = datePicker2
	}

	func dateTextField(sender: AnyObject) {
		let picker: UIDatePicker = (date1.inputView as! UIDatePicker)
		picker.maximumDate = NSDate()
		let dateFormat: NSDateFormatter = NSDateFormatter()
		let eventDate: NSDate = picker.date
		dateFormat.dateFormat = "dd/MM/yyyy"
		let dateString: String = dateFormat.stringFromDate(eventDate)
		date1.text = "\(dateString)"
	}

	func dateTextField2(sender: AnyObject) {
		let picker: UIDatePicker = (date2.inputView as! UIDatePicker)
		picker.maximumDate = NSDate()
		let dateFormat: NSDateFormatter = NSDateFormatter()
		let eventDate: NSDate = picker.date
		dateFormat.dateFormat = "dd/MM/yyyy"
		let dateString: String = dateFormat.stringFromDate(eventDate)
		date2.text = "\(dateString)"
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		let one = CGPointMake( foodImage.bounds.origin.x, foodImage.bounds.origin.y);
		let two = CGPointMake( foodImage.bounds.origin.x, foodImage.bounds.height);

		let three = CGPointMake( foodImage.bounds.width, foodImage.bounds.height-35);
		let four = CGPointMake( foodImage.bounds.width, foodImage.bounds.origin.y);
		let path = CGPathCreateMutable();
		CGPathMoveToPoint(path, nil,one.x, one.y);
		CGPathAddLineToPoint(path,nil,two.x, two.y);
		CGPathAddLineToPoint(path,nil,three.x, three.y);
		CGPathAddLineToPoint(path,nil,four.x, four.y);
		let maskLayer = CAShapeLayer()
		maskLayer.frame = foodImage.bounds
		maskLayer.path = path
		foodImage.layer.mask = maskLayer
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func cameraButtonClick(sender: AnyObject) {
		let cameraViewControllerObj = self.storyboard?.instantiateViewControllerWithIdentifier("CameraView") as! CameraViewController
		self.navigationController?.pushViewController(cameraViewControllerObj, animated: true)
	}
}

class UIImageViewTinted: UIImageView {
	override func layoutSubviews() {
		super.layoutSubviews()
		self.image = self.image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
	}
}
