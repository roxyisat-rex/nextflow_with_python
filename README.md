# nextflow_with_python


This is an example of wrapping python codes into nextflow. Tricky part about this is that the input variables needs to be modified to be read into python. 
This because nextflow is written in groovy and for each process the input/ channel specification happens in the beginning of the nextflow process when code is still in groovy. 
However, the process is actually wrapped python code.  [This link] (https://stackoverflow.com/questions/63093708/how-to-run-python-script-in-nextflow) also describes a
brief example of how python can be ran from nextflow but, this is relatively simple case. When there are multiple inputs and outputs, it is 
better to be albe to read the **bash variables**. 
The script here demonstrates an example of how this can be done. 
