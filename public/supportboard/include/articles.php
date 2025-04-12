<?php

/*
 * ==========================================================
 * ARTICLES.PHP
 * ==========================================================
 *
 * Articles page.
 * © 2017-2025 board.support. All rights reserved.
 *
 */

if (defined('SB_CROSS_DOMAIN') && SB_CROSS_DOMAIN) {
    header('Access-Control-Allow-Origin: *');
}
require_once('functions.php');
sb_cloud_load();
$query_category_id = sb_sanatize_string(sb_isset($_GET, 'category'));
$query_article_id = sb_sanatize_string(sb_isset($_GET, 'article_id'));
$query_search = sb_sanatize_string(sb_isset($_GET, 'search'));
$language = sb_sanatize_string(sb_isset($_GET, 'lang', sb_get_user_language()));
$code = '<div class="' . ($query_category_id ? 'sb-subcategories' : ($query_search ? 'sb-articles-search' : 'sb-grid sb-grid-3')) . '">';
$code_script = '';
$css = 'sb-articles-parent-categories-cnt';
$articles_page_url = sb_get_articles_page_url();
$articles_page_url_slash = $articles_page_url . (substr($articles_page_url, -1) == '/' ? '' : '/');
$url_rewrite = $articles_page_url && sb_is_articles_url_rewrite();
$cloud_url_part = defined('ARTICLES_URL') && isset($_GET['chat_id']) ? sb_sanatize_string($_GET['chat_id']) . '/' : '';
$code_breadcrumbs = $articles_page_url ? '<div class="sb-breadcrumbs"><a href="' . $articles_page_url . ($cloud_url_part ? '/' : '') . substr($cloud_url_part, 0, -1) . '">' . sb_t('All categories', $language) . '</a>' : '';
if ($query_category_id) {
    $category = sb_get_article_category($query_category_id);
    if ($category) {
        $category = sb_get_article_category_language($category, $language, $query_category_id);
        $css = 'sb-articles-category-cnt';
        $image = sb_isset($category, 'image');
        if ($code_breadcrumbs) {
            $code_breadcrumbs .= '<i class="sb-icon-arrow-right"></i><a>' . $category['title'] . '</a></div>';
        }
        $code .= $code_breadcrumbs . '<div class="sb-parent-category-box">' . ($image ? '<img src="' . $image . '" />' : '') . '<div><h1>' . $category['title'] . '</h1><p>' . trim(sb_isset($category, 'description', '')) . '</p>' . '</div></div>';
        $articles = sb_get_articles(false, false, false, $query_category_id, $language);
        $articles_by_category = [];
        for ($j = 0; $j < count($articles); $j++) {
            $category = sb_isset($articles[$j], 'category');
            $key = $category && $category != $query_category_id ? $category : 'no-category';
            $articles_by_category_single = sb_isset($articles_by_category, $key, []);
            array_push($articles_by_category_single, $articles[$j]);
            $articles_by_category[$key] = $articles_by_category_single;
        }
        foreach ($articles_by_category as $key => $articles) {
            $category = sb_get_article_category($key);
            $code .= '<div class="sb-subcategory-box">' . ($category ? '<a href="' . ($url_rewrite ? $articles_page_url_slash . $cloud_url_part . 'category/' . $category['id'] : $articles_page_url . '?category=' . $category['id'] . $cloud_url_part) . '" class="sb-subcategory-title"><h2>' . $category['title'] . '</h2><p>' . trim(sb_isset($category, 'description', '')) . '</p></a>' : '') . '<div class="sb-subcategory-articles">';
            for ($j = 0; $j < count($articles); $j++) {
                $code .= '<a class="sb-icon-arrow-right" href="' . ($url_rewrite ? $articles_page_url_slash . $cloud_url_part . sb_isset($articles[$j], 'slug', $articles[$j]['id']) : $articles_page_url . '?article_id=' . $articles[$j]['id'] . $cloud_url_part) . '">' . $articles[$j]['title'] . '</a>';
            }
            $code .= '</div></div>';
        }
    }
} else if ($query_article_id) {
    $css = 'sb-article-cnt';
    $article = sb_get_articles($query_article_id, false, true);
    if ($article) {
        $article = $article[0];
        if ($code_breadcrumbs) {
            $article_categories = [sb_isset($article, 'parent_category'), sb_isset($article, 'category')];
            for ($i = 0; $i < 2; $i++) {
                if ($article_categories[$i]) {
                    $category = sb_get_article_category_language(sb_get_article_category($article_categories[$i]), $language, $article_categories[$i]);
                    $code_breadcrumbs .= '<i class="sb-icon-arrow-right"></i><a href="' . ($url_rewrite ? $articles_page_url_slash . $cloud_url_part . 'category/' . $article_categories[$i] : $articles_page_url . '?category=' . $article_categories[$i] . $cloud_url_part) . '">' . $category['title'] . '</a>';
                }
            }
            $code_breadcrumbs .= '<i class="sb-icon-arrow-right"></i><a>' . $article['title'] . '</a></div>';
        }
        $code = $code_breadcrumbs . '<div data-id="' . $article['id'] . '" class="sb-article"><div class="sb-title">' . $article['title'] . '</div>';
        $code .= '<div class="sb-content">' . $article['content'] . '</div>';
        if (!empty($article['link'])) {
            $code .= '<a href="' . $article['link'] . '" target="_blank" class="sb-btn-text"><i class="sb-icon-plane"></i>' . sb_t('Read more', $language) . '</a>';
        }
        $code .= '<div class="sb-rating sb-rating-ext"><span>' . sb_t('Rate and review', $language) . '</span><div>';
        $code .= '<i data-rating="positive" class="sb-submit sb-icon-like"><span>' . sb_t('Helpful', $language) . '</span></i>';
        $code .= '<i data-rating="negative" class="sb-submit sb-icon-dislike"><span>' . sb_t('Not helpful', $language) . '</span></i>';
        $code .= '</div></div></div>';
        $code_script = 'let user_rating = false; $(document).on(\'SBInit\', function () { user_rating = SBF.storage(\'article-rating-' . $article['id'] . '\'); if (user_rating) $(\'.sb-article\').attr(\'data-user-rating\', user_rating); });  $(\'.sb-article\').on(\'click\', \'.sb-rating-ext [data-rating]\', function (e) { SBChat.articleRatingOnClick(this); e.preventDefault(); return false; });';
    }
} else if ($query_search) {
    $css = 'sb-article-search-cnt';
    $articles = sb_search_articles($query_search, $language);
    $count = count($articles);
    $code .= '<h2 class="sb-articles-search-title">' . sb_t('Search results for:', $language) . ' <span>' . $query_search . '</span></h2><div class="sb-search-results">';
    for ($i = 0; $i < $count; $i++) {
        $code .= '<a href="' . ($url_rewrite ? $articles_page_url_slash . $cloud_url_part . sb_isset($articles[$i], 'slug', $articles[$i]['id']) : $articles_page_url . '?article_id=' . $articles[$i]['id'] . $cloud_url_part) . '"><h3>' . $articles[$i]['title'] . '</h3><p>' . $articles[$i]['content'] . '</p></a>';
    }
    if (!$count) {
        $code .= '<p>' . sb_t('No results found.', $language) . '</p>';
    }
    $code .= '</div>';
} else {
    $categories = sb_get_articles_categories('parent');
    $count = count($categories);
    if ($count) {
        for ($i = 0; $i < count($categories); $i++) {
            $category = $categories[$i];
            $image = sb_isset($category, 'image');
            $title = sb_isset($category, 'title');
            $description = sb_isset($category, 'description');
            if ($language) {
                $translations = sb_isset(sb_isset($category, 'languages', []), $language);
                if ($translations) {
                    $title = sb_isset($translations, 'title', $title);
                    $description = sb_isset($translations, 'description', $description);
                }
            }
            $code .= '<a href="' . ($url_rewrite ? $articles_page_url_slash . $cloud_url_part . 'category/' . $category['id'] : $articles_page_url . '?category=' . $category['id'] . $cloud_url_part) . '">' . ($image ? '<img src="' . $image . '" />' : '') . '<h2>' . $title . '</h2><p>' . $description . '</p></a>';
        }
    } else {
        $code .= '<p>' . sb_t('No results found.', $language) . '</p>';
    }
}
if (sb_get_setting('rtl') || in_array(sb_get_user_language(), ['ar', 'he', 'ku', 'fa', 'ur'])) {
    $css .= ' sb-rtl';
}
$code .= '</div>';

