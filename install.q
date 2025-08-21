/ $ curl -o ~/.kx/m/install.q https://raw.githubusercontent.com/ConnorGervin/misc/refs/heads/main/install.q
/ q)git:use`install

/ https://github.com/ConnorGervin/misc/tree/main
/ q)git.fetch each `:ConnorGervin/misc`:ConnorGervin/misc/`:ConnorGervin/misc/main

/ https://github.com/KxSystems/embedR/tree/master
/ q)git.fetch`:KxSystems/embedR/master

/ installs to ~/.kx/m/b/
/ q)use`b  

\d .z.m.git

/ Download repository from GitHub and install as module
fetch:{[module]
   e:"fetch`:Owner/Repo/{Branch}";      /usage
   s:"/"vs string hsym module;          /split
   if[not count[s]in 2 3;'e];           /validate
   o:1_s 0; r:s 1;                      /owner:repo
   b:$[""~s 2;"main";s 2];              /branch
   u:"https://github.com/",o,"/",r,"/archive/refs/heads/",b,".tar.gz";
   cmd:"set -o pipefail;";              /failmode
   cmd,:"(curl -fL ",u," | ";           /curl
   cmd,:"tar -xz --strip-components=1 -C ",.z.v[`QPATH]," ) || exit 1";
   cmd;@[system;cmd;{[x;y]'"Curl Failed: ",x}u];
   }

\d .z.m

export:([git.fetch])
