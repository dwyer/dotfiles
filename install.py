#!/usr/bin/env python

"""Links filenames to ~/.filename"""

import os
import sys

THIS_PATH = os.path.abspath(__file__)
THIS_DIR = os.path.dirname(THIS_PATH)
HOME_DIR = os.getenv('HOME')

if not HOME_DIR:
    print "couldn't find your home directory"
    sys.exit(1)

for filename in os.listdir(THIS_DIR):
    src = os.path.join(THIS_DIR, filename)
    if src == THIS_PATH or filename.startswith('.'):
        continue
    elif filename != 'bin':
        filename = '.' + filename
    dest = os.path.join(HOME_DIR, filename)
    try:
        print 'linking %s to %s...' % (src, dest),
        if os.path.lexists(dest):
            os.unlink(dest)
        os.symlink(src, dest)
        print 'ok'
    except OSError, err:
        print err
