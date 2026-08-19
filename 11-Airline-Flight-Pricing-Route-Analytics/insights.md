# Airline Flight Pricing & Route Analytics - Insights

## Dataset Overview

* Total Flights: 15,000
* Total Airlines: 10
* Total Source Cities: 20
* Total Destination Cities: 20
* Journey Date Range: January 1, 2019 to December 28, 2025
* Average Ticket Price: ₹9,355.35
* Minimum Ticket Price: ₹2,502
* Maximum Ticket Price: ₹17,900

---

## Key Findings

### Flight Network Overview

* The dataset contains 15,000 flight records covering a seven-year period from 2019 to 2025.
* A total of 10 airlines operate across 20 source cities and 20 destination cities.
* The dataset provides broad coverage across major Indian cities, making it suitable for airline, route, and ticket pricing analysis.

### Airline Distribution

* TruJet recorded the highest number of flights with 1,556 flights.
* SpiceJet followed with 1,542 flights, while IndiGo operated 1,529 flights.
* Vistara recorded the lowest flight count among the airlines with 1,411 flights.
* Flight volume is relatively evenly distributed across the 10 airlines, with no single airline dominating the dataset.

### Ticket Price Overview

* The average ticket price across all flights is ₹9,355.35.
* Ticket prices range from a minimum of ₹2,502 to a maximum of ₹17,900.
* The wide price range indicates significant variation in airfare, providing opportunities to analyze how airlines, routes, stops, and flight duration influence ticket prices.

### Source City Analysis

* Hyderabad is the most common source city with 799 departing flights.
* Jaipur follows with 787 flights, while Delhi records 780 flights.
* Surat has the lowest number of departures with 709 flights.
* Flight departures are relatively evenly distributed across the 20 source cities.

### Destination City Analysis

* Guwahati is the most frequent destination with 814 arriving flights.
* Lucknow follows with 809 flights, while Mumbai records 803 flights.
* Goa has the lowest destination flight count with 664 flights.
* The destination distribution indicates a broad flight network without excessive concentration in a single city.

### Flight Stops Analysis

* Flights with 2 stops are the most common, accounting for 3,785 flights.
* Flights with 3 stops follow closely with 3,768 flights.
* Non-stop flights account for 3,766 flights.
* Flights with 1 stop represent 3,681 records.
* The nearly even distribution across stop categories provides a strong basis for comparing ticket prices and flight duration by number of stops.

---

## Day 1 Summary

The initial analysis shows a balanced airline and city distribution across 15,000 flight records. Ticket prices vary substantially from ₹2,502 to ₹17,900, while flight volumes remain relatively evenly distributed across airlines and stop categories. These findings establish a strong foundation for deeper analysis of airline pricing, route performance, flight duration, and stop-based fare differences.


## Day 2 - Airline & Ticket Pricing Analysis

### Airline Pricing Analysis

* Akasa Air has the highest average ticket price at ₹9,478.98.
* Alliance Air follows with an average ticket price of ₹9,459.43.
* IndiGo has the lowest average ticket price at ₹9,174.49.
* Star Air has the second-lowest average fare at ₹9,194.84.
* The difference between the highest and lowest airline average fares is relatively small, indicating that average pricing is fairly competitive across airlines.

### Ticket Price Range

* Akasa Air recorded the highest individual ticket price at ₹17,900.
* Vistara recorded the lowest individual ticket price at ₹2,502.
* Akasa Air has the widest ticket price range at ₹15,368.
* Air India has the smallest price range among the airlines at ₹14,716.
* All airlines show substantial variation between their minimum and maximum fares.

### Total Ticket Value by Airline

* TruJet generated the highest total ticket value at ₹14,674,291.
* SpiceJet ranked second with ₹14,535,837.
* Akasa Air generated ₹14,237,421 in total ticket value.
* Vistara recorded the lowest total ticket value at ₹13,167,316.
* Total ticket value appears to be influenced by both flight volume and average ticket price.

### Airline Flight Share

* TruJet has the largest share of flights at 10.37%.
* SpiceJet follows with 10.28%, while IndiGo accounts for 10.19%.
* Vistara has the smallest flight share at 9.41%.
* Every airline represents approximately 9% to 10% of total flights, showing a highly balanced distribution across the dataset.

### Above-Average Ticket Analysis

* The overall average ticket price is ₹9,355.35.
* SpiceJet has the highest number of flights priced above the overall average, with 788 flights.
* Alliance Air has the highest proportion of above-average-priced flights at 51.47%.
* IndiGo has the lowest proportion of flights above the overall average at 47.61%.
* The percentage of above-average flights remains close to 50% for every airline, indicating relatively balanced fare distributions.

### Airline Pricing Compared with Overall Average

* Six airlines have average ticket prices above the overall average: Akasa Air, Alliance Air, TruJet, SpiceJet, Air India, and GoAir.
* Akasa Air is ₹123.63 above the overall average, the largest positive difference.
* Four airlines fall below the overall average: Vistara, AirAsia India, Star Air, and IndiGo.
* IndiGo is ₹180.86 below the overall average, making it the most affordable airline based on average ticket price.
* Despite these differences, airline-level average fares remain relatively close to the overall market average.

