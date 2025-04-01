<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style>

        @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@600&display=swap');
        .template-btn {
	        color: #ffffff;
	        text-align: center;
	        vertical-align: middle;
	        -webkit-user-select: none;
	        -moz-user-select: none;
	        -ms-user-select: none;
	        user-select: none;
	        background-color: #2667ffde;
	        border: none;
	        padding: 12px 40px;
	        font-size: 15px;
	        font-weight: 600;
	        border-radius: 5px;
	        -webkit-transition: all 0.3s ease-in-out;
	        transition: all 0.3s ease-in-out;
	        position: relative;
	        z-index: 1;
	        overflow: hidden;
            width: 90px;
}
.video-container{
    position:relative;
    padding-bottom:30px;
    padding-top:30px;
    height:0;
    overflow:hidden
}
.responsive-iframe{
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%
}
      </style>
</head>
<body>
    <table style="width: 100%; max-width: 600px; margin: 0 auto; font-family: Arial, sans-serif; border-collapse: collapse;">
    <tr>
                                                    <td class="section_wrapper_th" style="mso-line-height-rule: exactly;">
                                                        <table cellspacing="0" cellpadding="0" style="line-height: inherit; border-collapse: collapse; table-layout: fixed; border-spacing: 0; mso-table-lspace: 0pt; mso-table-rspace: 0pt; vertical-align: top; min-width: 320px; Margin: 0 auto; background-color: #ffffff; width: 100%;" id="u_body" width="100%" valign="top" bgcolor="#ffffff">
                                                            <tbody style="line-height: inherit;">
                                                                <tr style="line-height: inherit; border-collapse: collapse; vertical-align: top;" valign="top">
                                                                    <td style="line-height: inherit; color: #000000; word-break: break-word; vertical-align: top; border-collapse: collapse !important;" valign="top">
                                                                        <div style="line-height: inherit; padding: 0px; background-color: transparent;" class="u-row-container">
                                                                            <div style="line-height: inherit; margin: 0 auto; min-width: 320px; max-width: 600px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: transparent;" class="u-row">
                                                                                <div style="line-height: inherit; border-collapse: collapse; display: table; width: 100%; background-size: cover; background-image: url({{ image('logos/order_logo.png') }}); background-repeat: no-repeat; background-position: center top;">
                                                                                    <div style="line-height: inherit; max-width: 320px; min-width: 600px; display: table-cell; vertical-align: top;" class="u-col u-col-100">
                                                                                        <div style="line-height: inherit; height: 100%; width: 100% !important;">
                                                                                            <div style="line-height: inherit; box-sizing: border-box; height: 100%; padding: 0px; border-top: 0px solid transparent; border-left: 0px solid transparent; border-right: 0px solid transparent; border-bottom: 0px solid transparent;">
                                                                                                <table border="0" width="100%" cellspacing="0" cellpadding="0" role="presentation" style="line-height: inherit; vertical-align: top; border-collapse: collapse; color: #000000; font-family: arial,helvetica,sans-serif;" valign="top">
                                                                                                    <tbody style="line-height: inherit;">
                                                                                                        <tr style="line-height: inherit; vertical-align: top; border-collapse: collapse;" valign="top">
                                                                                                            <td align="left" style="line-height: inherit; vertical-align: top; border-collapse: collapse; color: #000000; overflow-wrap: break-word; word-break: break-word; padding: 10px; font-family: arial,helvetica,sans-serif;" valign="top">
                                                                                                                <!-- Content Here -->
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                                <table border="0" width="100%" cellspacing="0" cellpadding="0" role="presentation" style="line-height: inherit; vertical-align: top; border-collapse: collapse; color: #000000; font-family: arial,helvetica,sans-serif;" valign="top">
                                                                                                    <tbody style="line-height: inherit;">
                                                                                                        <tr style="line-height: inherit; vertical-align: top; border-collapse: collapse;" valign="top">
                                                                                                            <td align="left" style="line-height: inherit; vertical-align: top; border-collapse: collapse; color: #000000; overflow-wrap: break-word; word-break: break-word; padding: 20px 10px 50px; font-family: arial,helvetica,sans-serif;" valign="top">
                                                                                                                <div style="font-family: inherit; font-size: 14px; color: #333333; line-height: 1%; text-align: left; word-wrap: break-word;">
                                                                                                                    <p style="margin: 0; font-size: 14px; line-height: 1%; text-align: center;">
                                                                                                                        <span style="font-size: 36px; line-height: 39.6px; font-family: inherit; color: #ffffff;">
                                                                                                                            <br style="line-height: inherit;">&nbsp;
                                                                                                                            <h1 style="font-family: 'Nunito', sans-serif; color: #ffffff; font-size: 20px; line-height: 1; font-weight: 700; text-transform: uppercase; letter-spacing: 1px; margin-top: 10px;" align="center">
                                                                                                                                <span data-key="1468270_order_number">Order ID.</span> {{ $data['data']->order_id }}
                                                                                                                            </h1>
                                                                                                                        </span>
                                                                                                                    </p>
                                                                                                                </div>
                                                                                                                
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
        <tr>
            <td style="padding: 20px; background-color: #DEF5FD; font-size: 16px; line-height: 1.6;">
                <p>Greetings {{$data['data']->client->name }},</p>
                <p>Please find your shipping service provider and Tracking ID below.</p>
                <p style="font-weight:700;color:black;"><b>@isset($data['shipping_service'])Shipping Service: {{ $data['shipping_service'] }}@endisset</p>    
                    <p style="font-weight:700;color:black;"><b>
                    @isset($data['tracking_id'])
                        Tracking ID: {{ $data['tracking_id'] }}
                    @endisset
                    </p>
                <p><b>Note: </b>In line with our company policies we hereby remind you to please take an unboxing video and give us a Quality check within the next 3 day of the delivery to claim rework/replace order/report damage done within transport.
