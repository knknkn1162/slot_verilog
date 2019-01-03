SUBDIRS=general display component slot

.SUFFIX:
.PHONY: all clean open

all: clean
	list='$(SUBDIRS)'; for subdir in $$list; do \
	$(MAKE) all -C $$subdir || exit 1;\
	echo "exec make all in the $$subdir directory.";\
	done
