# AppCoordinator-Segue

One the biggest issue we have when developping iOS application, is too handle the navigation flow. This is not the controllers's job to create, and configure the others UIViewControllers in the flow. This is not the right place. UIViewController has to many responsabilities, and at the final we got some massive view controllers, very hard to mantain.

So currently the navigation flow code doesn't have a home.
Coordinator is an object that handle one or more controllers, and manage the flow (navigation) of the application. And it works with the storyboards segues. The controllers doesn't know nothing about the others.

Advantage of the coordinators:
 - UIViewControllers are isolated from others, no link between them
 - High reseuability of the controllers, everywhere in the application, even with different presentation style
 - Seasy to handle the communication between in the controllers (passe data)
 - Better logic in the code, one coordinator for one purpose
 - Lighter UIViewController
 - Fully compatible with segue and storyboard, so keep using it 🎉
 
#Coordinator

```Swift
public protocol Coordinator: class {
    func start()
}
```
The method start allows you to handle some action at the right time, allowing you to make things lazy.
To handle the communication between the coordinator and controller, delegate is used.
