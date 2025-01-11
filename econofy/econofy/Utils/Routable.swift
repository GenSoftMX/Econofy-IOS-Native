//
//  Router.swift
//  Econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 03/01/25.
//

import UIKit

protocol Routable {

    func pushViewController<T: UIViewController>(withIdentifer identifier: String,
                                                 type: T.Type,
                                                 in storyBoard: UIStoryboard.Storyboard,
                                                 from viewController: UIViewController,
                                                 moduleConfiguration: (T) -> Void)
    
    func present<T: UIViewController>(withIdentifier identifier: String,
                                      type: T.Type,
                                      in storyboard: UIStoryboard.Storyboard,
                                      from viewController: UIViewController,
                                      shouldBlockSwipeDown: Bool,
                                      shouldShowInFullScreen: Bool,
                                      shouldAnimate: Bool,
                                      presentationMode: UIModalPresentationStyle?,
                                      moduleConfiguration: (T) -> Void)

    func makeViewController<T: UIViewController>(identifier: String,
                                                 type: T.Type,
                                                 in storyboard: UIStoryboard.Storyboard,
                                                 replaceRoot: Bool) -> T?
    
}

extension Routable {

    /// Pushes a view controller to the navigation stack.
    ///
    /// This method is used to push a view controller onto the navigation stack from the current view controller. It allows the
    /// configuration of the newly instantiated view controller before performing the push transition.
    ///
    /// - Parameters:
    ///   - identifier: The identifier of the view controller to instantiate from the storyboard.
    ///   - type: The type of the view controller to instantiate, which must be a subclass of `UIViewController`.
    ///   - storyBoard: The storyboard from which to instantiate the view controller.
    ///   - from: The current view controller from which the push will occur.
    ///   - moduleConfiguration: A closure that allows you to configure the instantiated view controller before pushing it onto the navigation stack.
    ///     You can use this to set properties or configure the view controller's state.
    ///
    /// - Note:
    ///   This method assumes that the current view controller is embedded in a `UINavigationController` and uses its `pushViewController`
    ///   method to perform the push transition. If the current view controller is not in a navigation controller, an error will be printed and no push will occur.
    ///
    /// - Example:
    ///   ```swift
    ///   pushViewController(withIdentifer: "SecondViewController",
    ///                      type: SecondViewController.self,
    ///                      in: .main,
    ///                      from: self) { secondVC in
    ///      secondVC.someProperty = "Some value"
    ///   }
    ///   ```
    func pushViewController<T: UIViewController>(withIdentifer identifier: String,
                                                 type: T.Type,
                                                 in storyBoard: UIStoryboard.Storyboard,
                                                 from viewController: UIViewController,
                                                 moduleConfiguration: (T) -> Void) {
        let bundle = Bundle(for: type)
        let storyboard = UIStoryboard.storyboard(storyBoard, bundle: bundle)
        
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            print("Error: Could not instantiate view controller with identifier \(identifier)")
            return
        }
        
        moduleConfiguration(nextViewController)
        
        // Verificar que viewController esté dentro de un UINavigationController
        guard let navigationController = viewController.navigationController else {
            print("Error: The viewController is not embedded in a UINavigationController.")
            return
        }
        
