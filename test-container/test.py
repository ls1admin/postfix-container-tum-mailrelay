from smtplib import *
import os

# Sender from env var SENDER, fallback to original default
s = os.getenv("SENDER", "test@ios.ase.cit.tum.de")

# Receiver(s) from env var RECEIVER. Support comma-separated lists.
_r = os.getenv("RECEIVER", "linhuber@in.tum.de")
if "," in _r:
    r = [addr.strip() for addr in _r.split(",") if addr.strip()]
else:
    r = [_r.strip()]

m = "This Postfix is working!"

with SMTP("postfix") as smtp:
    try:
        smtp.sendmail(s, r, m)
        print("sent")
    except SMTPException:
        print("error")
