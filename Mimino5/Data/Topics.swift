//
//  Topics.swift
//  Mimino5
//
//  Created by Vladislav on 18.10.2021.
//

import UIKit

struct DataTopics {
    
    static let topics = [
        
        Topic(name: "Домашние животные",
              words: [
                Word(origin: "ვერძი", translation: "баран", pronunciationAudioPath: "ვერძი"),
                Word(origin: "ბატი", translation: "гусь", pronunciationAudioPath: "ბატი"),
                Word(origin: "თხა", translation: "коза", pronunciationAudioPath: "თხა"),
                Word(origin: "ძროხა", translation: "корова", pronunciationAudioPath: "ძროხა"),
                Word(origin: "კატა", translation: "кот", pronunciationAudioPath: "კატა"),
                Word(origin: "კურდღელი", translation: "кролик", pronunciationAudioPath: "კურდღელი"),
                Word(origin: "ქათამი", translation: "курица", pronunciationAudioPath: "ქათამი"),
                Word(origin: "ცხენი", translation: "лошадь", pronunciationAudioPath: "ცხენი"),
                Word(origin: "ვირი", translation: "осел", pronunciationAudioPath: "ვირი"),
                Word(origin: "თუთიყუში", translation: "попугай", pronunciationAudioPath: "თუთიყუში"),
                Word(origin: "ღორი", translation: "свинья", pronunciationAudioPath: "ღორი"),
                Word(origin: "ძაღლი", translation: "собака", pronunciationAudioPath: "ძაღლი"),
                Word(origin: "იხვი", translation: "утка", pronunciationAudioPath: "იხვი"),
                Word(origin: "ზაზუნა", translation: "хомяк", pronunciationAudioPath: "ზაზუნა"),
              ],
              icon: UIImage(named: "homeAnimals")!,
              isActive: false),
        
        Topic(name: "Дикие животные",
              words: [
                Word(origin: "ჰიპო", translation: "бегемот", pronunciationAudioPath: "ჰიპო"),
                Word(origin: "ციყვი", translation: "белка", pronunciationAudioPath: "ციყვი"),
                Word(origin: "აქლემი", translation: "верблюд", pronunciationAudioPath: "აქლემი"),
                Word(origin: "მგელი", translation: "волк", pronunciationAudioPath: "მგელი"),
                Word(origin: "ზღარბი", translation: "еж", pronunciationAudioPath: "ზღარბი"),
                Word(origin: "ენოტი", translation: "енот", pronunciationAudioPath: "ენოტი"),
                Word(origin: "ჟირაფი", translation: "жираф", pronunciationAudioPath: "ჟირაფი"),
                Word(origin: "ზებრა", translation: "зебра", pronunciationAudioPath: "ზებრა"),
                Word(origin: "ნიანგი", translation: "крокодил", pronunciationAudioPath: "ნიანგი"),
                Word(origin: "ლომი", translation: "лев", pronunciationAudioPath: "ლომი"),
                Word(origin: "მელა", translation: "лиса", pronunciationAudioPath: "მელა"),
                Word(origin: "დათვი", translation: "медведь", pronunciationAudioPath: "დათვი"),
                Word(origin: "მარტორქა", translation: "носорог", pronunciationAudioPath: "მარტორქა"),
                Word(origin: "მაიმუნი", translation: "обезьяна", pronunciationAudioPath: "მაიმუნი"),
                Word(origin: "ირემი", translation: "олень", pronunciationAudioPath: "ირემი"),
                Word(origin: "სპილო", translation: "слон", pronunciationAudioPath: "სპილო"),
                Word(origin: "ვეფხვი", translation: "тигр", pronunciationAudioPath: "ვეფხვი"),
              ],
              icon: UIImage(named: "wildAnimals")!,
              isActive: false),
        
        Topic(name: "Транспорт",
              words: [
                Word(origin: "ავტობუსი", translation: "автобус", pronunciationAudioPath: "ავტობუსი"),
                Word(origin: "ველოსიპედი", translation: "велосипед", pronunciationAudioPath: "ველოსიპედი"),
                Word(origin: "ვერტმფრენი", translation: "вертолет", pronunciationAudioPath: "ვერტმფრენი"),
                Word(origin: "სატვირთო", translation: "грузовик", pronunciationAudioPath: "სატვირთო"),
                Word(origin: "გემი", translation: "корабль", pronunciationAudioPath: "გემი"),
                Word(origin: "ნავი", translation: "лодка", pronunciationAudioPath: "ნავი"),
                Word(origin: "მანქანა", translation: "машина", pronunciationAudioPath: "მანქანა"),
                Word(origin: "მოტოციკლი", translation: "мотоцикл", pronunciationAudioPath: "მოტოციკლი"),
                Word(origin: "მატარებელი", translation: "поезд", pronunciationAudioPath: "მატარებელი"),
                Word(origin: "თვითმფრინავი", translation: "самолет", pronunciationAudioPath: "თვითმფრინავი"),
                Word(origin: "სკუტერი", translation: "скутер", pronunciationAudioPath: "სკუტერი"),
                Word(origin: "ტაქსი", translation: "такси", pronunciationAudioPath: "ტაქსი"),
                Word(origin: "ტრამვაი", translation: "трамвай", pronunciationAudioPath: "ტრამვაი"),
              ],
              icon: UIImage(named: "transport")!,
              isActive: false),
        
        Topic(name: "Цвета",
              words: [
                Word(origin: "თეთრი", translation: "белый", pronunciationAudioPath: "თეთრი"),
                Word(origin: "ყვითელი", translation: "желтый", pronunciationAudioPath: "ყვითელი"),
                Word(origin: "მწვანე", translation: "зеленый", pronunciationAudioPath: "მწვანე"),
                Word(origin: "ოქროსფერი", translation: "золотистый", pronunciationAudioPath: "ოქროსფერი"),
                Word(origin: "ყავისფერი", translation: "коричневый", pronunciationAudioPath: "ყავისფერი"),
                Word(origin: "წითელი", translation: "красный", pronunciationAudioPath: "წითელი"),
                Word(origin: "ნარინჯისფერი", translation: "оранжевый", pronunciationAudioPath: "ნარინჯისფერი"),
                Word(origin: "ვარდისფერი", translation: "розовый", pronunciationAudioPath: "ვარდისფერი"),
                Word(origin: "ვერცხლისფერი", translation: "серебристый", pronunciationAudioPath: "ვერცხლისფერი"),
                Word(origin: "ნაცრისფერი", translation: "серый", pronunciationAudioPath: "ნაცრისფერი"),
                Word(origin: "ლურჯი", translation: "синий", pronunciationAudioPath: "ლურჯი"),
                Word(origin: "იასამნისფერი", translation: "фиолетовый", pronunciationAudioPath: "იასამნისფერი"),
                Word(origin: "შავი", translation: "черный", pronunciationAudioPath: "შავი"),
              ],
              icon: UIImage(named: "colors")!,
              isActive: false),
        
        Topic(name: "Природа",
              words: [
                Word(origin: "სანაპირო", translation: "берег", pronunciationAudioPath: "სანაპირო"),
                Word(origin: "ჩანჩქერი", translation: "водопад", pronunciationAudioPath: "ჩანჩქერი"),
                Word(origin: "ტალღა", translation: "волна", pronunciationAudioPath: "ტალღა"),
                Word(origin: "მთა", translation: "гора", pronunciationAudioPath: "მთა"),
                Word(origin: "ხე", translation: "дерево", pronunciationAudioPath: "ხე"),
                Word(origin: "ქვა", translation: "камень", pronunciationAudioPath: "ქვა"),
                Word(origin: "ტყე", translation: "лес", pronunciationAudioPath: "ტყე"),
                Word(origin: "ზღვა", translation: "море", pronunciationAudioPath: "ზღვა"),
                Word(origin: "ტბა", translation: "озеро", pronunciationAudioPath: "ტბა"),
                Word(origin: "ოკეანე", translation: "океан", pronunciationAudioPath: "ოკეანე"),
                Word(origin: "ქვიშა", translation: "песок", pronunciationAudioPath: "ქვიშა"),
                Word(origin: "ველი", translation: "поле", pronunciationAudioPath: "ველი"),
                Word(origin: "მდინარე", translation: "река", pronunciationAudioPath: "მდინარე"),
                Word(origin: "კლდე", translation: "скала", pronunciationAudioPath: "კლდე"),
                Word(origin: "ბალახი", translation: "трава", pronunciationAudioPath: "ბალახი"),
                Word(origin: "გორა", translation: "холм", pronunciationAudioPath: "გორა"),
                Word(origin: "ყვავილი", translation: "цветок", pronunciationAudioPath: "ყვავილი"),
              ],
              icon: UIImage(named: "nature")!,
              isActive: false),
        
        Topic(name: "Явления природы",
              words: [
                Word(origin: "ქარი", translation: "ветер", pronunciationAudioPath: "ქარი"),
                Word(origin: "სეტყვა", translation: "град", pronunciationAudioPath: "სეტყვა"),
                Word(origin: "ქუხილი", translation: "гром", pronunciationAudioPath: "ქუხილი"),
                Word(origin: "წვიმა", translation: "дождь", pronunciationAudioPath: "წვიმა"),
                Word(origin: "მზის ჩასვლა", translation: "закат", pronunciationAudioPath: "მზის ჩასვლა"),
                Word(origin: "მიწისძვრა", translation: "землетрясение", pronunciationAudioPath: "მიწისძვრა"),
                Word(origin: "ელვა", translation: "молния", pronunciationAudioPath: "ელვა"),
                Word(origin: "ღრუბელი", translation: "облако", pronunciationAudioPath: "ღრუბელი"),
                Word(origin: "ცისარტყელა", translation: "радуга", pronunciationAudioPath: "ცისარტყელა"),
                Word(origin: "თოვლი", translation: "снег", pronunciationAudioPath: "თოვლი"),
                Word(origin: "ნისლი", translation: "туман", pronunciationAudioPath: "ნისლი"),
              ],
              icon: UIImage(named: "phenomena")!,
              isActive: false),
        
        Topic(name: "Фрукты",
              words: [
                Word(origin: "გარგარი", translation: "абрикос", pronunciationAudioPath: "გარგარი"),
                Word(origin: "ანანასი", translation: "ананас", pronunciationAudioPath: "ანანასი"),
                Word(origin: "ფორთოხალი", translation: "апельсин", pronunciationAudioPath: "ფორთოხალი"),
                Word(origin: "საზამთრო", translation: "арбуз", pronunciationAudioPath: "საზამთრო"),
                Word(origin: "ბანანი", translation: "банан", pronunciationAudioPath: "ბანანი"),
                Word(origin: "ყურძენი", translation: "виноград", pronunciationAudioPath: "ყურძენი"),
                Word(origin: "ბროწეული", translation: "гранат", pronunciationAudioPath: "ბროწეული"),
                Word(origin: "მსხალი", translation: "груша", pronunciationAudioPath: "მსხალი"),
                Word(origin: "ნესვი", translation: "дыня", pronunciationAudioPath: "ნესვი"),
                Word(origin: "კივი", translation: "киви", pronunciationAudioPath: "კივი"),
                Word(origin: "ლიმონი", translation: "лимон", pronunciationAudioPath: "ლიმონი"),
                Word(origin: "ვაშლატამა", translation: "нектарин", pronunciationAudioPath: "ვაშლატამა"),
                Word(origin: "ატამი", translation: "персик", pronunciationAudioPath: "ატამი"),
                Word(origin: "ქლიავი", translation: "слива", pronunciationAudioPath: "ქლიავი"),
                Word(origin: "ხურმა", translation: "хурма", pronunciationAudioPath: "ხურმა"),
                Word(origin: "ვაშლის", translation: "яблоко", pronunciationAudioPath: "ვაშლის"),
              ],
              icon: UIImage(named: "fruits")!,
              isActive: false),
        
        Topic(name: "Овощи",
              words: [
                Word(origin: "ბადრიჯანი", translation: "баклажан", pronunciationAudioPath: "ბადრიჯანი"),
                Word(origin: "კომბოსტო", translation: "капуста", pronunciationAudioPath: "კომბოსტო"),
                Word(origin: "კარტოფილი", translation: "картофель", pronunciationAudioPath: "კარტოფილი"),
                Word(origin: "ხახვი", translation: "лук", pronunciationAudioPath: "ხახვი"),
                Word(origin: "სტაფილო", translation: "морковь", pronunciationAudioPath: "სტაფილო"),
                Word(origin: "კიტრი", translation: "огурец", pronunciationAudioPath: "კიტრი"),
                Word(origin: "პომიდორი", translation: "помидор", pronunciationAudioPath: "პომიდორი"),
                Word(origin: "ბოლოკი", translation: "редиска", pronunciationAudioPath: "ბოლოკი"),
                Word(origin: "ჭარხალი", translation: "свекла", pronunciationAudioPath: "ჭარხალი"),
                Word(origin: "გოგრა", translation: "тыква", pronunciationAudioPath: "გოგრა"),
                Word(origin: "ნიორი", translation: "чеснок", pronunciationAudioPath: "ნიორი"),
              ],
              icon: UIImage(named: "vegetables")!,
              isActive: false),
        
        Topic(name: "Мясо",
              words: [
                Word(origin: "ვერძი", translation: "баранина", pronunciationAudioPath: "ვერძი"),
                Word(origin: "ბეკონი", translation: "бекон", pronunciationAudioPath: "ბეკონი"),
                Word(origin: "ლორი", translation: "ветчина", pronunciationAudioPath: "ლორი"),
                Word(origin: "საქონლის ხორცი", translation: "говядина", pronunciationAudioPath: "საქონლის ხორცი"),
                Word(origin: "ძეხვი", translation: "колбаса", pronunciationAudioPath: "ძეხვი"),
                Word(origin: "ქათამი", translation: "курица", pronunciationAudioPath: "ქათამი"),
                Word(origin: "ხორცი", translation: "мясо", pronunciationAudioPath: "ხორცი"),
                Word(origin: "ღვიძლი", translation: "печень", pronunciationAudioPath: "ღვიძლი"),
                Word(origin: "ღორის ხორცი", translation: "свинина", pronunciationAudioPath: "ღორის ხორცი"),
                Word(origin: "ძეხვეული", translation: "сосиски", pronunciationAudioPath: "ძეხვეული"),
                Word(origin: "იხვი", translation: "утка", pronunciationAudioPath: "იხვი"),
              ],
              icon: UIImage(named: "meat")!,
              isActive: false),
        
        Topic(name: "Тело",
              words: [
                Word(origin: "თავი", translation: "голова", pronunciationAudioPath: "თავი"),
                Word(origin: "მკერდი", translation: "грудь", pronunciationAudioPath: "მკერდი"),
                Word(origin: "მუცელი", translation: "живот", pronunciationAudioPath: "მუცელი"),
                Word(origin: "მაჯა", translation: "запястье", pronunciationAudioPath: "მაჯა"),
                Word(origin: "მუხლი", translation: "колено", pronunciationAudioPath: "მუხლი"),
                Word(origin: "იდაყვი", translation: "локоть", pronunciationAudioPath: "იდაყვი"),
                Word(origin: "ფეხი", translation: "нога", pronunciationAudioPath: "ფეხი"),
                Word(origin: "თითი", translation: "палец", pronunciationAudioPath: "თითი"),
                Word(origin: "მხარი", translation: "плечо", pronunciationAudioPath: "მხარი"),
                Word(origin: "ქუსლი", translation: "пятка", pronunciationAudioPath: "ქუსლი"),
                Word(origin: "მკლავი", translation: "рука", pronunciationAudioPath: "მკლავი"),
                Word(origin: "ზურგი", translation: "спина", pronunciationAudioPath: "ზურგი"),
                Word(origin: "ტერფი", translation: "стопа", pronunciationAudioPath: "ტერფი"),
                Word(origin: "მენჯი", translation: "таз", pronunciationAudioPath: "მენჯი"),
                Word(origin: "კისერი", translation: "шея", pronunciationAudioPath: "კისერი"),
              ],
              icon: UIImage(named: "body")!,
              isActive: false),
        
        Topic(name: "Голова и лицо",
              words: [
                Word(origin: "წვერი", translation: "борода", pronunciationAudioPath: "წვერი"),
                Word(origin: "წარბი", translation: "бровь", pronunciationAudioPath: "წარბი"),
                Word(origin: "თმა", translation: "волосы", pronunciationAudioPath: "თმა"),
                Word(origin: "თვალი", translation: "глаз", pronunciationAudioPath: "თვალი"),
                Word(origin: "ტუჩი", translation: "губа", pronunciationAudioPath: "ტუჩი"),
                Word(origin: "კბილი", translation: "зуб", pronunciationAudioPath: "კბილი"),
                Word(origin: "კანი", translation: "кожа", pronunciationAudioPath: "კანი"),
                Word(origin: "შუბლი", translation: "лоб", pronunciationAudioPath: "შუბლი"),
                Word(origin: "ცხვირი", translation: "нос", pronunciationAudioPath: "ცხვირი"),
                Word(origin: "ნიკაპი", translation: "подбородок", pronunciationAudioPath: "ნიკაპი"),
                Word(origin: "წამწამი", translation: "ресница", pronunciationAudioPath: "წამწამი"),
                Word(origin: "პირი", translation: "рот", pronunciationAudioPath: "პირი"),
                Word(origin: "ულვაში", translation: "усы", pronunciationAudioPath: "ულვაში"),
                Word(origin: "ყური", translation: "ухо", pronunciationAudioPath: "ყური"),
                Word(origin: "ლოყა", translation: "щека", pronunciationAudioPath: "ლოყა"),
              ],
              icon: UIImage(named: "head")!,
              isActive: false),
        
        Topic(name: "Город",
              words: [
                Word(origin: "აფთიაქი", translation: "аптека", pronunciationAudioPath: "აფთიაქი"),
                Word(origin: "ბანკი", translation: "банк", pronunciationAudioPath: "ბანკი"),
                Word(origin: "ბარი", translation: "бар", pronunciationAudioPath: "ბარი"),
                Word(origin: "აუზი", translation: "бассейн", pronunciationAudioPath: "აუზი"),
                Word(origin: "ბიბლიოთეკა", translation: "библиотека", pronunciationAudioPath: "ბიბლიოთეკა"),
                Word(origin: "საავადმყოფო", translation: "больница", pronunciationAudioPath: "საავადმყოფო"),
                Word(origin: "საცხობი", translation: "булочная", pronunciationAudioPath: "საცხობი"),
                Word(origin: "კინო", translation: "кинотеатр", pronunciationAudioPath: "კინო"),
                Word(origin: "მაღაზია", translation: "магазин", pronunciationAudioPath: "მაღაზია"),
                Word(origin: "ხიდი", translation: "мост", pronunciationAudioPath: "ხიდი"),
                Word(origin: "პარკი", translation: "парк", pronunciationAudioPath: "პარკი"),
                Word(origin: "რესტორანი", translation: "ресторан", pronunciationAudioPath: "რესტორანი"),
                Word(origin: "ბაზარი", translation: "рынок", pronunciationAudioPath: "ბაზარი"),
                Word(origin: "სტადიონი", translation: "стадион", pronunciationAudioPath: "სტადიონი"),
                Word(origin: "თეატრი", translation: "театр", pronunciationAudioPath: "თეატრი"),
                Word(origin: "შადრევანი", translation: "фонтан", pronunciationAudioPath: "შადრევანი"),
                Word(origin: "ეკლესია", translation: "церковь", pronunciationAudioPath: "ეკლესია"),
              ],
              icon: UIImage(named: "city")!,
              isActive: false),
        
        Topic(name: "Числа",
              words: [
                Word(origin: "ერთი", translation: "один", pronunciationAudioPath: "ერთი"),
                Word(origin: "ორი", translation: "два", pronunciationAudioPath: "ორი"),
                Word(origin: "სამი", translation: "три", pronunciationAudioPath: "სამი"),
                Word(origin: "ოთხი", translation: "четыре", pronunciationAudioPath: "ოთხი"),
                Word(origin: "ხუთი", translation: "пять", pronunciationAudioPath: "ხუთი"),
                Word(origin: "ექვსი", translation: "шесть", pronunciationAudioPath: "ექვსი"),
                Word(origin: "შვიდი", translation: "семь", pronunciationAudioPath: "შვიდი"),
                Word(origin: "რვა", translation: "восемь", pronunciationAudioPath: "რვა"),
                Word(origin: "ცხრა", translation: "девять", pronunciationAudioPath: "ცხრა"),
                Word(origin: "ათი", translation: "десять", pronunciationAudioPath: "ათი"),
                Word(origin: "ასი", translation: "сто", pronunciationAudioPath: "ასი"),
                Word(origin: "ათასი", translation: "тысяча", pronunciationAudioPath: "ათასი"),
              ],
              icon: UIImage(named: "numbers")!,
              isActive: false),
        
        Topic(name: "Хобби",
              words: [
                Word(origin: "ცეკვა", translation: "танцы", pronunciationAudioPath: "ცეკვა"),
                Word(origin: "კალათბურთი", translation: "баскетбол", pronunciationAudioPath: "კალათბურთი"),
                Word(origin: "ბილიარდი", translation: "бильярд", pronunciationAudioPath: "ბილიარდი"),
                Word(origin: "ბოულინგი", translation: "боулинг", pronunciationAudioPath: "ბოულინგი"),
                Word(origin: "პოკერი", translation: "покер", pronunciationAudioPath: "პოკერი"),
                Word(origin: "ჭადრაკი", translation: "шахматы", pronunciationAudioPath: "ჭადრაკი"),
                Word(origin: "დაივინგი", translation: "дайвинг", pronunciationAudioPath: "დაივინგი"),
                Word(origin: "ფერწერა", translation: "рисование", pronunciationAudioPath: "ფერწერა"),
                Word(origin: "თევზაობა", translation: "рыбалка", pronunciationAudioPath: "თევზაობა"),
                Word(origin: "ფიტნესი", translation: "фитнес", pronunciationAudioPath: "ფიტნესი"),
                Word(origin: "ფეხბურთი", translation: "футбол", pronunciationAudioPath: "ფეხბურთი"),
                Word(origin: "ფრენბურთი", translation: "волейбол", pronunciationAudioPath: "ფრენბურთი"),
                Word(origin: "ჰოკეი", translation: "хоккей", pronunciationAudioPath: "ჰოკეი"),
                Word(origin: "ფოტო", translation: "фото", pronunciationAudioPath: "ფოტო"),
                Word(origin: "კითხვა", translation: "чтение", pronunciationAudioPath: "კითხვა"),
                Word(origin: "სკეიტბორდინგი", translation: "скейтбординг", pronunciationAudioPath: "სკეიტბორდინგი"),
                Word(origin: "თხილამურები", translation: "лыжи", pronunciationAudioPath: "თხილამურები"),
                Word(origin: "სნოუბორდი", translation: "сноубординг", pronunciationAudioPath: "სნოუბორდი"),
                Word(origin: "ცურვა", translation: "плавание", pronunciationAudioPath: "ცურვა"),
                Word(origin: "ჩოგბურთი", translation: "теннис", pronunciationAudioPath: "ჩოგბურთი"),
                Word(origin: "იოგა", translation: "йога", pronunciationAudioPath: "იოგა"),
                Word(origin: "მუსიკა", translation: "музыка", pronunciationAudioPath: "მუსიკა"),
              ],
              icon: UIImage(named: "hobby")!,
              isActive: false),
        
    ]
    
}




























