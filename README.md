# AppCoordinator + Segue

One of the biggest issue we have when developping iOS application, is to handle the **navigation flow**.

This is not the controllers's job to create, and configure the others UIViewControllers in the flow. Not the right place. UIViewController has to many responsabilities, and at the final we got some massive view controllers, very hard to maintain.

So currently the navigation flow code doesn't have a home.
Coordinator is an object that handle one or more controllers, and manage the flow (navigation) of the application. And it works with the storyboards segues. The controllers doesn't know nothing about the others. Coordinators handle navigation with others coordinator.

![schema](https://cloud.githubusercontent.com/assets/3276768/19786695/88ba710e-9c9f-11e6-8a17-373df0358657.png)

Advantage of the coordinators:
 - UIViewControllers are **isolated** from others, no link between them
 - High **resealability** of the controllers, everywhere in the application, even with different presentation style
 - Easy to handle the **communication** between the controllers (data flow)
 - Better logic in the code, one coordinator for one purpose
 - **Lighter** UIViewController, avoiding the massive UIViewController is our priority
 - Fully **compatible with segue and storyboard**, so keep using it 🎉 because it's great, and storyboards, and like a documentation in my point of view
 
#Coordinator

```Swift
public protocol Coordinator: class {
    func start()
}
```
The method start allows you to handle some action at the right time, allowing you to make things lazy.
To handle the communication between the coordinator and controller, delegate is used.

#How is it working with segue ?

```Swift
public protocol Coordinated: class {
    var coordinationDelegate: CoordinationDelegate? { get set }
}
```
To be fully compatible with segue, all the UIViewController need to be a Coordinated. Then the coordinator receive the informations about the segue with this delegate : 

```swift
public protocol CoordinationDelegate: class {
    func coordinate(from source: Coordinated, to destination: UIViewController, identifier id: String?)
}
```

The controllers don't have to deal with `override func performSegue(withIdentifier identifier: String, sender: Any?)` anymore, and that's a good thing.

#Example

 - A very simple example projet was made to test the concept.

This controller has 2 segues, one to login an user, the other one to display the menu.
But it doesn't implement any navigation or configuration code, because the magic is happening in the coordinator. Because it's a **Coordinated** controller, it can be reused everywhere.
```swift
class WelcomeViewController: UIViewController, Coordinated {
    
    @IBOutlet weak var labelWelcomeBack: UILabel!
    
    weak var coordinationDelegate: CoordinationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.coordinationDelegate as? AppCoordinator)?.delegate = self
    }
}
```
