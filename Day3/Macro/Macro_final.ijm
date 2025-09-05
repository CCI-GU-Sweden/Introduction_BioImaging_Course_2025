run("Close All");

directory = getDirectory("Choose directory"); 
filelist = getFileList(directory);

for (i=0; i < lengthOf(filelist); i++){
	filepath = directory+File.separator+filelist[i];
	if (endsWith(filepath, "tif")){
		run("Bio-Formats Importer", "open=["+filepath+"] autoscale color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
		ori_name = getTitle();
		run("Z Project...", "projection=[Max Intensity]");
		rename("ZProj");
		
		getDimensions(width, height, channels, slices, frames);
		color_array = newArray("Cyan", "Yellow", "Grays", "Green", "Magenta");
		active_channel = "";
		
		for (i = 0; i < channels; i++) {
			Stack.setChannel(i+1);
			run(color_array[i]);
			run("Enhance Contrast", "saturated=0.35");
			if (color_array[i] == "Grays"){active_channel += "0";}
			else {active_channel += "1";}
			
			}
		
		Stack.setDisplayMode("composite");
		Stack.setActiveChannels(active_channel);
		run("Stack to RGB");
		run("Scale Bar...", "width=15 height=7 thickness=6 font=20 bold");
		rename("merge");
		selectImage("ZProj");
		run("RGB Stack");
		
		run("Add Slice");
		selectImage("merge");
		run("Copy");
		selectImage("ZProj");
		run("Paste");
		run("Make Montage...", "columns=3 rows=2 scale=1");
		saveAs("PNG", directory+File.separator+replace(ori_name, "tif", "png"));
		run("Close All");
	}
	else {
		print(filepath+" not a tif image");
	}
}

