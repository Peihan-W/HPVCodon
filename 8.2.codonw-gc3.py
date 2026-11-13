import os
from statistics import stdev

outf1 = open('./8.out/2.gc3.codonw.blk', 'w')
outf2 = open('./8.out/2.gc3.codonw.tsv', 'w')
outf1.write('\tHPV-16\tHPV-18\tHPV-31\tHPV-33\tHPV-35\tHPV-39\tHPV-45\tHPV-51\tHPV-52\tHPV-56\tHPV-58\tHPV-59\tHPV-66\tHPV-68\n')
outf2.write('Subtype\tGene\tAvg\tStd\n')

for gene in ['E1', 'E2', 'E4', 'E5', 'E6', 'E7', 'L1', 'L2']:
	outf1.write(gene + '\t')
	for subtype in ['16', '18', '31', '33', '35', '39', '45', '51', '52', '56', '58', '59', '66', '68']:
		inf = './6.codonW/HPV-' + subtype + '.' + gene + '.out'
		if os.path.exists(inf) and os.path.getsize(inf) > 0:
			# print(subtype, gene)
			gc3_list = []
			inf = open(inf, 'r')
			for line in inf.readlines()[1:]:
				line = line.strip().split()
				gc3_list.append(float(line[9]))
			if len(gc3_list) > 1:
				gc3_avg = round(sum(gc3_list) / len(gc3_list), 2)
				gc3_std = round(stdev(gc3_list), 2)
			else:
				gc3_avg = round(sum(gc3_list) / len(gc3_list), 2)
				gc3_std = 0
			inf.close()
		else:
			gc3_avg = ''
			gc3_std = ''
		print('HPV-' + str(subtype) + '.' + gene + ': ' +
			str(gc3_avg) + '+-' + str(gc3_std))
		outf1.write(str(gc3_avg) + '+-' + str(gc3_std) + '\t')
		outf2.write('HPV-' + str(subtype) + '\t' + gene + '\t' + 
			str(gc3_avg) + '\t' + str(gc3_std) + '\n')
	outf1.write('\n')

outf1.close()
outf2.close()

