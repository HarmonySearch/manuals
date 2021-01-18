
<?php
// --- Добавляем в пост  ----------
function simple_theme_setup()
{
  // админки меню миниатюры
  add_theme_support('post-thumbnails');

  // меню
  register_nav_menus(array(
    'primary' => __('Первое меню'),
    'second' => __('Второе меню')
  ));
}
add_action('after_setup_theme', 'simple_theme_setup');

//
// Хук, чтобы урезать вывод поста до 20 слов.
//
function set_excerpt_length()
{
  return 25;
}
add_filter('excerpt_length', 'set_excerpt_length');

// Расположение виджета
function init_widgets($id)
{
  register_sidebar(array(
    'name' => 'Sidebar',
    'id' => 'sidebar',
    'before_widget' => '<div class="side-widget">',
    'after_widget' => '</div>',
    'before_title' => '<h3>',
    'after_title' => '</h3>'
  ));
}

add_action('widgets_init', 'init_widgets');

//хук в init action и вызов create_book_taxonomies когда хук сработает
add_action('init', 'create_topics_hierarchical_taxonomy', 0);

//задаем название для произвольной таксономии Topics для ваших записей

function create_topics_hierarchical_taxonomy()
{

  // Добавляем новую таксономию, делаем ее иерархической вроде рубрик
  // также задаем перевод для интерфейса

  $labels = array(
    'name' => _x('Жанры', 'taxonomy general name'),
    'singular_name' => _x('Жанр', 'taxonomy singular name'),
    'search_items' =>  __('Поиск жанров'),
    'all_items' => __('Все жанры'),
    'parent_item' => __('Родительский жанр'),
    'parent_item_colon' => __('Родительский жанр:'),
    'edit_item' => __('Редактировать жанр'),
    'update_item' => __('Обновить жанры'),
    'add_new_item' => __('Добавить новый жанр'),
    'new_item_name' => __('Новое имя жанра'),
    'menu_name' => __('Категории'),
  );

  // Теперь регистрируем таксономию

  register_taxonomy('genres', array(), array(
    'hierarchical' => true,
    'labels' => $labels,
    'show_ui' => true,
    'show_admin_column' => true,
    'query_var' => true,
    'rewrite' => array('slug' => 'genres'),
  ));
}

function wpschool_create_movies_posttype() {
  $labels = array(
      'name' => _x( 'Фильмы', 'Тип записей Фильмы', 'root' ),
      'singular_name' => _x( 'Фильм', 'Тип записей Фильмы', 'root' ),
      'menu_name' => __( 'Фильмы', 'root' ),
      'all_items' => __( 'Все фильмы', 'root' ),
      'view_item' => __( 'Смотреть фильм', 'root' ),
      'add_new_item' => __( 'Добавить новый фильм', 'root' ),
      'add_new' => __( 'Добавить новый', 'root' ),
      'edit_item' => __( 'Редактировать фильм', 'root' ),
      'update_item' => __( 'Обновить фильм', 'root' ),
      'search_items' => __( 'Искать фильм', 'root' ),
      'not_found' => __( 'Не найдено', 'root' ),
      'not_found_in_trash' => __( 'Не найдено в корзине', 'root' ),
  );

  $args = array(
      'label' => __( 'movies', 'root' ),
      'description' => __( 'Каталог фильмов', 'root' ),
      'labels' => $labels,
      'supports' => array( 'title', 'editor', 'excerpt', 'author', 'thumbnail', 'comments', 'revisions', 'custom-fields', ),
      'taxonomies' => array( 'genres' ),
      'hierarchical' => false,
      'public' => true,
      'show_ui' => true,
      'show_in_menu' => true,
      'show_in_nav_menus' => true,
      'show_in_admin_bar' => true,
      'menu_position' => 5,
      'can_export' => true,
      'has_archive' => true,
      'exclude_from_search' => false,
      'publicly_queryable' => true,
      'capability_type' => 'page',
  );

  register_post_type( 'movies', $args );

}
add_action( 'init', 'wpschool_create_movies_posttype', 0 );
