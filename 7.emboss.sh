for filename in `ls ./5.seq/faa`
do
cai -seqall ./5.seq/fna/$filename/$filename.E1.fna -outfile ./7.emboss/cai/$filename.E1.cai
cai -seqall ./5.seq/fna/$filename/$filename.E2.fna -outfile ./7.emboss/cai/$filename.E2.cai
cai -seqall ./5.seq/fna/$filename/$filename.E4.fna -outfile ./7.emboss/cai/$filename.E4.cai
cai -seqall ./5.seq/fna/$filename/$filename.E5.fna -outfile ./7.emboss/cai/$filename.E5.cai
cai -seqall ./5.seq/fna/$filename/$filename.E6.fna -outfile ./7.emboss/cai/$filename.E6.cai
cai -seqall ./5.seq/fna/$filename/$filename.E7.fna -outfile ./7.emboss/cai/$filename.E7.cai
cai -seqall ./5.seq/fna/$filename/$filename.L1.fna -outfile ./7.emboss/cai/$filename.L1.cai
cai -seqall ./5.seq/fna/$filename/$filename.L2.fna -outfile ./7.emboss/cai/$filename.L2.cai
done

for filename in `ls ./5.seq/faa`
do
chips -seqall ./5.seq/fna/$filename/$filename.E1.fna -outfile ./7.emboss/chips/$filename.E1.chips
chips -seqall ./5.seq/fna/$filename/$filename.E2.fna -outfile ./7.emboss/chips/$filename.E2.chips
chips -seqall ./5.seq/fna/$filename/$filename.E4.fna -outfile ./7.emboss/chips/$filename.E4.chips
chips -seqall ./5.seq/fna/$filename/$filename.E5.fna -outfile ./7.emboss/chips/$filename.E5.chips
chips -seqall ./5.seq/fna/$filename/$filename.E6.fna -outfile ./7.emboss/chips/$filename.E6.chips
chips -seqall ./5.seq/fna/$filename/$filename.E7.fna -outfile ./7.emboss/chips/$filename.E7.chips
chips -seqall ./5.seq/fna/$filename/$filename.L1.fna -outfile ./7.emboss/chips/$filename.L1.chips
chips -seqall ./5.seq/fna/$filename/$filename.L2.fna -outfile ./7.emboss/chips/$filename.L2.chips
done

for filename in `ls ./5.seq/faa`
do
cusp -sequence ./5.seq/fna/$filename/$filename.E1.fna -outfile ./7.emboss/cusp/$filename.E1.cusp
cusp -sequence ./5.seq/fna/$filename/$filename.E2.fna -outfile ./7.emboss/cusp/$filename.E2.cusp
cusp -sequence ./5.seq/fna/$filename/$filename.E4.fna -outfile ./7.emboss/cusp/$filename.E4.cusp
cusp -sequence ./5.seq/fna/$filename/$filename.E5.fna -outfile ./7.emboss/cusp/$filename.E5.cusp
cusp -sequence ./5.seq/fna/$filename/$filename.E6.fna -outfile ./7.emboss/cusp/$filename.E6.cusp
cusp -sequence ./5.seq/fna/$filename/$filename.E7.fna -outfile ./7.emboss/cusp/$filename.E7.cusp
cusp -sequence ./5.seq/fna/$filename/$filename.L1.fna -outfile ./7.emboss/cusp/$filename.L1.cusp
cusp -sequence ./5.seq/fna/$filename/$filename.L2.fna -outfile ./7.emboss/cusp/$filename.L2.cusp
done

for filename in `ls ./5.seq/faa`
do
distmat -sequence ./5.seq/fna/$filename/$filename.E1.fna.aln -outfile ./7.emboss/distmat/$filename.E1.fna.aln.dist
distmat -sequence ./5.seq/fna/$filename/$filename.E2.fna.aln -outfile ./7.emboss/distmat/$filename.E2.fna.aln.dist
distmat -sequence ./5.seq/fna/$filename/$filename.E4.fna.aln -outfile ./7.emboss/distmat/$filename.E4.fna.aln.dist
distmat -sequence ./5.seq/fna/$filename/$filename.E5.fna.aln -outfile ./7.emboss/distmat/$filename.E5.fna.aln.dist
distmat -sequence ./5.seq/fna/$filename/$filename.E6.fna.aln -outfile ./7.emboss/distmat/$filename.E6.fna.aln.dist
distmat -sequence ./5.seq/fna/$filename/$filename.E7.fna.aln -outfile ./7.emboss/distmat/$filename.E7.fna.aln.dist
distmat -sequence ./5.seq/fna/$filename/$filename.L1.fna.aln -outfile ./7.emboss/distmat/$filename.L1.fna.aln.dist
distmat -sequence ./5.seq/fna/$filename/$filename.L2.fna.aln -outfile ./7.emboss/distmat/$filename.L2.fna.aln.dist
done

for filename in `ls ./5.seq/faa`
do
distmat -sequence ./5.seq/faa/$filename/$filename.E1.faa.aln -outfile ./7.emboss/distmat/$filename.E1.faa.aln.dist
distmat -sequence ./5.seq/faa/$filename/$filename.E2.faa.aln -outfile ./7.emboss/distmat/$filename.E2.faa.aln.dist
distmat -sequence ./5.seq/faa/$filename/$filename.E4.faa.aln -outfile ./7.emboss/distmat/$filename.E4.faa.aln.dist
distmat -sequence ./5.seq/faa/$filename/$filename.E5.faa.aln -outfile ./7.emboss/distmat/$filename.E5.faa.aln.dist
distmat -sequence ./5.seq/faa/$filename/$filename.E6.faa.aln -outfile ./7.emboss/distmat/$filename.E6.faa.aln.dist
distmat -sequence ./5.seq/faa/$filename/$filename.E7.faa.aln -outfile ./7.emboss/distmat/$filename.E7.faa.aln.dist
distmat -sequence ./5.seq/faa/$filename/$filename.L1.faa.aln -outfile ./7.emboss/distmat/$filename.L1.faa.aln.dist
distmat -sequence ./5.seq/faa/$filename/$filename.L2.faa.aln -outfile ./7.emboss/distmat/$filename.L2.faa.aln.dist
done
