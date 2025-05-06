# Experiment 1: CDMA Simulation using Python

## 🎯 Objective

To simulate Code Division Multiple Access (CDMA) communication by spreading data using orthogonal codes and retrieving individual user data through correlation.


## 🧪 Theory

**CDMA stands for Code Division Multiple Access**. 

It is a digital cellular standard that utilizes 
spread-Spectrum Technology. It spreads the signal over a fully available spectrum or over 
multiple channels through division. It is a channelization protocol for Multiple Access, where 
information can be sent simultaneously through several transmitters over a single 
communication channel.

It is achieved in below steps: A signal is generated which extends over a wide bandwidth. The 
code which performs this action is called spreading code. Later, a specific signal can be selected 
with a given code even in the presence of many other signals. It is mainly used in mobile 
networks like 2G and 3G. It is a more secure and private line. It has good voice and data 
communication capabilities.  

## Procedure and Working
1. The station encodes its data bit as follows.  
If bit = 1 then +1  
If bit = 0 then -1  
no signal (interpreted as 0) if station is idle  
2. Each station is allocated a different orthogonal sequence (code) which is N bit long for N 
stations  
3. Each station does a scalar multiplication of its encoded data bit and code sequence.  
4. The resulting sequence is then stored on the channel.  
5. Since the channel is common, amplitudes add up and hence resultant channel sequence is the 
sum of sequences from all channels.  
6. If station 1 wants to listen to station 2, it multiplies (inner product) the channel sequence 
with code of station S2.  
7. The inner product is then divided by N to get data bit transmitted from station 2.  

## How CDMA works?
To see how CDMA works, we must understand orthogonal sequences (also known as chips).  
Let N be the number of stations establishing multiple access over a common channel.  
Then the properties of orthogonal sequences can be stated as follows:  
An orthogonal sequence can be thought of as a 1xN matrix.  
Eg: [+1 -1 +1 -1] for N = 4.  
Scalar multiplication and matrix addition rules follow as usual.  
Eg: 3.[+1 -1 +1 -1] = [+3 -3 +3 -3]  
Eg: [+1 -1 +1 -1] + [-1 -1 -1 -1] = [0 -2 0 -2]  
Inner Product: It is evaluated by multiplying two sequences element by element and then 
adding all elements of the resulting list.  
Inner Product of a sequence with itself is equal to N  
[+1 -1 +1 -1].[+1 -1 +1 -1] = 1 + 1 + 1 + 1 = 4  
Inner Product of two distinct sequences is zero  
[+1 -1 +1 -1].[+1 +1 +1 +1] = 1-1+1-1 = 0 

## 📜 Program Description

This Python script:

1. Defines orthogonal codes for 4 users.
2. Takes input data bits (±1) from all 4 users.
3. Multiplies each data bit with its unique code to spread the data.
4. Combines all spread signals into one shared channel (superimposed signal).
5. Allows user to select a particular station (user) to listen to.
6. Retrieves the original data bit from the selected user using correlation.


## 🧾 Sample Code

```python
import numpy as np

# Define spreading codes
c1 = [1, 1, 1, 1]
c2 = [1, -1, 1, -1]
c3 = [1, 1, -1, -1]
c4 = [1, -1, -1, 1]

print("Enter the data bits (±1):")
d1 = int(input("Enter D1: "))
d2 = int(input("Enter D2: "))
d3 = int(input("Enter D3: "))
d4 = int(input("Enter D4: "))

# Spread each user's data
r1 = np.multiply(c1, d1)
r2 = np.multiply(c2, d2)
r3 = np.multiply(c3, d3)
r4 = np.multiply(c4, d4)

# Combine all to simulate shared channel
resultant_channel = r1 + r2 + r3 + r4
print("Resultant Channel:", resultant_channel)

# Choose user to decode
Channel = int(input("Listen to (1-C1, 2-C2, 3-C3, 4-C4): "))
rc = [c1, c2, c3, c4][Channel - 1]

# Decode the signal
inner_product = np.multiply(resultant_channel, rc)
print("Inner Product:", inner_product)

# Recover data bit
data = sum(inner_product) / len(inner_product)
print("Recovered Data Bit:", data)
```


## ✅ Sample Output

```
Enter D1: 1
Enter D2: 1
Enter D3: -1
Enter D4: 1
Resultant Channel: [4 0 0 0]
Listen to (1-C1, 2-C2, 3-C3, 4-C4): 3
Inner Product: [4 0 0 0]
Recovered Data Bit: -1.0
```

---
