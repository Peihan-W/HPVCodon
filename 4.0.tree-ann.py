outf2 = open('./4.tree/fna_filtered/summary.txt', 'w')

for pr in ["E1", "E2", "E4", "E5", "E6", "E7", "L1", "L2"]:
    list_n = [pr]
    outf1 = open(f'{pr}.ann.txt', 'w')
    outf1.write('name\thpv_type\n')
    for hpv_type in ["16", "18", "31", "33", "35", "39", "45", "51", "52", "56", "58", "59", "66", "68"]:
        inf = open(f'./4.tree/fna_filtered/HPV-{hpv_type}/HPV-{hpv_type}.{pr}.fna', 'r')
        n = 0
        for line in inf.readlines():
            if line.startswith('>'):
                name = line.strip().strip('>').split()[0]
                outf1.write(name + '\tHPV-' + hpv_type + '\n')
                n += 1
        inf.close()
        list_n.append(str(n))
    outf1.close()
    line_n = '\t'.join(list_n)
    outf2.write(line_n + '\n')
outf2.close

