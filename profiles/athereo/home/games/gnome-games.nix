{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome.gnome-mines
  ];
}
