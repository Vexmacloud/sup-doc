<?php

/*
 * ==========================================================
 * WHATSAPP APP
 * ==========================================================
 *
 * WhatsApp app main file. © 2017-2024 board.support. All rights reserved.
 *
 */

define('SB_WHATSAPP', '1.2.4');

function sb_whatsapp_send_message($to, $message = '', $attachments = [], $phone_number_id = false) {
    if (empty($message) && empty($attachments)) {
        return false;
    }
    $message_original = $message;
    $twilio = !empty(sb_get_multi_setting('whatsapp-twilio', 'whatsapp-twilio-user'));
    $cloud_phone_id = $twilio ? false : ($phone_number_id ? $phone_number_id : sb_get_multi_setting('whatsapp-cloud', 'whatsapp-cloud-phone-id')); // Deprecated.  ($phone_number_id ? $phone_number_id : sb_get_multi_setting('whatsapp-cloud', 'whatsapp-cloud-phone-id')
    $to = trim(str_replace('+', '', $to));
    $user = sb_get_user_by('phone', $to);
    $response = false;
    $merge_field = false;
    $merge_field_checkout = false;

    // Security
    if (!sb_is_agent() && !sb_is_agent($user) && sb_get_active_user_ID() != sb_isset($user, 'id') && empty($GLOBALS['SB_FORCE_ADMIN'])) {
        return sb_error('security-error', 'sb_whatsapp_send_message');
    }

    // Send the message
    if (is_string($message) && $user) {
        $message = sb_messaging_platforms_text_formatting($message);
        $message = str_replace('__', '_', $message);
        $message = sb_whatsapp_rich_messages($message, ['user_id' => $user['id']]);
        $shortcodes = $message[2];
        if ($message[1]) {
            $attachments = $message[1];
        }
        $message = $message[0];
        if (is_string($message)) {
            $merge_fields = sb_get_shortcode($message, false, true);
            for ($i = 0; $i < count($merge_fields); $i++) {
                switch ($merge_fields[$i]['shortcode_name']) {
                    case 'catalog':
                        $merge_field = $merge_fields[$i];
                        break;
                    case 'catalog_checkout':
                        $merge_field_checkout = $merge_fields[$i];
                        break;
                    case 'wa_flow_email':
                        return sb_whatsapp_cloud_flow_send_builtin($to, $phone_number_id, 'email', $shortcodes[0]);
                    case 'wa_flow':
                        return sb_whatsapp_cloud_flow_send($to, $merge_fields[$i]['id'], $phone_number_id, sb_isset($merge_fields[$i], 'header', 'header'), sb_isset($merge_fields[$i], 'body', 'body'), sb_isset($merge_fields[$i], 'button', 'button'));
                }
            }
        }
    }
    $attachments_count = $attachments ? count($attachments) : 0;
    if ($twilio) {
        $supported_mime_types = ['step', 'stp', 'stl', 'obj', '3mf', 'bmp', 'aac', 'webm', 'oga', 'json', 'psd', 'ai', 'jpg', 'jpeg', 'png', 'gif', 'webp', 'pdf', 'doc', 'docx', 'key', 'ppt', 'odt', 'xls', 'xlsx', 'zip', 'rar', 'mp3', 'm4a', 'ogg', 'wav', 'mp4', 'mov', 'wmv', 'avi', 'mpg', 'ogv', '3gp', '3g2', 'mkv', 'txt', 'ico', 'csv', 'ttf', 'font', 'css', 'scss'];
        $query = ['Body' => $message, 'To' => 'whatsapp:+' . $to];
        if ($attachments_count) {
            if (in_array(strtolower(sb_isset(pathinfo($attachments[0][1]), 'extension')), $supported_mime_types)) {
                $query['MediaUrl'] = str_replace(' ', '%20', $attachments[0][1]);
            } else {
                $query['Body'] .= PHP_EOL . PHP_EOL . $attachments[0][1];
            }
        }
        $response = sb_whatsapp_twilio_curl($query, '/Messages.json');
        if ($attachments_count > 1) {
            $query['Body'] = '';
            for ($i = 1; $i < $attachments_count; $i++) {
                if (in_array(strtolower(sb_isset(pathinfo($attachments[$i][1]), 'extension')), $supported_mime_types)) {
                    $query['MediaUrl'] = str_replace(' ', '%20', $attachments[$i][1]);
                } else {
                    $query['Body'] = $attachments[$i][1];
                }
                $response = sb_whatsapp_twilio_curl($query, '/Messages.json');
            }
        }
    } else {
        if ($message) {
            $query = ['messaging_product' => 'whatsapp', 'recipient_type' => 'individual', 'to' => $to];
            if (is_string($message)) {
                if ($merge_field_checkout) {
                    $query['type'] = 'text';
                    $query['text'] = ['body' => str_replace('{catalog_checkout}', sb_woocommerce_get_url('cart') . '?sbwa=' . sb_encryption($to), $message)];
                } else if ($merge_field) {
                    $query['type'] = 'interactive';
                    if (isset($merge_field['product_id'])) {
                        $query['interactive'] = ['type' => 'product', 'action' => ['catalog_id' => $merge_field['id'], 'product_retailer_id' => $merge_field['product_id']]];
                    } else {
                        $continue = true;
                        $index = 1;
                        $sections = [];
                        $query['interactive'] = ['type' => 'product_list', 'action' => ['catalog_id' => $merge_field['id']], 'header' => ['text' => $merge_field['header'], 'type' => 'text']];
                        while ($continue) {
                            if (isset($merge_field['section_' . $index])) {
                                $continue_2 = true;
                                $index_2 = 1;
                                $products = [];
                                while ($continue_2) {
                                    $id = 'product_id_' . $index . '_' . $index_2;
                                    if (isset($merge_field[$id])) {
                                        array_push($products, ['product_retailer_id' => $merge_field[$id]]);
                                        $index_2++;
                                    } else {
                                        array_push($sections, ['title' => $merge_field['section_' . $index], 'product_items' => $products]);
                                        $continue_2 = false;
                                    }
                                }
                                $index++;
                            } else {
                                $query['interactive']['action']['sections'] = $sections;
                                $continue = false;
                            }
                        }
                    }
                    if (isset($merge_field['body'])) {
                        $query['interactive']['body'] = ['text' => $merge_field['body']];
                    }
                    if (isset($merge_field['footer'])) {
                        $query['interactive']['footer'] = ['text' => $merge_field['footer']];
                    }
                } else {
                    $query['type'] = 'text';
                    $query['text'] = ['body' => $message];
                }
            } else {
                $query = array_merge($query, $message);
            }
            $response = $cloud_phone_id ? sb_whatsapp_cloud_curl($cloud_phone_id . '/messages', $query, $phone_number_id) : sb_whatsapp_360_curl('messages', $query);
        }
        for ($i = 0; $i < $attachments_count; $i++) {
            $link = $attachments[$i][1];
            $media_type = sb_whatsapp_cloud_get_document_type($link);
            $query = ['messaging_product' => 'whatsapp', 'recipient_type' => 'individual', 'to' => $to, 'type' => $media_type];
            $query[$media_type] = ['link' => $link];
            if ($media_type == 'document') {
                $query[$media_type]['caption'] = $attachments[$i][0];
            }
            $response_2 = $cloud_phone_id ? sb_whatsapp_cloud_curl($cloud_phone_id . '/messages', $query, $phone_number_id) : sb_whatsapp_360_curl('messages', $query);
            if (!$response) {
                $response = $response_2;
            }
        }
    }
    if (!empty($response['error']) && is_string($message_original)) {
        $message_id = sb_isset(sb_db_get('SELECT id FROM sb_messages WHERE message = "' . sb_db_escape($message_original) . '" AND user_id = ' . sb_get_active_user_ID() . ' ORDER BY id DESC LIMIT 1'), 'id');
        if ($message_id) {
            sb_update_message($message_id, false, false, ['delivery_failed' => 'wa']);
        }
    }
    return $response;
}

