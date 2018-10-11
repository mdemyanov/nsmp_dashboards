# Модуль [Naumen SMP]() & [ITSM 365](): простой дашборд
## Общее назначение

Простой интерактивный дашборд для отображения метрик в приложениях на базе Naumen SMP или ITSM 365

**Внимание!** Этот проект не является официальным продуктом компании Naumen.

## Возможности

Модуль умеет отображать простые метрики (количество заявок или задач) в различных срезах (ответственные, статусы, приоритеты и прочее), с детализацией до конкретных объектов (Drill Down).

## Скриншоты

### Заявки по услуге

#### Открытые инциденты по приоритетам / Заявки по статусам

![заявки по услуге](https://github.com/mdemyanov/nsmp_dashboards/raw/master/screenshots/dashboard_service_calls_by_slm_service.png)

#### Заявки по услуге в статусе "Новая"

![Заявки по услуге в статусе "Новая"](https://github.com/mdemyanov/nsmp_dashboards/raw/master/screenshots/dashboard_details_new_scalls_by_slm_service.png)

### Заявки по команде

#### Открытые заявки по исполнителям / Заявки за месяц по статусам

![Заявки по каманде](https://github.com/mdemyanov/nsmp_dashboards/raw/master/screenshots/dashboard_servicecalls_by_team.png)

## Настройки виджета

### Загрузить вспомогательные модули

1. Откройте [GIST](https://gist.github.com/mdemyanov/cc9af0741303846e6231c46f38e504d4) с актуальной версией модуля.
2. Создайте в системе скриптовые модули с кодами из названий файлов:
    1. flatDashboard.groovy -> flatDashboard 
    2. flatDashboardParams.groovy -> flatDashboardParams 
    
**Внимание!** Оставьте код модуля flatDashboard без зименений. Дополнительные правила поиска и фильтрации вы можете 
внести в модуль flatDashboardParams.

### Загрузить приложение

1. Перейдите в директорию [release](https://github.com/mdemyanov/nsmp_dashboards/tree/master/release)
2. Скачайте самый новый архив
3. Загрузите на свой стенд по [инструкции](http://www.naumen.ru/docs/sd/NSD_manual.htm#setting_advanced/applications.htm#02)

### Настройка нового класса

Создайте класс, который в будущем будет выполнять роль контейнера для хранения данных отчета:
- Название класса: Контейнер отчета
- Код класса: userReport
- Жизненный цикл - да

#### Настройка атрибутов

Добавьте новые атрибуты:
- Группировка (тип: строка, код: groupBy)
- Источник (тип: строка, код: source)
- Код (тип: строка, код: code)
- Количество (тип: вещественное, код: count)

Настройте атрибут "Название":
- Составной
- ШаблонЖ Контейнер для объектов класса ${metaClass} 

Настройте карточку класса:
- Заголовок: Без заголовка
- Тулбар: уберите все кнопки с панели
- Вкладка "Параметры объекта": убрать все контенты

Пример карточки на скриншоте ниже:
![Заявки по каманде](https://github.com/mdemyanov/nsmp_dashboards/raw/master/screenshots/user_report_card_settings.png)

#### Настройка типов контейнеров

Создайте свои типы контейнеров под каждый класс объектов системы, для которых вы хотите настроить дашборды. При создании используйте следующую логику:
- Название типа: аналогично классу объектов на дашборде, например, Заявка
- Код типа: аналогично коду класса, например, serviceCall

Атрибут для хранения ссылок на объекты:
- Название: Объекты
- Код: objects
- Тип: набор ссылок на БО целевого класса объектов (например, Заявка)

Карточка объекта:
- Разорвите наследование настроек карточки в типе
- Выведете на карточку контент типа "Список связанных объектов" через атрибут "Объекты"(код: objects)


### Настройка контента

1. Перейдите в настройки карточки класса/типа, для которого хотите добавить дашборд
2. Нажмите кнопку "Добавить контент", для нужного компонента интерфейса
3. Выберите тип контента "Встраиваемое приложение"
4. Заполните название (произвольно) и код (по правилу)
5. Укажите опциональные настройки и нажмите кнопку "Сохранить"

#### Пример настройки контента

**callsByStates#donut@fqn-serviceCall@sourceAttr-responsibleTeam@groupAttr-state@group-states$serviceCall@intervalAttr-creationDate@interval-4$week@filter-openedScalls@above-0**
Описание примера:
- выести дашборд в виде "бубликовой" диаграммы
- по объектам  класса "Заявка"
- связанным с текущим объектом через атрибут "Ответственная команда"
- с группировкой по атрибуту "Статус"
- с предопределенным правилом получения групп "states"
- дата создания которых находится в промежутке "4$week" от текущей даты
- с дополнительной фильтрацией по предопределенному правилу "openedScalls"
- с правилом выборки групп, в которых количество заявок больше 0


#### Описание настроек контента

![Заявки по каманде](https://github.com/mdemyanov/nsmp_dashboards/raw/master/screenshots/settings.jpg?sanitize=true)

- callsByStates - код дашборда (любая уникальная комбинация букв латинского алфавита)
- \#donut - тип диаграммы, доступные типы:
 * radialBar ![radialBar](https://github.com/mdemyanov/nsmp_dashboards/raw/master/screenshots/radialBar.svg?sanitize=true)
 * pie ![pie](https://github.com/mdemyanov/nsmp_dashboards/raw/master/screenshots/simple-pie-chart.svg?sanitize=true)
 * donut ![pie](https://github.com/mdemyanov/nsmp_dashboards/raw/master/screenshots/simple-donut-chart.svg?sanitize=true)
 * line ![pie](https://github.com/mdemyanov/nsmp_dashboards/raw/master/screenshots/basic-line-chart.svg?sanitize=true)
 * bar (горизонтальные колонки), column (вертикальные) ![pie](https://github.com/mdemyanov/nsmp_dashboards/raw/master/screenshots/basic-bar-chart.svg?sanitize=true)
- @fqn-class$case - код метакласса объектов для диаграммы, например, task или task$task
- @sourceAttr-attrCode - код связи объектов диаграммы с карточкой текущего объекта
- @groupAttr-attrCode - атрибут, по которому производится группировка
- @group-ruleCode$param1$param2 - правило поиска групп
- @intervalAttr-attrCode - атрибут типа "Дата/время", по которому нужно ограничить интервал
- @interval-length$interval - интервал для ограничения, где length - целое число, interval - строка
- @above-N - дополнительный фильтр для элементов дашборда, количество объектов больше N (целое число)

## Лицензия

Распространяю под лицензией BSD
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).
