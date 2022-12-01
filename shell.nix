let
  nixpkgs = import <nixpkgs> {};
in
  with nixpkgs;
  mkShell rec {
    name = "stable-diffusion-webui";
    buildInputs = [
      python310
      stdenv.cc.cc.lib
      glibc
      glib
      libsndfile
      stdenv
        glibc
        libgcc
        gcc-unwrapped
        gtk2-x11
        zlib
        gnome2.pango
        atk
        cairo
        fontconfig
        freetype
        xorg.libX11
        xorg.libxcb
        xorg.libXi
        xorg.libXcursor
        xorg.libXdamage
        xorg.libXrandr
        xorg.libXcomposite
        xorg.libXext
        xorg.libXfixes
        xorg.libXrender
        xorg.libXtst
        xorg.libXScrnSaver
    ];
    shellHook = ''
    export LD_LIBRARY_PATH="${lib.makeLibraryPath buildInputs}";
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.glib}/lib";
    '';
  }
