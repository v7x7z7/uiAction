
import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let pickerData = ["Раздел 1", "Раздел 2", "Раздел 3"]
    var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Создаем кнопку Поделиться
        let shareButton = UIButton(type: .system)
        shareButton.setTitle("Поделиться", for: .normal)
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        shareButton.frame = CGRect(x: 100, y: 200, width: 150, height: 50)
//        shareButton.center = self.view.center
        view.addSubview(shareButton)
        
        // Создаем UIPickerView
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.frame = CGRect(x: 50, y: 300, width: 300, height: 150)
        view.addSubview(pickerView)
        //nkjn
    }
    
    @objc func shareButtonTapped() {
        let items: [Any] = ["Раздел поделиться"]
        
        // Создаем UIActivityViewController
        let activityVC1 = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        // Показываем его
        present(activityVC1, animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // 1 столбец
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 2 {
            let items: [Any] = ["Выбран Раздел 3 "]
//            let items = "Вы выбрали Раздел 3! "
            
            let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
            present(activityVC, animated: true, completion: nil)
        }
    }
}




