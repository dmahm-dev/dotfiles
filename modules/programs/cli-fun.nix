{pkgs,...}:

{
	environment.systemPackages = with pkgs; [
		bottom
		file
		yt-dlp
	];
}
