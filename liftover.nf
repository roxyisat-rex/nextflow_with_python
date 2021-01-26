#!/usr/bin/env nextflow


x = Channel.from( 'original_bed')

process pyTask {
    echo true
 
    input:
    env x

    '''
    #!/usr/bin/env python3
    import sys
    import os
    import pandas as pd
    from os import listdir, system, getenv
    from os.path import join, isdir


    def liftOver_func(o_bed_path, lifted_bed_path, unlifted_bed_path, prefix=getenv('PBS_O_WORKDIR'), prefixcmd='$PBS_O_WORKDIR'):
        if not isdir(os.path.join(prefix, o_bed_path)):
            system('mkdir {0}'.format(os.path.join(prefixcmd, o_bed_path)))


        o_bed_files = [f for f in listdir(join(prefix, o_bed_path)) if f.endswith('.bed')]
        for dir in [lifted_bed_path, unlifted_bed_path]:
            if not isdir(join(prefix, dir)):
                system('mkdir {0}'.format(join(prefixcmd, dir)))

        for of in o_bed_files:
            cmd = './liftOver {0} mm10ToHg19.over.chain {1} {2}'.format(join(prefixcmd, o_bed_path, of), join(prefixcmd, lifted_bed_path, 'lifted_' + of), join(prefixcmd, unlifted_bed_path, 'unlifted_' + of))
            system(cmd)


    liftOver_func(os.environ['x'], 'lifed_bed', 'unlifted_bed', '/Users/xinyuanzhang/next_flow', '/Users/xinyuanzhang/next_flow')
    '''
 
}