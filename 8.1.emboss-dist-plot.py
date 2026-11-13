import os
from statistics import stdev

outf1 = open('./8.out/1.dist.emboss-distmat-nt.tsv', 'w')
outf1.write('Subtype\tGene\tdist\n')
outf2 = open('./8.out/1.dist.emboss-distmat-aa.tsv', 'w')
outf2.write('Subtype\tGene\tdist\n')
outf = open('./8.out/1.dist.emboss-distmat-all.tsv', 'w')
outf.write('Subtype\tGene\tType\tdist\n')

for gene in ['E1', 'E2', 'E4', 'E5', 'E6', 'E7', 'L1', 'L2']:
	for subtype in ['16', '18', '31', '33', '35', '39', '45', '51', '52', '56', '58', '59', '66', '68']:
		inf1 = './7.emboss/distmat/HPV-' + subtype + '.' + gene + '.fna.aln.dist'
		inf2 = './7.emboss/distmat/HPV-' + subtype + '.' + gene + '.faa.aln.dist'
		if os.path.exists(inf1):
			# print(subtype, gene)
			dist_list_n = []
			inf1 = open(inf1, 'r')
			for line in inf1.readlines()[8:]:
				line = line.strip().split()[: -2]
				for dist in line:
					outf1.write('HPV-' + subtype + '\t' + gene + '\t' + dist + '\n')
					outf.write('HPV-' + subtype + '\t' + gene + '\tnucleotides\t' + dist + '\n')
		else:
			outf1.write('HPV-' + subtype + '\t' + gene + '\t0\n')
			outf.write('HPV-' + subtype + '\t' + gene + '\tnucleotides\t0\n')
		if os.path.exists(inf2):
			# print(subtype, gene)
			dist_list_aa = []
			inf2 = open(inf2, 'r')
			for line in inf2.readlines()[7:]:
				line = line.strip().split()[: -2]
				for dist in line:
					outf2.write('HPV-' + subtype + '\t' + gene + '\t' + dist + '\n')
					outf.write('HPV-' + subtype + '\t' + gene + '\tamino acids\t' + dist + '\n')
		else:
			outf2.write('HPV-' + subtype + '\t' + gene + '\t0\n')
			outf.write('HPV-' + subtype + '\t' + gene + '\tamino acids\t0\n')
outf1.close()
outf2.close()
outf.close()

