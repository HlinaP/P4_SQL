## ÚVOD 
Cílem tohoto projektu je zajistit přesné, přehledné a relevantní datové podklady, které umožní srovnání dostupnosti potravin ve vztahu k průměrným příjmům za určité časové období.
Pro analýzu budou vytvořeny dvě tabulky, které budou obsahovat klíčová data:
1.	Tabulka primární analýzy – zahrnující údaje o průměrných cenách základních potravin a průměrných příjmech obyvatel
2.	Tabulka mezinárodního srovnání – obsahující HDP, GINI koeficient a populaci vybraných evropských států za stejné období.
K analýze těchto dat budou využity SQL dotazy, které umožní efektivní vyhledávání a porovnání údajů pro jednotlivé výzkumné otázky.

## Výzkumné otázky:
1.	Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
2.	Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
3.	Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
4.	Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
5.	Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

## ODPOVĚDI NA VÝZKUMNÉ OTÁZKY
### Otázka č. 1: Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
*Navzdory krátkodobým výkyvům můžeme pozorovat rostoucí trend průměrných mezd napříč všemi odvětvími. Největší pokles byl zaznamenán v roce **2013** v odvětví Peněžnictví a pojišťovnictví, kde průměrná mzda meziročně klesla o **4 479 Kč**. Přesto však v dlouhodobém horizontu vzrostly průměrné mzdy z **25 049 Kč** v roce **2000** na **61 542 Kč** v roce **2021**. Nejčastěji se meziroční pokles mezd objevil v odvětví těžby a dobývání, kde k němu během sledovaného období došlo čtyřikrát. V dlouhodobém horizontu však i v tomto odvětví mzdy vzrostly, a to z **16 551 Kč** na **37 971 Kč**.*

### Otázka č. 2: Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
***2006**: Chléb konzumní kmínový: **1211,91 kg**  
**2018**: Chléb konzumní kmínový: **1321,91 kg**  
**2006**: Mléko polotučné pasterované: **1352,91 l**  
**2018**: Mléko polotučné pasterované: **1616,70 l***  

*Přestože ceny obou potravin mezi roky 2006 a 2018 vzrostly, v přepočtu na průměrnou mzdu je možné si v roce 2018 pořídit větší množství těchto potravin než v roce 2006.*

### Otázka č. 3: Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
*Ze sledovaných potravin nejpomaleji zdražuje **cukr krystalový**, který za sledované období vykazuje nejnižší průměrnou roční změnu ceny, a to **-1,92 %**. To naznačuje, že cena cukru v tomto období klesala, což může signalizovat dlouhodobý trend poklesu cen.*

### Otázka č. 4: Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
*Výrazně vyšší nárůst cen potravin oproti růstu mezd ve sledovaném období neexistuje. Nejvyšší nárůst cen potravin oproti mzdám byl v roce **2013**, kdy byl rozdíl **5,23 %**. Ten byl způsoben převážně meziročním poklesem mezd, který činil **(-0,13 %)**.* 

### Otázka č. 5: Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?
*Mezi vývojem HDP, mezd a cen potravin existuje určitá souvislost, ale není vždy přímá. **Růst HDP (např. 2007, 2015, 2017)** obvykle znamenal růst mezd i cen potravin, zatímco **pokles HDP (2009, 2012, 2013)** ne vždy vedl k jejich snížení. Například v roce **2009** HDP kleslo o **(-4,66 %)**, ale mzdy vzrostly o **(3,37 %)**, a zatímco v roce 2009 ceny potravin prudce klesly o **(-6,41 %)**, v roce 2012 naopak vzrostly o **(6,72 %)**.*

## VYTVOŘENÉ TABULKY
### Primární tabulka
Název: t_petr_hlisnikovsky_project_sql_primary_final

| Sloupec             | Popis                                  |
|---------------------|----------------------------------------|
| Typ_dat             | Typ dat: ‘mzdy‘ nebo ‘potraviny‘       |
| Odvetvi             | Průmyslové odvětví                     |
| Prumerna_rocni_mzda | Hodnota mzdy                           |
| Jednotka_mzdy       | Kč                                     |
| Typ_mzdy            | Průměrná hrubá mzda na zaměstnance     |
| Rok_mzdy            | Rok průměrné mzdy                      |
| Nazev_potraviny     | Název potraviny                        |
| Prumerna_cena       | Průměrná cena potraviny                |
| Množství            | Množství potraviny na jednotku         |
| Jednotka_potraviny  | kg / l / g / ks                        |
| Rok_potraviny       | Rok ceny potraviny                     |

### Sekundární tabulka
Název: t_petr_hlisnikovsky_project_sql_secondary_final

| Sloupec      | Popis                    |
|--------------|--------------------------|
| nazev_zeme   | Název země.              |
| rok          | Rok.                     |
| hdp          | Hrubý domácí produkt.    |
