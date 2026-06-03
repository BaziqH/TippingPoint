//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//
    
extension UIColor {
    convenience init(hex: String, alpha: Double) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        // Add # if missing
        if !hexString.hasPrefix("#") {
            hexString = "#" + hexString
        }
        
        hexString.removeFirst()

        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)

        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
