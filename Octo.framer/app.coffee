# The naming convention I tried to follow was camelCase for components, and
# Capital_Case(with underscore conversion) for the artboards.

flow = new FlowComponent
flow.showNext(Loading)

Loading.onTap ->
	flow.showNext(Octo_Home)


# Bar Buttons
# TODO: this feels a bit gross, see if there is a better way to do this.
recipeBarButton.onTap ->
	flow.showNext(Octo_Home)

favoritesBarButton.onTap ->
	flow.showNext(Favorites)
	
myOrdersBarButton.onTap ->
	flow.showNext(Order_History)
	
recipeBarButton_1.onTap ->
	flow.showNext(Octo_Home)

favoritesBarButton_1.onTap ->
	flow.showNext(Favorites)
	
myOrdersBarButton_1.onTap ->
	flow.showNext(Order_History)
	
recipeBarButton_2.onTap ->
	flow.showNext(Octo_Home)

favoritesBarButton_2.onTap ->
	flow.showNext(Favorites)
	
myOrdersBarButton_2.onTap ->
	flow.showNext(Order_History)


# Ingredient list components
ingredientCard.onTap ->
	flow.showNext(Octopus_Recipes)


# Octopus recipe list components
backButton.onTap ->
	flow.showPrevious(Octopus_Recipes)

grilledOctopusCard.onTap ->
	flow.showNext(Grilled_Octopus)
	orderButton.stateSwitch("order")
	starFill.stateSwitch("unfavorite")
	

# Grilled Octopus recipe view components
closeButton.onTap ->
	flow.showPrevious(Octopus_Recipes)

starFill.states = 
	favorite:
		opacity: 1
	unfavorite:
		opacity: 0
	
favoriteButton.onTap ->
	starFill.animate
		scale: 1.25
		options:
			curve: Spring(damping: 0.5)
			time: 0.5
	
	starFill.stateCycle "favorite", "unfavorite"
	
	starFill.animate
		scale: 1
		options: 
			curve: Spring(damping:0.5)
			time: 0.5

orderButton.onTap ->
	flow.showOverlayBottom(Apple_Pay_Sheet)

orderButton.style =
	fontSize: "20px"
	textAlign: "center"
	paddingTop: "16px"

orderButton.states = 
	order:
		backgroundColor: "#007FFF"
		color: "#FFFFFF"
		html: "Delivered tomorrow $65"
	track:
		backgroundColor: "#FFFFFF"
		color: "#007FFF"
		html: "Track your order"

orderButton.onTap ->
	if orderButton.states.current.name == "order"
		orderButton.stateSwitch("track")
	else
		flow.showNext(Order_History)


# Favorites View components
favoriteRecipeCard.onTap ->
	flow.showNext(Grilled_Octopus)
	orderButton.stateSwitch("track")