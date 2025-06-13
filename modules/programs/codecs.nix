{pkgs,...}:

{
	environment.systemPackages = with pkgs; [
		libavif
		libheif
		librsvg
	] ++ (with pkgs.gst_all_1; [
			gstreamer
			gst-plugins-good
			gst-plugins-base
			gst-plugins-bad
			gst-plugins-ugly
			gst-vaapi
	]);
}
