class Tender < ApplicationRecord
  enum region: [
    'Адыгея респ.',
    'Алтай респ.',
    'Башкортостан респ.',
    'Бурятия респ.',
    'Дагестан респ.',
    'Ингушетия респ.',
    'Кабардино-Балкарская респ.',
    'Калмыкия респ.',
    'Карачаево-Черкесская респ.',
    'Карелия респ.',
    'Коми респ.',
    'Марий Эл респ.',
    'Мордовия респ.',
    'Саха (Якутия)',
    'Северная Осетия — Алания',
    'Татарстан респ.',
    'Тыва (Тува) респ.',
    'Удмуртская респ.',
    'Хакасия респ.',
    'Чеченская респ.',
    'Чувашская респ.',
    'Автономная республика Крым',
    'Алтайский край',
    'Забайкальский край',
    'Камчатский край',
    'Краснодарский край',
    'Красноярский край',
    'Пермский край',
    'Приморский край',
    'Ставропольский край',
    'Хабаровский край',
    'Амурская обл.',
    'Архангельская обл.',
    'Астраханская обл.',
    'Белгородская обл.',
    'Брянская обл.',
    'Владимирская обл.',
    'Волгоградская обл.',
    'Вологодская обл.',
    'Воронежская обл.',
    'Ивановская обл.',
    'Иркутская обл.',
    'Калининградская обл.',
    'Калужская обл.',
    'Кемеровская обл.',
    'Кировская обл.',
    'Костромская обл.',
    'Курганская обл.',
    'Курская обл.',
    'Ленинградская обл.',
    'Липецкая обл.',
    'Магаданская обл.',
    'Московская обл.',
    'Мурманская обл.',
    'Нижегородская обл.',
    'Новгородская обл.',
    'Новосибирская обл.',
    'Омская обл.',
    'Оренбургская обл.',
    'Орловская обл.',
    'Пензенская обл.',
    'Псковская обл.',
    'Ростовская обл.',
    'Рязанская обл.',
    'Самарская обл.',
    'Саратовская обл.',
    'Сахалинская обл.',
    'Свердловская обл.',
    'Смоленская обл.',
    'Тамбовская обл.',
    'Тверская обл.',
    'Томская обл.',
    'Тульская обл.',
    'Тюменская обл.',
    'Ульяновская обл.',
    'Челябинская обл.',
    'Ярославская обл.',
    'Москва',
    'Санкт-Петербург',
    'Севастополь',
    'Еврейская авт. обл.',
    'Ненецкий авт. окр.',
    'Ханты-Мансийский авт. окр.',
    'Чукотский авт. окр.',
    'Ямало-Ненецкий авт. окр.'
  ]

  enum category: [ 'Аукцион', 'Конкурентный лист', 'Открытый конкурентный лист', 'Запрос котировок', 'Запрос предложений', 'Запрос предложений с переторжкой']

  enum status: ['Опубликованные', 'Прошедшие']

  include PgSearch
  pg_search_scope :pg_search, against: [:name, :address],:using => {tsearch: {prefix: true, any_word: true}}

  validates :start_date, :company_id, :name, :item_price, :status, :end_date, :category, presence: true
  belongs_to :company
  has_many :items
end
