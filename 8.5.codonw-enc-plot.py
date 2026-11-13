import os
from statistics import stdev

outf = open('./8.out/5.enc-plot.codonw.tsv', 'w')
outf.write('Subtype\tGene\tENC\tGC3s\n')
for gene in ['E1', 'E2', 'E4', 'E5', 'E6', 'E7', 'L1', 'L2']:
	for subtype in ['16', '18', '31', '33', '35', '39', '45', '51', '52', '56', '58', '59', '66', '68']:
		inf = './6.codonW/HPV-' + subtype + '.' + gene + '.out'
		if os.path.exists(inf) and os.path.getsize(inf) > 0:
			# print(subtype, gene)
			gc3_list = []
			inf = open(inf, 'r')
			for line in inf.readlines()[1:]:
				line = line.strip().split()
				print('HPV-' + str(subtype), gene, line[8], line[9])
				if line[8] != '*****' and line[9] != '*****':
					outf.write('HPV-' + str(subtype) + '\t' + gene + '\t' + line[8] + '\t' + line[9] + '\n')
			inf.close()
