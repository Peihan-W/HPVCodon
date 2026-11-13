for filename in `ls ./2.raw-filtered`
do
orfipy ./2.raw-filtered/$filename/$filename.complete.fasta --dna $filename.complete.cds.fasta --min 300 --max 3000  --start ATG --include-stop --procs 4 --table 1 --outdir ./3.cds/$filename
orfipy ./2.raw-filtered/$filename/$filename.E1.fasta --dna $filename.E1.cds.fasta --min 1560  --max 2340 --start ATG --include-stop --procs 4 --table 1 --outdir ./3.cds/$filename #1950+
orfipy ./2.raw-filtered/$filename/$filename.E2.fasta --dna $filename.E2.cds.fasta --min 878 --max 1318 --start ATG --include-stop --procs 4 --table 1 --outdir ./3.cds/$filename #1098+
orfipy ./2.raw-filtered/$filename/$filename.E4.fasta --dna $filename.E4.cds.fasta --min 223 --max 335 --start ATG --include-stop --procs 4 --table 1 --outdir ./3.cds/$filename #279+
orfipy ./2.raw-filtered/$filename/$filename.E5.fasta --dna $filename.E5.cds.fasta --min 201 --max 303 --start ATG --include-stop --procs 4 --table 1 --outdir ./3.cds/$filename #252+
orfipy ./2.raw-filtered/$filename/$filename.E6.fasta --dna $filename.E6.cds.fasta --min 381 --max 572 --start ATG --include-stop --procs 4 --table 1 --outdir ./3.cds/$filename #477+
orfipy ./2.raw-filtered/$filename/$filename.E7.fasta --dna $filename.E7.cds.fasta --min 237 --max 356 --start ATG --include-stop --procs 4 --table 1 --outdir ./3.cds/$filename #297+
orfipy ./2.raw-filtered/$filename/$filename.L1.fasta --dna $filename.L1.cds.fasta --min 1214 --max 1821 --start ATG --include-stop --procs 4 --table 1 --outdir ./3.cds/$filename #1518+
orfipy ./2.raw-filtered/$filename/$filename.L2.fasta --dna $filename.L2.cds.fasta --min 1137 --max 1706 --start ATG --include-stop --procs 4 --table 1 --outdir ./3.cds/$filename #1422+
done
rm ./3.cds/*/*log
