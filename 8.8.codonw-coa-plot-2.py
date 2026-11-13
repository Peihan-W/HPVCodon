import os
from statistics import stdev

outf = open('./8.out/8.coa-plot-2.codonw.tsv', 'w')
outf.write('Gene\tSeq\tAxis1\tAxis2\tAxis3\tAxis4\n')
for gene in ['E1', 'E2', 'E4', 'E5', 'E6', 'E7', 'L1', 'L2']:
	inf = './6.codonW/' + gene + '.genes.coa'
	if os.path.exists(inf) and os.path.getsize(inf) > 0:
		# print(subtype, gene)
		inf = open(inf, 'r')
		for line in inf.readlines()[1:]:
			line = line.strip().split()
			# line = line[1:]
			line = '\t'.join(line)
			# print(line)
			# print('HPV-' + str(subtype) + '\t' + gene + '\t' + line + '\n')
			outf.write(gene + '\t' + line + '\n')
		inf.close()
