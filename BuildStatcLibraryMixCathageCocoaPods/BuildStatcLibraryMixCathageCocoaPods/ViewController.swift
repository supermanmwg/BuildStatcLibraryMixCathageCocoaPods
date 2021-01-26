//
//  ViewController.swift
//  BuildStatcLibraryMixCathageCocoaPods
//
//  Created by 维光孟 on 2021/1/25.
//

import UIKit
import Lottie
import MarqueeLabel

class ViewController: UIViewController {
    let animationView = AnimationView()
    let slider = UISlider()
    var displayLink: CADisplayLink?
    var customImageView:SDAnimatedImageView!
    var sdImageView: UIImageView!
    private var nameLabel: MarqueeLabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lottieTest()
        sdTest()
        afTest()
        marqueeLabelTest()
    }
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      animationView.play(fromProgress: 0,
                         toProgress: 1,
                         loopMode: LottieLoopMode.playOnce,
                         completion: { (finished) in
                          if finished {
                            print("Animation Complete")
                          } else {
                            print("Animation cancelled")
                          }
      })
    }
    
    func marqueeLabelTest() {
        nameLabel = MarqueeLabel(frame: CGRect(x: 10, y: 150, width: 50, height: 17), rate: 30, fadeLength: 10)
        nameLabel.textColor = UIColor.green
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.contentMode = .center
        nameLabel.textAlignment = .center
        nameLabel.text = "marqueeLabelTest is a label!!!"
        view.addSubview(nameLabel)
    }
    
    func afTest() {
        let manager = AFURLSessionManager(sessionConfiguration: URLSessionConfiguration.default)
        let request = URLRequest(url: URL(string: "http://httpbin.org/get")!)
        let dataTask = manager.dataTask(with: request, uploadProgress: nil, downloadProgress: nil) { (response, responseObject, error) in
            guard let error = error else {
                print("response:\(response)")
                print("response object:\(responseObject)")
                return
            }
            print(error)
        }
        dataTask.resume()
    }
    
    func sdTest() {
        SDImageCodersManager.shared.addCoder(SDImageWebPCoder.shared)
        customImageView = SDAnimatedImageView(frame: CGRect(x: 20, y: 100, width: 60, height: 40))
        customImageView.clipsToBounds = true
        customImageView.contentMode = .scaleAspectFill
        view.addSubview(customImageView)
        var urlString = "http://apng.onevcat.com/assets/elephant.png"
//        urlString = "http://www.ioncannon.net/wp-content/uploads/2011/06/test2.webp"
        customImageView.sd_setImage(with: URL(string: urlString)) { (image, error, type, url) in
            print("1,image:\(image), error:\(error)")
        }
      
        urlString = "http://www.ioncannon.net/wp-content/uploads/2011/06/test2.webp"
        sdImageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 60, height: 40))
        view.addSubview(sdImageView)
        sdImageView.sd_setImage(with: URL(string: urlString)) { (image, error, type, url) in
            print("2,image:\(image), error:\(error)")
        }
    }
    


    func lottieTest() {
        let animation = Animation.named("LottieLogo1", subdirectory: "TestAnimations")
        
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
      
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0
        view.addSubview(slider)
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        animationView.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -12).isActive = true
        animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        animationView.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        
        /// *** Keypath Setting
        
        let redValueProvider = ColorValueProvider(Color(r: 1, g: 0.2, b: 0.3, a: 1))
        animationView.setValueProvider(redValueProvider, keypath: AnimationKeypath(keypath: "Switch Outline Outlines.**.Fill 1.Color"))
        animationView.setValueProvider(redValueProvider, keypath: AnimationKeypath(keypath: "Checkmark Outlines 2.**.Stroke 1.Color"))
        
        /// Slider
        slider.heightAnchor.constraint(equalToConstant: 40).isActive = true
        slider.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        slider.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        slider.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -12).isActive = true
        slider.addTarget(self, action: #selector(updateAnimation(sender:)), for: .valueChanged)
        slider.addTarget(self, action: #selector(sliderFinished), for: .touchUpInside)
        
        /// Play Animation
        
        /// Create a display link to make slider track with animation progress.
        displayLink = CADisplayLink(target: self, selector: #selector(animationCallback))
        displayLink?.add(to: .current,
                        forMode: RunLoop.Mode.default)
    }
    
    @objc func updateAnimation(sender: UISlider) {
      animationView.currentProgress = CGFloat(sender.value)
    }
    
    @objc func sliderFinished() {
  //    animationView.play(fromProgress: 0,
  //                       toProgress: 1,
  //                       loopMode: LottieLoopMode.playOnce,
  //                       completion: { (finished) in
  //                        if finished {
  //                          print("Animation Complete")
  //                        } else {
  //                          print("Animation cancelled")
  //                        }
  //    })
    }
    
    @objc func animationCallback() {
      if animationView.isAnimationPlaying {
        slider.value = Float(animationView.realtimeAnimationProgress)
      }
    }
}

