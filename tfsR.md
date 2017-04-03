---
title: "tfsR"
author: "Steph Locke"
date: "2017-04-03"
output:
  html_document:
    theme: spacelab
---



```
## Loading required package: devtools
```

```
## 
## Attaching package: 'devtools'
```

```
## The following object is masked from 'package:DiagrammeR':
## 
##     add_path
```

```
## Loading required package: curl
```

```
## 
## Attaching package: 'curl'
```

```
## The following object is masked from 'package:readr':
## 
##     parse_date
```

```
## Loading required package: random
```

```
## Loading required package: tfsR
```
## TFS
In TFS2013 and Visual Studio Online, you can use git repositories **inside** TFS. This gives the ability to leverage all the advantages of a distributed source control system whilst still giving you all the functionality of TFS.

If you're using SourceSafe or earlier editions of TFS, UPGRADE for everyone's sakes.

If you're not using any source control, consider getting Visual Studio Online as it's free for 5 users (plus unlimited MSDN users), requires no hosting or maintenance on your part, and has fine grained permissions management.

## Working with your TFS site in R with tfsR

