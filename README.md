# Модуль [Naumen SMP]() & [ITSM 365](): простой дашборд
## Общее назначение

Простой интерактивный дашборд для отображения метрик приложениях на базе Naumen SMP или ITSM 365

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

1. Откройте (GIST)[https://gist.github.com/mdemyanov/cc9af0741303846e6231c46f38e504d4] с актуальной версией модуля.
2. Создайте в системе скриптовые модули с кодами из названий файлов:
    1. flatDashboard.groovy -> flatDashboard 
    2. flatDashboardParams.groovy -> flatDashboardParams 
**Внимание!** Оставьте код модуля flatDashboard без зименений. Дополнительные правила поиска и фильтрации вы можете 
внести в модуль flatDashboardParams.

### Загрузить приложение

1. Перейдите в директорию [release](../tree/master/release)
2. Скачайте самый новый архив
3. Загрузите на свой стенд по [инструкции](http://www.naumen.ru/docs/sd/NSD_manual.htm#setting_advanced/applications.htm#02)


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

![Заявки по каманде](https://github.com/mdemyanov/nsmp_dashboards/raw/master/screenshots/settings.jpg)

- callsByStates - код дашборда (любая уникальная комбинация букв латинского алфавита)
- \#donut - тип диаграммы, доступные типы:
 * radialBar ![radialBar](https://github.com/mdemyanov/nsmp_dashboards/raw/master/screenshots/radialBar.svg)
 * pie ![pie](https://github.com/mdemyanov/nsmp_dashboards/raw/master/screenshots/simple-pie-chart.svg)
 * donut ![pie](https://github.com/mdemyanov/nsmp_dashboards/raw/master/screenshots/simple-donut-chart.svg)
 * line ![pie](https://github.com/mdemyanov/nsmp_dashboards/raw/master/screenshots/basic-line-chart.svg)
 * bar (горизонтальные колонки), column (вертикальные) ![pie](https://github.com/mdemyanov/nsmp_dashboards/raw/master/screenshots/basic-bar-chart.svg)
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
