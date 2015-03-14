# Rtraining
This package contains Steph Locke's materials for various presentations and hands-on labs about R.

To download it:
```{r}
if (!require(devtools)) install.packages("devtools")
devtools::install_github("stephlocke/Rtraining")
```
## RTutor
The exercises use [RTutor](https://github.com/skranz/RTutor) to allow interactive exercises. To download RTutor, here is the How To (as of 2015-03-14):
```{r}
if (!require(devtools))
  install.packages("devtools")
source_gist("gist.github.com/skranz/fad6062e5462c9d0efe4")
install.rtutor(update.github=TRUE)
library(RTutor)
```
You can get the latest version of this code on the [RTutor github](https://github.com/skranz/RTutor)

We need a directory to store your exercises in:
```{r}
origlocation<-getwd()
exerciselocation<- if (interactive()) choose.dir(getwd(), "Choose a suitable folder")
run.ps(user.name="Your name here")
```