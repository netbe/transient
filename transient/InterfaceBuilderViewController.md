
# Learning:

* IB preview will use initWithFrame, prepareForInterfaceBuilder, read the xib values, layoutSubviews, drawRect
* Running app will use initWihCoder, awakeFromNib, viewDidLoad, layoutSubviews, drawRect
* Storyboard does not show customView

Order
1. initWihCoder || initWithFrame
2. awakeFromNib || prepareForInterfaceBuilder
3. viewDidLoad
4. layoutSubviews || updateConstraints
5. drawRect

* IBInspectable values are used in xib

