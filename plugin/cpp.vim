" Can be initalized in nix shell like this:
" let
"    pkgs = import <nixpkgs> {};
" in pkgs.stdenv.mkDerivation rec {
"   name = "makefile-guy-dev";
"   LIBCLANG_PATH="${pkgs.llvmPackages.libclang}/lib";


let g:deoplete#sources#clang#libclang_path = $LIBCLANG_PATH.'/libclang.so'
