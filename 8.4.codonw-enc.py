import os
from statistics import stdev

outf1 = open('./8.out/4.enc.codonw.blk', 'w')
outf2 = open('./8.out/4.enc.codonw.tsv', 'w')
outf1.write('\tHPV-16\tHPV-18\tHPV-31\tHPV-33\tHPV-35\tHPV-39\tHPV-45\tHPV-51\tHPV-52\tHPV-56\tHPV-58\tHPV-59\tHPV-66\tHPV-68\n')
outf2.write('Subtype\tGene\tAvg\tStd\n')

for gene in ['E1', 'E2', 'E4', 'E5', 'E6', 'E7', 'L1', 'L2']:
	outf1.write(gene + '\t')
	for subtype in ['16', '18', '31', '33', '35', '39', '45', '51', '52', '56', '58', '59', '66', '68']:
		print(gene + '-' + subtype)
		inf = './6.codonW/HPV-' + subtype + '.' + gene + '.out'
		if os.path.exists(inf) and os.path.getsize(inf) > 0:
			# print(subtype, gene)
			enc_list = []
			inf = open(inf, 'r')
			for line in inf.readlines()[1:]:
				line = line.strip().split()[: -2]
				# print(line)
				# print(line[8])
				if line[8] != '*****':
					enc_list.append(float(line[8]))
			if len(enc_list) > 1:
				enc_avg = round(sum(enc_list) / len(enc_list), 2)
				enc_std = round(stdev(enc_list), 2)
			else:
				enc_avg = round(sum(enc_list) / len(enc_list), 2)
				enc_std = 0
			inf.close()
		else:
			enc_avg = ''
			enc_std = ''
		print('HPV-' + str(subtype) + '.' + gene + ': ' +
			str(enc_avg) + '+-' + str(enc_std))
		outf1.write(str(enc_avg) + '+-' + str(enc_std) + '\t')
		outf2.write('HPV-' + str(subtype) + '\t' + gene + '\t' + 
			str(enc_avg) + '\t' + str(enc_std) + '\n')
	outf1.write('\n')

outf1.close()
outf2.close()

