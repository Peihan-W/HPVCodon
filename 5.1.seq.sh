cp -r ./4.tree/fna_filtered  ./5.seq/fna

for filename in `ls ./5.seq/fna`
do
mkdir ./5.seq/faa/$filename
done

for filename in `ls ./5.seq/fna`
do
python 5.0.fna2faa.py -i ./5.seq/fna/$filename/$filename.E1.fna -o ./5.seq/faa/$filename/$filename.E1.faa
python 5.0.fna2faa.py -i ./5.seq/fna/$filename/$filename.E2.fna -o ./5.seq/faa/$filename/$filename.E2.faa
python 5.0.fna2faa.py -i ./5.seq/fna/$filename/$filename.E4.fna -o ./5.seq/faa/$filename/$filename.E4.faa
python 5.0.fna2faa.py -i ./5.seq/fna/$filename/$filename.E5.fna -o ./5.seq/faa/$filename/$filename.E5.faa
python 5.0.fna2faa.py -i ./5.seq/fna/$filename/$filename.E6.fna -o ./5.seq/faa/$filename/$filename.E6.faa
python 5.0.fna2faa.py -i ./5.seq/fna/$filename/$filename.E7.fna -o ./5.seq/faa/$filename/$filename.E7.faa
python 5.0.fna2faa.py -i ./5.seq/fna/$filename/$filename.L1.fna -o ./5.seq/faa/$filename/$filename.L1.faa
python 5.0.fna2faa.py -i ./5.seq/fna/$filename/$filename.L2.fna -o ./5.seq/faa/$filename/$filename.L2.faa
done

for filename in `ls ./5.seq/fna`
do
# nohup muscle -super5 ./5.seq/faa/$filename/$filename.E1.faa -output ./5.seq/faa/$filename/$filename.E1.faa.aln -threads 8 > ./5.seq/faa/$filename/$filename.E1.log 2>&1 &
# nohup muscle -super5 ./5.seq/faa/$filename/$filename.E2.faa -output ./5.seq/faa/$filename/$filename.E2.faa.aln -threads 8 > ./5.seq/faa/$filename/$filename.E2.log 2>&1 &
# nohup muscle -super5 ./5.seq/faa/$filename/$filename.E4.faa -output ./5.seq/faa/$filename/$filename.E4.faa.aln -threads 8 > ./5.seq/faa/$filename/$filename.E4.log 2>&1 &
# nohup muscle -super5 ./5.seq/faa/$filename/$filename.E5.faa -output ./5.seq/faa/$filename/$filename.E5.faa.aln -threads 8 > ./5.seq/faa/$filename/$filename.E5.log 2>&1 &
# nohup muscle -super5 ./5.seq/faa/$filename/$filename.E6.faa -output ./5.seq/faa/$filename/$filename.E6.faa.aln -threads 8 > ./5.seq/faa/$filename/$filename.E6.log 2>&1 &
# nohup muscle -super5 ./5.seq/faa/$filename/$filename.E7.faa -output ./5.seq/faa/$filename/$filename.E7.faa.aln -threads 8 > ./5.seq/faa/$filename/$filename.E7.log 2>&1 &
nohup muscle -super5 ./5.seq/faa/$filename/$filename.L1.faa -output ./5.seq/faa/$filename/$filename.L1.faa.aln -threads 8 > ./5.seq/faa/$filename/$filename.L1.log 2>&1 &
nohup muscle -super5 ./5.seq/faa/$filename/$filename.L2.faa -output ./5.seq/faa/$filename/$filename.L2.faa.aln -threads 8 > ./5.seq/faa/$filename/$filename.L2.log 2>&1 &
done
