import qrcode
import os
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--url", default="https://www.njit.edu")
args = parser.parse_args()

url = args.url
img = qrcode.make(url)
output_folder = os.getenv("QR_CODE_DIR", "qr_codes")
img.save(f"{output_folder}/qrcode.png")
print("QR code generated successfully!")
