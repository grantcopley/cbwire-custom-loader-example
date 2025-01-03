# CBWIRE Custom Loader Example

This is a simple example of how to create a custom loader for CBWIRE when using `wire:navigate` for SPA applications.

## Setup

```bash
box install
box server start
```

## Files To Look At

* layouts/Main.cfm
* views/main/page1.cfm
* views/main/page2.cfm

## Custom Loader

```js
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

        // Use Livewire's navigate feature to actually navigate
        Livewire.navigate( target.url.pathname );
    }
} , { once: true } );

document.addEventListener( 'livewire:navigated', () => {
    window.navigating = false;
} );
```