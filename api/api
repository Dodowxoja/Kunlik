package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

type Category struct {
	Name     string `json:"name"`
	Img      string `json:"img"`
	Category string `json:"category"`
}

var category = []Category{
	{Name: "Paprika", Img: "paprika", Category: "Vegetables"},
	{Name: "Broccoli", Img: "broccoli", Category: "Vegetables"},
	{Name: "Lettuce", Img: "lettuce", Category: "Vegetables"},
	{Name: "Potato", Img: "potato", Category: "Vegetables"},
	{Name: "Carrot", Img: "carrot", Category: "Vegetables"},
	{Name: "Red Onion", Img: "red_onion", Category: "Vegetables"},
	{Name: "Banan", Img: "banan", Category: "Fruits"},
	{Name: "Qo'y Go'shti", Img: "qoy_goshti", Category: "Meats"},
}

func getTodos(context *gin.Context) {
	context.IndentedJSON(http.StatusOK, category)
}

func addTodo(context *gin.Context) {
	var newAuth Category

	if err := context.BindJSON(&newAuth); err != nil {
		return
	}

	category = append(category, newAuth)

	context.IndentedJSON(http.StatusCreated, newAuth)

}

func main() {
	router := gin.Default()
	router.GET("/api/", getTodos)
	router.POST("/api/post/", addTodo)

	// router.PATCH("/todos/", patchTodo)
	// router.PUT("/todos/", putTodo)
	// router.DELETE("/todos",deletTodo)
	// router.Run("192.168.1.103:8080")
	// router.Run("192.168.111.99:8080")
	router.Run("192.168.43.141:8080")

	
}

/*
Category: "Vegetables", Name: &Comment{Type: "Paprika",      Img: "paprika"}
Category: "Vegetables", Name: &Comment{Type: "Broccoli",     Img: "broccoli"}
Category: "Vegetables", Name: &Comment{Type: "Lettuce",      Img: "lettuce"}
Category: "Vegetables", Name: &Comment{Type: "Potato",       Img: "potato"}
Category: "Vegetables", Name: &Comment{Type: "Carrot",       Img: "carrot"}
Category: "Vegetables", Name: &Comment{Type: "Red Onion",    Img: "red_onion"}
Category: "Fruits", 	Name: &Comment{Type: "Banan", 		 Img: "banan"}
Category: "Meats", 		Name: &Comment{Type: "Qo'y Go'shti", Img: "qoy_goshti"}
*/
// category = append(category, Category{Name: "Paprika", Img: "paprika", Category: "Vegetables"})
// category = append(category, Category{Name: "Broccoli", Img: "broccoli", Category: "Vegetables"})
// category = append(category, Category{Name: "Lettuce", Img: "lettuce", Category: "Vegetables"})
// category = append(category, Category{Name: "Potato", Img: "potato", Category: "Vegetables"})
// category = append(category, Category{Name: "Carrot", Img: "carrot", Category: "Vegetables"})
// category = append(category, Category{Name: "Red Onion", Img: "red_onion", Category: "Vegetables"})
// category = append(category, Category{Name: "Banan", Img: "banan", Category: "Fruits"})
// category = append(category, Category{Name: "Qo'y Go'shti", Img: "qoy_goshti", Category: "Meats"})
