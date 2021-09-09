library(plm)
data("Wages", package = "plm")
paneldata <- pdata.frame(Wages, index=595)
View(paneldata)
help(Wages)

#package yang digunakan
library(plm)
library(lmtest)
library(tseries)

#set data panel
lwage = paneldata$lwage
exp = paneldata$exp
wks = paneldata$wks
ed = paneldata$ed

y = cbind(lwage)
x = cbind(exp,wks,ed)

#struktur data panel
str(Wages)

#fem
fem = plm(y ~ x, data=paneldata, model="within")
summary(fem)

#pool
pooling = plm(y ~ x, data=paneldata, model="pooling")
summary(pooling)

#fd
fd = plm(y ~ x, data=paneldata, model="fd")
summary(fd)

#between
btw= plm(y ~ x, data=paneldata, model="between")
summary(btw)

#rem
rem = plm(y ~ x, data=paneldata, model="random")
summary(rem)

#uji chow
pooltest(pooling, fem)

#uji haussman
phtest(fem, rem)

library(lmtest)
# Uji Heteroskedastisitas
bptest(y ~ x, data=paneldata, studentize=F)

corr <- cor.test(x=, y, method = 'spearman')
corr <- cor.test(x=cars$speed, y=cars$dist, method = 'spearman')

r.squared(fem)
