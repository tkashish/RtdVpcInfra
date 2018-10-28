
base_dir=$(shell pwd)
build_dir=${base_dir}/build
merge_file_name=merged.yml

all: deps build

build: clean
	mkdir -p ${build_dir}
	python scripts/merge-cf.py ${base_dir}/cf ${build_dir}/${merge_file_name}

clean:
	 rm -rf build

validate:
	chmod +x scripts/*
	./scripts/validate-cf-template ${build_dir}/${merge_file_name}

deps:
	sudo pip install HiYaPyCo
	sudo pip install yamllint
	sudo gem install cfn-nag

fmt:
	yamllint ${build_dir}/${merge_file_name}

