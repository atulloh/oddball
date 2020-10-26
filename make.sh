# requires openscad to be in your PATH

component_path=./src/components/
output_path=./output/dump/

mkdir -p $output_path

find $component_path -name "*.scad"|while read full_file_name; do
  file_name=${full_file_name#$component_path}
  file_name_no_ext=${file_name%.scad}

  echo Starting build of $file_name  
  openscad -o $output_path$file_name_no_ext.stl $full_file_name
done