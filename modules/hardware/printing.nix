{config, pkgs, ...}:

{
	services.printing = {
		enable = true;
		cups-pdf.enable = true;
		cups-pdf.instances.pdf.settings = {
			Out = "\${HOME}/Documents/printer-pdf/";
		};
		drivers = [pkgs.pantum-driver];
	};
	hardware.sane = {
		enable = true;
		extraBackends = [ pkgs.pantum-driver ];
	};
}
