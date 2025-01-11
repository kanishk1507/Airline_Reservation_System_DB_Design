# Airlines Database Design 
## Airlines Reservation System 
## By : Kanishk Acharya 

This is a Database design for an Airlines Company with 10,000 hours of **flights**. It has the highest capacity **aircraft**, all equipped with modern technology stuffs ensuring quality and safety of passengers.

It has several **Branches** in different countries. Most branches are in American **States**. Its dedicated **employees** are keen to prove the quality service often recommended by its customers. It is well known for low **AirFare** for both way **routes** services across domestic customers.
  
Highly dedicated in customer services, it offers several discount schemes for children and people with disabilities. Due to its high reliability, safety records and highly gained trust from customers, It is having more **transactions**, causing day to day expanding business activities hard to manage its operations. To ensure more flexible service for customers its highly recommended to implement and **Airlines Reservation System**, a computerized system that will help manage all information related to flight, passengers, their contact details, reservation, transactions, schedule publishing, air fare payments etc.  

**Current business activities :**

It is operating on spot airline reservation, flight booking services with help of several travel agencies. It's not only causing inconvenience for customers but also raises the actual tariff that customer has to pay. Though having branches in multiple cities targeting high range of customers. employee something fails to satisfy customers in remote areas when they have to travel for reservation also when they need to travel for cancellation or flight day extension. Followings are 
the key operations of Buddha Air's day to day business: 

**1. Sales Transactions**

All sales transactions are related to flight ticket sales; advance reservations, reservation cancellations etc. 
**a. Reservation**  
It provides flight pre-reservation to its customers. All customers are open to reserve flights to travel in future. Reservations are taken before 11hour of flight. Pre
reservation insuring future sales forecast. 
**b. Cancellation**  
No hard ules, as far as company does not have to lose anything. A customer is always can cancel their flights. Cancelled seats are released for re-sell instantly. 
Company denies canceling a sold ticket, if cancellation request is made within 6 hours of flight. 

**2. Flight scheduling**  

Day to day flight scheduling new flight arrangements according to sales potentiality, flight departure delay decisions all takes rooms in its daily flight scheduling activities etc. 

**3. Ticketing**

On spot ticket sales, online reservation sales, urgent sales, VVIP ticketing is done in its several branches, authorized agents from different travel agencies. 

**Business rules** 

Quality services to customers aren't possible with defined business principles Buddha Air has several business rules that apply from its own staffs to third party sales agents and potential customers. For each, business rules are as per listed below: 

**1. Customers**  
• They are welcome to those from different flight schedules those are available throughout a  day depending upon their comfort, willingness and flexibility and of course upon flight availability.  
• All customers are required to submit valid contact details.  
• All customers must reserve a flight to travel. No on the gate sales are available. Also  customers can't buy tickets at airports, instead they need to visit online store or a sales counter to get a ticket or reserve for future plans.  
• Full payments are necessary in-order to confirm a booking, yes, there can be several discounts schemes which can be claimed by customers & is given upon proper alignment with discount descriptions. 
• Customers must be penalized for cancellation, how much charges they have to pay, depends when they are canceling the flights. If it's before 11 hour of flight they need to pay 10% of sales and if it's within 11 hour of flight -33.33% will be deducted from actual   
sales amount.  
• Customers can demand the cancellation & 100% refund of flight is cancelled due to technical reason, bad weather. 
• All customers are allowed up to 5 KG cargo free with each ticket. Exceeding 5 KG causes the additional fees Each customer is eligible for $20,000 life insurance. 
• Wheel chairs & oxygen is available for special passengers. 

**2. Employees (including sales agents)**  
• All employees must be dressed according to company dress code with an ID card, easily visible to guests  
• Employees are expected to be presence on their seat within duty hours.,  
• All employees are assigned to serve client based on first come first services. Yes- there is a provision for special cure for urgent & national security matters.  
• Employees are hereby responsible for serving customers first, second their own jobs.  
• Employees are not allowed to take flight reservations within 11 hours of flight.

**Database Design for Airline Reservation :**
**Entities & their relevant attributes**  
-Entity list
1) AirCrafts 
2) Route 
3) AirFare 
4) flight_schedule 
5) Discounts 
6) charges 
7) Countries 
8) state 
9) Contact_details 
10) passengers 
11) Branches 
12) employee 
13) Transactions 
14) Notifications

## Here's the ER Diagram for this Database: 
![image](https://github.com/user-attachments/assets/abed45e1-539f-486c-bb64-366c27b037f8)



This database contains 14 tables that are unique and referenced to each other as per the requirements and the data stored in them.  

This database also contains some Cursors, Triggers and a stored procedure that serve different purposes which are described below:  
**-Cursors:** 
(i) To calculate and update available seats:  
This cursor iterates through flights and calculate the number of available seats based on the aircraft capacity and booked seats. 

**-Triggers:**  
(i) Auto-calculate Net Fare: 
Automatically calculates the net fare whenever a new fare is inserted into the ‘AirFare’ table. 

**-Stored Procedure:** 
To notify users about updated flight timings (delays or early departure) and discount offers.  

(i) Notification Table: To store notifications that can be queried by the application to send messages to users.  
(ii) Triggers: Flight schedule change and new discount notification triggers on discounts and flight_schedule tables.  
(iii) Procedure: ‘Send Notification’  procedure and ‘Notification Cursor’
