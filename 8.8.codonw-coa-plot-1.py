import os
from statistics import stdev

outf = open('./8.out/8.coa-plot-1.codonw.tsv', 'w')
outf.write('Subtype\tGene\tSeq\tAxis1\tAxis2\tAxis3\tAxis4\n')
for gene in ['E1', 'E2', 'E4', 'E5', 'E6', 'E7', 'L1', 'L2']:
	for subtype in ['16', '18', '31', '33', '35', '39', '45', '51', '52', '56', '58', '59', '66', '68']:
		inf = './6.codonW/HPV-' + subtype + '.' + gene + '.genes.coa'
		if os.path.exists(inf) and os.path.getsize(inf) > 0:
			# print(subtype, gene)
			inf = open(inf, 'r')
			for line in inf.readlines()[1:]:
				line = line.strip().split()
				# line = line[1:]
				line = '\t'.join(line)
				# print(line)
				# print('HPV-' + str(subtype) + '\t' + gene + '\t' + line + '\n')
				outf.write('HPV-' + str(subtype) + '\t' + gene + '\t' + line + '\n')
			inf.close()
