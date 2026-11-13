import os
from statistics import stdev

outf = open('./8.out/7.pr2-plot.codonw.tsv', 'w')
outf.write('Subtype\tGene\tA3S/(A3S+T3S)\tG3S/(G3S+C3S)\n')
for gene in ['E1', 'E2', 'E4', 'E5', 'E6', 'E7', 'L1', 'L2']:
	for subtype in ['16', '18', '31', '33', '35', '39', '45', '51', '52', '56', '58', '59', '66', '68']:
		inf = './6.codonW/HPV-' + subtype + '.' + gene + '.out'
		if os.path.exists(inf) and os.path.getsize(inf) > 0:
			# print(subtype, gene)
			gc3_list = []
			inf = open(inf, 'r')
			for line in inf.readlines()[1:]:
				line = line.strip().split()
				if float(line[1]) + float(line[3]) != 0:
					x = str(float(line[3])/(float(line[1]) + float(line[3])))
				else:
					x = '0'
				if float(line[2]) + float(line[4]) != 0:
					y = str(float(line[4])/(float(line[2]) + float(line[4])))
				else:
					y = '0'
				print('HPV-' + str(subtype), gene, x, y)
				outf.write('HPV-' + str(subtype) + '\t' + gene + '\t' + x + '\t' + y + '\n')
			inf.close()
