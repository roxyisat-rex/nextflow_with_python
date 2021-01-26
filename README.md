# nextflow_with_python


This is an example of wrapping python codes into nextflow. Tricky part about this is that the input variables needs to be modified to be read into python. 
This because nextflow is written in groovy and for each process the input/ channel specification happens in the beginning of the nextflow process when code is still in groovy. 
However, the process is actually wrapped python code.  [This link](https://stackoverflow.com/questions/63093708/how-to-run-python-script-in-nextflow) also describes a
brief example of how python can be ran from nextflow but, this is a relatively simple case. When there are multiple inputs and outputs, it is 
better to be albe to read the **bash variables**. 
The script here demonstrates an example of how this can be done. 
The .py script is for using UCSC's liftOver to lift mouse genome coordinates over to human genome coordinates. 
It calls on the unix exe liftOver, and liftOver takes .bed files and it's output is lifted .bed files and unlifted .bed files. 
Because usually this would need to be done over a number of files, the way the function is set up is that it takes in the path with all the .bed that needs to be 
lifted over as a string. 
Therefore here, for nextflow we cannot use the below. 
'''
ch = Channel.fromPath('dir/xx.bed)
'''
It has to be 
'''
x = Channel.from('path') 
'''  
and then in the input section 'x' has to be a env variable in this case.  
'''
input: 
env x
'''
This is just an example, but the general rule is outlined. 
