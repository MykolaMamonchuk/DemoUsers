//
//  SGH.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import NVActivityIndicatorView

public class SGH {
    public static let sI = SGH()
    public let activityIndicator = NVActivityIndicatorView(frame: UIScreen.main.bounds, type: .ballRotateChase, color: Colors.AccentM, padding: 100)

    public func startIndicator() {
        let topView = UIApplication.shared.topViewController?.navigationController?.topViewController?.view
        if topView == activityIndicator.superview { return }
        activityIndicator.backgroundColor = Colors.AccentM.withAlphaComponent(0.1)
        activityIndicator.startAnimating()
        topView?.addSubview(activityIndicator)
    }

    public func stopIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }

    /**
     Returned plural string

     - returns:
     String

     - parameters:
     Integer, String, String, String

     An example of using a *function*
     ````
     SELH.sI.pluralForm(1, "День", "Дня", "Днів")

     ````
     */
    func pluralForm(_ i: Int, _ form1: String, _ form2: String, _ form3: String) -> String {
        let numberH = abs(i) % 100
        let numberT = numberH % 10
        if numberH > 10, numberH < 20 { return form3 }
        if numberT > 1, numberT < 5 { return form2 }
        if numberT == 1 { return form1 }
        return form3
    }

    // MARK: -

    // MARK: VARIABLEs

    // MARK: -

    var isDarkMode: UIUserInterfaceStyle {
        get {
            return (UserDefaults().getNSUDAnyByKey(key: UDKey.UserAppMode) as? Bool ?? false) ? .dark : .light
        }
        set {
            UserDefaults().saveNSUDAnyByKey(value: newValue == .dark ? true : false, key: UDKey.UserAppMode)
        }
    }
}
