+++
title="Builder, Strategy Patterns Still relevant?"
description="How functional programming makes such design patterns irrelevant"
date=2015-10-22

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala", "design"]

[extra]
toc = true
comments = false
+++

If you agree with me that writing less code equals lesser bugs, you are going to appreciate how Scala simplifies Strategy and 
Builder design patterns by making you write less code!

Let's look at them one by one. Let us see how the Builder design pattern is implemented in Java.

## Builder Pattern

Builder design pattern helps in constructing a complex object in a series of steps. Let me take a classical example of preparing a Pizza, 
especially a vegetable Pizza! Our Pizza modelled as a POJO would look like below! Assume that we have the needed getters and setters to 
instantiate a Pizza.

```java
public class VegetarianPizza extends Pizza {
    private String dough;
    private Enum sauceType;
    private Enum cheeseType;
    private String toppings;
    private Enum sizeType;
    private Boolean isTomatoAdded;
    private Boolean isGarlicAdded;
    private Boolean isOnionAdded;
    private Boolean isSpinachAdded;
}
```

Now as I see the instance fields, I can see 9*9 ways of instantiating a VegetarianPizza. I do not definitely want to write those many constructors! 
Builder pattern to the rescue!

Here is how I could add a VegetarianPizza builder to make a VegetarianPizza instantiation much organised:

```java
public class VegetarianPizza extends Pizza {
    private String dough;
    private Enum sauceType;
    private Enum cheeseType;
    private String toppings;
    private Enum sizeType;
    private Boolean isTomatoAdded;
    private Boolean isGarlicAdded;
    private Boolean isOnionAdded;
    private Boolean isSpinachAdded;

   //Private constructor to enforce instantiation via Builder
   private VegetarianPizza(...) { ... }
   public static class VegetarianPizzaBuilder {
       private String dough;
       private Enum sauceType;
       private Enum cheeseType;
       private String toppings;
       private Enum sizeType;
       private Boolean isTomatoAdded;
       private Boolean isGarlicAdded;
       private Boolean isOnionAdded;
       private Boolean isSpinachAdded;
       
       public VegetarianPizzaBuilder withDough(String dough) { 
           this.dough = dough; return this; 
       }

       public VegetarianPizzaBuilder withSauceType(Enum sauceType) { 
           this.sauceType = sauceType; return this; 
       }

       public VegetarianPizzaBuilder withcheeseType(Enum cheeseType) { 
           this.cheeseType = cheeseType; return this; 
       }

       public VegetarianPizzaBuilder withTopping(String toppings) { 
           this.toppings = toppings; return this; 
       }

       public VegetarianPizzaBuilder withSize(Enum sizeType) { 
           this.sizeType = sizeType; return this; 
       }

       public VegetarianPizzaBuilder withTomato(Boolean isTomatoAdded) { 
           this.isTomatoAdded = isTomatoAdded; return this; 
       }

       public VegetarianPizzaBuilder withGarlic(Boolean isGarlicAdded) { 
           this.isGarlicAdded = isGarlicAdded; return this; 
       }

       public VegetarianPizzaBuilder withOnion(Boolean isOnionAdded) { 
           this.isOnionAdded = isOnionAdded; return this; 
       }

       public VegetarianPizzaBuilder withSpinach(Boolean isSpinachAdded) { 
           this.isSpinachAdded = isSpinachAdded; return this; 
       }

       public Pizza buildVegetarianPizza() {
           return new VegetarianPizza(this);
       }
    }
}
```

That was roughly 60+ lines of boiler plate code. Ain't that shitty!

Enter Scala, using case classes with default parameters, our VegetarianPizza in Scala would look like

```scala
case class VegetarianPizza(dough: String = "WhiteDough",
  sauceType: SauceType = SauceType.withName("Ketchup"),
  cheeseType: CheeseType = CheeseType.withName("Irish"),
  toppings: String = "Anything",
  sizeType: SizeType = SizeType.withName("Large"),
  isTomato: Boolean = true,
  isGarlic: Boolean = true,
  isOnion: Boolean = true,
  isSpinach: Boolean = true
)
```

That's all it. Our builder is reduced to less than 10 lines! You can instantiate it like this!

```scala
val defaultVegPizza = VegetarianPizza()
val withoutOnions = VegetarianPizza(isOnion = false)
val withoutSpinachAndTomato = VegetarianPizza(isTomato = false, isSpinach = false)
```

## Strategy Pattern
Let's now dive into the Strategy pattern and see what Scala has to offer in terms of brevity
The definition of the strategy pattern goes like this "... enable an algorithm's behavior to be determined at runtime. Let me take the classical 
example of doing something with two Integers. What could be done with them? Add, Subtract, Multiply or Divide!
Let's dive into some code. Let's first do it the ugly way using Java:

```java
interface Strategy {
    int execute(int a, int b);
}
```

Our concrete implementations for Add, Subtract, Multiply and Divide

```java
class Add implements Strategy {
    public int execute(int a, int b) {
        return a + b;
    }
}

class Subtract implements Strategy {
    public int execute(int a, int b) {
        return a - b;
    }
}

class Multiply implements Strategy {
    public int execute(int a, int b) {
        return a * b;
    }
}

class Divide implements Strategy {
    public int execute(int a, int b) {
        return a / b;
    }
}
```

We now wrap our strategy in a context object, so that the clients can call our strategy depending on the context of what they want to do with 
the strategy.

```java
class Context {
    private Strategy strategy;

    public Context(Strategy strategy) {
        this.strategy = strategy;
    }

    public int executeStrategy(int a, int b) {
        return this.strategy.execute(a, b);
    }
}
```

All our client or the caller of our strategy needs to do is to get a context, pass in the strategy to the context and execute the strategy within 
that context.

Here it is in code!

```java
    Context ctx = new Context(new Add()); 
    ctx.executeStrategy(1, 2);
```

All good so far. If you watch closely, it is all about invoking the algorithm that does the actual job. What is an algorithm? In our example above it
is just our Add, Subtract, Multiply and Divide functions. What? Did I just say functions .... functional programming.... Scala!

Let's now see how Scala addresses this with a functional approach

```scala
object IWillNotWriteBoilerPlateStrategyPatternAnymore extends App {
  def add(a: Int, b: Int) = a + b
  def sub(a: Int, b: Int) = a - b
  def mul(a: Int, b: Int) = a * b
  def div(a: Int, b: Int) = a / b

  def execute(fn: (Int, Int) =&gt; Int, a: Int, b: Int) = fn(a, b)
}
```

That is all it! This is what we call simplicity! Here is how to call it!

```scala
execute(add, 1, 2)
execute(mul, 1, 2)
```

So I hope that I was able to convince you with some historical design patterns and how you could simplify them with a functional programming 
approach. Now, since Java 8 has functional paradigm baked into the language, I still find Scala's functional approach is lot simpler and 
subtler! The choice is your's!