function sb_whatsapp_send_template($phone, $user_language = '', $conversation_url_parameter = '', $user_name = '', $user_email = '', $template_name = false, $phone_number_id = false, $parameters = false, $template_languages = false, $user_id = false) {
    $response = false;
    switch (sb_whatsapp_provider()) {
        case 'official':
            $settings = sb_get_setting('whatsapp-template-cloud');
            $template_languages = explode(',', str_replace(' ', '', $template_languages ? $template_languages : $settings['whatsapp-template-cloud-languages']));
            $template_language = false;
            for ($i = 0; $i < count($template_languages); $i++) {
                if (substr($template_languages[$i], 0, 2) == $user_language) {
                    $template_language = $template_languages[$i];
                    break;
                }
            }
            if (!$template_language) {
                $template_language = $template_languages[0];
            }
            if (!$template_name) {
                $template_name = $settings['whatsapp-template-cloud-name'];
            }
            if ($template_name) {
                $query = ['type' => 'template', 'template' => ['name' => $template_name ? $template_name : $settings['whatsapp-template-cloud-name'], 'language' => ['code' => $template_language]]];
                $components = [];
                for ($i = 0; $i < 3; $i++) {
                    $type = $i == 2 ? 'button' : ($i ? 'body' : 'header');
                    $parameter_section = $parameters && isset($parameters[$i]) ? $parameters[$i] : sb_isset($settings, 'whatsapp-template-cloud-parameters-' . $type);
                    if ($parameter_section) {
                        $parameters_auto = explode(',', trim(str_replace(['{conversation_url_parameter}', '{recipient_name}', '{recipient_email}'], [$conversation_url_parameter, $user_name, $user_email], $parameter_section)));
                        $count = count($parameters_auto);
                        if ($count) {
                            if ($i == 2) {
                                for ($j = 0; $j < $count; $j++) {
                                    $parameter = $parameters_auto[$j];
                                    $sub_type = 'url';
                                    if (strpos($parameter, 'quick_reply_') === 0) {
                                        $sub_type = 'quick_reply';
                                        $parameter = substr($parameter, 12);
                                    }
                                    array_push($components, ['type' => $type, 'sub_type' => $sub_type, 'index' => $j, 'parameters' => [['type' => 'text', 'text' => $parameter]]]);
                                }
                            } else {
                                for ($j = 0; $j < $count; $j++) {
                                    $parameter = $parameters_auto[$j];
                                    $media_type = sb_whatsapp_cloud_get_document_type($parameter, 'text');
                                    $parameters_auto[$j] = ['type' => $media_type];
                                    $parameters_auto[$j][$media_type] = $media_type == 'text' ? $parameter : ['link' => $parameter];
                                }
                                array_push($components, ['type' => $type, 'parameters' => $parameters_auto]);
                            }
                        }
                    }
                }
                if (count($components)) {
                    $query['template']['components'] = $components;
                }
                $response = sb_whatsapp_send_message($phone, $query, [], $phone_number_id);
            }
        case 'twilio':
            if (!$template_name) {
                $template_name = sb_get_multi_setting('whatsapp-twilio-template', 'whatsapp-twilio-template-content-sid');
                $parameters[1] = sb_get_multi_setting('whatsapp-twilio-template', 'whatsapp-twilio-template-parameters');
            }
            if ($template_name) {
                $query = ['ContentSid' => $template_name, 'To' => 'whatsapp:' . $phone];
                if ($parameters[1]) {
                    $parameters[1] = explode(',', $parameters[1]);
                    $content_variables = ['1' => ''];
                    for ($i = 0; $i < count($parameters[1]); $i++) {
                        $content_variables[strval($i + 1)] = trim($parameters[1][$i]);
                    }
                    $query['ContentVariables'] = str_replace(['{conversation_url_parameter}', '{recipient_name}', '{recipient_email}'], [$conversation_url_parameter, $user_name, $user_email], json_encode($content_variables, JSON_INVALID_UTF8_IGNORE, JSON_UNESCAPED_UNICODE));
                }
                $response = sb_whatsapp_twilio_curl($query, '/Messages.json');
            }
            break;
        case '360':
            $settings = sb_get_setting('whatsapp-template-360');
            if ($settings && !empty($settings['whatsapp-template-360-namespace'])) {
                $template = sb_whatsapp_360_templates($template_name ? $template_name : $settings['whatsapp-template-360-name'], $user_language);
                if ($template) {
                    $merge_fields = explode(',', str_replace(' ', '', $settings['whatsapp-template-360-parameters']));
                    $parameters_return = [];
                    $index = 0;
                    $components = sb_isset($template, 'components', []);
                    for ($i = 0; $i < count($components); $i++) {
                        switch (strtolower($components[$i]['type'])) {
                            case 'body':
                                $count = substr_count($components[$i]['text'], '{{');
                                if ($count) {
                                    $parameters_sub = [];
                                    for ($j = 0; $j < $count; $j++) {
                                        array_push($parameters_sub, sb_whatsapp_create_template_parameter('text', $merge_fields[$index], $conversation_url_parameter, $user_name, $user_email));
                                        $index++;
                                    }
                                    array_push($parameters_return, ['type' => 'body', 'parameters' => $parameters_sub]);
                                }
                                break;
                            case 'buttons':
                                $buttons = $components[$i]['buttons'];
                                for ($j = 0; $j < count($buttons); $j++) {
                                    $key = strtolower($buttons[$j]['type']) == 'url' ? 'url' : 'text';
                                    $count = substr_count($buttons[$j][$key], '{{');
                                    if ($count) {
                                        array_push($parameters_return, ['type' => 'button', 'sub_type' => $key, 'index' => $j, 'parameters' => [sb_whatsapp_create_template_parameter('text', $merge_fields[$index], $conversation_url_parameter, $user_name, $user_email)]]);
                                        $index++;
                                    }
                                }
                                break;
                            case 'header':
                                $format = strtolower($components[$i]['format']);
                                $parameter = ['type' => $format];
                                if ($format == 'text') {
                                    $parameter = sb_whatsapp_create_template_parameter('text', $merge_fields[$index], $conversation_url_parameter, $user_name, $user_email);
                                } else {
                                    $parameter[$format] = ['link' => $components[$i]['example']['header_handle'][0]];
                                }
                                array_push($parameters_return, ['type' => 'header', 'parameters' => [$parameter]]);
                                break;
                        }
                    }
                    $query = ['type' => 'template', 'template' => ['namespace' => $settings['whatsapp-template-360-namespace'], 'language' => ['policy' => 'deterministic', 'code' => $template['language']], 'name' => $template['name'], 'components' => $parameters_return]];
                    $response = sb_whatsapp_send_message($phone, $query);
                }
            }
            break;
    }
    if ($user_id) {
        $conversation_id = sb_whatsapp_get_conversation_id($user_id, $phone_number_id);
        if (!$conversation_id) {
            $conversation_id = sb_isset(sb_new_conversation($user_id, 2, '', sb_isset(sb_whatsapp_cloud_get_phone_numbers($phone_number_id), 'whatsapp-cloud-numbers-department', -1), -1, 'wa', $phone_number_id), 'details', [])['id'];
        }
        sb_send_message(sb_get_active_user_ID(), $conversation_id, 'WhatsApp Template *' . $template_name . '*');
    }
    return $response;
}

