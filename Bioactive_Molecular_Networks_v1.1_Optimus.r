
# Load and inspect the .CSV features table.
# Change the name in the code below if needed (.CSV file in red)
# NB: Make sure to add the value of bioactivity in the second columns 
tab <- read.csv("features_quantification_matrix_edited_bioactivity_Optimus.csv", stringsAsFactor=FALSE, check.names=FALSE)
dim(tab)                  
tab[1:5,1:5]                                                       


# Take out blank rows in the table
if(any(is.na(tab[,2]))) tab <- tab[!is.na(tab[,2]),]

# Add 1 to all to help scaling feature intensities and Normalize the features by TIC  
# 
tab2 <- tab
tab2[,-c(1:2)] <- t(apply(tab2[,-c(1:2)], 1, function(x) (x+1)/sum((x+1))))

# Calculate the correlation coefficient between a single feature and the bioactivity.
# Scale should help correlation - https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1534033/
cor.test(scale(tab2[,2])[,1], scale(tab2[,3])[,1])[c("estimate", "p.value")]

# How to do for all features
ct <- t(sapply(3:ncol(tab2), function(x) unlist(cor.test(scale(tab2[,2])[,1], scale(tab2[,x])[,1])[c("estimate", "p.value")])))

# Show the dimensions of the features_quantificaton_matrix.csv
dim(tab2)
dim(ct)


# Create an output table with correlation coefficient value and p-value for every features

ct <- rbind(c("cor"," p_value"), c(0,0), ct)

tab3 <- rbind(t(ct),  as.matrix(tab2))
rownames(tab3) <- NULL
tab3[1:5, 1:5]
write.csv(tab3, "features_quantification_matrix_edited_with_correlation.csv", row.names=FALSE)

# Tranpose the table for molecular networking mapping in Cytoscape
new = t(tab3)
colnames(new) = new[1,]
new = new[-1,]
new = cbind(0:(nrow(new)-1), rownames(new), new)
rownames(new) <- NULL
colnames(new)[1:2] <- c("shared name", "IDs")
new[1,1] <- ""
new[1:5,1:5]
write.csv(new, "features_quantification_matrix_transposed_with_correlation.csv", row.names=FALSE)

# Get the significant correlation coefficients for both cases (>0.05)
which(as.numeric(ct[-c(1,2),2])<0.05)

# Show the features ID with correlation coefficient
nm <- colnames(tab)
nm[-c(1:2)][as.numeric(ct[-c(1,2),2])<0.05]

# Display feature ID with correlation coefficient
which(as.numeric(ct[-c(1,2),2])<0.05)

# Table with significant correlation coefficients. Using Bonferroni method.
ct[-c(1,2),][which(p.adjust(as.numeric(ct[-c(1:2),2]), method = "bonferroni")<0.05),]

# Call the ID
which(p.adjust(as.numeric(ct[-c(1:2),2]), method = "bonferroni")<0.05)

# Features passing Bonferronii method
nm[-c(1:2)][which(p.adjust(as.numeric(ct[-c(1:2),2]), method = "bonferroni")<0.05)]


# Prepare the new table
new <- cbind(new[,1:5], c(0, p.adjust(as.numeric(ct[-c(1:2),2]), method = "bonferroni")), new[,-c(1:5)])
colnames(new)[6] <- "p_value_corrected"
new[,1:10]

# Write the final table with corrected p_value
write.csv(new, "features_quantification_matrix_transposed_with_significant_correlation_pvalue_corrected.csv", row.names=FALSE)
