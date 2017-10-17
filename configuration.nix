# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs.config = {
   allowUnfree =true;

  firefox = {
     enableGoogleTalkPlugin = true;
     enableAdobeFlash = true;
    };
  };

   fonts = {
     enableFontDir = true;
     enableGhostscriptFonts = true;
     fonts = with pkgs; [
       corefonts  # Micrsoft free fonts
       inconsolata  # monospaced
       ubuntu_font_family  # Ubuntu fonts
       unifont # some international languages
     ];
   };



#enable fuse 

boot.kernelModules = ["fuse"];
# Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos"; # Define your hostname.


  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

#  List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
     environment.systemPackages = with pkgs; [
     firefox
     nodejs
     androidsdk
     ruby
     terminator
     unzip
     wget
     vim
     krita
     haskellPackages.xmonad
     haskellPackages.xmobar
     dmenu
     python 
     unity3d
     monodevelop
     blender
     vpnc
     ack
     pciutils
     leiningen
     godot
     gimp
     rofi
     imagemagick
   ];

     virtualisation.virtualbox.host.enable = true;
     virtualisation.libvirtd.enable = false;
    hardware.opengl.driSupport32Bit = true;
    security.chromiumSuidSandbox.enable= true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
   services.printing = {
   enable =  true;
   webInterface = true;
};

  # Enable the X11 windowing system.
  # services.xserver = {
  #   enable = true;
  #   layout = "us";
  #   windowManager.xmonad.enable = true;
  #   windowManager.default = "xmonad";
  #   displayManager.kdm.enable = false;
  #   desktopManager.default="none";
  #   xkbOptions = "eurosign:e";
  #   synaptics.enable = true;
  # };
  # Enable the X11 windowing system.
   services.xserver = {
     enable = true;
     layout = "us";
     windowManager.i3.enable = true;
     synaptics.enable = true;
     #desktopManager.kde4.enable = true;
     xkbOptions = "eurosign:e";
     videoDrivers = ["radeon"];
   };

   networking.networkmanager.enable = true;

  # Enable the KDE Desktop Environment.
  #services.xserver.displayManager.kdm.enable = true;
  #services.xserver.desktopManager.kde4.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.jasonwq = {
     isNormalUser = true;
     uid = 1000; 
     extraGroups = ["networkmanager" "wheel" "libvirtd"];
   };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";
}


