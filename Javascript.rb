⚡ What is Turbolinks?
Turbolinks is a JavaScript library created by the Rails team to make navigating a web application faster by loading 
only the HTML needed instead of reloading the full page.

🧠 How it Works:
When you click a link:

Turbolinks intercepts the click.

It sends an AJAX request to the server for the new page.

It replaces the <body> and merges the <head> (if needed).

It doesn't reload the full page or JavaScript — it reuses the current JavaScript context.

✅ Result: Much faster page transitions, almost like a single-page application (SPA), but without rewriting your app in React/Vue.
=======================================================================================================================================