function sb_whatsapp_rich_messages($message, $extra = false) {
    $shortcodes = sb_get_shortcode($message);
    $attachments = false;
    for ($j = 0; $j < count($shortcodes); $j++) {
        $shortcode = $shortcodes[$j];
        $shortcode_name = $shortcode['shortcode_name'];
        $shortcode_id = sb_isset($shortcode, 'id', '');
        $message = trim(str_replace($shortcode['shortcode'], '{R}', $message) . (isset($shortcode['title']) ? ' *' . sb_($shortcode['title']) . '*' : '') . PHP_EOL . sb_(sb_isset($shortcode, 'message', '')));
        $message_inner = '';
        $twilio = !empty(sb_get_multi_setting('whatsapp-twilio', 'whatsapp-twilio-user'));
        switch ($shortcode_name) {
            case 'slider-images':
                $attachments = explode(',', $shortcode['images']);
                for ($i = 0; $i < count($attachments); $i++) {
                    $attachments[$i] = [$attachments[$i], $attachments[$i]];
                }
                $message = '';
                break;
            case 'slider':
            case 'card':
                $is_slider = $shortcode_name == 'slider';
                $suffix = $is_slider ? '-1' : '';
                $message = '*' . sb_($shortcode['header' . $suffix . $index]) . '*' . (isset($shortcode['description' . $suffix]) ? (PHP_EOL . $shortcode['description' . $suffix]) : '') . (isset($shortcode['extra' . $suffix]) ? (PHP_EOL . '```' . $shortcode['extra' . $suffix] . '```') : '') . (isset($shortcode['link' . $suffix]) ? (PHP_EOL . PHP_EOL . $shortcode['link' . $suffix]) : '');
                $attachments = [[$shortcode['image' . $suffix], $shortcode['image' . $suffix]]];
                $catalog_id = sb_isset($shortcode, 'whatsapp-catalog-id');
                $product_id = sb_isset($shortcode, 'product-id');
                if (!$twilio && $catalog_id && $product_id) {
                    $body = sb_isset($shortcode, 'message', '');
                    $message = '{catalog id="' . $catalog_id . '"';
                    if ($is_slider) {
                        $product_id = explode('|', $product_id);
                        $message .= ' header="' . sb_(sb_isset($shortcode, 'filters', sb_isset($shortcode, 'header', sb_get_multi_setting('whatsapp-catalog', 'whatsapp-catalog-head')))) . '" section_1="' . sb_(sb_get_setting('whatsapp-catalog-title', 'Shop')) . '"';
                        for ($i = 0; $i < count($product_id); $i++) {
                            $message .= ' product_id_1_' . ($i + 1) . '="' . $product_id[$i] . '"';
                        }
                        if (!$body)
                            $body = sb_isset($shortcode, 'filters', sb_get_multi_setting('whatsapp-catalog', 'whatsapp-catalog-body'));
                    } else {
                        $message .= ' product_id="' . $product_id . '"';
                    }
                    if ($body)
                        $message .= ' body="' . sb_($body) . '"';
                    $message .= '}';
                    $attachments = [];
                }
                break;
            case 'list-image':
            case 'list':
                $index = $shortcode_name == 'list-image' ? 1 : 0;
                $shortcode['values'] = str_replace('://', '{R2}', $shortcode['values']);
                $values = explode(',', str_replace('\,', '{R3}', $shortcode['values']));
                if (strpos($values[0], ':')) {
                    for ($i = 0; $i < count($values); $i++) {
                        $value = explode(':', str_replace('{R3}', ',', $values[$i]));
                        $message_inner .= PHP_EOL . '• *' . trim($value[$index]) . '* ' . trim($value[$index + 1]);
                    }
                } else {
                    for ($i = 0; $i < count($values); $i++) {
                        $message_inner .= PHP_EOL . '• ' . trim(str_replace('{R3}', ',', $values[$i]));
                    }
                }
                $pos_r = strpos($message, '{R}');
                $message = trim(str_replace('{R2}', '://', $message));
                $message = str_replace('{R}', $message_inner . PHP_EOL . PHP_EOL, $message);
                $message = str_replace("\r\n\r\n\r\n", "\r\n\r\n", $message);
                break;
            case 'select':
            case 'buttons':
            case 'chips':
                $values = explode(',', $shortcode['options']);
                $count = count($values);
                if ($twilio) {
                    $message_inner .= PHP_EOL;
                    for ($i = 0; $i < $count; $i++) {
                        $message_inner .= PHP_EOL . '• ' . trim($values[$i]);
                    }
                    $message = str_replace('{R}', $message_inner, $message);
                } else {
                    if ($count > 10) {
                        $count = 10;
                    }
                    $is_buttons = $count < 4;
                    $message = ['type' => $is_buttons ? 'button' : 'list', 'body' => ['text' => sb_isset($shortcode, 'message')]];
                    if (!empty($shortcode['title'])) {
                        $message['header'] = ['type' => 'text', 'text' => $shortcode['title']];
                    }
                    $buttons = [];
                    for ($i = 0; $i < $count; $i++) {
                        $value = trim($values[$i]);
                        $item = ['id' => sb_string_slug($value), 'title' => $value];
                        array_push($buttons, $is_buttons ? ['type' => 'reply', 'reply' => $item] : $item);
                    }
                    $message['action'] = $is_buttons ? ['buttons' => $buttons] : ['button' => sb_(sb_isset($shortcode, 'whatsapp', 'Menu')), 'sections' => [['title' => substr(sb_isset($shortcode, 'title' . $index, $shortcode['message' . $index]), 0, 24), 'rows' => $buttons]]];
                    $message = ['type' => 'interactive', 'interactive' => $message];
                }
                if ($shortcode_id == 'sb-human-takeover' && defined('SB_DIALOGFLOW')) {
                    sb_dialogflow_set_active_context('human-takeover', [], 2, false, sb_isset($extra, 'user_id'));
                }
                break;
            case 'button':
                $message = $shortcode['link'];
                break;
            case 'video':
                $message = ($shortcode['type'] == 'youtube' ? 'https://www.youtube.com/embed/' : 'https://player.vimeo.com/video/') . $shortcode['id'];
                break;
            case 'image':
                $attachments = [[$shortcode['url'], $shortcode['url']]];
                break;
            case 'rating':
                if (!$twilio) {
                    $message = ['type' => 'interactive', 'interactive' => ['type' => 'button', 'body' => ['text' => $shortcode['message']], 'action' => ['buttons' => [['type' => 'reply', 'reply' => ['id' => 'rating-positive', 'title' => sb_($shortcode['label-positive'])]], ['type' => 'reply', 'reply' => ['id' => 'rating-negative', 'title' => sb_($shortcode['label-negative'])]]]]]];
                    if (!empty($shortcode['title'])) {
                        $message['interactive']['header'] = ['type' => 'text', 'text' => $shortcode['title']];
                    }
                }
                if (defined('SB_DIALOGFLOW')) {
                    sb_dialogflow_set_active_context('rating', [], 2, false, sb_isset($extra, 'user_id'));
                }
                break;
            case 'articles':
                if (isset($shortcode['link'])) {
                    $message = $shortcode['link'];
                }
                break;
            case 'email':
                $message = '{wa_flow_email}';
                break;
        }
    }
    return [$message, $attachments, $shortcodes];
}

