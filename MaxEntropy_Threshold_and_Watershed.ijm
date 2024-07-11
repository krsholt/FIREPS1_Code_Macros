input = getDirectory("Choose stack folder");

setBatchMode(true); 
list = getFileList(input);
for (i = 0; i < list.length; i++)
        action(input, list[i]);
setBatchMode(false);


function action(input, filename) {
        open(input + filename);
name=getInfo("image.filename");

output = input+"thresholded"+File.separator;
File.makeDirectory(output);

setThreshold(4000, 65535, "raw");
run("Convert to Mask");
run("Watershed");

saveAs("Tiff", output + ""+name+"");
close();

}
