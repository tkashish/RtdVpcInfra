import hiyapyco
import sys
import os
import glob

basepath = os.path.dirname(os.path.realpath(__file__))
hiyapyco._usedefaultyamlloader = True
src_path = sys.argv[1]
merged_file_path = sys.argv[2]
stacks = os.path.join(src_path,'*.yaml')
print(stacks)
conf = hiyapyco.load(glob.glob(stacks), method=hiyapyco.METHOD_MERGE)
print(hiyapyco.dump(conf))

with open(merged_file_path, 'w') as yaml_file:
    hiyapyco.dump(conf, stream=yaml_file)
