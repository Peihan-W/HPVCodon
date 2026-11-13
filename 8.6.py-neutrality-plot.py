import os

outf = open('./8.out/6.neutrality-plot.tsv', 'w')
outf.write('Subtype\tGene\tGC12\tGC3\n')

def calc_GC(cds):
    """
    计算每条CDS的GC12和GC3
    """
    GC1 = 0
    GC2 = 0
    base12 = 0
    GC3 = 0
    base3 = 0
    # print(cds)
    for idx in range(0, len(cds), 3):
        codon = cds[idx:idx+3]
        # print(codon)
        if (codon!='ATG') and (codon!='TGG'):
            # 计算GC12
            if (codon[0]=='G') or (codon[0]=='C'):
                GC1 += 1
            if (codon[1]=='G') or (codon[1]=='C'):
                GC2 += 1
            base12 += 2
            
            if codon not in ['TAA','TAG','TGA','ATT','ATC','ATA']:
                # 计算GC3
                if (codon[2]=='G') or (codon[2]=='C'):
                    GC3 += 1
                base3 += 1
    GC12 = (GC1+GC2)/base12
    GC3 = GC3/base3
    return GC12, GC3

for gene in ['E1', 'E2', 'E4', 'E5', 'E6', 'E7', 'L1', 'L2']:
    for subtype in ['16', '18', '31', '33', '35', '39', '45', '51', '52', '56', '58', '59', '66', '68']:
        inf = './5.seq/fna/HPV-' + subtype + '/HPV-' + subtype + '.' + gene + '.fna'
        print(inf)
        if os.path.exists(inf) and os.path.getsize(inf) > 0:
            seq = {}
            inf = open(inf, 'r')
            for line in inf.readlines():
                # print(line)
                if line.startswith('>'):
                    name = line.strip().strip('>').split()[0]
                    seq[name] = ''
                    # print(name)
                else:
                    print(name)                
                    seq[name] += line.strip()
            for key in seq.keys():
                # print(key)
                GC12, GC3 = calc_GC(seq[key])
                # print('HPV-' + subtype + '\t' + gene + '\t' + str(GC12) + '\t' + str(GC3))
                outf.write('HPV-' + subtype + '\t' + gene + '\t' + str(GC12) + '\t' + str(GC3) + '\n')