function sb_whatsapp_360_synchronization($key = false, $cloud = '') {
    $response = sb_whatsapp_360_curl('configs/webhook', ['url' => SB_URL . '/apps/whatsapp/post.php' . str_replace(['&', '%26', '%3D'], ['?', '?', '='], $cloud)]);
    return $response && !empty($response['url']) ? ['success' => true] : $response;
}

function sb_whatsapp_360_curl($url_part, $post_fields = false, $type = 'POST') {
    $key = sb_get_multi_setting('whatsapp-360', 'whatsapp-360-key');
    return sb_curl((strpos($key, 'sandbox') ? 'https://waba-sandbox-v2.360dialog.io/' : 'https://waba-v2.360dialog.io/') . $url_part, $post_fields ? json_encode($post_fields) : '', ['D360-API-KEY: ' . $key, 'Content-Type: application/json'], $type);
}

function sb_whatsapp_360_upload($link) {
    $path = substr($link, strrpos(substr($link, 0, strrpos($link, '/')), '/'));
    $response = sb_curl('https://waba-v2.360dialog.io/media', file_get_contents(sb_upload_path() . $path), ['D360-API-KEY: ' . sb_get_multi_setting('whatsapp-360', 'whatsapp-360-key')], 'UPLOAD');
    return isset($response['media']) ? $response['media'][0]['id'] : false;
}

