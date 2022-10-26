import re
import csv
UserID = ""
password = ""

def write(id,pas):
    f=open("Logfile.csv","a",newline="")
    wo=csv.writer(f)
    data = [id,pas]
    wo.writerow(data)
    f.close()

def retreivepass(Id):
    f = open("Logfile.csv", "r")
    ro = csv.reader(f)
    for i in ro:
        if i[0] == Id:
            return i[1]

def checkloginpass(id,pas):
    f = open("Logfile.csv", "r")
    ro=csv.reader(f)
    for i in ro:
        if i[0] == id:
            if i[1] == pas:
                return 1
    f.close()

def read(id):
    f = open("Logfile.csv", "r")
    ro = csv.reader(f)
    for i in ro:
        if i[0] == id:
            return 1
    f.close()

def checkid(email):
    regex = '[A-Za-z]+[A-Za-z0-9#._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}'
    if (re.fullmatch(regex, email)):
        return True
    else:
        return False

def checkpass(pas):
    l, u, p, d = 0, 0, 0, 0
    if (len(pas) >= 5):
        for i in pas:
            if (i.islower()):
                l += 1
            if (i.isupper()):
                u += 1
            if (i.isdigit()):
                d += 1
            if (i == '@' or i == '$' or i == '_' or i == '!' or i == '#' or i == '%' or i == '&' or i == '*' or i == '.' or i == ','):
                p += 1
    if (l >= 1 and u >= 1 and p >= 1 and d >= 1 and l + p + u + d == len(pas)):
        return True
    else:
        return False

def Register():
    UserID = input("Enter a Username:  ")
    x=1
    while x==1:
       if checkid(UserID):
           print("valid ID")
           x=0
       else:
        UserID = input("invalid ID, Enter Proper Username: ")
    password = input('Enter the Password:')
    x=1
    while x==1:
        if checkpass(password):
            print("valid password")
            x=0
        else:
            password = input('Enter a valid Password:')
    write(UserID,password)
    print("Registration Successfull. You are Redirected to login Page")
    Login()

def Login():
    UserID = input("Enter Username:")
    password = input("Enter Password:")
    b = read(UserID)
    if b == 1:
        a = checkloginpass(UserID,password)
        if a == 1:
            print("login successfull. Thank You")
        else:
            ss=input("wrong password.Do you want to retreive your password(y/n):")
            if ss in 'nN':
                print("You are Redirected to Login Page")
                Login()
            else:
                ss = retreivepass(UserID)
                print("The Password is :",ss)
                print("You are Redirected to Login Page")
                Login()
    else:
        print("Wrong Used ID. You will have to create a new ID,password.You are Redirected to registration page")
        Register()

print("Welcome")
print("Press 1 for registration or press 2 for login:   ")
Stage = int(input())
x=1
while x==1:
    if Stage ==1 or Stage ==2:
        Stage = Stage
        x=0
    else:
        Stage = int(input("Please enter correct choice(1,2):  "))
if Stage == 1:
    Register()
elif Stage == 2:
    Login()



