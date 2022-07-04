//
//  MovieDetailTransitioning.swift
//  MovieBox
//
//  Created by Macbook on 30/06/2022.
//  Copyright © 2022 Backbase. All rights reserved.
//

import UIKit

// swiftlint:disable force_cast
class MovieDetailTransitioning: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    class FromObject {
        let imageView: UIImageView
        let titleLabel: UILabel
        let cell: MovieCell
        init(imageView: UIImageView, titleLabel: UILabel, cell: MovieCell) {
            self.cell = cell
            self.imageView = imageView
            self.titleLabel = titleLabel
        }
    }

    class ToObject {
        let imageView: UIImageView
        let titleLabel: UILabel
        let imageViewFinalFrame: CGRect
        init(imageView: UIImageView, titleLabel: UILabel, imageViewFinalFrame: CGRect) {
            self.imageViewFinalFrame = imageViewFinalFrame
            self.imageView = imageView
            self.titleLabel = titleLabel
        }
    }

    private let duration: TimeInterval = 0.3
    let interactiveTransition = UIPercentDrivenInteractiveTransition()
    var viewInitalFrame: CGRect = .zero
    var imageViewInitialFrame: CGRect = .zero

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        duration
    }

    fileprivate func presentAnimation(_ fromViewController: MoviesListViewController,
                                      _ toViewController: MovieDetailViewController,
                                      _ transitionContext: UIViewControllerContextTransitioning) {
        guard let fromObject = fromViewController.transitioningObject,
              let toObject = toViewController.transitioningObject else { return }
        let viewFinalFrame = toViewController.view.frame
        toViewController.view.addSubview(fromObject.imageView)
        toViewController.view.addSubview(fromObject.titleLabel)
        toObject.imageView.isHidden = true
        toObject.titleLabel.alpha = 0

        var origin = fromObject.cell.containerView.superview?.convert(fromObject.cell.containerView.frame.origin, to: nil) ?? .zero
        viewInitalFrame = CGRect(origin: origin, size: fromObject.cell.containerView.frame.size)
        //origin = fromObject.cell.posterImageView.superview?.convert(fromObject.cell.posterImageView.frame.origin, to: nil) ?? .zero
        imageViewInitialFrame = fromObject.imageView.frame

        toViewController.view.frame = viewInitalFrame
        toViewController.view.layer.cornerRadius = 10
        toViewController.view.clipsToBounds = true
        toViewController.view.layoutIfNeeded()

        let titleLabelFinalX = toObject.titleLabel.frame.origin.x
        let titleLabelFinalY = toObject.imageViewFinalFrame.maxY + 6
        toObject.titleLabel.frame.origin = fromObject.titleLabel.frame.origin

        CATransaction.begin()
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.fromValue = 10
        animation.toValue = 0
        animation.duration = duration
        CATransaction.setCompletionBlock {
            toViewController.view.layer.cornerRadius = 0
        }
        toViewController.view.layer.add(animation, forKey: "cornerRadius")
        CATransaction.commit()

        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModePaced, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: self.duration + 0.4) {
                UIView.animate(withDuration: self.duration + 0.4, animations: {
                    toViewController.view.frame = viewFinalFrame
                    fromObject.imageView.frame = toObject.imageViewFinalFrame
                    fromObject.titleLabel.frame.origin.x = titleLabelFinalX
                    fromObject.titleLabel.frame.origin.y = titleLabelFinalY
                    toObject.titleLabel.frame.origin.x = titleLabelFinalX
                    toObject.titleLabel.frame.origin.y = titleLabelFinalY
                    toObject.titleLabel.alpha = 1
                    fromObject.titleLabel.alpha = 0
                    fromObject.titleLabel.frame.size.width += toObject.titleLabel.frame.size.width - fromObject.titleLabel.frame.size.width
                })
            }

        }, completion: { _ in
            transitionContext.completeTransition(true)
            DispatchQueue.main.asyncAfter(deadline: .now() + self.duration ) {
                toViewController.transitioningObject?.imageView.isHidden = false
//                toViewController.transitioningObject?.titleLabel.isHidden = false
                fromObject.imageView.removeFromSuperview()
                print("fromObject.titleLabel.frame.origin", fromObject.titleLabel.frame.origin)
                print("toObject.titleLabel.frame.origin", toObject.titleLabel.frame.origin)
//                fromObject.titleLabel.removeFromSuperview()
            }
        })
    }

    func dismissAnimation(_ fromViewController: MovieDetailViewController,
                          _ toViewController: MoviesListViewController,
                          _ transitionContext: UIViewControllerContextTransitioning) {
        guard let fromObject = fromViewController.transitioningObject,
                let toObject = toViewController.transitioningObject else { return }
        print("self.imageViewInitialFrame", self.imageViewInitialFrame)
        let imageView = UIImageView()
        imageView.image = fromObject.imageView.image
        let origin = fromObject.imageView.superview?.convert(fromObject.imageView.frame.origin,
                                                                      to: nil) ?? .zero
        imageView.frame = CGRect(origin: origin, size: fromObject.imageView.frame.size)
        fromViewController.view.addSubview(imageView)
        fromObject.imageView.removeFromSuperview()
        UIView.animate(withDuration: duration, animations: {
            fromViewController.view.frame = self.viewInitalFrame
            imageView.frame = self.imageViewInitialFrame
            transitionContext.containerView.layoutIfNeeded()
        }, completion: {_ in
            transitionContext.completeTransition(true)
        })
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        if let toViewController = transitionContext.viewController(forKey: .to) as? MovieDetailViewController ,
           let navigationController = transitionContext.viewController(forKey: .from) as? MBNavigationController,
           let fromViewController = navigationController.viewControllers.first as? MoviesListViewController {
            containerView.addSubview(toViewController.view)
            presentAnimation(fromViewController, toViewController, transitionContext)
        } else if let fromViewController = transitionContext.viewController(forKey: .from) as? MovieDetailViewController,
                  let navigationController = transitionContext.viewController(forKey: .to) as? MBNavigationController,
                  let toViewController = navigationController.viewControllers.first as? MoviesListViewController {
            containerView.addSubview(fromViewController.view)
            dismissAnimation(fromViewController, toViewController, transitionContext)
        } else {
            print("abc")
        }
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}
