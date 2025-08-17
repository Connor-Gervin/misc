a1:use`a   / absolute
a2:use`..a / sibling, same as a1
c1:use`.c   / child
c2:use`b.c  / absolute, same as c1

\l ::f.q

if[not(a1~a2)&c1~c2;'"wrong"]

export:([a1.getv;c2.bar;baz])