Please also confirm that you have received an Invoice in the package.</p>
                <p>Best regards, <br>Team Vexma</p>
            </td> 
        </tr>                                                              
        <table class="section_wrapper footer" data-id="footer" id="section-footer"
        border="0" width="100%" cellpadding="0" cellspacing="0"
        align="center" style="min-width: 100%;" role="presentation"
        bgcolor="#DEF5FD">
        <tbody>
            <tr>
                <th data-id="store-info"
                    style="mso-line-height-rule: exactly;"
                    bgcolor="#DEF5FD">
                    
                    <div class="cta-btn">
    <div class="first-row" style="display:flex; justify-content: space-around; margin:0px 10px 10px 10px">
<div class="view-account" style="width:80%;">
<a href="https://cloud.vexmatech.com/"
                                        target="_blank"
                                        data-key="section_shop_block1"
                                        class="template-btn"
                                        style="color: #ffffff; text-decoration: none !important; text-underline: none; text-transform: none; margin: 6px; display: block; width: auto">View Account</a>
</div>
<div class="schedue-meeting" style="width:80%;">
<a href="https://zcal.co/i/9UE_HSmp"
                                        target="_blank"
                                        data-key="section_shop_block1"
                                        class="template-btn"
                                        style="color: #ffffff; text-decoration: none !important; text-underline: none; text-transform: none; margin: 6px; display: block; width: auto">Schedule Meeting</a>
</div>
    </div>
    <div class="second-row" style="display:block; margin:20px auto; width:100%; ">
<div class="feedback">
<a href="https://forms.gle/iHKb2pXmtsoWiaS68" target="_blank"
                                        data-key="section_shop_block1"
                                        class="template-btn"
                                        style="color: #ffffff; text-decoration: none !important; text-underline: none; text-transform: none; margin: 3px;">We Value Feedback</a>
</div>
    </div>
