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

## Day 4 - Time, Stops & Flight Duration Analysis

### Yearly Flight and Pricing Trends

* Flight volume remained relatively stable between 2019 and 2025, ranging from 2,074 to 2,208 flights per year.
* 2022 recorded the highest flight volume with 2,208 flights.
* 2019 had the highest yearly average ticket price at ₹9,438.22.
* 2023 recorded the lowest yearly average ticket price at ₹9,236.24.
* Overall, yearly average fares remained relatively stable throughout the dataset period.

### Monthly Pricing Trends

* September recorded the highest flight volume with 1,310 flights.
* June had the highest average ticket price at ₹9,545.78.
* April followed with an average fare of ₹9,506.85.
* May recorded the lowest average ticket price at ₹9,205.88.
* Monthly fare differences suggest some seasonal variation, although prices remain within a relatively narrow range.

### Day-of-Week Analysis

* Friday recorded the highest number of flights with 2,239 flights.
* Monday had the lowest flight volume with 2,042 flights.
* Sunday had the highest average ticket price at ₹9,436.10.
* Tuesday had the lowest average ticket price at ₹9,259.31.
* Day-of-week pricing differences are moderate compared with the much larger differences observed across stop categories.

### Departure Period Analysis

* Morning is the most common departure period with 4,419 flights.
* Night departures follow with 4,281 flights.
* Afternoon and evening departures recorded 3,152 and 3,148 flights respectively.
* Morning flights have the highest average fare at ₹9,369.11.
* Afternoon flights have the lowest average fare at ₹9,333.36.
* Average fares across broad departure periods are very similar, indicating that departure period alone has limited influence on pricing.

### Departure Hour Pricing

* Flights departing at 7 AM have the highest hourly average ticket price at ₹9,711.03.
* 1 AM departures have the second-highest average fare at ₹9,507.41.
* Flights departing at 4 PM have the lowest average ticket price at ₹9,095.97.
* 5 PM departures also have relatively low fares, averaging ₹9,100.49.
* Hour-level analysis reveals greater pricing variation than the broader morning, afternoon, evening, and night categories.

### Flight Duration Analysis

* The shortest recorded flight duration is 60 minutes.
* The longest recorded flight duration is 945 minutes, equivalent to 15 hours and 45 minutes.
* Average flight duration across the dataset is 502.05 minutes, or approximately 8 hours and 22 minutes.
* Very long flights of 10 hours or more form the largest duration category with 5,978 flights.
* Long flights between 5 and 10 hours account for 5,025 flights.

### Duration Category and Ticket Pricing

* Short flights under 2 hours have the highest average ticket price at ₹9,483.06.
* Medium-duration flights between 2 and 5 hours have the lowest average fare at ₹9,287.57.
* Long flights between 5 and 10 hours average ₹9,327.32.
* Very long flights of 10 hours or more average ₹9,390.61.
* Ticket prices do not increase consistently with flight duration, suggesting that duration alone is not a strong pricing driver in this dataset.

### Stops, Duration, and Pricing

* Average flight duration is approximately 500 minutes across all stop categories.
* Non-stop flights average 501.81 minutes, while 2-stop flights average 505.27 minutes.
* Despite similar average durations, ticket prices vary substantially by number of stops.
* Non-stop flights have the lowest average fare at ₹7,145.21.
* One-stop flights average ₹8,481.81, while two-stop flights average ₹10,032.82.
* Three-stop flights have the highest average fare at ₹11,737.15.
* This indicates that stop count has a much stronger relationship with ticket price than average flight duration within this dataset.

### Airline Departure Period Pricing

* Alliance Air's most expensive departure period is Night, averaging ₹9,695.98.
* Akasa Air's highest-priced period is Afternoon at ₹9,670.21.
* GoAir's highest-priced period is Morning at ₹9,640.70.
* TruJet's highest-priced period is Evening at ₹9,594.07.
* The most expensive departure period varies by airline, indicating that there is no single time period that consistently commands the highest fare across all carriers.

### Year-over-Year Ticket Price Changes

* Average ticket prices decreased by 0.33% in 2020 and 0.68% in 2021.
* Prices increased by 0.66% in 2022.
* 2023 recorded the largest year-over-year decline at 1.78%.
* Average fares recovered by 0.71% in 2024 and another 0.57% in 2025.
* Overall year-over-year movements remain relatively small, showing that average ticket prices were broadly stable across the seven-year period.

---

## Day 4 Summary

Time-based analysis shows relatively stable ticket pricing across years, months, weekdays, and broad departure periods, although individual departure hours display greater variation. Flight duration also does not show a consistent relationship with airfare. In contrast, the number of stops remains a strong pricing differentiator: average fares rise substantially from non-stop to three-stop flights even though average flight durations remain almost identical across stop categories. This suggests that stop structure is a more significant pricing factor than duration or general departure timing within this dataset.

## Day 5 - Advanced Business Insights & Final Analysis

### Airline Pricing Rankings

* Akasa Air ranks first by average ticket price at ₹9,478.98.
* Alliance Air ranks second at ₹9,459.43, followed by TruJet at ₹9,430.78.
* IndiGo has the lowest average ticket price at ₹9,174.49.
* The relatively small difference between airline-level average fares indicates strong pricing competition across carriers.

### Source City Demand Rankings

* Hyderabad is the highest-demand source city with 799 departing flights.
* Jaipur ranks second with 787 flights, followed by Delhi with 780 flights.
* Guwahati and Chennai complete the top five source cities with 779 and 778 flights respectively.
* Surat has the lowest departure volume among the 20 source cities with 709 flights.

### Destination City Demand Rankings

