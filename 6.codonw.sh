for filename in `ls ./5.seq/faa`
do
codonw ./5.seq/fna/$filename/$filename.E1.fna -all_indices -nomenu -silent
codonw ./5.seq/fna/$filename/$filename.E2.fna -all_indices -nomenu -silent
codonw ./5.seq/fna/$filename/$filename.E4.fna -all_indices -nomenu -silent
codonw ./5.seq/fna/$filename/$filename.E5.fna -all_indices -nomenu -silent
codonw ./5.seq/fna/$filename/$filename.E6.fna -all_indices -nomenu -silent
codonw ./5.seq/fna/$filename/$filename.E7.fna -all_indices -nomenu -silent
codonw ./5.seq/fna/$filename/$filename.L1.fna -all_indices -nomenu -silent
codonw ./5.seq/fna/$filename/$filename.L2.fna -all_indices -nomenu -silent
mv ./5.seq/fna/$filename/*.out ./6.codonW
mv ./5.seq/fna/$filename/*.blk ./6.codonW
done

for filename in `ls ./5.seq/faa`
do
rscu ./5.seq/fna/$filename/$filename.E1.fna ./6.codonW/$filename.E1.rscu -nomenu -silent -totals
rscu ./5.seq/fna/$filename/$filename.E2.fna ./6.codonW/$filename.E2.rscu -nomenu -silent -totals
rscu ./5.seq/fna/$filename/$filename.E4.fna ./6.codonW/$filename.E4.rscu -nomenu -silent -totals
rscu ./5.seq/fna/$filename/$filename.E5.fna ./6.codonW/$filename.E5.rscu -nomenu -silent -totals
rscu ./5.seq/fna/$filename/$filename.E6.fna ./6.codonW/$filename.E6.rscu -nomenu -silent -totals
rscu ./5.seq/fna/$filename/$filename.E7.fna ./6.codonW/$filename.E7.rscu -nomenu -silent -totals
rscu ./5.seq/fna/$filename/$filename.L1.fna ./6.codonW/$filename.L1.rscu -nomenu -silent -totals
rscu ./5.seq/fna/$filename/$filename.L2.fna ./6.codonW/$filename.L2.rscu -nomenu -silent -totals
done


for filename in `ls ./5.seq/faa`
do
for gene in E1 E2 E4 E5 E6 E7 L1 L2
do
codonw ./5.seq/fna/$filename/$filename.$gene.fna -coa_cu -nomenu -silent
mv summary.coa ./6.codonW/$filename.$gene.summary.coa
mv genes.coa ./6.codonW/$filename.$gene.genes.coa
mv codon.coa ./6.codonW/$filename.$gene.codon.coa
done
rm ./5.seq/fna/$filename/*.out
rm ./5.seq/fna/$filename/*.blk
done
rm *coa*

for gene in E1 E2 E4 E5 E6 E7 L1 L2
do
cat ./5.seq/fna/*/*$gene.fna > ./5.seq/fna/$gene.fna
codonw ./5.seq/fna/$gene.fna -coa_cu -nomenu -silent
mv summary.coa ./6.codonW/$gene.summary.coa
mv genes.coa ./6.codonW/$gene.genes.coa
mv codon.coa ./6.codonW/$gene.codon.coa
done
rm *coa*
