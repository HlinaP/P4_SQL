# ÚVOD 
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
*Navzdory krátkodobým výkyvům můžeme pozorovat rostoucí trend průměrných mezd napříč všemi odvětvími. Největší pokles byl zaznamenán v roce **2013** v odvětví Peněžnictví a pojišťovnictví, kde průměrná mzda meziročně klesla o **4 479 Kč**. Přesto však v dlouhodobém horizontu vzrostly průměrné mzdy z **25 049 Kč** v roce **2000** na **61 542 Kč** v roce **2021**. Nejčastěji se meziroční pokles mezd objevil v odvětví těžby a dobývání, kde k němu během sledovaného období došlo čtyřikrát. V dlouhodobém horizontu však i v tomto odvětví mzdy vzrostly z **16 551 Kč** na **37 971 Kč**.*

### Otázka č. 2: Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
***2006**: Chléb konzumní kmínový: **1211,91 kg**
**2018**: Chléb konzumní kmínový: **1321,91 kg**
**2006**: Mléko polotučné pasterované: **1352,91 l**
**2018**: Mléko polotučné pasterované: **1616,70 l***

*Přestože ceny obou potravin vzrostly mezi roky 2006 a 2018, v přepočtu na průměrnou mzdu je možné si v roce 2018 pořídit větší množství těchto potravin než v roce 2006*

### Otázka č. 3: Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
*Ze sledovaných potravin nejpomaleji zdražuje **cukr krystalový**, který za sledované období vykazuje nejnižší průměrnou roční změnu ceny, a to **-1,92 %**. To naznačuje, že cena cukru v tomto období klesala, což může signalizovat dlouhodobý trend poklesu cen.*

