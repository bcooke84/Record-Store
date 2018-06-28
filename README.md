# SOLO PROJECT BRIEF

## Record Store

The owner of a Record Store wants an app which will help to keep on top of the store inventory. This is not an app that customers will see, but will be used to check stock levels and see what needs to be ordered soon.

You should be able to add stock, which would have an Artist and Album as well as the quantity available.

CSS styling only to be used.

### MVP:

- Create albums with the quantity that are in stock
- Create artists
- Show an inventory page listing albums and artists
- Show a stock level for the inventory items e.g. High/Medium/Low

### Additional features added:

- Added a cost and store price property to Albums.
- Added genre property to Albums.
- Added a genre page for Albums.
- Added release year property to Albums.
- Added a release year page for Albums.
- Added album artwork property for all Albums.
- Added search bar, which returns Albums based on Artist and Album name.  Protected against case sensitivity and duplicate results.
- Added delete and edit functions.
- When an Album is deleted, if no further associated Albums exist, the Artist is also deleted.
- Sorting added for each property on Inventory page.
- Edit function pre-populates existing details.
- Total cost value, store  value and stock-level added to inventory page.
- Delete and edit functions utilise 'datalists' and allow existing Artists & Genres to be selected - preventing against input error and duplication.
- Additional files added for deployment to Heroku:  https://record-store-bc.herokuapp.com/home/inventory
