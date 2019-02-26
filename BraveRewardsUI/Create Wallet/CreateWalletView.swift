/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import UIKit

public class CreateWalletView: UIView {
  
  private struct UX {
    static let prefixTextColor = UIColor(white: 1.0, alpha: 0.75)
    static let titleTextColor = UIColor.white
    static let bodyTextColor = UIColor.white
    static let learnMoreTextColor = Colors.blue500
    static let createWalletButtonHeight = 40.0
    static let learnMoreButtonHeight = 30.0
  }
  
  let backgroundView = GradientView.purpleRewardsGradientView()
  
  let watermarkImageView = UIImageView(image: UIImage(frameworkResourceNamed: "bat-watermark"))
  
  let prefixLabel = UILabel().then {
    $0.textColor = UX.prefixTextColor
    $0.font = .systemFont(ofSize: 16.0)
    $0.textAlignment = .center
    $0.text = BATLocalizedString("RewardsOptInPrefix", "Get ready to experience the next Internet.")
    $0.numberOfLines = 0
  }
  
  let batLogoImageView = UIImageView(image: UIImage(frameworkResourceNamed: "bat-logo"))
  
  let titleLabel = UILabel().then {
    $0.textColor = UX.titleTextColor
    $0.font = .systemFont(ofSize: 28.0, weight: .medium)
    $0.textAlignment = .center
    $0.attributedText = {
      let title = NSMutableAttributedString(string: BATLocalizedString("RewardsOptInTitle", "Brave Rewards™"))
      if let trademarkRange = title.string.range(of: "™") {
        title.addAttributes(
          [
            .font: UIFont.systemFont(ofSize: 14.0),
            .baselineOffset: 10.0
          ],
          range: NSRange(trademarkRange, in: title.string)
        )
      }
      return title
    }()
  }
  
  let descriptionLabel = UILabel().then {
    $0.textColor = UX.bodyTextColor
    $0.font = .systemFont(ofSize: 16.0)
    $0.textAlignment = .center
    $0.text = BATLocalizedString("RewardsOptInDescription", "Get paid for viewing ads and pay it forward to support your favorite content creators.")
    $0.numberOfLines = 0
  }
  
  public let createWalletButton = ActionButton(type: .system).then {
    $0.setTitle(BATLocalizedString("RewardsOptInJoinTitle", "Join Rewards").uppercased(), for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .bold)
  }
  
  public let learnMoreButton = UIButton(type: .system).then {
    $0.setTitle(BATLocalizedString("RewardsOptInLearnMore", "Learn More").uppercased(), for: .normal)
    $0.tintColor = UX.learnMoreTextColor
    $0.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .medium)
  }
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(backgroundView)
    addSubview(watermarkImageView)
    addSubview(prefixLabel)
    addSubview(batLogoImageView)
    addSubview(titleLabel)
    addSubview(descriptionLabel)
    addSubview(createWalletButton)
    addSubview(learnMoreButton)
    
    backgroundView.snp.makeConstraints {
      $0.edges.equalTo(self)
    }
    watermarkImageView.snp.makeConstraints {
      $0.top.equalTo(self)
      $0.leading.equalTo(self).offset(10.0)
    }
    prefixLabel.snp.makeConstraints {
      $0.top.leading.trailing.equalTo(self).inset(30.0)
    }
    batLogoImageView.snp.makeConstraints {
      $0.top.equalTo(self.prefixLabel.snp.bottom).offset(10.0)
      $0.centerX.equalTo(self)
    }
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(self.batLogoImageView.snp.bottom).offset(10.0)
      $0.leading.trailing.equalTo(self).inset(30.0)
    }
    descriptionLabel.snp.makeConstraints {
      $0.top.equalTo(self.titleLabel.snp.bottom).offset(15.0)
      $0.leading.trailing.equalTo(self.titleLabel)
    }
    createWalletButton.snp.makeConstraints {
      $0.top.equalTo(self.descriptionLabel.snp.bottom).offset(25.0)
      $0.leading.trailing.equalTo(self).inset(50.0)
      $0.height.equalTo(UX.createWalletButtonHeight)
    }
    learnMoreButton.snp.makeConstraints {
      $0.top.equalTo(self.createWalletButton.snp.bottom).offset(30.0)
      $0.centerX.equalTo(self)
      $0.height.equalTo(UX.learnMoreButtonHeight)
      $0.bottom.equalTo(self).offset(-20.0)
    }
  }
  
  @available(*, unavailable)
  required init(coder: NSCoder) {
    fatalError()
  }
}
