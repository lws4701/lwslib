project('lwslib', 'c',
version: '0.0.1',
license: 'BSD0'
)
inc = include_directories('src/include')

lwslib_sources = ['src/datastructures/arraylist.c', 'src/random/randomdatagenerators.c']
lwslib_shared = shared_library('lwslib',
lwslib_sources,
include_directories: inc,
install : false)
lwslib_static = static_library('lwslib',
lwslib_sources,
include_directories: inc,
install: false)
