# For building FPGA image with Quartus

DESIGN_NAME=DE0_NANO

pgm: $(DESIGN_NAME).sof
	quartus_pgm --mode=jtag -o p\;$(DESIGN_NAME).sof

sta: asm
	quartus_sta $(DESIGN_NAME)

build: $(DESIGN_NAME).sof

$(DESIGN_NAME).sof: $(DESIGN_NAME).fit.rpt
	quartus_asm $(DESIGN_NAME)

$(DESIGN_NAME).fit.rpt: $(DESIGN_NAME).map.rpt
	quartus_fit $(DESIGN_NAME)

$(DESIGN_NAME).map.rpt: $(DESIGN_NAME).qpf
	quartus_map $(DESIGN_NAME)

clean:
	rm -rf db output_files



