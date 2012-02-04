#!/usr/bin/env python

import os
import sys

thispath = os.path.abspath(__file__)
thisdir = os.path.dirname(thispath)
homedir = os.getenv('HOME')

if not homedir:
    print "couldn't find your home directory"
    sys.exit(1)

for filename in os.listdir(thisdir):
    src = os.path.join(thisdir, filename)
    if src == thispath:
        continue
    elif filename != 'bin':
        filename = '.' + filename
    dest = os.path.join(homedir, filename)
    try:
        print 'linking %s to %s...' % (src, dest),
        if os.path.exists(dest):
            os.remove(dest)
        os.symlink(src, dest)
        print 'ok'
    except OSError, e:
        print e
