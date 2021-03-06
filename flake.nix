{
  description = ''Macro for building OOP class hierarchies based on closure methods.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."oop_utils-master".dir   = "master";
  inputs."oop_utils-master".owner = "nim-nix-pkgs";
  inputs."oop_utils-master".ref   = "master";
  inputs."oop_utils-master".repo  = "oop_utils";
  inputs."oop_utils-master".type  = "github";
  inputs."oop_utils-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."oop_utils-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}