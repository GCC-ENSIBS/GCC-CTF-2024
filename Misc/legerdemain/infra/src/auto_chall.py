#!/usr/bin/env python3
# YAPAMS, Yet Another Pyjail Automated Making Script
# Author: Shy
# Desc.: Setup a basic pyjail with parameters and special pre-setup code you can set


## 👇 SET YOUR PARAMETERS HERE 👇
p = {
    # Filter testing
    "banned words":     ["get","any","all","print","in","char","or","and","len","flag"],
    "banned chars":     '_-+.0123456789\\o',
    "max length":       18,
    "ban unicode":      True,
    # Main setup
    "is prod":          True,
    "use audithook":    False,
    "use debugger":     False,
    "use backups":      False,
    # Vars
    "globals backup":   globals(),
    "builtins backup":  __builtins__,
    "vars":             [],
    # Debug
    "debug extra":      True,
    "debug list":       ["onion"],
    "debug text":       "",
}
## 👆 SET YOUR PARAMETERS HERE 👆


## Load dependencies
if p["use audithook"]:  import sys
if p["use debugger"]:   import pdb


## Flag reading
flag = "GCC{Ch3ck_l1st}"




## 👇 WRITE YOUR OWN SPECIAL VARS SETUP HERE 👇
def chall_init():
    while len(p["vars"])<len(flag): p["vars"].append([])
    for i,c in enumerate(flag): p["vars"][i] = c
## 👆 WRITE YOUR OWN SPECIAL VARS SETUP HERE 👆




TITLE="""
      :::::::::   :::   :::   :::::::::::   :::       :::::::::::   :::                        :::   :::         :::       :::    :::   ::::::::::   :::::::::
     :+:    :+:  :+:   :+:       :+:     :+: :+:         :+:       :+:                       :+:+: :+:+:      :+: :+:     :+:   :+:    :+:          :+:    :+:
    +:+    +:+   +:+ +:+        +:+    +:+   +:+        +:+       +:+                      +:+ +:+:+ +:+    +:+   +:+    +:+  +:+     +:+          +:+    +:+ 
   +#++:++#+     +#++:         +#+   +#++:++#++:       +#+       +#+                      +#+  +:+  +#+   +#++:++#++:   +#++:++      +#++:++#     +#++:++#:   
  +#+            +#+          +#+   +#+     +#+       +#+       +#+                      +#+       +#+   +#+     +#+   +#+  +#+     +#+          +#+    +#+   
 #+#            #+#      #+# #+#   #+#     #+#       #+#       #+#                      #+#       #+#   #+#     #+#   #+#   #+#    #+#          #+#    #+#    
###            ###       #####    ###     ###   ###########   ##########               ###       ###   ###     ###   ###    ###   ##########   ###    ###     
"""
CHOICES="""

    1- Test input and filters
    2- See debug helper
    3- Launch pyjail
    4- Quit

"""


if __name__=="__main__":
    print(TITLE)
    while True:
        print(CHOICES)
        choice = input(">>>").strip()
        match choice:
            case "1":
                inp = input("Test your instruction chief!\n>>> ")
                if p["ban unicode"] and any(map(lambda x:ord(x)>128, inp)): inp = "print('gotcha!')"
                if len(inp)>p["max length"] or any(bw in inp for bw in p["banned words"]) or any(bc in inp for bc in p["banned chars"]): inp = "print('gotcha!')"
                try:
                    exec(inp)
                except:
                    print("WARNING: Bypass possible ! (or just a bad payload...)")
            case "2":
                print(p["debug text"])
                for dbv in p["debug list"]: print(' -', dbv)
            case "3":
                chall_init()
                # Debug
                if p["debug extra"]:
                    print(p["debug text"])
                    for dbv in p["debug list"]: print(' -', dbv)
                # Launch challenge
                print("ERROR: Your script is not yet finished")
                exit()
            case "4":
                exit()
            case _:
                print("???")
