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
	Type string `json:"type"`
	Img  string `json:"img"`
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
	api = append(api, Author{Category: "Vegetables", Name: &Comment{Type: "Paprika", Img: "paprika"}})
	api = append(api, Author{Category: "Vegetables", Name: &Comment{Type: "Broccoli", Img: "broccoli"}})
	api = append(api, Author{Category: "Vegetables", Name: &Comment{Type: "Lettuce", Img: "lettuce"}})
	api = append(api, Author{Category: "Vegetables", Name: &Comment{Type: "Potato", Img: "potato"}})
	api = append(api, Author{Category: "Vegetables", Name: &Comment{Type: "Carrot", Img: "carrot"}})
	api = append(api, Author{Category: "Vegetables", Name: &Comment{Type: "Red Onion", Img: "red_onion"}})
	api = append(api, Author{Category: "Fruits", Name: &Comment{Type: "Banan", Img: "banan"}})
	api = append(api, Author{Category: "Meats", Name: &Comment{Type: "Qo'y Go'shti", Img: "qoy_goshti"}})

	router := gin.Default()
	router.GET("/api/", getTodos)
	router.POST("/api/", addTodo)
	// router.PATCH("/todos/", patchTodo)
	// router.PUT("/todos/", putTodo)
	// router.DELETE("/todos",deletTodo)
	router.Run("192.168.1.103:8080")
}