function sb_get_article_category_language($category, $language, $category_id) {
    if (isset($category['languages'][$language])) {
        return $category['languages'][$language];
    }
    if (sb_get_multi_setting('google', 'google-multilingual-translation')) {
        $translations = [$category['title']];
        if (isset($category['description'])) {
            array_push($translations, $category['description']);
        }
        $translations = sb_google_translate($translations, $language);
        $category['title'] = $translations[0][0];
        $category['description'] = sb_isset($translations[0], 1, '');
        $articles_categories = sb_get_articles_categories();
        for ($i = 0; $i < count($articles_categories); $i++) {
            if ($articles_categories[$i]['id'] == $category_id) {
                $articles_categories[$i]['languages'][$language] = $category;
                sb_save_articles_categories($articles_categories);
            }
        }
    }
    return $category;
}

?>

<div class="sb-articles-page <?php echo $css ?>">
    <div class="sb-articles-header">
        <div>
            <h1>
                <?php sb_e(sb_get_setting('articles-title', 'Help Center')) ?>
            </h1>
            <div class="sb-input sb-input-btn">
                <input placeholder="<?php sb_e('Search for articles...') ?>" autocomplete="off" />
                <div class="sb-search-articles sb-icon-search"></div>
            </div>
        </div>
    </div>
    <div class="sb-articles-body">
        <?php echo $code ?>
    </div>
</div>
<?php sb_js_global() ?>
<script>
    $('.sb-search-articles').on('click', function () {
        document.location.href = '<?php echo ($articles_page_url ? $articles_page_url : '') . (defined('ARTICLES_URL') && isset($_GET['chat_id']) ? (substr($articles_page_url, -1) == '/' ? '' : '/') . $_GET['chat_id'] . '/' : '') . '?search=\' + $(this).prev().val();' ?>
    });
    <?php echo $code_script ?>
</script>
