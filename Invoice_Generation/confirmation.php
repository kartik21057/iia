<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmation</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>

<form action="Bank.php" method="post">

<?php

    include ("navbar.php");
    $userphone= $user_data['PhoneNumber'] ;
    $fromCity = $_POST['from_city'];
    $toCity = $_POST['to_city'];
    $travelDate = $_POST['travel_date'];
    $numPassengers = $_POST['num_passengers'];

    $selectedTransMode = $_POST['selectedMode'];
    $selectedTransID = $_POST['selectedTransportID'];
    $selectedTransClass = $_POST['selectedTransportClass'];
    

    $selectedAccommodationType = $_POST['selectedAccommodationType'];
    $selectedAccommodationID = $_POST['selectedAccommodationID'];
    $selectedRoomType = $_POST['selectedRoomType'];

    $selectedCabDriverID = $_POST['selectedCabRentalID'];
    $BookingTime = date('Y-m-d');
    $FinalCost=0;


        // Loop through the passenger data
        for ($i = 1; $i <= $numPassengers; $i++) {
            // Retrieve data for each passenger
            $first_name = $_POST['first_name_' . $i];
            $last_name = $_POST['last_name_' . $i];
            $email = $_POST['email_' . $i];
            $gender = $_POST['gender_' . $i];
            $phone = $_POST['phone_' . $i];
            echo '<td><input type="text" name="first_name_' . $i . '" required></td>';
            echo '<td><input type="text" name="last_name_' . $i . '" required></td>';
            echo '<td><input type="email" name="email_' . $i . '" required></td>';
            echo '<td><input type="gender" name="gender_' . $i . '" required></td>';
            echo '<td><input type="tel" name="phone_' . $i . '" required></td>';


            // You can now process or display the data as needed
            // echo "Passenger $i:<br>";
            // echo "First Name: $first_name<br>";
            // echo "Last Name: $last_name<br>";
            // echo "Email: $email<br>";
            // echo "Gender: $gender<br>";
            // echo "Phone: $phone<br><br>";

            if ($selectedTransMode == 'Flight') {

                $ClassName = $selectedTransID."_".$selectedTransClass;
                // echo $ClassName;

                $addFlightPassengerQuery = "INSERT INTO PASSENGERS(F_name, L_name , Email , Gender , Phone_Number) 
                values  ( '$first_name' , '$last_name' , '$email' , '$gender' , '$phone' );";
                mysqli_query($cont_flights, $addFlightPassengerQuery);


                
                $getCustomerIDQuery = "SELECT MAX(Passenger_ID) AS MaxPassengerID FROM Passengers;";
                $getCustomerIDResult = mysqli_query($cont_flights, $getCustomerIDQuery);
                $getCustomerIDRow = mysqli_fetch_assoc($getCustomerIDResult);
                $CustomerID= $getCustomerIDRow['MaxPassengerID'];

                $getPriceQuery = "SELECT Price from Class WHERE Class_Code='$selectedTransClass' AND Flight_ID = '$selectedTransID'; ";
                $getPriceResult = mysqli_query($cont_flights, $getPriceQuery);
                $getPriceRow = mysqli_fetch_assoc($getPriceResult);
                $FlightPrice= $getPriceRow['Price'];
                

                ////// Now insert into Booking Table
                $addFlightBookingQuery = "INSERT INTO Booking(Flight_ID, Class_Name , Booking_Time , Total_Amount , Customer_ID , Coupon_ID , Booked_By) 
                values  ( '$selectedTransID' , '$ClassName' , '$BookingTime' , '$FlightPrice' , '$CustomerID' , 'Flight10' , '$userphone' );";
                mysqli_query($cont_flights, $addFlightBookingQuery);
                $FinalCost = $FinalCost + $FlightPrice ; 



            }
            if ($selectedTransMode == 'Train') {
                
                $ClassName = $selectedTransID."_".$selectedTransClass;
                // echo $ClassName;

                $addTrainPassengerQuery = "INSERT INTO PASSENGERS(F_name, L_name , Email , Gender , Phone_Number) 
                values  ( '$first_name' , '$last_name' , '$email' , '$gender' , '$phone' );";
                mysqli_query($con_trains, $addTrainPassengerQuery);


                
                $getCustomerIDQuery = "SELECT MAX(Passenger_ID) AS MaxPassengerID FROM Passengers;";
                $getCustomerIDResult = mysqli_query($con_trains, $getCustomerIDQuery);
                $getCustomerIDRow = mysqli_fetch_assoc($getCustomerIDResult);
                $CustomerID= $getCustomerIDRow['MaxPassengerID'];

                $getPriceQuery = "SELECT Price from Class WHERE Class_Code='$selectedTransClass' AND Train_ID = '$selectedTransID'; ";
                $getPriceResult = mysqli_query($con_trains, $getPriceQuery);
                $getPriceRow = mysqli_fetch_assoc($getPriceResult);
                $TrainPrice= $getPriceRow['Price'];
                

                ////// Now insert into Booking Table
                $addTrainBookingQuery = "INSERT INTO Booking(Train_ID, Class_Name , Booking_Time , Total_Amount , Customer_ID , Coupon_ID , Booked_By) 
                values  ( '$selectedTransID' , '$ClassName' , '$BookingTime' , '$TrainPrice' , '$CustomerID' , 'NaN' ,  '$userphone');";
                mysqli_query($con_trains, $addTrainBookingQuery);
                $FinalCost = $FinalCost + $TrainPrice ; 



            }
            if ($selectedTransMode == 'Bus') {

                // $ClassName = $selectedTransID."_".$selectedTransClass;
                // echo $ClassName;

                $addBusPassengerQuery = "INSERT INTO BUS_PASSENGERS(F_name, L_name , Email , Gender , Phone_Number) 
                values  ( '$first_name' , '$last_name' , '$email' , '$gender' , '$phone' );";
                mysqli_query($con_buses, $addBusPassengerQuery);


                
                $getCustomerIDQuery = "SELECT MAX(Passenger_ID) AS MaxPassengerID FROM BUS_Passengers;";
                $getCustomerIDResult = mysqli_query($con_buses, $getCustomerIDQuery);
                $getCustomerIDRow = mysqli_fetch_assoc($getCustomerIDResult);
                $CustomerID= $getCustomerIDRow['MaxPassengerID'];

                $getPriceQuery = "SELECT Price from Buses WHERE  Bus_ID = '$selectedTransID'; ";
                $getPriceResult = mysqli_query($con_buses, $getPriceQuery);
                $getPriceRow = mysqli_fetch_assoc($getPriceResult);
                $BusPrice= $getPriceRow['Price'];
                

                ////// Now insert into Booking Table
                $addBusBookingQuery = "INSERT INTO Booking(Bus_ID,  Booking_DateTime , Total_Amount , Passenger_ID , Booked_By  )
                values  ( '$selectedTransID' , '$BookingTime' , '$BusPrice' , '$CustomerID' , '$userphone'  );";
                mysqli_query($con_buses, $addBusBookingQuery);
                $FinalCost = $FinalCost + $BusPrice ; 

            }
            if ($selectedAccommodationType == 'Hotel' ){

                $addHotelCustomersQuery = "INSERT INTO Customers(F_name, L_name , Email , Gender , Phone_Number) 
                values  ( '$first_name' , '$last_name' , '$email' , '$gender' , '$phone' );";
                mysqli_query($con_hotels, $addHotelCustomersQuery);


                
                $getCustomerIDQuery = "SELECT MAX(Customer_ID) AS MaxCustomerID FROM Customers;";
                $getCustomerIDResult = mysqli_query($con_hotels, $getCustomerIDQuery);
                $getCustomerIDRow = mysqli_fetch_assoc($getCustomerIDResult);
                $CustomerID= $getCustomerIDRow['MaxCustomerID'];

                $getPriceQuery = "SELECT Room_Num , Cost from Room WHERE  Hotel_ID = '$selectedAccommodationID' AND Room_Type = '$selectedRoomType' ; ";
                $getPriceResult = mysqli_query($con_hotels, $getPriceQuery);
                $getPriceRow = mysqli_fetch_assoc($getPriceResult);
                $HotelPrice= $getPriceRow['Cost'];
                $RoomNum = $getPriceRow['Room_Num'];
                

                ////// Now insert into Booking Table
                $addHotelBookingQuery = "INSERT INTO Booking (Room_ID, Hotel_ID,   Booking_Date , Total_Bill , Customer_ID , Booked_By , Coupon  )
                values  ( '$RoomNum' ,'$selectedAccommodationID' , '$BookingTime' , '$HotelPrice' , '$CustomerID' , '$userphone' , 'NaN' );";
                mysqli_query($con_hotels, $addHotelBookingQuery);
                $FinalCost = $FinalCost + $HotelPrice ; 

            }

            if ($selectedAccommodationType == 'Homestay' ){

                $addHomestayCustomersQuery = "INSERT INTO Customers(F_name, L_name , Email , Gender , Phone_Number) 
                values  ( '$first_name' , '$last_name' , '$email' , '$gender' , '$phone' );";
                mysqli_query($con_homestays, $addHomestayCustomersQuery);


                
                $getCustomerIDQuery = "SELECT MAX(Customer_ID) AS MaxCustomerID FROM Customers;";
                $getCustomerIDResult = mysqli_query($con_homestays, $getCustomerIDQuery);
                $getCustomerIDRow = mysqli_fetch_assoc($getCustomerIDResult);
                $CustomerID= $getCustomerIDRow['MaxCustomerID'];

                $getPriceQuery = "SELECT Home_Rent from Home WHERE  Home_ID = '$selectedAccommodationID' ; ";
                $getPriceResult = mysqli_query($con_homestays, $getPriceQuery);
                $getPriceRow = mysqli_fetch_assoc($getPriceResult);
                $HomestayPrice= $getPriceRow['Home_Rent'];
                

                ////// Now insert into Booking Table
                $addHomestayBookingQuery = "INSERT INTO Booking ( Home_ID,   Booking_Date , Total_Bill , Customer_ID , Booked_By , Coupon  )
                values  ( '$selectedAccommodationID' , '$BookingTime' , '$HomestayPrice' , '$CustomerID' , '$userphone' , 'NaN' );";
                mysqli_query($con_homestays, $addHomestayBookingQuery);
                $FinalCost = $FinalCost + $HomestayPrice ; 

            }

            ////////////////////////////// CAB RENTAL /////////////////////////////////////
                // echo "Selected Cab";
                // echo $selectedCabDriverID;
                $addCabCustomersQuery = "INSERT INTO Customers(F_name, L_name , Email , Gender , Phone_Number) 
                values  ( '$first_name' , '$last_name' , '$email' , '$gender' , '$phone' );";
                mysqli_query($con_cabs, $addCabCustomersQuery);


                
                $getCustomerIDQuery = "SELECT MAX(Customer_ID) AS MaxCustomerID FROM Customers;";
                $getCustomerIDResult = mysqli_query($con_cabs, $getCustomerIDQuery);
                $getCustomerIDRow = mysqli_fetch_assoc($getCustomerIDResult);
                $CustomerID= $getCustomerIDRow['MaxCustomerID'];

                $getCabQuery = "SELECT Car_ID from Car_Driver WHERE Driver_ID = '$selectedCabDriverID' ";
                $getCabResult = mysqli_query($con_cabs, $getCabQuery);
                $getCabRow = mysqli_fetch_assoc($getCabResult);
                $CabId = $getCabRow['Car_ID'];

                $getPriceQuery = "SELECT Cost from Car_Type WHERE Car_ID = '$CabId' ";
                $getPriceResult = mysqli_query($con_cabs, $getPriceQuery);
                $getPriceRow = mysqli_fetch_assoc($getPriceResult);
                $CabPrice= $getPriceRow['Cost'];

                
                

                ////// Now insert into Booking Table
                $addCabBookingQuery = "INSERT INTO Booking(Driver_ID,   Booking_DateTime , Total_Fare , Customer_ID , Coupon , Booked_By) 
                values  ( '$selectedCabDriverID'  , '$BookingTime' , '$CabPrice' , '$CustomerID' , 'NaN' ,  '$userphone');";
                mysqli_query($con_cabs, $addCabBookingQuery);
                $FinalCost = $FinalCost + $CabPrice ; 
                ?>
                     
                     
                
                

<!-- Here we will send rest of the data  -->
<!-- /////////////////////////////////////////////////////////////////////////////////////////// -->









            
<?php

    }

    