---

## Day 2 Summary

The airline pricing analysis shows a highly competitive and balanced market within the dataset. Akasa Air leads in average ticket price and maximum fare, while IndiGo records the lowest average fare. TruJet generates the highest total ticket value and also holds the largest share of flights. Overall, airline market shares and average fares are closely distributed, suggesting that deeper factors such as routes, destinations, stops, and flight duration may provide stronger explanations for ticket price differences.


## Day 3 - Route & Destination Analysis

### Popular Route Analysis

* Raipur to Indore is the most frequently operated route with 55 flights.
* Bhubaneswar to Mumbai, Hyderabad to Guwahati, and Varanasi to Bhubaneswar each recorded 54 flights.
* Surat to Delhi, Guwahati to Delhi, Delhi to Kolkata, and Pune to Lucknow each recorded 53 flights.
* Overall, flight demand is distributed across several routes rather than being concentrated on a single source-destination pair.

### Most Expensive Routes

* Among routes with at least 20 flights, Lucknow to Hyderabad has the highest average ticket price at ₹10,731.12.
* Lucknow to Nagpur follows with an average fare of ₹10,671.00.
* Indore to Ahmedabad has an average ticket price of ₹10,641.04.
* Other relatively expensive routes include Nagpur to Cochin, Raipur to Varanasi, Nagpur to Kolkata, Mumbai to Chennai, and Bangalore to Delhi.

### Most Affordable Routes

* Raipur to Jaipur is the most affordable qualifying route with an average ticket price of ₹7,935.49.
* Bhubaneswar to Raipur follows at ₹8,055.26.
* Cochin to Jaipur averages ₹8,116.37, while Chennai to Goa averages ₹8,131.74.
* The difference between the most expensive and most affordable qualifying routes shows that route selection can have a substantial impact on ticket prices.

### Source City Pricing

* Kolkata has the highest average departure fare at ₹9,506.24.
* Varanasi follows at ₹9,471.19, while Bangalore averages ₹9,435.38.
* Chennai has the lowest average departure fare at ₹9,242.38.
* Average fares by source city remain relatively close compared with the larger pricing differences observed at the individual route level.

### Destination City Pricing

* Varanasi has the highest average arrival fare at ₹9,481.57.
* Patna and Guwahati follow closely at ₹9,469.58 and ₹9,469.07 respectively.
* Lucknow has the lowest average destination fare at ₹9,136.47.
* Destination-level pricing differences are moderate, suggesting that specific routes and flight characteristics may influence fares more strongly than destination alone.

### Direct vs Connecting Flights

* Connecting flights account for 11,234 flights, representing 74.89% of the dataset.
* Direct flights account for 3,766 flights, representing 25.11%.
* Connecting flights have an average ticket price of ₹10,096.26.
* Direct flights have a significantly lower average ticket price of ₹7,145.21.
* The maximum connecting-flight fare reaches ₹17,900, compared with ₹11,999 for direct flights.

### Number of Stops and Ticket Price

* Non-stop flights have the lowest average ticket price at ₹7,145.21.
* Flights with 1 stop average ₹8,481.81.
* Flights with 2 stops average ₹10,032.82.
* Flights with 3 stops have the highest average ticket price at ₹11,737.15.
* Average ticket prices increase consistently as the number of stops increases, showing a strong positive relationship between stop count and airfare in this dataset.

### Popular Airline Routes

* Akasa Air's most frequent route is Kolkata to Mumbai with 12 flights.
* Vistara's most frequent route is Pune to Lucknow with 11 flights.
* SpiceJet's leading route is Ahmedabad to Goa with 11 flights.
* Air India's leading route is Mumbai to Kolkata with 11 flights.
* TruJet's most frequent route is Chennai to Goa with 11 flights.
* No airline shows an overwhelmingly dominant route, indicating broad route distribution across carriers.

### Route Pricing Compared with Overall Average

* The overall average ticket price is ₹9,355.35.
* Raipur to Jaipur is ₹1,419.86 below the overall average, representing the largest difference among the routes returned by the comparison.
* Lucknow to Hyderabad is ₹1,375.77 above the overall average.
* Lucknow to Nagpur is ₹1,315.65 above the overall average.
* Bhubaneswar to Raipur is ₹1,300.08 below the overall average.
* These differences show that individual routes produce considerably greater fare variation than airline-level average pricing.

---

## Day 3 Summary

Route analysis reveals that ticket pricing is influenced substantially by route and stop count. While airline-level average fares were relatively similar, individual routes show much larger price differences. The strongest pattern is the relationship between stops and price: fares increase consistently from non-stop flights through three-stop journeys. Connecting flights also represent nearly three-quarters of all flights and have considerably higher average fares than direct flights. These findings suggest that route structure and number of stops are important pricing factors within the dataset.
