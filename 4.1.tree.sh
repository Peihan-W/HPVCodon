for filename in `ls ./3.cds`
do
# mkdir ./4.tree/fna/$filename
cat ./3.cds/$filename/$filename.E1.cds.filtered.fasta ./3.cds/$filename/$filename.complete.E1.cds.filtered.fasta > ./4.tree/fna/$filename/$filename.E1.fna
cat ./3.cds/$filename/$filename.E2.cds.filtered.fasta ./3.cds/$filename/$filename.complete.E2.cds.filtered.fasta > ./4.tree/fna/$filename/$filename.E2.fna
cat ./3.cds/$filename/$filename.E4.cds.filtered.fasta ./3.cds/$filename/$filename.complete.E4.cds.filtered.fasta > ./4.tree/fna/$filename/$filename.E4.fna
cat ./3.cds/$filename/$filename.E5.cds.filtered.fasta ./3.cds/$filename/$filename.complete.E5.cds.filtered.fasta > ./4.tree/fna/$filename/$filename.E5.fna
cat ./3.cds/$filename/$filename.E6.cds.filtered.fasta ./3.cds/$filename/$filename.complete.E6.cds.filtered.fasta > ./4.tree/fna/$filename/$filename.E6.fna
cat ./3.cds/$filename/$filename.E7.cds.filtered.fasta ./3.cds/$filename/$filename.complete.E7.cds.filtered.fasta > ./4.tree/fna/$filename/$filename.E7.fna
cat ./3.cds/$filename/$filename.L1.cds.filtered.fasta ./3.cds/$filename/$filename.complete.L1.cds.filtered.fasta > ./4.tree/fna/$filename/$filename.L1.fna
cat ./3.cds/$filename/$filename.L2.cds.filtered.fasta ./3.cds/$filename/$filename.complete.L2.cds.filtered.fasta > ./4.tree/fna/$filename/$filename.L2.fna
done

for filename in `ls ./3.cds`
do
# nohup muscle -super5 ./4.tree/fna/$filename/$filename.E1.fna -output ./4.tree/fna/$filename/$filename.E1.fna.aln -threads 8 > ./4.tree/fna/$filename/$filename.E1.log 2>&1 &
# nohup muscle -super5 ./4.tree/fna/$filename/$filename.E2.fna -output ./4.tree/fna/$filename/$filename.E2.fna.aln -threads 8 > ./4.tree/fna/$filename/$filename.E2.log 2>&1 &
# nohup muscle -super5 ./4.tree/fna/$filename/$filename.E4.fna -output ./4.tree/fna/$filename/$filename.E4.fna.aln -threads 8 > ./4.tree/fna/$filename/$filename.E4.log 2>&1 &
# nohup muscle -super5 ./4.tree/fna/$filename/$filename.E5.fna -output ./4.tree/fna/$filename/$filename.E5.fna.aln -threads 8 > ./4.tree/fna/$filename/$filename.E5.log 2>&1 &
# nohup muscle -super5 ./4.tree/fna/$filename/$filename.E6.fna -output ./4.tree/fna/$filename/$filename.E6.fna.aln -threads 8 > ./4.tree/fna/$filename/$filename.E6.log 2>&1 &
# nohup muscle -super5 ./4.tree/fna/$filename/$filename.E7.fna -output ./4.tree/fna/$filename/$filename.E7.fna.aln -threads 8 > ./4.tree/fna/$filename/$filename.E7.log 2>&1 &
nohup muscle -super5 ./4.tree/fna/$filename/$filename.L1.fna -output ./4.tree/fna/$filename/$filename.L1.fna.aln -threads 8 > ./4.tree/fna/$filename/$filename.L1.log 2>&1 &
nohup muscle -super5 ./4.tree/fna/$filename/$filename.L2.fna -output ./4.tree/fna/$filename/$filename.L2.fna.aln -threads 8 > ./4.tree/fna/$filename/$filename.L2.log 2>&1 &
done



for filename in E1 E2 E4 E5 E6 E7 L1 L2
do
# cat ./4.tree/fna/*/*.$filename.fna > ./4.tree/fna/$filename.fna
nohup muscle -super5 ./4.tree/fna/$filename.fna -output ./4.tree/fna/$filename.fna.aln -threads 8 > ./4.tree/fna/$filename.log 2>&1 &
# FastTree -nt -gtr ./4.tree/fna/$filename.fna.aln > ./4.tree/fna/$filename.fna.aln.nwk
done

nohup muscle -super5 ./4.tree/fna/L1.fna -output ./4.tree/fna/L1.fna.aln -threads 8 > ./4.tree/fna/L1.log 2>&1 &
nohup muscle -super5 ./4.tree/fna/L2.fna -output ./4.tree/fna/L2.fna.aln -threads 8 > ./4.tree/fna/L2.log 2>&1 &


for filename in E1 E2 E4 E5 E6 E7 L1 L2
do
nohup FastTree -nt -gtr ./4.tree/fna/$filename.fna.aln > ./4.tree/fna/$filename.fna.aln.nwk &
done
