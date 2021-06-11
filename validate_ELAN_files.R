install.packages("xfun")
library(tidyr)
library(tinytex)
library(readxl)
library(dplyr)
library(data.table)
library(xfun)
library(readxl)

# PASO 1. Copiar los ficheros en la carpeta revisión

current_folder <- "/Users/adriancabedonebot/Library/Mobile Documents/com~apple~CloudDocs/corpus/Ameresco/07_09_2020/originales"
new_folder <- "/Users/adriancabedonebot/Library/Mobile Documents/com~apple~CloudDocs/corpus/Ameresco/07_09_2020/revision"
list_of_files <- list.files(current_folder, ".eaf$") 
file.copy(file.path(current_folder,list_of_files), new_folder)

# PASO 2. Añadir la línea de DTD nueva (se realiza luego la revisión con Oxygen).


gsub_dir(dir = new_folder, pattern = "<ANNOTATION_DOCUMENT AUTHOR=", replacement = "<!--<ANNOTATION_DOCUMENT AUTHOR=")
gsub_dir(dir = new_folder, pattern = "EAFv3.0.xsd\">", replacement = "EAFv3.0.xsd\"><!--><ANNOTATION_DOCUMENT>")
gsub_dir(dir = new_folder, pattern = "<!--<ANNOTATION_DOCUMENT AUTHOR=", replacement = "<!DOCTYPE ANNOTATION_DOCUMENT SYSTEM \"/Users/adriancabedonebot/Library/Mobile Documents/com~apple~CloudDocs/corpus/Ameresco/anotaciones.dtd\">
<!--<ANNOTATION_DOCUMENT AUTHOR=")
gsub_dir(dir = new_folder, pattern = "&lt;", replacement = "<")
gsub_dir(dir = new_folder, pattern = "&gt;", replacement = ">")
gsub_dir(dir = new_folder, pattern = "<énfasis", replacement = "<enfasis")
gsub_dir(dir = new_folder, pattern = "<anónimo", replacement = "<anonimo")
gsub_dir(dir = new_folder, pattern = "</énfasis", replacement = "</enfasis")
gsub_dir(dir = new_folder, pattern = "</anónimo", replacement = "</anonimo")

# PASO 3. Copiar ficheros revisados a la carpeta final

current_folder1 <- "/Users/adriancabedonebot/Library/Mobile Documents/com~apple~CloudDocs/corpus/Ameresco/07_09_2020/revision"
new_folder1 <- "/Users/adriancabedonebot/Library/Mobile Documents/com~apple~CloudDocs/corpus/Ameresco/07_09_2020/corpus"
list_of_files <- list.files(current_folder1, ".eaf$") 
file.copy(file.path(current_folder1,list_of_files), new_folder1)
gsub_dir(dir = new_folder1, pattern = "<enfasis>", replacement = "&lt;enfasis&gt;")
gsub_dir(dir = new_folder1, pattern = "<anonimo>", replacement = "&lt;anonimo&gt;")
gsub_dir(dir = new_folder1, pattern = "</anonimo>", replacement = "&lt;/anonimo&gt;")
gsub_dir(dir = new_folder1, pattern = "</enfasis>", replacement = "&lt;/enfasis&gt;")
gsub_dir(dir = new_folder1, pattern = "<entre_risas>", replacement = "&lt;entre_risas&gt;")
gsub_dir(dir = new_folder1, pattern = "</entre_risas>", replacement = "&lt;/entre_risas&gt;")
gsub_dir(dir = new_folder1, pattern = "<risas/>", replacement = "&lt;risas/&gt;")
gsub_dir(dir = new_folder1, pattern = "<alargamiento/>", replacement = "&lt;alargamiento/&gt;")
gsub_dir(dir = new_folder1, pattern = "<ininteligible/>", replacement = "&lt;ininteligible/&gt;")
gsub_dir(dir = new_folder1, pattern = "<susurro/>", replacement = "&lt;susurro/&gt;")
gsub_dir(dir = new_folder1, pattern = "<gritos/>", replacement = "&lt;gritos/&gt;")
gsub_dir(dir = new_folder1, pattern = "<tos/>", replacement = "&lt;tos/&gt;")
gsub_dir(dir = new_folder1, pattern = "<cita>", replacement = "&lt;cita&gt;")
gsub_dir(dir = new_folder1, pattern = "</cita>", replacement = "&lt;/cita&gt;")
gsub_dir(dir = new_folder1, pattern = "<sic>", replacement = "&lt;sic&gt;")
gsub_dir(dir = new_folder1, pattern = "</sic>", replacement = "&lt;/sic&gt;")
gsub_dir(dir = new_folder1, pattern = "<obs", replacement = "&lt;obs")
gsub_dir(dir = new_folder1, pattern = "</obs>", replacement = "&lt;/obs&gt;")
gsub_dir(dir = new_folder1, pattern = "<fsr", replacement = "&lt;fsr")
gsub_dir(dir = new_folder1, pattern = "</fsr>", replacement = "&lt;/fsr&gt;")
gsub_dir(dir = new_folder1, pattern = "<enfasis", replacement = "&lt;enfasis")
gsub_dir(dir = new_folder1, pattern = "</enfasis>", replacement = "&lt;/enfasis&gt;")
gsub_dir(dir = new_folder1, pattern = "<siglas", replacement = "&lt;siglas")
gsub_dir(dir = new_folder1, pattern = "</siglas>", replacement = "&lt;/siglas&gt;")
gsub_dir(dir = new_folder1, pattern = "<extranjero", replacement = "&lt;extranjero")
gsub_dir(dir = new_folder1, pattern = "</extranjero>", replacement = "&lt;/extranjero&gt;")
gsub_dir(dir = new_folder1, pattern = "(t=\"([^\"]*)\")(>)", replacement = "\\1&gt;")
gsub_dir(dir = new_folder1, pattern = "(t=\"([^\"]*)\"/)(>)", replacement = "\\1&gt;")
gsub_dir(dir = new_folder1, pattern = "/\">", replacement = "/\"&gt;")
gsub_dir(dir = new_folder1, pattern = "<!--<ANNOTATION_DOCUMENT AUTHOR=", replacement = "<ANNOTATION_DOCUMENT AUTHOR=")
gsub_dir(dir = new_folder1, pattern = "<!-->", replacement = "")
gsub_dir(dir = new_folder1, pattern = "EAFv3.0.xsd\"><!--><ANNOTATION_DOCUMENT>", replacement = "EAFv3.0.xsd\">")
gsub_dir(dir = new_folder1, pattern = "<!DOCTYPE ANNOTATION_DOCUMENT SYSTEM \"/Users/adriancabedonebot/Library/Mobile Documents/com~apple~CloudDocs/corpus/Ameresco/anotaciones.dtd\">", replacement = "")
gsub_dir(dir = new_folder1, pattern = "EAFv3.0.xsd\"><ANNOTATION_DOCUMENT>", replacement = "EAFv3.0.xsd\">")
