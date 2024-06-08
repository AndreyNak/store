import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';

const resources = {
  en: {
    translation: {
      "delete": "Delete",
      "edit": "Edit",
      "submit": "Submit",
      "close": "Close",
      "create": "Create",
      "loading": 'Loading',
      "bundles": {
        "confirm": {
          "are_you_sure": "Are you sure?",
          "no": "No",
          "yes": "Yes"
        },
        "paginate": {
          "previous": "Previous",
          "next": "Next"
        },
        "errors": {
          "not_found": {
            "subheader": "Page Not Found",
            "text": "We can't seem to find the page you're looking for. Go Back to choose a new direction.",
          },
          "internal_server_error": {
            "subheader": "Something is wrong",
            "text": "Our development team have been notified of this issue and they are working on it.",
          },
          "unauthorized": {
            "subheader": "Unauthorized Access",
            "text": "You do not have the necessary permissions to access this resource.",
          },
          "back_to_dashboard": "Back to Dashboard"
        }
      },
      "header": {
        "welcome": "Welcome",
        "role": "Role",
      },
      "admin": {
        "dashboard": {
          "title": "Admin Dashboard",
          "welcome": "Welcome to the admin dashboard"
        },
        "chats": {
          "chat": {
            "no_more_messages": "No more messages"
          },
          "chats": {
            "login": "login",
            "question": "question"
          }
        },
        "products": {
          "discount_form": {
            "make_discount_for": "Make discount for",
            "current_price": "Current price",
            "discount_price": "Discount price",
            "start_date": "Start date",
            "end_date": "End date",
            "cancel_discount": "Cancel discount"
          },
          "product_form": {
            "create_new_product": "Create new product",
            "name": "Name",
            "description": "Description",
            "image": "Image",
            "price": "Price",
            "quantity": "Quantity",
            "type_products": "Type Products",
            "create_product": "Create product",
            "edit_product": "Edit product",
          },
          "products": {
            "list_of_products": "List of products",
            "sold_out": "Sold out",
            "search": "Search",
            "create_new_product": "Create new product",
            "quantity": "Quantity",
            "discount_price": "Discount Price",
            "make_discount": "Make discount",
            "empty": "Empty!"
          }
        },
        "roles": {
          "roles": {
            "roles": "Roles",
            "permissions": "Permissions"
          },
          "permissions": {
            "permissions": {
              "permissions": "Permissions",
              "create_permission": "Create Permission"
            }
          },
          "permission": {
              "how_create": "How create permissions",
              "name": "Name",
            }
        },
        "type_products": {
          "type_product_form": {
            "create_type_product": "Create new type product",
            "edit_type_product": 'Edit type product',
            "name": "Name",
            "description": "Description",
            "products": "Products",
            "type_product": "type product"
          },
          "type_products": {
          "list": "List of type products",
          "create": "Create new type product"
          }
        },
        "users": {
          "users": {
            "list": "List of users",
            "email": "Email",
            "roles": "Roles",
            "count_orders": "Count Orders"
          },
          "user": {
            "back": "Back",
            "profile": "User Profile",
            "email": "Email",
            "login": "Login",
            "name": "Name",
            "surname": "Surname",
            "date_of_birth": "Date of Birth",
            "address": "Address",
            "orders": "Orders",
            "start_date": "Start Date",
            "end_date": "End Date",
            "all": "All",
            "count": "Count",
            "total_amount": "Total amount",
            "order_id": "Order ID",
            "order_status": "Order status",
            "quantity": "Quantity",
            "ordered_at": "Ordered at",
            "rating": "Rating",
            "unrated": "unrated",
            "total_value": "Total value",
            "not_yet": "Not yet"
          }
        }
      },
      "cart": {
        "cart": {
          "title": "Cart",
          "home": "Home",
          "product": "Product",
          "price": "Price",
          "quantity": "Quantity",
          "actions": "Actions",
          "sold_out": "Sold out",
          "total_price": "Total Price",
          "checkout": "Checkout",
          "empty": "Your cart is empty.",
          "remove": "Remove"
        }
      },
      "products": {
        "products": {
          "navbar": {
            "profile": "Profile",
            "support": "Support",
            "admin": "Admin",
            "cart": "Cart",
            "total_price": "Total Price",
            "checkout": "Checkout"
          },
          "filters": {
            "all": "All",
            "with_discount": "With discount",
            "favorites": "Favorites",
            "search": "Search"
          },
          "sold_out": "Sold out",
          "amount_in_cart": "Amount in cart",
          "nothing": "Nothing found"
        },
        "product": {
          "quantity": 'Quantity',
          "amount_in_cart": "Amount in cart",
          "open": "Open comments",
          "close": "Close comments"
        }
      },
      "auth": {
        "logout": "Logout",
        "signup": {
          "email": "Email",
          "login": "Login",
          "password": "Password",
          "submit": "Submit",
          "already_registered": "Already registered?",
          "login_here": "Login here."
        },
        "signin": {
          "login": "Login",
          "password": "Password",
          "submit": "Login",
          "not_registered_yet": "Not registered yet?",
          "signup": "Signup"
        }
      }
    }
  },
  ru: {
    translation: {
      "delete": "Удалить",
      "edit": "Изменить",
      "submit": 'Отправить',
      "close": "Закрыть",
      "create": "Создать",
      "loading": "Загрузка",
      "bundles": {
        "confirm": {
          "are_you_sure": "Вы уверены?",
          "no": "Нет",
          "yes": "Да"
        },
        "paginate": {
           "previous": "Предыдущий",
            "next": "Следующий"
        },
        "errors": {
          "not_found": {
            "subheader": "Страница не найдена",
            "text": "Мы не можем найти страницу, которую вы ищете. Вернитесь, чтобы выбрать новое направление.",
          },
          "internal_server_error": {
            "subheader": "Что-то пошло не так",
            "text": "Наша команда разработчиков уведомлена об этой проблеме и работает над ее устранением.",
          },
          "unauthorized": {
            "subheader": "Несанкционированный доступ",
            "text": "У вас нет необходимых разрешений для доступа к этому ресурсу.",
          },
          "back_to_dashboard": "Вернуться на главную"
        }
      },
      "header": {
        "welcome": "Добро пожаловать",
        "role": "Роль",
      },
      "admin": {
        "dashboard": {
          "title": "Панель администратора",
          "welcome": "Добро пожаловать в панель администратора"
        },
        "chats": {
          "chat": {
            "no_more_messages": "Нет больше сообщений"
          },
          "chats": {
            "login": "логин",
            "question": "вопрос"
          }
        },
        "products": {
          "discount_form": {
            "make_discount_for": "Сделать скидку на",
            "current_price": "Текущая цена",
            "discount_price": "Цена со скидкой",
            "start_date": "Дата начала",
            "end_date": "Дата окончания",
            "cancel_discount": "Отменить скидку"
          },
          "product_form": {
            "create_new_product": "Создать новый продукт",
            "name": "Имя",
            "description": "Описание",
            "image": "Изображение",
            "price": "Цена",
            "quantity": "Количество",
            "type_products": "Тип продуктов",
            "create_product": "Создать продукт",
            "edit_product": "Редактировать продукт"
          },
          "products": {
            "list_of_products": "Список продуктов",
            "sold_out": "Распродано",
            "search": "Поиск",
            "create_new_product": "Создать новый продукт",
            "quantity": "Количество",
            "discount_price": "Цена со скидкой",
            "make_discount": "Сделать скидку",
            "empty": "Пусто!"
          }
        },
        "roles": {
          "roles": {
            "roles": "Роли",
            "permissions": "Разрешения"
          },
          "permissions": {
            "permissions": {
              "permissions": "Разрешения",
              "create_permission": "Создать разрешение"
            },
            "permission": {
              "how_create": "Как создавать разрешения",
              "name": "Имя",
            }
          }
        },
        "type_products": {
          "type_product_form": {
            "create_type_product": "Создать новый тип продуктов",
            "edit_type_product": 'Изменить тип продуктов',
            "name": "Имя",
            "description": "Описание",
            "products": "Продукты",
            "type_product": "тип продукта"
          },
          "type_products": {
            "list": "Список типов продуктов",
            "create": "Создать новый тип продуктов"
          }
        },
        "users": {
          "users": {
            "list": "Список пользователей",
            "email": "Почта",
            "roles": "Роли",
            "count_orders": "Кол-во заказов"
          },
          "user": {
            "back": "Назад",
            "profile": "Профиль пользователя",
            "email": "Электронная почта",
            "login": "Логин",
            "name": "Имя",
            "surname": "Фамилия",
            "date_of_birth": "Дата рождения",
            "address": "Адрес",
            "orders": "Заказы",
            "start_date": "Дата начала",
            "end_date": "Дата окончания",
            "all": "Все",
            "count": "Количество",
            "total_amount": "Общая сумма",
            "order_id": "ID заказа",
            "order_status": "Статус заказа",
            "quantity": "Количество",
            "ordered_at": "Заказано в",
            "rating": "Рейтинг",
            "unrated": "без оценки",
            "total_value": "Общая стоимость",
            "not_yet": "Еще нет"
          }
        }
      },
      "cart":{
        "cart": {
        "title": "Корзина",
        "home": "Домой",
        "product": "Продукт",
        "price": "Цена",
        "quantity": "Количество",
        "actions": "Действия",
        "sold_out": "Распродано",
        "total_price": "Общая цена",
        "checkout": "Оформить заказ",
        "empty": "Ваша корзина пуста.",
        "remove": "Удалить"
        }
      },
      "products": {
        "products": {
          "navbar": {
            "profile": "Профиль",
            "support": "Поддержка",
            "admin": "Админ",
            "cart": "Корзина",
            "total_price": "Общая цена",
            "checkout": "Оформить заказ"
          },
          "filters": {
            "all": "Все",
            "with_discount": "Со скидкой",
            "favorites": "Избранное",
            "search": "Поиск"
          },
          "sold_out": "Распродано",
          "amount_in_cart": "Кол-во",
          "nothing": "Ничего не найдено"
        },
        "product": {
          "quantity": 'Кол-во',
          "amount_in_cart": "Кол-во в корзине",
          "open": "Открыть комментарии",
          "close": "Закрыть комментарии"
        }
      },
      "auth": {
        "logout": "Выход",
        "signup": {
          "email": "Электронная почта",
          "login": "Логин",
          "password": "Пароль",
          "submit": "Отправить",
          "already_registered": "Уже зарегистрированы?",
          "login_here": "Войдите здесь."
        },
        "signin": {
          "login": "Логин",
          "password": "Пароль",
          "submit": "Войти",
          "not_registered_yet": "Еще не зарегистрированы?",
          "signup": "Регистрация"
        }
      }
    }
  }
};

i18n
  .use(initReactI18next)
  .init({
    resources,
    lng: "en",
    interpolation: {
      escapeValue: false
    }
  });

export default i18n;
