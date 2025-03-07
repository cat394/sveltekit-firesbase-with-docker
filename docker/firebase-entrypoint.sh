#!/bin/sh
set -e

# Firebase エミュレーターを起動
firebase emulators:start --only firestore,auth,storage,functions --inspect-functions
