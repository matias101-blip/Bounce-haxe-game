# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.lime
    pkgs.haxe
    pkgs.neko
  ];
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
      "ms-vscode.js-debug"
      "nadako.vshaxe"
      "openfl.lime-vscode-extension"
      "redhat.vscode-xml"
    ];
    # Enable previews
    previews = {
      enable = false;
      previews = {
        web = {
          command = ["haxelib" "run" "lime" "test" "html5" "--port=8080"];
        #   # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
        #   # and show it in IDX's web preview panel
        #   command = ["npm" "run" "dev"];
        manager = "web";
        };
      };
    };
    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {

        mkdir = "mkdir /home/user/haxe";
        haxeSetup = "haxelib setup /home/user/haxe";
        installLime = "haxelib install lime";
        installOpenfl = "haxelib install openfl";
        installFlixel = "haxelib install flixel";
        runLime = "haxelib run lime setup flixel && haxelib run lime setup";
        runFlixel-tools = "haxelib install flixel-tools && haxelib run flixel-tools setup";

        # Example: install JS dependencies from NPM
        # npm-install = "npm install";
        # Open editors for the following files by default, if they exist:
        default.openFiles = [ ".idx/dev.nix" "README.md" ];
      };
      # Runs when the workspace is (re)started
      onStart = {

        #createProject = "cd .. && haxelib run flixel tpl -n \\\"juego-2d-haxe\\\" -ide vscode";

        # Example: start a background task to watch and re-build backend code
        # watch-backend = "npm run watch-backend";
      };
    };
  };
}