function sb_whatsapp_360_templates($template_name = false, $template_language = false) {
    $templates = sb_isset(json_decode(sb_whatsapp_360_curl('configs/templates', false, 'GET'), true), 'waba_templates', []);
    if ($template_name) {
        $template = false;
        $default_language = sb_get_multi_setting('whatsapp-template-360', 'whatsapp-template-360-language');
        $template_language = substr(strtolower($template_language), 0, 2);
        for ($i = 0; $i < count($templates); $i++) {
            if ($templates[$i]['name'] == $template_name) {
                if (!$template_language)
                    return $templates[$i];
                $language = substr(strtolower($templates[$i]['language']), 0, 2);
                if ($language == $template_language) {
                    return $templates[$i];
                } else if ($language == $default_language) {
                    $template = $templates[$i];
                }
            }
        }
        return $template;
    }
    return $templates;
}

function sb_whatsapp_shop_url($sbwa) {
    $carts = sb_get_external_setting('wc-whatsapp-carts');
    $cart = sb_isset($carts, sb_encryption($sbwa, false));
    $update = false;
    $now = time();
    if ($cart) {
        for ($i = 0; $i < count($cart); $i++) {
            sb_woocommerce_update_cart($cart[$i]['product_retailer_id'], 'cart-add', $cart[$i]['quantity']);
        }
        header('Location: ' . wc_get_checkout_url());
    }
    for ($i = 0; $i < count($carts); $i++) {
        if ($now > $cart[$i]['expiration']) {
            array_splice($carts, $i, 1);
            $update = true;
        }
    }
    if ($update) {
        sb_save_external_setting('wc-whatsapp-carts', $carts);
    }
}

function sb_whatsapp_create_template_parameter($type, $text, $conversation_url_parameter, $user_name, $user_email) {
    $parameter = ['type' => $type];
    $parameter[$type] = str_replace(['{conversation_url_parameter}', '{recipient_name}', '{recipient_email}'], [$conversation_url_parameter, $user_name, $user_email], $text);
    if (!$parameter[$type]) {
        $parameter[$type] = '[]';
    }
    return $parameter;
}

function sb_whatsapp_cloud_curl($url_part, $post_fields = false, $phone_number_id = false, $type = 'POST') {
    $response = sb_curl('https://graph.facebook.com/v18.0/' . $url_part, $post_fields ? $post_fields : '', ['Authorization: Bearer ' . sb_whatsapp_cloud_get_token($phone_number_id)], $type);
    return is_string($response) ? json_decode($response, true) : $response;
}

function sb_whatsapp_cloud_get_token($phone_number_id) {
    return sb_isset(sb_whatsapp_cloud_get_phone_numbers($phone_number_id), 'whatsapp-cloud-numbers-token');
}

function sb_whatsapp_cloud_get_phone_numbers($phone_number_id = false) {
    $phone_numbers = sb_get_setting('whatsapp-cloud-numbers');
    $phone_numbers = is_array($phone_numbers) ? $phone_numbers : [];
    if (sb_get_multi_setting('whatsapp-cloud', 'whatsapp-cloud-phone-id')) {
        array_unshift($phone_numbers, ['whatsapp-cloud-numbers-phone-id' => sb_get_multi_setting('whatsapp-cloud', 'whatsapp-cloud-phone-id'), 'whatsapp-cloud-numbers-token' => sb_get_multi_setting('whatsapp-cloud', 'whatsapp-cloud-token'), 'whatsapp-cloud-numbers-department' => sb_get_setting('whatsapp-department'), 'whatsapp-cloud-numbers-label' => sb_get_multi_setting('whatsapp-cloud', 'whatsapp-cloud-label'), 'whatsapp-cloud-numbers-account-id' => sb_get_multi_setting('whatsapp-cloud', 'whatsapp-cloud-account-id')]); // Deprecated
    }
    if ($phone_number_id) {
        for ($i = 0; $i < count($phone_numbers); $i++) {
            if ($phone_numbers[$i]['whatsapp-cloud-numbers-phone-id'] == $phone_number_id) {
                return $phone_numbers[$i];
            }
        }
        return false;
    }
    return $phone_numbers;
}

