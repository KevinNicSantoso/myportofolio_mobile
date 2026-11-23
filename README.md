# myportofolio_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### Assignment 7

1. The widget tree is a hierarchical representation of the UI where every visual element is a widget nested within other widgets. Parent-child relationships dictate layout and behavior. A parent widget manages the positioning, constraints, and data flow for its child widgets, passing styling and configuration down the tree.

2. The project uses MaterialApp, Scaffold, and AppBar for overall app structure, Row, Column, Center, and GridView for layout, and Card, Container, SizedBox, and Padding for spacing and material containers. For content and interaction, it uses Text and Icon for display, Material and InkWell for touch feedback, and SnackBar to show a message at the bottom of the screen when a button is pressed.

3. MaterialApp is a convenience widget that configures the top-level navigator, themes, and routing required to build an application using Google's Material Design guidelines. It is used as the root widget because it injects essential framework configurations into the tree, ensuring all descendant widgets render correctly with consistent, app-wide design rules.

4. A StatelessWidget is immutable and used for static UI elements whose appearance depends solely on the initial configuration provided in their constructor. Conversely, a StatefulWidget maintains mutable state that can change over time using setState(), making it necessary for dynamic interfaces like forms, animations, or live data feeds.

5. BuildContext is a handle to the location of a specific widget within the widget tree, allowing it to access data and services provided by ancestor widgets. Inside the build method, it is crucial for retrieving app-wide configurations, such as using Theme.of(context) to get the current color scheme or ScaffoldMessenger.of(context) to trigger overlays.

6. Hot reload injects updated code into the running Dart VM and rebuilds only affected widgets while preserving the app's current state, such as scroll positions or form inputs. Hot restart completely resets the app's state and rebuilds the entire widget tree from scratch, which is required when adding new assets, changing global variables, or modifying app initialization logic.

### Assignment 8

1. Navigator.push() stacks a new route on top so the Back button returns to the previous screen, Navigator.pushReplacement() swaps the current route for a new one so Back skips the replaced screen, and Navigator.pop() simply removes the top route to reveal the one below. The action card opens the form with Navigator.push() (in ItemCard's onTap), which is why the device/browser Back button returns the user to the home menu. The drawer's Home option calls Navigator.pushReplacement() with a MaterialPageRoute to MyHomePage, replacing whatever screen is current (e.g., the education form) with the home screen so the user lands directly on home without stacking duplicate pages.

2. Every screen (home, Add Project, Add Education) wraps its content in a Scaffold with the same AppBar configuration (white bold title, backgroundColor: Theme.of(context).colorScheme.primary, white iconTheme) and attaches the same LeftDrawer via the drawer property, so the header and navigation chrome look identical on every page. As a shared theme color, indigo appears across multiple pages: it is the MaterialApp seed color (which makes every AppBar's primary color indigo), the DrawerHeader's BoxDecoration color, and the Save button's background (WidgetStateProperty.all(Colors.indigo)) on both forms.

3. The form places its Padding fields in a Column inside a SingleChildScrollView, with the Save button aligned at the bottom, so the whole form is one top-to-bottom scrollable flow that works on any screen size. When space is limited, for example when the keyboard opens or the Chrome window is narrow, the SingleChildScrollView lets the user scroll to reach otherwise hidden fields and the Save button instead of triggering a RenderFlex overflow, while the Padding around each field keeps touch targets comfortably spaced and legible.

4. The GlobalKey<FormState> gives the Save button access to the Form's state, and pressing Save calls _formKey.currentState!.validate(), which runs every field's validator callback; each validator returns an error string displayed next to its field, or null if the value passes. The form rejects, for example, an end date that is earlier than the start date (as well as whitespace-only entries like " "), because those rules are about meaning and order, not about how the data was typed. Choosing a widget or keyboard type alone is insufficient: a URL keyboard or showDatePicker only guides how input is entered and cannot enforce required values, length limits, formats, or ordering between two fields.