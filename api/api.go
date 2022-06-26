package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

type Author struct {
	Category string   `json:"category"`
	Name     *Comment `json:"name"`
}
type Comment struct {
	Type   string `json:"type"`
	Img    string `json:"img"`
	Color  string `json:"color"`
	Price  string `json:"price"`
	Detail string `json:"detail"`
}

var api = []Author{}

func getTodos(context *gin.Context) {
	context.IndentedJSON(http.StatusOK, api)
}

func addTodo(context *gin.Context) {
	var newTodo Author

	if err := context.BindJSON(&newTodo); err != nil {
		return
	}

	api = append(api, newTodo)

	context.IndentedJSON(http.StatusCreated, newTodo)
}

func main() {
	api = append(api, Author{Category: "Vegetables", Name: &Comment{Type: "Paprika", Img: "paprika", Color: "colorE3553F_15", Price: "$4.99 /Kg", Detail: "Paprika is a fruit-producing plant that tastes sweet and slightly spicy from the eggplant or Solanaceae tribe. Its green, yellow, red, or purple fru..Read more"}})
	api = append(api, Author{Category: "Vegetables", Name: &Comment{Type: "Broccoli", Img: "broccoli", Color: "color76B226_15", Price: "$4.99 /Kg", Detail: "Paprika is a fruit-producing plant that tastes sweet and slightly spicy from the eggplant or Solanaceae tribe. Its green, yellow, red, or purple fru..Read more"}})
	api = append(api, Author{Category: "Vegetables", Name: &Comment{Type: "Lettuce", Img: "lettuce", Color: "color3F7D3C_15", Price: "$3.40 /Kg", Detail: "Paprika is a fruit-producing plant that tastes sweet and slightly spicy from the eggplant or Solanaceae tribe. Its green, yellow, red, or purple fru..Read more"}})
	api = append(api, Author{Category: "Vegetables", Name: &Comment{Type: "Potato", Img: "potato", Color: "colorE9B04F_15", Price: "$4.21 /Kg", Detail: "Paprika is a fruit-producing plant that tastes sweet and slightly spicy from the eggplant or Solanaceae tribe. Its green, yellow, red, or purple fru..Read more"}})
	api = append(api, Author{Category: "Vegetables", Name: &Comment{Type: "Carrot", Img: "carrot", Color: "colorEA812F_15", Price: "$4.99 /Kg", Detail: "Paprika is a fruit-producing plant that tastes sweet and slightly spicy from the eggplant or Solanaceae tribe. Its green, yellow, red, or purple fru..Read more"}})
	api = append(api, Author{Category: "Vegetables", Name: &Comment{Type: "Red Onion", Img: "red_onion", Color: "color97031D_15", Price: "3.30 /Kg", Detail: "Paprika is a fruit-producing plant that tastes sweet and slightly spicy from the eggplant or Solanaceae tribe. Its green, yellow, red, or purple fru..Read more"}})
	api = append(api, Author{Category: "Fruits", Name: &Comment{Type: "Banan", Img: "banan", Color: "colorF3A20C_15", Price: "$4.68 /Kg", Detail: "Paprika is a fruit-producing plant that tastes sweet and slightly spicy from the eggplant or Solanaceae tribe. Its green, yellow, red, or purple fru..Read more"}})
	api = append(api, Author{Category: "Fruits", Name: &Comment{Type: "Apple", Img: "apple", Color: "colorF3A20C_15", Price: "$2.23 /Kg", Detail: "Paprika is a fruit-producing plant that tastes sweet and slightly spicy from the eggplant or Solanaceae tribe. Its green, yellow, red, or purple fru..Read more"}})
	api = append(api, Author{Category: "Fruits", Name: &Comment{Type: "Kiwi", Img: "kiwi", Color: "colorF3A20C_15", Price: "$5.21 /Kg", Detail: "Paprika is a fruit-producing plant that tastes sweet and slightly spicy from the eggplant or Solanaceae tribe. Its green, yellow, red, or purple fru..Read more"}})
	api = append(api, Author{Category: "Fruits", Name: &Comment{Type: "Pineapple", Img: "pineapple", Color: "colorF3A20C_15", Price: "$8.11 /Kg", Detail: "Paprika is a fruit-producing plant that tastes sweet and slightly spicy from the eggplant or Solanaceae tribe. Its green, yellow, red, or purple fru..Read more"}})
	api = append(api, Author{Category: "Meats", Name: &Comment{Type: "Meat", Img: "qoy_goshti", Color: "colorFE706E_25", Price: "$11.15 /Kg", Detail: "Paprika is a fruit-producing plant that tastes sweet and slightly spicy from the eggplant or Solanaceae tribe. Its green, yellow, red, or purple fru..Read more"}})
	api = append(api, Author{Category: "Meats", Name: &Comment{Type: "Chicken Meat", Img: "chicken_meat", Color: "colorFE706E_25", Price: "$5.22 /Kg", Detail: "Paprika is a fruit-producing plant that tastes sweet and slightly spicy from the eggplant or Solanaceae tribe. Its green, yellow, red, or purple fru..Read more"}})
	api = append(api, Author{Category: "Meats", Name: &Comment{Type: "Fish Meat", Img: "fish_meat", Color: "colorFE706E_25", Price: "$6.44 /Kg", Detail: "Paprika is a fruit-producing plant that tastes sweet and slightly spicy from the eggplant or Solanaceae tribe. Its green, yellow, red, or purple fru..Read more"}})

	router := gin.Default()
	router.GET("/api/", getTodos)
	router.POST("/api/", addTodo)
	// router.PATCH("/todos/", patchTodo)
	// router.PUT("/todos/", putTodo)
	// router.DELETE("/todos",deletTodo)
	router.Run("192.168.43.19:8080")
}