        navigationController.pushViewController(nextViewController, animated: true)
    }


    /// Presents a new view controller modally with customizable presentation options.
    ///
    /// This method handles the presentation of a new view controller as a modal. It provides several options for customization,
    /// including the ability to block swipe-down gestures, show the modal in full-screen mode, customize the animation of the
    /// presentation, and choose a specific modal presentation style.
    ///
    /// - Parameters:
    ///   - identifier: The identifier of the view controller to be instantiated from the storyboard.
    ///   - type: The type of the view controller to be presented.
    ///   - storyboard: The storyboard from which the view controller should be instantiated.
    ///   - from: The view controller from which the new view controller will be presented.
    ///   - shouldBlockSwipeDown: A boolean that indicates whether the swipe-down gesture to dismiss the modal should be blocked. Defaults to `false`. (iOS 13 and above)
    ///   - shouldShowInFullScreen: A boolean that indicates whether the modal should be presented in full screen. Defaults to `false`.
    ///   - shouldAnimate: A boolean that indicates whether the presentation should be animated. Defaults to `true`.
    ///   - presentationMode: A custom `UIModalPresentationStyle` for the modal presentation. Defaults to `nil`, which uses the default style.
    ///   - moduleConfiguration: A closure that is executed after the view controller is instantiated. This closure allows you to configure the newly instantiated view controller before presenting it.
    func present<T: UIViewController>(withIdentifier identifier: String,
                                      type: T.Type,
                                      in storyboard: UIStoryboard.Storyboard,
                                      from viewController: UIViewController,
                                      shouldBlockSwipeDown: Bool = false,
                                      shouldShowInFullScreen: Bool = false,
                                      shouldAnimate: Bool = true,
                                      presentationMode: UIModalPresentationStyle? = nil,
                                      moduleConfiguration: (T) -> Void) {

        let bundle = Bundle(for: type)
        let storyboard = UIStoryboard.storyboard(storyboard, bundle: bundle)
        
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            print("Error: Could not instantiate view controller with identifier \(identifier)")
            return
        }

        let navigationController = UINavigationController(rootViewController: nextViewController)

        // Block swipe-down gesture on iOS 13+ if requested
        if #available(iOS 13.0, *) {
            navigationController.isModalInPresentation = shouldBlockSwipeDown
        }

        // Show modal in full screen if requested
        if shouldShowInFullScreen {
            navigationController.modalPresentationStyle = .fullScreen
        }

        // Apply custom presentation style if specified
        if let presentationMode = presentationMode {
            navigationController.modalPresentationStyle = presentationMode
        }

        // Configure the view controller using the provided closure
        moduleConfiguration(nextViewController)

        // Present the modal with animation if requested
        viewController.present(navigationController, animated: shouldAnimate)
    }


    /// A method that creates and returns a view controller from the specified storyboard identifier,
    /// with the option to replace the root view controller of the current window.
    ///
    /// - Parameters:
    ///   - identifier: The identifier of the view controller to be instantiated from the storyboard.
    ///   - type: The type of the view controller to be instantiated (this is a generic type that must be a subclass of `UIViewController`).
    ///   - storyboard: The storyboard where the view controller is defined. This should be one of the cases from `UIStoryboard.Storyboard`.
    ///   - replaceRoot: A boolean flag indicating whether the current root view controller should be replaced by the new view controller.
    ///     If set to `true`, the root view controller of the app's main window will be replaced by the view controller created from the storyboard identifier.
    ///     If set to `false`, no changes will be made to the root view controller, and the method will simply return the created view controller.
    ///
    /// - Returns: An instance of the view controller type `T` that was created from the storyboard.
    ///
    /// - Throws: A fatal error if the view controller cannot be instantiated from the provided storyboard identifier.
    ///
    /// This method is useful when you need to instantiate a new view controller from a storyboard and optionally replace the root view controller
    /// of the application's window, effectively resetting the navigation stack. This is typically used in scenarios such as onboarding, authentication flows,
    /// or after a user has completed an action that requires starting a new flow from a fresh view controller.
    ///
    /// ### Example Usage:
    ///
    /// ```swift
    /// let viewController = makeViewController(identifier: "OnboardingVC", type: OnboardingViewController.self, in: .main, replaceRoot: true)
    /// ```
    ///
    /// In this example, the `OnboardingViewController` will be instantiated from the main storyboard, and if `replaceRoot` is set to `true`,
    /// it will replace the current root view controller with the `OnboardingViewController`. All previous view controllers in the navigation stack will be lost.
    ///
    /// ### How it Works:
    ///
    /// - The method first attempts to instantiate the specified view controller from the storyboard using the provided identifier.
    /// - If the `replaceRoot` flag is set to `true`, the method will get the window scene from the `UIApplication.shared.connectedScenes` and replace the root view controller of the window with the new view controller.
    /// - The method does not push a new view controller onto a navigation stack; it directly sets the root view controller of the app's window, removing any previous view controllers from the stack.
    ///
    /// ### Use Cases:
    /// - **Onboarding flow:** After the user completes an onboarding process, you may want to replace the root view controller with the main content of the app (e.g., a `HomeViewController`).
    /// - **Authentication:** After the user logs in, you may want to replace the root view controller with a dashboard or home screen, replacing any previous authentication or login screens.
    /// - **Resetting the app:** If you want to restart the flow of the app from a new root view controller (e.g., after a logout or a significant state change), this method can be used to reset the navigation stack.
    ///
    func makeViewController<T: UIViewController>(identifier: String,
                                                 type: T.Type,
                                                 in storyboard: UIStoryboard.Storyboard,
                                                 replaceRoot: Bool = true) -> T? {
        let storyboard = UIStoryboard.storyboard(storyboard)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Error: Could not instantiate view controller with identifier \(identifier)")
        }
        
        // If replaceRoot is true, replace the current root view controller
        if replaceRoot, let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                window.rootViewController = viewController
                window.makeKeyAndVisible()
            }
        }
        
        return viewController
    }
}
