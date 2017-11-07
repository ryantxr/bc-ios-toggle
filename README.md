# bc-ios-toggle
This is a simple Swift app for iOS which demonstrates how to use UISwitch controls in a UITableView.
In this example, all the switch controls are added using an array of data which tells the app 
how many rows(switches) are in the table and what their labels are.

One of the switches is called "All". This switch is "on" when all the others are off. Changing any 
of the others to "on" will cause the "All" switch to be turned off.

Here are some noted techniques to learn from this:

1. Use of a table view prototype and a custom UITableViewCell class.

2. Dynamically attaching a function to catch the Value Changed events.

3. Attaching arbitrary data to a UIControl using a not so well known function from NSObject.

