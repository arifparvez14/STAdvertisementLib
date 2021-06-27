# STAdvertisementLib

How To Use

Insall using pod as: pod 'STAdvertisementLib', :git => 'https://github.com/arifparvez14/STAdvertisementLib.git', :tag => '0.0.6'

1. Make a view subclass of STAdvertisementLib
2. Configure as follow and show add.

addView.configureView(addType: .banner) {
     [weak self] (crossButtonTapped) in
     self?.addView.removeFromSuperview()
}
