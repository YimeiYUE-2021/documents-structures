1. /juicers
2. /juicers/juicer
3. //juicer
4. 
5. ./juicer/@*
6. /juicers/juicer/@*/data()
7. /juicers/juicer/* ou /juicers/juicer/child::*
8. //juicer[@type = "gear"]
9. /juicers/juicer[1]
10. /juicers/juicer[last()]
11. /juicers/juicer[4]/warranty
12. /juicers/juicer[cost < 100]
13. //juicer[not(image)]
14. /juicers/juicer[last()]
15. ancestor::*[last()]
16. count(//*)
17. //*[count(child::*) >= 2] ou //*[child::*[position() >= 2]]
18. //*[2]
19. //name/following-sibling::*[position()=1]/name()
20. //text()[string-length(.) > 140]
21. //juicer/retailer[contains(text(), 'html')]



/
descendant::juicer (ou //juicer)      en se plaçant sur <juicers>
/juicers/juicer
/juicers/juicer/@* (ou /juicers/juicer/@*/name() pour renvoyer le nom des attributs)
//juicer/@*/string()
./* (position sur juicer)
//juicer[@type = 'gear']
//juicer[1]
//juicer[last()]
//juicer[4]/warranty
/juicers/juicer[cost < 100]
//juicer[not(image)]
/descendant::juicer[last()]
ancestor::*[last()]
count(//*)
//*[count(child::*) >= 2]
//*[position() = 2]
//name/following-sibling::*[1]/name()
//text()[string-length() > 140]
//juicer[contains(retailer, ".html")]