function sb_whatsapp_cloud_get_templates($business_account_id = false) {
    $templates = [];
    $phone_numbers = sb_whatsapp_cloud_get_phone_numbers();
    for ($y = 0; $y < count($phone_numbers); $y++) {
        $current_business_account_id = $phone_numbers[$y]['whatsapp-cloud-numbers-account-id'];
        if ($business_account_id && $current_business_account_id != $business_account_id) {
            continue;
        }
        $phone_number_id = $phone_numbers[$y]['whatsapp-cloud-numbers-phone-id'];
        $response = sb_whatsapp_cloud_curl($current_business_account_id . '/message_templates', false, $phone_number_id, 'GET');
        if (isset($response['data'])) {
            $response = $response['data'];
            for ($i = 0; $i < count($response); $i++) {
                $template = $response[$i];
                $is_new = true;
                for ($j = 0; $j < count($templates); $j++) {
                    if ($templates[$j]['name'] == $template['name']) {
                        array_push($templates[$j]['languages'], $template['language']);
                        array_push($templates[$j]['ids'], $template['id']);
                        $is_new = false;
                        break;
                    }
                }
                if ($is_new) {
                    $template['languages'] = [$template['language']];
                    $template['ids'] = [$template['id']];
                    $template['phone_number_id'] = $phone_number_id;
                    $template['label'] = sb_isset($phone_numbers[$y], 'whatsapp-cloud-numbers-label', $phone_number_id);
                    $template['department'] = sb_isset($phone_numbers[$y], 'whatsapp-cloud-numbers-department', $phone_number_id);
                    unset($template['language']);
                    unset($template['id']);
                    array_push($templates, $template);
                }
            }
        } else {
            return $response;
        }
    }
    return $templates;
}

function sb_whatsapp_cloud_flow_send($to, $flow_id, $phone_number_id, $header_text, $body_text, $cta_text, $footer_text = false) {
    $data = [
        'type' => 'interactive',
        'interactive' => [
            'type' => 'flow',
            'header' => ['type' => 'text', 'text' => sb_($header_text)],
            'body' => ['text' => sb_($body_text)],
            'action' => [
                'name' => 'flow',
                'parameters' => [
                    'flow_message_version' => '3',
                    'flow_token' => 'sb-' . rand(99999, 9999999),
                    'flow_id' => $flow_id,
                    'flow_cta' => sb_($cta_text),
                    'flow_action' => 'navigate',
                    'flow_action_payload' => ['screen' => 'FIRST_SCREEN']
                ]
            ]
        ]
    ];
    if ($footer_text) {
        $data['interactive']['footer'] = ['text' => $footer_text];
    }
    return sb_whatsapp_send_message($to, $data, [], $phone_number_id);
}

function sb_whatsapp_cloud_flow_update($flow_id, $phone_number_id, $json) {
    $path = sb_upload_path() . '/flow.json';
    sb_file($path, $json);
    $response = sb_whatsapp_cloud_curl($flow_id . '/assets', ['file' => new CurlFile($path, 'application/json'), 'name' => 'flow.json', 'asset_type' => 'FLOW_JSON'], $phone_number_id, 'UPLOAD');
    unlink($path);
    return $response;
}

function sb_whatsapp_cloud_flow_get($phone_number_id, $flow_name = false, $flow_id = false) {
    $phone_number = sb_whatsapp_cloud_get_phone_numbers($phone_number_id);
    $response = $phone_number ? sb_whatsapp_cloud_curl($phone_number['whatsapp-cloud-numbers-account-id'] . '/flows', false, $phone_number_id, 'GET') : false;
    if (($flow_id || $flow_name) && $response) {
        $data = sb_isset($response, 'data');
        if ($data === false) {
            return sb_error('flow-get-error', 'sb_whatsapp_cloud_flow_get', $response);
        }
        for ($i = 0; $i < count($data); $i++) {
            if ($data[$i]['status'] == 'PUBLISHED' && ($data[$i]['id'] == $flow_id || strpos($data[$i]['name'], $flow_name) === 0)) {
                return $data[$i];
            }
        }
        return false;
    }
    return $response;
}

