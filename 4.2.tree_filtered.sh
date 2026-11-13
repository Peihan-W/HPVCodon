# 删除下列序列
# E1 (HPV-31): 
# MT410191
# E2 (HPV-58): 
# KY225933.1_ORF.1, KY225965.1_ORF.1, KY225935.1_ORF.1, KY225940.1_ORF.1
# E6 (HPV-16): 
# KU684311.1_ORF.2
# E7 (HPV-51): 
# OP971008.1_ORF.7, LR861939.1_ORF.7, OP712040.1_ORF.7, OR997950.1_ORF.7, KF436867.1_ORF.7
# OP712096.1_ORF.7, OP712026.1_ORF.7, OP712001.1_ORF.7, OP711998.1_ORF.7, OP711960.1_ORF.7
# KF436886.1_ORF.7, OR997958.1_ORF.7, PP718700.1_ORF.2, LR862072.1_ORF.7, KF436866.1_ORF.7
# OR997940.1_ORF.7, OR997935.1_ORF.7, OR997934.1_ORF.7, OR997933.1_ORF.7, PP718719.1_ORF.2
# OP971092.1_ORF.7, OP971038.1_ORF.7, OP971014.1_ORF.7, LR862069.1_ORF.7, LR862046.1_ORF.7
# LR862037.1_ORF.7, LR862023.1_ORF.7, LR861995.1_ORF.7, LR861977.1_ORF.7, LR861929.1_ORF.7
# LR861920.1_ORF.7, LR861911.1_ORF.7, LR861896.1_ORF.7, LR861893.1_ORF.7, LR861887.1_ORF.7
# LR861869.1_ORF.7, LR861846.1_ORF.7, LR861810.1_ORF.7, KX514432.1_ORF.7, KU298905.1_ORF.7
# KU298904.1_ORF.7, KU298903.1_ORF.4, KU298902.1_ORF.4, KF436869.1_ORF.7, KF436868.1_ORF.7
# KF436885.1_ORF.7, OR997941.1_ORF.7, OR997932.1_ORF.7, KF436878.1_ORF.7, KF436875.1_ORF.7
# OR997938.1_ORF.7, LR861863.1_ORF.7, KF436871.1_ORF.7, KF436872.1_ORF.7, OR997957.1_ORF.7
# OR997952.1_ORF.7
# L1(HPV-16, HPV-39, HPV-51, HPV-56, HPV-59, HPV-66, HPV-68): 
# K02718.1_ORF.5, LC786759.1_ORF.5, PC423659.1_ORF.1, OF208341.1_ORF.1, PC423660.1_ORF.1
# OF208342.1_ORF.1, PC419713.1_ORF.1, OF201607.1_ORF.1, PC434756.1_ORF.1, OF208299.1_ORF.1
# PC434767.1_ORF.1, OF208310.1_ORF.1, PC434757.1_ORF.1, OF208300.1_ORF.1, AJ313179.1_ORF.1
# PC488438.1_ORF.1, OF283559.1_ORF.1, AJ313181.1_ORF.1
# L2 (HPV-16, HPV-58): 
# AJ313180.1_ORF.1, FN297862.1_ORF.1, FN178627.1_ORF.1

# E1 (HPV-31)
# E2 (HPV-58)
# E6 (HPV-31)
# E7 (HPV-51)
# L1(HPV-16, HPV-39, HPV-51, HPV-56, HPV-59, HPV-66, HPV-68)
# L2 (HPV-16, HPV-58)


nohup muscle -super5 ./4.tree/fna_filtered/HPV-31/HPV-31.E1.fna -output ./4.tree/fna_filtered/HPV-31/HPV-31.E1.fna.aln -threads 8 > ./4.tree/fna_filtered/HPV-31/HPV-31.E1.log 2>&1 &
nohup muscle -super5 ./4.tree/fna_filtered/HPV-58/HPV-58.E2.fna -output ./4.tree/fna_filtered/HPV-58/HPV-58.E2.fna.aln -threads 8 > ./4.tree/fna_filtered/HPV-58/HPV-58.E2.log 2>&1 &
nohup muscle -super5 ./4.tree/fna_filtered/HPV-31/HPV-31.E6.fna -output ./4.tree/fna_filtered/HPV-31/HPV-31.E6.fna.aln -threads 8 > ./4.tree/fna_filtered/HPV-31/HPV-31.E6.log 2>&1 &
nohup muscle -super5 ./4.tree/fna_filtered/HPV-51/HPV-51.E7.fna -output ./4.tree/fna_filtered/HPV-51/HPV-51.E7.fna.aln -threads 8 > ./4.tree/fna_filtered/HPV-51/HPV-51.E7.log 2>&1 &
for filename in HPV-16 HPV-39 HPV-51 HPV-56 HPV-59 HPV-66 HPV-68
do
nohup muscle -super5 ./4.tree/fna_filtered/$filename/$filename.L1.fna -output ./4.tree/fna_filtered/$filename/$filename.L1.fna.aln -threads 8 > ./4.tree/fna_filtered/$filename/$filename.L1.log 2>&1 &
done
for filename in HPV-16 HPV-58
do
nohup muscle -super5 ./4.tree/fna_filtered/$filename/$filename.L2.fna -output ./4.tree/fna_filtered/$filename/$filename.L2.fna.aln -threads 8 > ./4.tree/fna_filtered/$filename/$filename.L2.log 2>&1 &
done


for filename in E1 E2 E4 E5 E6 E7 L1 L2
do
cat ./4.tree/fna_filtered/*/*.$filename.fna > ./4.tree/fna_filtered/$filename.fna
nohup muscle -super5 ./4.tree/fna_filtered/$filename.fna -output ./4.tree/fna_filtered/$filename.fna.aln -threads 8 > ./4.tree/fna_filtered/$filename.log 2>&1 &
done


for filename in E1 E2 E4 E5 E6 E7 L1 L2
do
nohup FastTree -nt -gtr ./4.tree/fna_filtered/$filename.fna.aln > ./4.tree/fna_filtered/$filename.fna.aln.nwk &
done
nohup FastTree -nt -gtr ./4.tree/fna_filtered/L1.fna.aln > ./4.tree/fna_filtered/L1.fna.aln.nwk &

