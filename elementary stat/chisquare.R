#final destination
#goodness of fit
#follows theoritical distributions 
#multinomial goodness of fit
#multinomial >>> categorical & discrete classes of non overlapping
#H0: 
library(MASS)
head(survey)
str(survey$Smoke)
levels(survey$Smoke)

smoke.freq=table(survey$Smoke)
smoke.freq

#
smoke.prob <- c(0.045,0.795,0.085,0.075)
#chi-square test
chisq.test(smoke.freq,p=smoke.prob)

#your p-value is greater than your significance interval so you are not going to reject 
#null hyphothesis
#chi-squared test of independence
#ones probability distribution doesnt affects the others
tbl=table(survey$Smoke,survey$Exer)
tbl

chisq.test(tbl)
#null hypo 















































