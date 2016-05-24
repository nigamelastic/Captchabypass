from PIL import Image
from pytesser import *
from urllib import urlretrieve

url="your url"
def get(link):
    urlretrieve(link,'temp.png')

get(url)
image_file = 'temp.png'
im = Image.open(image_file)
text = image_to_string(im)
print text
text = image_file_to_string(image_file)
print text
text = image_file_to_string(image_file, graceful_errors=True)
print "=====output=======\n"
print text
