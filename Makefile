build_dir = build

all: \
	${build_dir}/sq-fwd-dec.dump \
	${build_dir}/sq-fwd-dec-lto.dump \
	${build_dir}/sq-fptr.dump \
	${build_dir}/sq-fptr-lto.dump \
	${build_dir}/sq-function.dump \
	${build_dir}/sq-function-lto.dump

${build_dir}:
	mkdir ${build_dir}

${build_dir}/%.o: %.cpp | ${build_dir}
	${CXX} -c -O3 -std=c++17 $^ -o $@

${build_dir}/%-lto.o: %.cpp | ${build_dir}
	${CXX} -c -O3 -std=c++17 -flto $^ -o $@

${build_dir}/sq-%: ${build_dir}/sq-%.o ${build_dir}/main-%.o | ${build_dir}
	${CXX} $^ -o $@

${build_dir}/sq-%-lto: ${build_dir}/sq-%-lto.o ${build_dir}/main-%-lto.o | ${build_dir}
	${CXX} -flto $^ -o $@

${build_dir}/sq-%.dump: ${build_dir}/sq-% | ${build_dir}
	objdump -S --disassemble $^ > $@
