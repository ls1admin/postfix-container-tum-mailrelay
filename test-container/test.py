from smtplib import *

s = "test@ios.ase.cit.tum.de"
r = ["linhuber@in.tum.de"]

m = "This is working!"

with SMTP("postfix") as smtp:
    try:
        smtp.sendmail(s, r, m)
        print("sent")
    except SMTPException:
        print("error")