* Guwahati ranks first among destination cities with 814 arriving flights.
* Lucknow ranks second with 809 flights, followed by Mumbai with 803 flights.
* Kolkata ranks fourth with 787 flights, while Delhi ranks fifth with 773 flights.
* Goa has the lowest destination volume with 664 flights.

### Ticket Price Segmentation

* Standard-priced flights between ₹5,000 and ₹9,999 form the largest fare segment with 6,986 flights, representing 46.57% of the dataset.
* Premium flights between ₹10,000 and ₹14,999 account for 5,757 flights, or 38.38%.
* Budget flights below ₹5,000 account for 1,566 flights, representing 10.44%.
* High-premium flights priced at ₹15,000 or above represent only 691 flights, or 4.61%.
* Standard and premium fares together account for 84.95% of all flights.

### Airline Performance by Price Segment

* TruJet has the highest overall flight volume with 1,556 flights.
* SpiceJet records 597 premium flights, the highest premium-flight count among the airlines, closely followed by TruJet and Alliance Air with 596 each.
* IndiGo has the highest number of budget flights with 181.
* GoAir records the highest number of high-premium flights with 82.
* Standard-priced flights form a substantial portion of each airline's operations, reinforcing the importance of the ₹5,000–₹9,999 fare segment.

### High-Value Routes

* Surat to Delhi generates the highest total ticket value among qualifying routes at ₹543,693 from 53 flights.
* Cochin to Bangalore ranks second with ₹535,580 from 52 flights.
* Hyderabad to Guwahati generates ₹527,600 from 54 flights.
* Kolkata to Mumbai generates ₹523,235, while Bangalore to Hyderabad generates ₹512,795.
* Route value is influenced by a combination of flight demand and average ticket price rather than either factor alone.

### Route Pricing Within Source Cities

* Ranking routes within individual source cities highlights substantial fare differences across destinations.
* Bangalore to Delhi is Bangalore's highest-priced qualifying route with an average fare of ₹10,480.08.
* Bhubaneswar to Indore leads qualifying routes from Bhubaneswar at ₹10,465.13.
* Nagpur to Cochin averages ₹10,560.71 and ranks first among qualifying Nagpur routes.
* Raipur to Varanasi leads qualifying routes from Raipur with an average fare of ₹10,523.30.
* Route-level pricing therefore provides more detailed differentiation than source-city averages alone.

### Airline Position vs Overall Market

* The overall market average ticket price is approximately ₹9,355.
* Akasa Air has the largest premium to the market average at 1.32%.
* Alliance Air follows at a 1.11% premium.
* TruJet and SpiceJet operate at premiums of 0.81% and 0.76% respectively.
* Air India and GoAir are both approximately 0.35% above the market average.
* Vistara operates at a 0.25% discount to the market average.
* AirAsia India is 0.85% below market, while Star Air is 1.72% below market.
* IndiGo has the largest discount to the overall market average at 1.93%.
* All airline premiums and discounts remain within approximately ±2%, further demonstrating relatively competitive airline-level pricing.

### Combined Airline Performance Ranking

* The combined performance score evaluates airlines using flight volume rank, average fare rank, and total ticket value rank.
* A lower combined score indicates stronger performance across these three dataset-specific measures.
* TruJet ranks first with a combined score of 5.
* SpiceJet ranks second with a score of 8.
* Akasa Air ranks third with a score of 10.
* Alliance Air follows with a score of 13.
* Vistara records the highest combined score at 27.
* This score is a comparative analytical measure for this dataset and should not be interpreted as a real-world airline quality or service ranking.

### Executive Airline Performance

* TruJet generates the highest total ticket value at ₹14,674,291 while also operating the highest number of flights at 1,556.
* SpiceJet follows with ₹14,535,837 in total ticket value.
* Akasa Air ranks third by total ticket value at ₹14,237,421.
* GoAir has the highest non-stop flight percentage at 26.63%.
* Star Air follows with 26.19%, while AirAsia India records 26.11%.
* Vistara has the lowest non-stop share at 22.89%.
* Non-stop percentages remain relatively close across airlines, indicating a broadly similar mix of direct and connecting services.

---

## Day 5 Summary

The advanced analysis confirms that the airline market represented in the dataset is highly balanced at the carrier level but shows stronger variation at the route and flight-characteristic levels. Akasa Air commands the highest average fare, while IndiGo operates at the largest discount to the overall market average. TruJet leads in both flight volume and total ticket value and achieves the strongest dataset-specific combined ranking.

Standard and premium fares dominate the dataset, together representing 84.95% of all flights. High-value route analysis further demonstrates that revenue potential depends on the interaction between flight demand and ticket pricing. Combined with the findings from earlier analyses, route selection and number of stops emerge as more significant pricing differentiators than airline, broad departure period, or flight duration.

---

## Final Project Conclusion

The Airline Flight Pricing & Route Analytics project analyzed 15,000 flight records across 10 airlines, 20 source cities, and 20 destination cities covering journeys from 2019 through 2025.

The analysis identified a relatively balanced airline market in terms of flight volume and average pricing. However, considerably greater differences appear at the route level and across stop categories. Connecting flights account for the majority of the dataset, and average ticket prices increase substantially as the number of stops rises. In contrast, flight duration, broad departure period, and yearly pricing trends show comparatively limited variation.

Advanced ranking, segmentation, route-value analysis, and market-position comparisons further demonstrate how SQL can transform raw airline data into actionable business insights. Across 50 SQL analyses, the project applies aggregation, CTEs, conditional logic, date functions, regular expressions, subqueries, ranking, and window functions to examine airline performance, demand, pricing behavior, route economics, and flight characteristics.
