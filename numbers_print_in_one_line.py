import math

def main():
    for number in range(100,0,-1):
#       print("number used: ", number)
        if (number % 5)==0 or (number % 3)==0:
# prints "Agile" when number is divisible by 5
            if (number % 5)==0:
                print("Agile",end='')
# prints "Software" when number is divisible by 3                
            if (number % 3)==0:
                print("Software",end='')
# prints "Testing" when number is divisible by 5 and 3
            if (number % 5)==0 and (number % 3)==0:
                print("Testing",end='')
# prints number when it is not divisible by 5 or 3
        else:
            print(number,end='')

if __name__ == "__main__":
    main()