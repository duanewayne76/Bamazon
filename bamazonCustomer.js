require("dotenv").config();
var mysql = require("mysql");
var inquirer = require("inquirer");
var keys = require("./keys.js");
var table = require("table");
console.log(keys.mySQL.id);

var connection = mysql.createConnection({
    host: "localhost",

    // Your port; if not 3306
    port: 3306,

    // Your username
    user: "root",

    // Your password
    password: keys.mySQL.id,
    database: "bamazonDB"
});

connection.connect(function (err) {
    if (err) throw err;
    console.log("Connected to Database");
    displayItems();
})






var displayItems = function () {

    connection.query("Select * From products", function (err, results) {
        console.table(results);
        customerPromptID();
    })
}



var customerPromptID = function () {
    inquirer.prompt([{
        type: 'input',
        name: 'itemID',
        message: "Which product ID would you like to buy?"

    },
    {
        type: "input",
        name: "quantity",
        message: "How many would you like to buy?",
        validate: function (value) {
            if (isNaN(value) == false) {
                return true;
            }
            else {
                return false;
            }
        }
    }
    ]).then(function (answer) {
        var itemID = answer.itemID;
        var quantity = answer.quantity;
        var queryString = `SELECT * FROM products WHERE id = ${itemID}`
        connection.query(queryString, function (err, results) {
            var price = results[0].price;
            var stock = results[0].stock_quantity;

            if (quantity < stock) {
                var newStock = stock - quantity;
                var totalAmount = price * quantity;
                // UPDATE products SET stock_quantity = 2 WHERE id = itemID
                var queryString = "UPDATE products SET ? WHERE ?"
                connection.query(queryString, [
                    {
                        stock_quantity: newStock
                    }, {
                        id: itemID
                    }
                ], function (err, results) {
                    console.log(`Total amount: $${totalAmount}`)
                    connection.end()
                })
            }
            else {
                console.log("Insufficent stock");
                connection.end()
            }


        });

        
    })


}



