import LiveView

setUpLiveView()

file = .BFS


/*:
## Introduction
 
If you're even a little interested in CS, at some point you will eventually come across algorithms. 

So what is an algorithm?
Simply put, it's just a series of steps we repeat over and over.
 
Why do we care though?
In our everyday lives, it's not so important for us to think about the steps we take to achieve our goals. 

However, there are some tasks we want to accomplish quickly. That was the whole point of starting to use machines.
And if we're going to go through the trouble of having machines do tasks for us, we should try to give it the set of instructions that will finish the task in as little work as possible.

Sometimes this might be randomized (cleverly guessing approximate solutions) and sometimes it might involve a lot of math, there are many ways to get a good algorithm. 

In our case we're going to explore some simple "graph" algorithms, which is fancy terminology for a small network. 
 
Use the green flag to place down a starting point, the red flag to place down a destination and the green arrow to start searching for the shortest path

Use the wall option to place down barriers, so the shortest path isn't so obvious (or perhaps so it doesn't even exist)
The cross will let you delete barriers and the recycling icon will reset the graph

This first example is called Breadth-First-Search, where the basic strategy is to always move to the closest univisited square (from any starting point)
*/