</div>

                </th>
            </tr>
            <tr>
                <td class="section_wrapper_th"
                    style="mso-line-height-rule: exactly;"
                    bgcolor="#DEF5FD">
                    <table border="0" width="100%" cellpadding="0"
                        cellspacing="0" align="center" style="min-width: 100%;"
                        role="presentation">
                        <!-- BEGIN : 2 COLUMNS : SOCIAL_BLOCK -->
                        <tbody>
                            <tr>
                                <th style="mso-line-height-rule: exactly;"
                                    bgcolor="#DEF5FD">
                                    <table border="0" width="100%"
                                        cellpadding="0" cellspacing="0"
                                        align="center" style="min-width: 100%;"
                                        role="presentation">
                                        <tbody>
                                            <tr>
                                                <!-- BEGIN : Column 1 of 2 : SOCIAL_BLOCK -->
                                                <th width="50%"
                                                    class="column_1_of_2 column_social_block "
                                                    style="mso-line-height-rule: exactly; padding-top: 26px; padding-bottom: 26px; border-top-width: 2px; border-top-color: #0b14609c; border-top-style: solid; border-bottom-width: 2px; border-bottom-color: #0b14609c; border-bottom-style: solid; border-right-width: 2px; border-right-color: #0b14609c; border-right-style: solid;"
                                                    align="center"
                                                    bgcolor="#DEF5FD"
                                                    valign="top">
                                                    <table align="center"
                                                        border="0"
                                                        width="100%"
                                                        cellpadding="0"
                                                        cellspacing="0"
                                                        style="min-width: 100%; text-align: center;"
                                                        role="presentation">
                                                        <!-- Social heading : BEGIN -->
                                                        <tbody>
                                                            <tr style=""
                                                                align="center">
                                                                <th class="column_footer_title "
                                                                    width="100%"
                                                                    style="mso-line-height-rule: exactly; padding-right: 5%; font-family: 'Quicksand', sans-serif; font-size: 14px; line-height: 24px; font-weight: 400; color: #0b1460; text-transform: none;"
                                                                    align="center"
                                                                    bgcolor="#DEF5FD"
                                                                    valign="top">
                                                                    <p data-key="section_footer_title"
                                                                        style="mso-line-height-rule: exactly; font-family: 'Quicksand', sans-serif; font-size: 14px; line-height: 24px; font-weight: 400; color: #0b1460; text-transform: none; margin: 0 0 13px;"
                                                                        align="center">
                                                                        Find Us Online</p><label style="display:none" for="">{{rand()}}</label>
                                                                </th>
                                                            </tr>
                                                            <!-- Social heading : END -->
                                                            <!-- Store Address : BEGIN -->
                                                            <tr style=""
                                                                align="center">
                                                                <th class="column_shop_social_icons "
                                                                    width="100%"
                                                                    style="mso-line-height-rule: exactly; padding-right: 5%;"
                                                                    align="center"
                                                                    bgcolor="#DEF5FD"
                                                                    valign="top">
                                                                    <a class="social-link"
                                                                        href="https://www.facebook.com/vexmatech"
                                                                        target="_blank"
                                                                        title="Facebook"
                                                                        style="color: #0a72eb; text-decoration: none !important; text-underline: none; font-size: 14px; text-align: center;">
                                                                        <img 
                                                                            class="social-icons"
                                                                            alt="Facebook"
                                                                            src="{{ image('logos/mail_icon/facebook_icon.png') }}"
                                                                            style="width: 16px; height: auto !important; vertical-align: middle; text-align: center; padding: 6px 6px 0 0px;">
                                                                    </a>
                                                                    <a class="social-link"
                                                                        href="https://www.linkedin.com/company/vexma-technologies-private-limtied"
                                                                        target="_blank"
                                                                        title="linkedin"
                                                                        style="color: #ecba78; text-decoration: none !important; text-underline: none; font-size: 14px; text-align: center;">
                                                                        <img 
                                                                            class="social-icons"
                                                                            alt="linkdin"
                                                                            src="{{ image('logos/mail_icon/linkedin_icon.png') }}"
                                                                            style="width: 16px; height: auto !important; vertical-align: middle; text-align: center; padding: 6px 6px 0 0px;">
                                                                        <a class="social-link"
                                                                        href="https://instagram.com/vexmatech"
                                                                        target="_blank"
                                                                        title="Instagram"
                                                                        style="color: #ecba78; text-decoration: none !important; text-underline: none; font-size: 14px; text-align: center;">
                                                                        <img 
                                                                            class="social-icons"
                                                                            alt="instagram"
                                                                            src="{{ image('logos/mail_icon/instagram_icon.png') }}"
                                                                            style="width: 16px; height: auto !important; vertical-align: middle; text-align: center; padding: 6px 6px 0 0px;">
                                                                            <a class="social-link"
                                                                        href="https://www.youtube.com/@Vexmatech"
                                                                        target="_blank"
                                                                        title="YouTube"
                                                                        style="color: #ecba78; text-decoration: none !important; text-underline: none; font-size: 14px; text-align: center;">
                                                                        <img 
                                                                            class="social-icons"
                                                                            alt="youtube"
                                                                            src="{{ image('logos/mail_icon/youtube_icon.png') }}"
                                                                            style="width: 16px; height: auto !important; vertical-align: middle; text-align: center; padding: 6px 6px 0 0px;">
                                                                    </a>
                                                                    <a class="social-link"
                                                                    href="https://in.pinterest.com/vexmatech/pins/"
                                                                    target="_blank"
                                                                    title="pintrest"
                                                                    style="color: #0a72eb; text-decoration: none !important; text-underline: none; font-size: 14px; text-align: center;">
                                                                    <img 
                                                                        class="social-icons"
                                                                        alt="pintrest"
                                                                        src="{{ image('logos/mail_icon/pinterest_icon.png') }}"
                                                                        style="width: 16px; height: auto !important; vertical-align: middle; text-align: center; padding: 6px 6px 0 0px;">
                                                                </a>
                                                                <a class="social-link"
                                                                href="https://twitter.com/vexma_tech"
                                                                target="_blank"
                                                                title="twitter"
                                                                style="color: #ecba78; text-decoration: none !important; text-underline: none; font-size: 14px; text-align: center;">
                                                                <img 
                                                                class="social-icons"
                                                                alt="twitter"
                                                                src="{{ image('logos/mail_icon/twitter_icon.png') }}"
                                                                style="width: 16px; height: auto !important; vertical-align: middle; text-align: center; padding: 6px 6px 0 0px;">
                                                                </a>
                                                                <a class="social-link"
                                                                    href="https://www.threads.net/@vexmatech"
                                                                    target="_blank"
                                                                    title="threads"
                                                                    style="color: #ecba78; text-decoration: none !important; text-underline: none; font-size: 14px; text-align: center;">
                                                                    <img 
                                                                    class="social-icons"
                                                                    alt="thread"
                                                                    src="{{ image('logos/mail_icon/threads_icon.png') }}"
                                                                    style="width: 16px; height: auto !important; vertical-align: middle; text-align: center; padding: 6px 6px 0 0px;">
                                                                </a>
                                                                <a class="social-link"
                                                                    href="https://www.tumblr.com/vexmatech"
                                                                    target="_blank"
                                                                    title="tumblr"
                                                                    style="color: #ecba78; text-decoration: none !important; text-underline: none; font-size: 14px; text-align: center;">
                                                                    <img 
                                                                        class="social-icons"
                                                                        alt="tumblr"
                                                                        src="{{ image('logos/mail_icon/tumblr_icon.png') }}"
                                                                        style="width: 16px; height: auto !important; vertical-align: middle; text-align: center; padding: 6px 6px 0 0px;">
                                                                </a>
                                                                <a class="social-link"
                                                                href="https://www.vexmatech.com"
                                                                target="_blank"
                                                                title="Vexma Website"
                                                                style="color: #ecba78; text-decoration: none !important; text-underline: none; font-size: 14px; text-align: center;">
                                                                <img 
                                                                    class="social-icons"
                                                                    alt="website"
                                                                    src="{{ image('logos/mail_icon/website_icon.png') }}"
                                                                    style="width: 16px; height: auto !important; vertical-align: middle; text-align: center; padding: 6px 6px 0 0px;">
                                                            </a>
                                                                </th>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </th>
                                                
                                                <!-- END : Column 1 of 2 : SOCIAL_BLOCK -->
                                                <!-- BEGIN : Column 2 of 2 : SHOP_BLOCK -->
                                                <th width="50%"
                                                    class="column_2_of_2 column_shop_block "
                                                    style="mso-line-height-rule: exactly; padding-top: 26px; padding-bottom: 26px; border-top-width: 2px; border-top-color: #0b14609c; border-top-style: solid; border-bottom-width: 2px; border-bottom-color: #0b14609c; border-bottom-style: solid;"
                                                    align="center"
                                                    bgcolor="#DEF5FD"
                                                    valign="top">
                                                    <table align="center"
                                                        border="0"
                                                        width="100%"
                                                        cellpadding="0"
                                                        cellspacing="0"
                                                        style="min-width: 100%; text-align: center;"
                                                        role="presentation">
                                                        <!-- Store Address : BEGIN -->
                                                        <tbody>
                                                            <tr style="" align="center">
                                                                <th class="column_shop_block2" data-key="section_shop_block2" width="20%" valign="top" style="mso-line-height-rule: exactly; font-family: 'Quicksand', sans-serif; font-size: 7px; line-height: 24px; font-weight: 400; color: #0b1460; text-transform: none;">
                                                                    <img class="social-icons" alt="map" src="{{ image('logos/mail_icon/map.png') }}" style="max-width: 50px; height: 50px; display: block; margin-top: 17%">
                                                                </th>
                                                                <th class="column_shop_block2" data-key="section_shop_block2" width="80%" valign="top" style="mso-line-height-rule: exactly; font-family: 'Quicksand', sans-serif; font-size: 14px; line-height: 24px; font-weight: 400; color: #0b1460; text-transform: none;">
                                                                    Vexma Technologies,<br style="text-align: center;">
                                                                    Old Chhani Road, Vadodara,<br style="text-align: center;">
                                                                    Gujarat - 390002<br style="text-align: center;">
                                                                </th>
                                                            </tr>
                                                        </tbody>
                                                        
                                                    </table>
                                                </th>
                                                <!-- END : Column 2 of 2 : SHOP_BLOCK -->
                                            </tr>
                                        </tbody>
                                    </table>
                                </th>
                                <!-- END : 2 COLUMNS : SHOP_BLOCK -->
                            </tr>
                            <tr>
                                <th data-id="store-info"
                                    style="mso-line-height-rule: exactly;"
                                    bgcolor="#DEF5FD">
                                    <table border="0" width="100%"
                                        cellpadding="0" cellspacing="0"
                                        role="presentation">
                                        <!-- Store Website : BEGIN -->
                                        <tbody>
                                            <tr>
                                                <th class="column_shop_block1 "
                                                    width="100%"
                                                    style="mso-line-height-rule: exactly; font-family: 'Quicksand', sans-serif; font-size: 14px; line-height: 24px; font-weight: 400; color: #0b14609c; text-transform: none; padding-bottom: 12px; padding-top: 12px;"
                                                    align="center"
                                                    bgcolor="#DEF5FD">
                                                        <a href="https://youtu.be/Phf4ywPThY8" target="_blank"
                                                        data-key="section_shop_block1"
                                                        style="color: #0a72eb; text-decoration: none !important; text-underline: none; font-size: 14px; font-weight: 400; text-transform: none; margin-left:12px;">Vexma Cloud Tutorial</a>
                                                </th>
                                            </tr>
                                            <!-- Store Website : END -->
                                        </tbody>
                                    </table>
                                </th>
                            </tr>
                            <tr>
                                <td style="padding: 20px; background-color: #f5f5f5;">
                                    <p style="font-size: 12px; color: #999; text-align: center;">&copy; {{ date('Y') }} {{ config('app.name') }}. All rights reserved.</p>
                                    <p style="font-size: 12px; color: #999; text-align: center;">This is an automated message. Please do not reply.</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    </table>
</body>
</html>
