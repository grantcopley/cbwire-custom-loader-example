<cfoutput>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CBWIRE Navigate Demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col">
                    <h1 class="mt-5">CBWIRE Navigate Demo</h1>
                    <!--- Navigation --->
                    <div class="mb-5">
                        <a href="/main/page1" class="btn btn-primary" wire:navigate>Page 1</a>
                        <a href="/main/page2" class="btn btn-primary" wire:navigate>Page 2</a>
                    </div>
                    <div id="content">
                        #view()#
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

        <!--- CBWIRE loader override --->
        <script>
            document.addEventListener( 'livewire:navigate', () => {
                if ( !window.navigating ) {
                    // Set flag to prevent multiple navigations
                    window.navigating = true;

                    // Prevent the navigate from actually being performed
                    event.preventDefault();

                    // Get target context from the navigation trigger
                    let target = event.detail;

                    // Show bootstrap loader (spinner)
                    let loader = document.createElement( 'div' );
                    loader.className = 'spinner-border text-primary';
                    loader.setAttribute( 'role', 'status' );
                    loader.innerHTML = '<span class="visually-hidden">Loading...</span>';
                    document.getElementById( 'content' ).appendChild( loader );

                    Livewire.navigate( target.url.pathname );
                }
            } , { once: true } );

            document.addEventListener( 'livewire:navigated', () => {
                window.navigating = false;
            } );
        </script>
    </body>
</html>
</cfoutput>