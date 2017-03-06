# Makefile for gEDA/PCB
# 10-08-2013 E. Brombaugh

# base name
DESIGN = cuttle_lure

# Executables
GSCH = gschem
GNET = gnetlist
PCB = pcb
PDF = ps2pdf
CVT = convert

# Targets
clean:
	-rm -f *~ *- *.new.pcb *.cmd *.net  bom.txt *.ps *.zip *.bak

bom:
	$(GNET) -g bom $(DESIGN)_pg?.sch -o bom.txt
	
sch_pdf:
	$(GSCH) -p -o $(DESIGN)_pg1.ps -s print.scm $(DESIGN)_pg1.sch
	$(GSCH) -p -o $(DESIGN)_pg2.ps -s print.scm $(DESIGN)_pg2.sch
	$(GSCH) -p -o $(DESIGN)_pg3.ps -s print.scm $(DESIGN)_pg3.sch
	$(GSCH) -p -o $(DESIGN)_pg4.ps -s print.scm $(DESIGN)_pg4.sch
	cat $(DESIGN)_pg?.ps > $(DESIGN)_schematic.ps
	$(PDF) $(DESIGN)_schematic.ps
	rm -f *.ps

render_front:
	$(PCB) -x png --photo-mode --dpi 450  --use-alpha --only-visible \
     --outfile /tmp/out.png $(DESIGN).pcb
	$(CVT) /tmp/out.png \
		\( +clone -background black -shadow 75x20+20+20 \) \
		+swap  -background white -layers merge -resize 67% $(DESIGN)_front.jpg
	
render_back:
	$(PCB) -x png --photo-mode --dpi 450  --use-alpha --only-visible \
     --photo-flip-x --outfile /tmp/out.png $(DESIGN).pcb
	$(CVT) /tmp/out.png \
		\( +clone -background black -shadow 75x20+20+20 \) \
		+swap  -background white -layers merge -resize 67% $(DESIGN)_back.jpg
	
gerber:
	rm -rf gerbers
	mkdir gerbers
	$(PCB) -x gerber --gerberfile gerbers/$(DESIGN) $(DESIGN).pcb

oshpark: $(DESIGN).pcb
	$(PCB) -x gerber --gerberfile $(DESIGN) $(DESIGN).pcb
	./mk_oshpark.pl $(DESIGN)
	rm *.gbr *.cnc
	
