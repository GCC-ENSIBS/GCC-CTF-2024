# Write-up

## Program

The program converts the flag in a binary array then take random points on an elliptic curve and add them when the bit of the flag is 1. This can be sumed up as a knapsack problem with elliptic curve points. The good thing is that the user can choose which curve we work on.

## Solution

To solve we want to be able to tell when a point has been added to the sum, which we can't do with elliptic curve points but we numbers.

So we'll try to get a the list of the discrete logarithm results for each point P<sub>i</sub> and G. This works because :
```py
a*G + b*G = (a+b)*G
```

So the addition of 2 points results in the addition of the 2 discrete logarithm results. We can then solve a normal knapsack with LLL (we can tweak the size of the prime field to have a very low density).

Due to the high number of discrete logarithm needed we need a fast way to solve it. The best one is by using anomalous curves.
