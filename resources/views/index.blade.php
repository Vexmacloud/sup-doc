<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Security-Policy" content="frame-ancestors 'self' https://cloud.vexmatech.com">
    <title>{{ env('APP_NAME') }}</title>

    <!-- Fonts -->
    <link rel="icon" href="{{ asset('vexma-cloud-favicon.ico') }}">
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('splash-screen.css') }}">

    <!-- <script src="https://cdn.tiny.cloud/1/glvdbar1akcht9rtd7mkcjkhpeny4rvvu8a2b3dyfew1n47h/tinymce/5/tinymce.min.js"
        referrerpolicy="origin"></script>
        <script src="https://cloud.vexmatech.com/public/supportboard/js/min/jquery.min.js"></script>
        <script id="sbinit" src="https://cloud.vexmatech.com/public/supportboard/js/main.js"></script> -->
        <!-- <script src="https://js.pusher.com/beams/1.0/push-notifications-cdn.js"></script>
        <script>
            const beamsClient = new PusherPushNotifications.Client({
              instanceId: '7a8055b0-8d0b-4068-ad2c-ba27780167ab',
            });
          
            beamsClient.start()
              .then(() => beamsClient.addDeviceInterest('hello'))
              .then(() => console.log('Successfully registered and subscribed!'))
              .catch(console.error);
          </script> -->
    <!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-D46XYYDGDN"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-D46XYYDGDN');
</script>

    @vite('resources/js/main.ts')
</head>

<body class="antialiased">
    <script>
        let themeMode = "system";

        if (localStorage.getItem("kt_theme_mode_value")) {
            themeMode = localStorage.getItem("kt_theme_mode_value");
        }

        if (themeMode === "system") {
            themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
        }

        document.documentElement.setAttribute("data-bs-theme", themeMode);
    </script>
    <!--end::Theme mode setup on page load-->

    <div id="app"></div>

    <!--begin::Loading markup-->
    <div id="splash-screen" class="splash-screen">
        <img src="{{ asset('media/logos/vexma-cloud-small.png') }}" class="dark-logo" alt="Vexma dark logo" />
        <img src="{{ asset('media/logos/vexma-cloud-small.png') }}" class="light-logo" alt="Vexma light logo" />
        <span>Loading ...</span>
    </div>
    <!--end::Loading markup-->
    <script src="{{ asset('service-worker.js') }}"></script>
    <!-- <script src="{{asset('firebase-messaging-sw.js')}}"></script> -->

    <!-- <script type="module" src="../js/main.ts"></script> -->
</body>

</html>
