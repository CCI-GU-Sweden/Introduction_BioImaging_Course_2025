// First part - Zproj and visualization
run("Bio-Formats Importer", "open=[D:/DATA/Simon/Imaging_FiJi_course 2025/2_22.tif] autoscale color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
run("Z Project...", "projection=[Max Intensity]");
run("Cyan");
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
run("Next Slice [>]");
run("Enhance Contrast", "saturated=0.35");
run("Yellow");
run("Next Slice [>]");
run("Enhance Contrast", "saturated=0.35");
run("Grays");
run("Next Slice [>]");
run("Enhance Contrast", "saturated=0.35");
run("Green");
run("Next Slice [>]");
run("Enhance Contrast", "saturated=0.35");
run("Magenta");

// Second part - Merge and Scale bar
//run("Channels Tool...");
Stack.setDisplayMode("composite");
Stack.setActiveChannels("11011");
run("Stack to RGB");
run("Scale Bar...", "width=15 height=7 thickness=6 font=20 bold");

// third part - Fuse both image and Make montage
selectImage("MAX_D:/DATA/Simon/Imaging_FiJi_course 2025/2_22.tif");
run("RGB Stack");
run("Add Slice");
selectImage("MAX_D:/DATA/Simon/Imaging_FiJi_course 2025/2_22.tif (RGB)");
run("Copy");
selectImage("MAX_D:/DATA/Simon/Imaging_FiJi_course 2025/2_22.tif");
run("Paste");
run("Make Montage...", "columns=3 rows=2 scale=1");
saveAs("PNG", "D:/DATA/Simon/Imaging_FiJi_course 2025/2_22.png");

