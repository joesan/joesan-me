+++
description="This is what it costs when you own a HEV (Hybrid Electric Vehicle) or a BEV"
title="Operational Cost comparison between a HEV and BEV"
date=2024-08-16

categories = ["misc"]
+++

Recently I had to make a choice of which new car to get so that I can replace my old Diesel car. Given the industry shift 
to electric vehicles, it is definitely an unfortunate time to buy. I mean it is an unfortunate time in the sense that EV is
an emerging technology market, and we see new cars launched every year and with that new technology, be it the battery (solid state), or
the charging speed among many others, the prices are insanely expensive. It will definitely take a few years until this
price craziness for EV will eventually settle and be more affordable.

After some extensive research, I'm finding that the EV cars offered on the market is atleast ca. 10K Euros more than what 
they are worthy. For example., a Tesla Model Y should be somewhere between 30K and 40K against what it costs now. This 
applies to all the other EV cars as well. So I wanted to do some calculations that would give me a sense of what I will 
be spending over the years as operational costs.

In this blog, I wanted to present my simple rational that helped me make my decision.

**NOTE: I cannot vouch for the correctness, and I'm not liable if you use this article for basing your purchase decision!**

First, let us see what parameters we are going to use

## Assumptions

-> No comparison based on pure Horse Power or Torque or any other performance metrics

-> This specific comparison is not to be generalized for any cars other than these two cars that are being compared

## Parameters to use

**Purchase Price** - The most important parameter that heavily influences which car to buy

**Total Years of Ownership** - For how many years do you want to own your car after purchase

**Fuel Price** - The cost per liter of fuel at the pipe (be it cost per kWh for BEV or cost per liter for HEV)

**Fuel Price Appreciation Percentage** - By how much factor does the Fuel price appreciates YoY (Year over Year)

**Liters per 100 km** - How many liters for HEV or how much kWh for BEV is required to cover 100 Kilometers

**Total km over a year** - Total Kilometers that will be driven over a year

**Maintenance Costs per year** - Average maintenance costs per year

**Additional Costs** - Any other additional costs. For example., installation of a Wallbox at home

## Let us calculate

To keep it simple and not bloat this blog article, I have created the calculations in a Scala REPL. Please have a 
look [here](https://scastie.scala-lang.org/dfpAWiu7QI2Lf3Ptig0lZg)

## What were my assumptions?

In my calculations I assumed a 10% price increase every year for Fuel, and a 2% price increase for electricity every year.

For example., if we look at the electricity household price per kWh, it was around 0.29 Euros per kWh in 2014 and now in 2024
it is 0.40 Euros per kWh (average). For Fuel prices, it was roughly 1.35 Euros in 2014 and now it is 1.80 Euros per liter (average).

We calculate the percentage increase over the last 10 years, using:

```
percentaage increaase = ((new_price - old_price) / old_price) * 100
```

Plugging in the values we get:

**Electricity price increase over the last 10 years = 37%**

**Fuel price increase over the last 10 years = 33%**

So that more or less works out to a ca. 3% increase YoY for both Fuel and Electricity price over the last 10 years. 

But in  my calculations, I have assumed an YoY increase of 10% for Fuel prices, and a 2% increase YoY for electricity 
prices which means my calculations work in favor of electricity prices. A 10% increase in Fuel prices YoY from now until 
the next 10 years is based on the fact that there will be an increase in the CO2 emissions tax per ton and this tax will
have a direct effect on the Fuel prices at the tank stations.

*Disclaimer: If you understand how the electricity prices (and if you are clever enough) are set (merit order), you will be
able to infer that the electricity prices will also rise more-or-less on the same percentage YoY like Fuel prices as there
is a very strong coupling between Fuel and Electricity prices (unfortunately)!*

Hint: For the Fuel and Electricity prices, I used the following data as source:

For Fuel prices - https://www.statista.com/statistics/1346041/premium-gasoline-average-price-germany/

For Electricity prices - https://tradingeconomics.com/germany/electricity-prices-medium-size-households-eurostat-data.html

## What do the results say?

I compared a Toyota Corolla Cross 2.0 (purchasePrice = 33000) against aa Tesla Model Y (purchasePrice = 49000) and here are the comparison results:

```
Corolla Cross 2.0 Hybrid: **********
Total cost over 10 years with a yearly fuel price appreciation of 10% is: EUR 67978
Tesla Model Y Long Range: **********
Total cost over 10 years with a yearly fuel price appreciation of  2% is: EUR 67502
```

Assuming that you have tried running the comparison, you can see that by tweaking the parameters for the car of your choice,
you will be able to infer a basic estimate on how much you will be spending YoY.

For an electric car, I see Tesla Model Y long range as the standard. Anything else (as of today) is not worthy for me to
consider. But this may be different to you. So play with different parameters to see the results.

## Next Steps

As you might have noticed that I used a pretty much linear appreciation for the price, a much more realistic value would 
be to estimate the fuel price based on some statistical methods. I'm on it now!
