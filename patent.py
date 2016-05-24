from PIL import Image
from pytesser import *
 
image_file = 'test.png'
im = Image.open(image_file)
text = image_to_string(im)
print text
text = image_file_to_string(image_file)
print text
text = image_file_to_string(image_file, graceful_errors=True)
print "=====output=======\n"
print text
