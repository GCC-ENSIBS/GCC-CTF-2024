# Array programming rocks
```
First part is just a giant XOR with the flag itself, shifted one character rotation by one.
The thing is that the flag is XORed twice! Meaning we can easily recover our flag by XORing it again.

Xoring with 'B's give us ... GCC{1_M1w3_Ui15_sU5ck_ca5eE_M5eO355}
Oh...
There are collisions :/

Ok let's look at the next checks!

/+↯9_4⇌
    => Reverse, reshape in 9x4, sum
    Not really useful

/+⍉◫7
    => Windows 7 characters wide, summed
    Oh! Juicy
    We can check if every windows of 7 characters are equal to the flag,
    we check each sums one by one and change the characters to the value needed to complete the sum.
    (Of course it's based on the presumption that there is at least 6 followed characters of our XOR found flag that match)
    Btw if you blocked here, it might be because you forgot it was reversed >:)
```