function sb_whatsapp_cloud_flow_create_json($type, $extra = false) {
    $payload = ['sb_type' => $type];
    $title = '';
    $childrens = false;
    switch ($type) {
        case 'registration':
            $settings = sb_get_setting('registration');
            $registration_fields = sb_get_setting('registration-fields');
            $additional_fields = sb_get_setting('user-additional-fields');
            $last_name = sb_isset($registration_fields, 'reg-last-name');
            $title = sb_isset($settings, 'registration-title', 'Create new account');
            $footer_button = sb_isset($settings, 'registration-btn-text', 'Create account');
            $childrens = [
                [
                    'type' => 'TextInput',
                    'name' => 'first_name',
                    'label' => $last_name ? 'First name' : 'Name',
                    'required' => true
                ]
            ];
            $payload['first_name'] = '${form.first_name}';
            if ($last_name) {
                array_push($childrens, [
                    'type' => 'TextInput',
                    'label' => 'Last Name',
                    'name' => 'last_name',
                    'required' => true
                ]);
                $payload['last_name'] = '${form.last_name}';
            }
            if (!sb_get_setting('registration-email-disable')) {
                array_push($childrens, [
                    'type' => 'TextInput',
                    'label' => 'Email',
                    'name' => 'email',
                    'required' => true
                ]);
                $payload['email'] = '${form.email}';
            }
            foreach ($registration_fields as $key => $value) {
                if ($value) {
                    $key = str_replace('reg-', '', $key);
                    if (in_array($key, ['profile-img', 'last-name', 'phone'])) {
                        continue;
                    }
                    $type = 'TextInput';
                    $data_source = false;
                    switch ($key) {
                        case 'birthday':
                            $type = 'DatePicker';
                            break;
                        case 'language':
                        case 'country':
                            $type = 'Dropdown';
                            $data_source = [];
                            $items = sb_get_json_resource($key == 'language' ? 'languages/language-codes.json' : 'json/country_codes.json');
                            foreach ($items as $key_2 => $value) {
                                array_push($data_source, ['id' => $key_2, 'title' => $value]);
                            }
                            break;
                    }
                    $children = [
                        'type' => $type,
                        'label' => sb_string_slug($key, 'string'),
                        'name' => $key
                    ];
                    if ($data_source) {
                        $children['data-source'] = $data_source;
                    }
                    array_push($childrens, $children);
                    $payload[$key] = '${form.' . $key . '}';
                }
            }
            if (is_array($additional_fields)) {
                for ($i = 0; $i < count($additional_fields); $i++) {
                    $slug = $additional_fields[$i]['extra-field-slug'];
                    array_push($childrens, [
                        'type' => 'TextInput',
                        'label' => $additional_fields[$i]['extra-field-name'],
                        'name' => $slug,
                        'required' => $additional_fields[$i]['extra-field-required']
                    ]);
                    $payload[$slug] = '${form.' . $slug . '}';
                }
            }
        case 'email':
            $title = sb_isset($extra, 'title');
            $footer_button = $title;
            $childrens = [
                [
                    'type' => 'TextInput',
                    'label' => 'Email',
                    'name' => 'email',
                    'required' => true
                ]
            ];
            $payload['email'] = '${form.email}';
    }
    if ($childrens) {
        array_push($childrens, [
            'type' => 'Footer',
            'label' => sb_($footer_button),
            'on-click-action' => [
                'name' => 'complete',
                'payload' => $payload
            ]
        ]);
        $data = [
            'version' => '3.1',
            'screens' => [
                [
                    'id' => 'FIRST_SCREEN',
                    'title' => $title,
                    'data' => new stdClass(),
                    'terminal' => true,
                    'success' => true,
                    'layout' => [
                        'type' => 'SingleColumnLayout',
                        'children' => [
                            [
                                'type' => 'Form',
                                'name' => 'form',
                                'children' => $childrens
                            ]
                        ]
                    ]
                ]
            ]
        ];
        return json_encode($data, JSON_INVALID_UTF8_IGNORE | JSON_UNESCAPED_UNICODE);
    }
    return false;
}

function sb_whatsapp_cloud_flow_send_builtin($to, $phone_number_id, $type, $extra = false) {
    $flows = sb_get_external_setting('wa-flows', []);
    $flow_id = sb_isset($flows, $type);
    $header_text = false;
    $body_text = false;
    $cta_text = false;
    switch ($type) {
        case 'registration':
            $settings = sb_get_setting('registration');
            $header_text = sb_isset($settings, 'registration-title', 'Create new account');
            $body_text = sb_isset($settings, 'registration-msg');
            $cta_text = sb_isset($settings, 'registration-btn-text', 'Create account');
            break;
        case 'email':
            $header_text = sb_isset($extra, 'title', 'Create new account');
            $body_text = sb_isset($extra, 'message');
            $cta_text = sb_isset($extra, 'btn-text', 'Update account');
            break;
    }
    if (!$flow_id) {
        $flow = sb_whatsapp_cloud_flow_get($phone_number_id, 'sb_' . $type);
        if (!$flow) {
            $response = sb_whatsapp_cloud_curl(sb_whatsapp_cloud_get_phone_numbers($phone_number_id)['whatsapp-cloud-numbers-account-id'] . '/flows', ['name' => 'sb_' . $type . '_' . rand(999, 99999), 'categories' => ['SIGN_UP']], $phone_number_id);
            $flow_id = sb_isset($response, 'id');
            if ($flow_id) {
                $response = sb_whatsapp_cloud_flow_update($flow_id, $phone_number_id, sb_whatsapp_cloud_flow_create_json($type, $extra));
                if (empty($response['success'])) {
                    return sb_error('flow-update-error', 'sb_whatsapp_cloud_flow_send_builtin', $response);
                }
                $response = sb_whatsapp_cloud_curl($flow_id . '/publish', false, $phone_number_id);
                if (empty($response['success'])) {
                    return sb_error('flow-publish-error', 'sb_whatsapp_cloud_flow_send_builtin', $response);
                }
                $flows[$type] = $flow_id;
                sb_save_external_setting('wa-flows', $flows);
            } else {
                return sb_error('flow-creation-error', 'sb_whatsapp_cloud_flow_send_builtin', $response);
            }
        } else if (sb_is_error($flow)) {
            return $flow;
        } else {
            $flow_id = $flow['id'];
            $flows[$type] = $flow_id;
            sb_save_external_setting('wa-flows', $flows);
        }
    }
    $response = sb_whatsapp_cloud_flow_send($to, $flow_id, $phone_number_id, sb_($header_text), sb_($body_text), sb_($cta_text));
    if (isset($response['error'])) {
        unset($flows[$type]);
        sb_save_external_setting('wa-flows', $flows);
        return sb_error('flow-send-error', 'sb_whatsapp_cloud_flow_send_builtin', $response);
    }
    return $response;
}

function sb_whatsapp_active() {
    return !empty(sb_get_multi_setting('whatsapp-cloud', 'whatsapp-cloud-key')) || (sb_is_cloud() && count(sb_whatsapp_cloud_get_phone_numbers()) && sb_isset(sb_whatsapp_cloud_get_phone_numbers()[0], 'whatsapp-cloud-numbers-phone-id')) || !empty(sb_get_multi_setting('whatsapp-twilio', 'whatsapp-twilio-user')) || !empty(sb_get_multi_setting('whatsapp-360', 'whatsapp-360-key'));
}

