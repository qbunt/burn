import shutil
import subprocess

user='/Users/jeremy.bunting'

print user
dirs=['/Dropbox', '/.ssh', '/git', '/Desktop', '/Users/jeremy.bunting/Library/Application Support/1Password 4']
files=['']

# kill browser history
# subprocess.call('./browser.sh', shell=True)

for i, v in enumerate(dirs):
     print i, user+v
