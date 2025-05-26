{config, ...}:

{
	services.printing = {
		enable = true;
		cups-pdf.enable = true;
		cups-pdf.instances.pdf.settings = {
			Out = "\${HOME}/Documents/printer-pdf/";
		};
	};
}