function sb_whatsapp_twilio_curl($query, $url_part = false, $url = false, $method = 'POST') {
    $settings = sb_get_setting('whatsapp-twilio');
    $header = ['Authorization: Basic ' . base64_encode($settings['whatsapp-twilio-user'] . ':' . $settings['whatsapp-twilio-token'])];
    $url = $url_part ? 'https://api.twilio.com/2010-04-01/Accounts/' . $settings['whatsapp-twilio-user'] . $url_part : $url;
    if ($method == 'POST') {
        $from = trim($settings['whatsapp-twilio-sender']);
        if (strpos($from, '+') === 0) {
            $from = 'whatsapp:' . $from;
        }
        $query[strpos($from, 'whatsapp') === 0 ? 'From' : 'MessagingServiceSid'] = $from;
    }
    return sb_curl($url, $query, $header, $method);
}

function sb_whatsapp_twilio_get_templates() {
    $response = sb_whatsapp_twilio_curl(false, false, 'https://content.twilio.com/v1/Content', 'GET');
    return sb_isset(json_decode($response, true), 'contents', $response);
}

function sb_whatsapp_get_templates($business_account_id = false, $template_name = false, $template_language = false) {
    $provider = sb_whatsapp_provider();
    switch ($provider) {
        case 'official':
            return [$provider, sb_whatsapp_cloud_get_templates($business_account_id)];
        case 'twilio':
            return [$provider, sb_whatsapp_twilio_get_templates()];
        case '360':
            return [$provider, sb_whatsapp_360_templates($template_name, $template_language)];
    }
}

function sb_whatsapp_provider() {
    if (!empty(sb_get_multi_setting('whatsapp-cloud', 'whatsapp-cloud-key')) || (sb_is_cloud() && count(sb_whatsapp_cloud_get_phone_numbers()) && sb_isset(sb_whatsapp_cloud_get_phone_numbers()[0], 'whatsapp-cloud-numbers-phone-id'))) {
        return 'official';
    } else if (!empty(sb_get_multi_setting('whatsapp-twilio', 'whatsapp-twilio-user'))) {
        return 'twilio';
    }
    return '360';
}

function sb_whatsapp_cloud_get_document_type($link, $media_type = 'document') {
    switch (strtolower(sb_isset(pathinfo($link), 'extension'))) {
        case 'jpg':
        case 'jpeg':
        case 'png':
            $media_type = 'image';
            break;
        case 'mp4':
        case '3gpp':
            $media_type = 'video';
            break;
        case 'ogg':
        case 'm4a':
        case 'mp3':
        case 'aac':
        case 'amr':
            $media_type = 'audio';
            break;
        case 'pdf':
            $media_type = 'document';
            break;
    }
    return $media_type;
}

function sb_whatsapp_get_conversation_id($user_id, $phone_number_id) {
    return sb_isset(sb_db_get('SELECT id FROM sb_conversations WHERE source = "wa" AND user_id = ' . $user_id . ($phone_number_id ? ' AND extra = "' . $phone_number_id . '"' : '') . ' ORDER BY id DESC LIMIT 1'), 'id');
}

function sb_whatsapp_send_template_box() { ?>
    <div id="sb-whatsapp-send-template-box" class="sb-lightbox">
        <div class="sb-info"></div>
        <div class="sb-top-bar">
            <div>
                <?php sb_e('Send a WhatsApp message template') ?>
            </div>
            <div>
                <a class="sb-close sb-btn-icon">
                    <i class="sb-icon-close"></i>
                </a>
            </div>
        </div>
        <div class="sb-main sb-scroll-area">
            <div class="sb-title">
                <?php sb_e('User IDs') ?>
            </div>
            <div class="sb-input-setting sb-type-text sb-first">
                <input class="sb-direct-message-users" type="text" placeholder="<?php sb_e('User IDs separated by commas') ?>" required />
            </div>
            <div class="sb-title sb-whatsapp-box-header">
                <?php sb_e('Header variables') ?>
            </div>
            <div class="sb-input-setting sb-type-text">
                <input id="sb-whatsapp-send-template-header" type="text" placeholder="<?php sb_e('Attributes separated by commas') ?>" />
            </div>
            <div class="sb-title">
                <?php sb_e('Body variables') ?>
            </div>
            <div class="sb-input-setting sb-type-text">
                <input id="sb-whatsapp-send-template-body" type="text" placeholder="<?php sb_e('Attributes separated by commas') ?>" />
            </div>
            <div class="sb-title">
                <?php sb_e('Button variables') ?>
            </div>
            <div class="sb-input-setting sb-type-text">
                <input id="sb-whatsapp-send-template-button" type="text" placeholder="<?php sb_e('Attributes separated by commas') ?>" />
            </div>
            <div class="sb-title">
                <?php sb_e('Template') ?>
            </div>
            <div class="sb-input-setting sb-type-select">
                <select id="sb-whatsapp-send-template-list" required></select>
            </div>
            <div class="sb-bottom">
                <a class="sb-send-direct-message sb-btn sb-icon" data-type="whatsapp">
                    <i class="sb-icon-plane"></i>
                    <?php sb_e('Send message now') ?>
                </a>
                <div></div>
                <?php
                if (!sb_is_cloud() || defined('SB_CLOUD_DOCS')) {
                    echo '<a href="' . (sb_is_cloud() ? SB_CLOUD_DOCS : 'https://board.support/docs') . '#direct-messages" class="sb-btn-text" target="_blank"><i class="sb-icon-help"></i></a>';
                }
                ?>
            </div>
        </div>
    </div>
<?php } ?>