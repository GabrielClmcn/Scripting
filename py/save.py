#!/usr/bin/python36

###
# nm: save.py
# descr: save of a dir
# date: 06/11/2018
# Author: gabrielClmcn
###


import shutil
import os
import sys
import signal
import datetime

#treatment of the SIGINT signal and stop the script properly
def exit_properly(sig, frame):
  print("User asked for exit. Exiting...")
  sys.exit(0)
signal.signal(signal.SIGINT, exit_properly)

def makeBackup():
  os.remove(data_path + '/backup.tar.gz')
  shutil.move(backup + '.tar.gz', data_path)

# if archive already exist, delete it
def deleteBackup():
  if os.path.exists(backup + '.tar.gz'):
    os.remove(backup + '.tar.gz')

# Variables
data_path = os.path.expanduser('~/data/')
directory_path = os.path.expanduser('~/B2-Python/scripts')
backup = os.path.expanduser('~/backup')
storage = os.system("df -h | grep '%s'")

try:
  os.makedirs(data_path, exist_ok=True)
except OSError:
  if not os.path.isdir(data_path):
    os.system("mkdir data_path")

for partition in ['/home', '/var']:
  sys.stdout.write(
    "Disk space : " + partition + " : " + str(storage + "G\n")

if storage > 3:
  if os.access(data_path, os.W_OK and os.R_OK):
    shutil.make_archive(data_path, 'gztar', directory_path)

    if os.path.exists(data_path + '/backup;tar.gz'):
      with gzip.open(data_path + '/backup;tar.gz') as es:
        existing_save = es.read()
      with gzip.open(backup + '.tar.gz') as ns:
        new_s = ns.read()

      if existing_save == new_s:
        deleteArchive()
        sys.stdout.write('Error : Archive save already exist\n')
      else:
        makeArchive()
        sys.stdout.write('Success : Archive saved\n')

    else:
      makeArchive()
      sys.stdout.write('Success : Archive saved\n')

  else:
    sys.stderr.write('Error: You don\'t have the necessary rights\n')

else:
  sys.stderr.write('Error: There is no more place in the disk.')
