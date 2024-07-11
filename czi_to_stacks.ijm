
//This macro works if:
//In the folder there are only individual multichannel images of consecutive sections from a single case. 
//The images are named with increasing numbers.
//To change the channel name needs to be changed in the script (see below).

//-------------------------------------------------------------------------------------------------------
setBatchMode(true); 
input = getDirectory("Choose a Directory");
fileList = getFileList(input);
Dialog.create("Which name would you give?")
Dialog.addString("name", "", 40);
Dialog.show();
name=Dialog.getString();
  for (i=0; i<fileList.length; i++){
    if (endsWith(fileList[i], ".czi")) {                        
run("Bio-Formats Importer", "open=[" + input + fileList[i] + "] color_mode=Grayscale split_channels open_all_series rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT SelectAll");
    }}
output = input+"Stacks"+File.separator;
File.makeDirectory(output);
//-------------------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------------------
//Change the channel names in the "saveAs" line. Add more or remove channels as needed.
run("Images to Stack", "method=[Copy (center)] name=channel_1 title=[C=0] use");  
selectWindow("channel_1");
saveAs("Tiff", output + ""+name+"-mxo4");

run("Images to Stack", "method=[Copy (center)] name=channel_1 title=[C=1] use");  
selectWindow("channel_1");
saveAs("Tiff", output + ""+name+"-psd");

run("Images to Stack", "method=[Copy (center)] name=channel_1 title=[C=2] use");  
selectWindow("channel_1");
saveAs("Tiff", output + ""+name+"-sy38");

run("Images to Stack", "method=[Copy (center)] name=channel_1 title=[C=3] use");  
selectWindow("channel_1");
saveAs("Tiff", output + ""+name+"-gfap");

//-------------------------------------------------------------------------------------------------------

        
run("Close All");

