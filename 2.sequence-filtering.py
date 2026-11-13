from collections import defaultdict

inf = open('./1.raw/HPV-68.complete.fasta', 'r')
outf_summary = open('./2.raw-filtered/HPV-68/HPV-68.summary.csv', 'w')
outf_complete = open('./2.raw-filtered/HPV-68/HPV-68.complete.fasta', 'w')
outf_E6 = open('./2.raw-filtered/HPV-68/HPV-68.E6.fasta', 'w')
outf_E7 = open('./2.raw-filtered/HPV-68/HPV-68.E7.fasta', 'w')
outf_E1 = open('./2.raw-filtered/HPV-68/HPV-68.E1.fasta', 'w')
outf_E2 = open('./2.raw-filtered/HPV-68/HPV-68.E2.fasta', 'w')
outf_E4 = open('./2.raw-filtered/HPV-68/HPV-68.E4.fasta', 'w')
outf_E5 = open('./2.raw-filtered/HPV-68/HPV-68.E5.fasta', 'w')
outf_L2 = open('./2.raw-filtered/HPV-68/HPV-68.L2.fasta', 'w')
outf_L1 = open('./2.raw-filtered/HPV-68/HPV-68.L1.fasta', 'w')

seq = {}
for line in inf.readlines():
	# print(line)
	if line.startswith('>'):
		name = line.strip().strip('>')
		seq[name] = ''
	else:                
		seq[name] += line.strip()


# punctuation_string = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
punctuation_string = '!"#$%&\'()*+,-/:;<=>?@[\\]^_`{|}~'
count = defaultdict(int)
segments = ['E6', 'E7', 'E1', 'E2', 'E4', 'E5', 'L2', 'L1']
outf_summary.write('ID,complete genome,' + ','.join(segments) + '\n')
for key in seq.keys():
	# print(key)
	info = key
	for i in punctuation_string:
		info = info.replace(i, '')
	info = info.split(' ')
	info_key = info[0]
	# print(info_key)
	if 'complete genome' in key:
		# print(key)
		outf_summary.write(info_key + ',1')
		outf_complete.write('>' + key + '\n')
		outf_complete.write(seq[key] + '\n')
		count['complete'] += 1
	else:
		outf_summary.write(info_key + ',0')
	for seg in segments:
		# print(seg)
		if seg in info:
			outf_summary.write(',1')
			eval('outf_' + str(seg)).write('>' + key + '\n')
			eval('outf_' + str(seg)).write(seq[key] + '\n')
			count[seg] += 1
		else:
			outf_summary.write(',0')
	outf_summary.write('\n')

outf_summary.write(',' + str(count['complete']) +
	',' + str(count['E6']) +
	',' + str(count['E7']) +
	',' + str(count['E1']) +
	',' + str(count['E2']) +
	',' + str(count['E4']) +
	',' + str(count['E5']) +
	',' + str(count['L2']) +
	',' + str(count['L1']) +'\n')

outf_summary.close()
outf_complete.close()
outf_E6.close()
outf_E7.close()
outf_E1.close()
outf_E2.close()
outf_E4.close()
outf_E5.close()
outf_L2.close()
outf_L1.close()
