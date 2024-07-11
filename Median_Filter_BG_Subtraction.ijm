//  Place all of your aligned stacks (16 bit greyscale) into a single folder.

//  Run this macro in FIJI and direct it to the folder with your images.

//  This will apply a local median filter (radius = 1.0 pixel) to de-noise images and also equalise background across the stack (rolling ball radius = 10.0 pixels).

// Output images (preprocessed) can then be found in the created sub-folder: 'thresholded'.


input = getDirectory("Choose stack folder");

setBatchMode(true); 
list = getFileList(input);
for (i = 0; i < list.length; i++)
        action(input, list[i]);
setBatchMode(false);


function action(input, filename) {
        open(input + filename);
name=getInfo("image.filename");

output = input+"preprocessed"+File.separator;
File.makeDirectory(output);

run("Median...", "radius=1 stack");
run("Subtract Background...", "rolling=40 stack");
saveAs("Tiff", output + ""+name+"");
close();

}