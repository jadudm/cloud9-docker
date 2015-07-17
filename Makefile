all:
	rm -rf pkgs/plumb
	cp -R /home/cnc/git/ccc/plumb2 pkgs/plumb
	rm -rf pkgs/plumb/.git
	docker build -t jadudm/plumbing .

