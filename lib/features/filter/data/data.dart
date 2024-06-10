import '../model/model.dart';

final List<FilterItem> filterData = [
  FilterItem(
    name: Filters.date.name,
    title: 'Даты',
    tiles: const [
      FilterTile(title: 'Сегодня', value: 'today'),
      FilterTile(title: 'Текущая неделя', value: 'currentWeek'),
      FilterTile(title: 'Текущий месяц', value: 'currentMonth'),
      FilterTile(title: 'Вчера', value: 'tomorrow'),
      FilterTile(title: 'Прошлый месяц', value: 'lastMonth'),
      FilterTile(title: 'Прошлая неделя', value: 'lastWeek'),
    ],
  ),
  FilterItem(
    name: Filters.lfl.name,
    title: 'Сравнение с подобным периодом из прошлого',
    tiles: const [
      FilterTile(title: 'LFL: Годовой', value: 'LFL: Годовой'),
      FilterTile(title: 'LFL: Ближайший переод', value: 'LFL: Ближайший переод'),
      FilterTile(title: 'LFL: Прошлый месяц', value: 'LFL: Прошлый месяц'),
    ],
  ),
  FilterItem(
    name: Filters.city.name,
    title: 'Города',
    tiles: const [
      FilterTile(title: 'Все города', value: 'Все города'),
      FilterTile(title: 'Ижевск', value: 'Ижевск'),
    ],
  ),
  FilterItem(
    name: Filters.store.name,
    title: 'Торговые точки',
    tiles: const [
      FilterTile(title: 'Все тогровые точки', value: 'Все тогровые точки'),
      FilterTile(
        title: 'УР Ижевск Детство №54 ул.Воткинское шоссе, д.38, Воткинское',
        value: 'УР Ижевск Детство №54 ул.Воткинское шоссе, д.38, Воткинское',
      ),
    ],
  ),
  FilterItem(
    name: Filters.level.name,
    title: 'Уровни',
    tiles: const [
      FilterTile(title: 'Все уровни', value: 'Все уровни'),
      FilterTile(title: 'Свои Заведующие аптеками', value: 'Свои Заведующие аптеками'),
      FilterTile(title: 'Все Заведующие аптеками', value: 'Все Заведующие аптеками'),
      FilterTile(title: 'Все СПС', value: 'Все СПС'),
    ],
  ),
  FilterItem(
    name: Filters.subordinate.name,
    title: 'Подчинённые',
    tiles: const [
      FilterTile(title: 'Все подчинённые', value: 'Все подчинённые'),
      FilterTile(title: 'Бодяга Алёна Ивановна', value: 'Бодяга Алёна Ивановна'),
      FilterTile(title: 'Барабанщиков Кирилл Дмитриевич', value: 'Барабанщиков Кирилл Дмитриевич'),
    ],
    search: true,
  ),
  FilterItem(
    name: Filters.plan.name,
    title: 'План',
    tiles: const [
      FilterTile(title: 'План/Факт', value: 'План/Факт'),
      FilterTile(title: 'План/Прогноз', value: 'План/Прогноз'),
    ],
  ),
  FilterItem(
    name: Filters.indicator.name,
    title: 'Показатели',
    tiles: const [
      FilterTile(title: 'Выручка', value: 'Выручка'),
      FilterTile(title: 'Кол-во продаж', value: 'Кол-во продаж'),
      FilterTile(title: 'SMART товары, уп.', value: 'SMART товары, уп.'),
      FilterTile(title: 'Доля чеков со SMART-товарами', value: 'Доля чеков со SMART-товарами'),
      FilterTile(title: 'ВМТ, руб.', value: 'ВМТ, руб.'),
      FilterTile(title: 'Доля ВМТ', value: 'Доля ВМТ'),
      FilterTile(title: 'СТМ, руб.', value: 'СТМ, руб.'),
      FilterTile(title: 'Доля СТМ', value: 'Доля СТМ'),
      FilterTile(title: 'Средний чек', value: 'Средний чек'),
      FilterTile(title: 'Кол-во позиций в чеке', value: 'Кол-во позиций в чеке'),
      FilterTile(title: 'ИСГ 1-6мес.', value: 'ИСГ 1-6мес.'),
      FilterTile(title: 'Кол-во товаров в чеке (шт)', value: 'Кол-во товаров в чеке (шт)'),
      FilterTile(title: 'ВМТ, доля чеков', value: 'ВМТ, доля чеков'),
      FilterTile(title: 'Доля СМАРТ уп в чеках', value: 'Доля СМАРТ уп в чеках'),
      FilterTile(title: 'Валовый доход', value: 'Валовый доход'),
    ],
    search: true,
  ),
  FilterItem(
    name: Filters.block.name,
    title: 'Сотрудники',
    tiles: const [
      FilterTile(title: 'Все пользователи', value: ''),
      FilterTile(title: 'Заблокированные', value: 'inactive'),
      FilterTile(title: 'Активные', value: 'active'),
    ],
  ),
  FilterItem(
    name: Filters.status.name,
    title: 'Статус задачи',
    tiles: const [
      FilterTile(title: 'Любой статус', value: ''),
      FilterTile(title: 'Новые', value: 'Новая'),
      FilterTile(title: 'В процессе', value: 'В процессе'),
      FilterTile(title: 'Сделанные', value: 'Сделано'),
    ],
  ),
  FilterItem(
    name: Filters.type.name,
    title: 'Тип задачи',
    tiles: const [
      FilterTile(title: 'Любой тип', value: ''),
      FilterTile(title: 'Срочно', value: 'СРОЧНО'),
      FilterTile(title: 'Позже', value: 'ПОЗЖЕ'),
      FilterTile(title: 'Не важно', value: 'НЕ ВАЖНО'),
    ],
  ),
];
