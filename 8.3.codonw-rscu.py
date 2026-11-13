import os
from collections import defaultdict

ref = open('./0.codon-sorted.tsv', 'r')
codon_dict = {}
codon_color1 = defaultdict(int)
codon_color2 = {}
for line in ref.readlines():
	line = line.strip().split('\t')
	# print(line)
	codon_dict[line[1]] = line[0]
	codon_color1[line[0]] += 1
	codon_color2[line[1]] = str(codon_color1[line[0]])
# print(codon_dict)
print(codon_color2)
ref.close()

outf2 = open('./8.out/3.rscu.codonw.tsv', 'w')
outf2.write('Subtype\tGene\tAA\tCodon\tRSCU\tColour\n')

for gene in ['E1', 'E2', 'E4', 'E5', 'E6', 'E7', 'L1', 'L2']:
	rscu_defaultdict = defaultdict(list)
	outf1 = open('./8.out/3.' + gene + '.rscu.codonw.blk', 'w')
	outf1.write('AA\tCodon\tHPV-16\tHPV-18\tHPV-31\tHPV-33\tHPV-35\tHPV-39\tHPV-45\tHPV-51\tHPV-52\tHPV-56\tHPV-58\tHPV-59\tHPV-66\tHPV-68\n')
	for subtype in ['16', '18', '31', '33', '35', '39', '45', '51', '52', '56', '58', '59', '66', '68']:
		rscu_dict = {}
		inf = './6.codonW/HPV-' + subtype + '.' + gene + '.rscu'
		if os.path.exists(inf) and os.path.getsize(inf) > 0:
			# print(subtype, gene)
			inf = open(inf, 'r')
			for line in inf.readlines():
				line = line.strip('\n').split()
				for i in range(len(line)):
					if line[i] in codon_dict.keys():
						rscu_dict[line[i]] = line[i + 2]
						rscu_defaultdict[line[i]].append(line[i + 2])
					elif len(line[i]) == 8 and line[i][:3] in codon_dict.keys():
						rscu_dict[line[i][:3]] = line[i + 1]
						rscu_defaultdict[line[i][:3]].append(line[i + 1])
			# print(rscu_dict)
			inf.close()
		else:
			for codon in codon_dict.keys():
				rscu_defaultdict[codon].append('')
		for codon in codon_dict.keys():
			if rscu_dict == {}:
				print('HPV-' + subtype, gene, codon_dict[codon], codon)
				outf2.write('HPV-' + subtype + '\t' + gene + '\t' + codon_dict[codon] + '\t' + codon + '\t\t' + codon_color2[codon] + '\n')
			else:
				print('HPV-' + subtype, gene, codon_dict[codon], codon, rscu_dict[codon])
				outf2.write('HPV-' + subtype + '\t' + gene + '\t' + codon_dict[codon] + '\t' + codon + '\t' + rscu_dict[codon] + '\t' + codon_color2[codon] + '\n')
	# print(rscu_defaultdict)
	for codon in codon_dict.keys():
		rscu = '\t'.join(rscu_defaultdict[codon])
		# print(codon_dict[codon], codon, rscu)
		outf1.write(codon_dict[codon] + '\t' + codon + '\t' + rscu + '\n')
	outf1.close()
outf2.close()
