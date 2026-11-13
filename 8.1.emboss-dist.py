import os
import math
from statistics import stdev

outf1 = open('./8.out/1.dist.emboss-distmat.blk', 'w')
outf2 = open('./8.out/1.dist.emboss-distmat.tsv', 'w')
outf2.write('Subtype\tGene\tAvg_n\tStd_n\tMin_n\tMax_n\tAvg_a\tStd_a\tMin_a\tMax_a\n')

for gene in ['E1', 'E2', 'E4', 'E5', 'E6', 'E7', 'L1', 'L2']:
	for subtype in ['16', '18', '31', '33', '35', '39', '45', '51', '52', '56', '58', '59', '66', '68']:
		print(gene,'-',subtype)
		inf1 = './7.emboss/distmat/HPV-' + subtype + '.' + gene + '.fna.aln.dist'
		inf2 = './7.emboss/distmat/HPV-' + subtype + '.' + gene + '.faa.aln.dist'
		if os.path.exists(inf1) and os.stat(inf1).st_size != 0:
			# print(subtype, gene)
			dist_list_n = []
			inf1 = open(inf1, 'r')
			for line in inf1.readlines()[8:]:
				line = line.strip().split()[: -2]
				for dist in line:
					dist_list_n.append(float(dist))
			dist_list_n = [x for x in dist_list_n if not (isinstance(x, float) and math.isnan(x))]
			dist_min_n = min(dist_list_n)
			dist_max_n = max(dist_list_n)
			dist_avg_n = round(sum(dist_list_n) / len(dist_list_n), 2)
			dist_std_n = round(stdev(dist_list_n), 2)
			inf1.close()
		else:
			dist_min_n = ''
			dist_max_n = ''
			dist_avg_n = ''
			dist_std_n = ''
		if os.path.exists(inf2) and os.stat(inf2).st_size != 0:
			# print(subtype, gene)
			dist_list_aa = []
			inf2 = open(inf2, 'r')
			for line in inf2.readlines()[7:]:
				line = line.strip().split()[: -2]
				for dist in line:
					dist_list_aa.append(float(dist))
			dist_list_aa = [x for x in dist_list_aa if not (isinstance(x, float) and math.isnan(x))]
			dist_min_aa = min(dist_list_aa)
			dist_max_aa = max(dist_list_aa)
			dist_avg_aa = round(sum(dist_list_aa) / len(dist_list_aa), 2)
			dist_std_aa = round(stdev(dist_list_aa), 2)
			inf2.close()
		else:
			dist_min_aa = ''
			dist_max_aa = ''
			dist_avg_aa = ''
			dist_std_aa = ''
		print('HPV-' + str(subtype) + '.' + gene + ': ' +
			str(dist_avg_n) + '+-' + str(dist_std_n) + ', ' +
			str(dist_min_n) + '~' + str(dist_max_n) + '; ' +
			str(dist_avg_aa) + '+-' + str(dist_std_aa) + ', ' +
			str(dist_min_aa) + '~' + str(dist_max_aa))
		outf1.write('HPV-' + str(subtype) + '.' + gene + ': ' +
			str(dist_avg_n) + '+-' + str(dist_std_n) + ', ' +
			str(dist_min_n) + '~' + str(dist_max_n) + '; ' +
			str(dist_avg_aa) + '+-' + str(dist_std_aa) + ', ' +
			str(dist_min_aa) + '~' + str(dist_max_aa) + '\n')
		outf2.write('HPV-' + str(subtype) + '\t' + gene + '\t' + 
			str(dist_avg_n) + '\t' + str(dist_std_n) + '\t' +
			str(dist_min_n) + '\t' + str(dist_max_n) + '\t' + 
			str(dist_avg_aa) + '\t' + str(dist_std_aa) + '\t' +
			str(dist_min_aa) + '\t' + str(dist_max_aa) + '\n')

outf1.close()
outf2.close()

