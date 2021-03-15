import 'package:delvaryapp/ingredient.dart';
import 'package:flutter/material.dart';

const double _pizzaCardSize = 55;

class PizzaOrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "New Orleans Pizza",
            style: TextStyle(color: Colors.brown, fontSize: 24),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.brown,
              ),
              onPressed: () {})
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 50,
            left: 10,
            right: 10,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 10.0,
              child: Column(
                children: [
                  Expanded(flex: 3, child: _PizzaDetails()),
                  Expanded(flex: 2, child: _PizzaIngredients())
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            height: _pizzaCardSize,
            width: _pizzaCardSize,
            left: MediaQuery.of(context).size.width / 2 - _pizzaCardSize / 2,
            child: PizzaCardButtom(),
          )
        ],
      ),
    );
  }
}

class _PizzaDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Image.asset("pizza_order_assets/part1/dish.png"),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("pizza_order_assets/part1/pizza-1.png"),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "\$15",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.brown),
        ),
      ],
    );
  }
}

class PizzaCardButtom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.orange.withOpacity(.5),
                Colors.orange,
              ])),
      child: Icon(
        Icons.shopping_cart_outlined,
        color: Colors.white,
        size: 35,
      ),
    );
  }
}

class _PizzaIngredients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        final ingredient = ingredients[index];

        return _PizzaIngredientsItem(ingredient: ingredient);
      },
    );
  }
}

class _PizzaIngredientsItem extends StatelessWidget {
  const _PizzaIngredientsItem({Key key, this.ingredient}) : super(key: key);
  final Ingredients ingredient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            ingredient.image,
            fit: BoxFit.contain,
          ),
        ),
        height: 45,
        width: 45,
        decoration:
            BoxDecoration(color: Color(0xFFF5EED3), shape: BoxShape.circle),
      ),
    );
  }
}