?>
        <div class="form-row">

        <table border='1'>
        <tr> 
        <th>Total Price</th>
            <td>
            <?php
        echo "Your Total Price is: ";
        echo $FinalCost; 
        ?>
        </td>
        </tr>

<tr>
<th>Select Mode of Payment</th>
    <td>
        <div class="form-row">
        <div class="form-group col-md-6">
        <select class="form-select" id="MOP" name="MOP" required>
        <option value="UPI">UPI</option>
        <option value="Net Banking">Net Banking</option>
        <option value="Debit/Credit Card">Debit/Credit Card</option>
        </select>
        </div>
</td>
</tr>
</table >


<div class="form-group">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </form>
    
    




</body>
</html>

<form action="invoice.php" method="post">
    <input type="hidden" name="FinalCost" value="<?php echo $FinalCost; ?>">
    <input type="hidden" name="HomestayPrice" value="<?php echo $HomestayPrice; ?>">
    <input type="hidden" name="CabPrice" value="<?php echo $CabPrice; ?>">
    <input type="hidden" name="first_name" value="<?php echo $first_name; ?>">
    <input type="hidden" name="last_name" value="<?php echo $last_name; ?>">
    <input type="hidden" name="email" value="<?php echo $email; ?>">
    <input type="hidden" name="phone" value="<?php echo $phone; ?>">
    <input type="hidden" name="BookingTime" value="<?php echo $BookingTime; ?>">
    
    <!-- User-visible fields and Submit button -->
    <label for="MOP">Choose a mode of payment:</label>
    <select name="MOP" required>
        <option value="UPI">UPI</option>
        <option value="Net Banking">Net Banking</option>
        <option value="Debit/Credit Card">Debit/Credit Card</option>
    </select>
    <button type="submit" class="btn btn-primary">Generate Invoice</button>
</form>
