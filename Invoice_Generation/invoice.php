<?php
session_start();

require 'vendor/autoload.php'; 
use Dompdf\Dompdf;

$FinalCost = $_POST['FinalCost'] ?? 0;
$first_name = $_POST['first_name'] ?? '';
$last_name = $_POST['last_name'] ?? '';
$email = $_POST['email'] ?? '';
$phone = $_POST['phone'] ?? '';
$selectedAccommodationType = $_POST['selectedAccommodationType'];
$selectedAccommodationID = $_POST['selectedAccommodationID'];
$selectedRoomType = $_POST['selectedRoomType'];
// $HomestayPrice = $_POST['HomestayPrice'] ?? 0;
$CabPrice = $_POST['CabPrice'] ?? 0;
$BookingTime = $_POST['BookingTime'] ?? '';
$mop = $_POST['MOP'] ?? '';
$numPassengers = $_SESSION['numPassengers'] ?? 1; // Default to 1 if not provided
$selectedMode = $_SESSION['selectedMode'] ?? '';
$travelDate = $_SESSION['travelDate'] ?? '';
$selectedID = $_SESSION['selectedID'] ?? '';
$selectedClass = $_SESSION['selectedClass'] ?? '';

$dataToEncode = "Name: {$first_name} {$last_name}, " .
                "Email: {$email}, " . 
                "Phone: {$phone}, " .
                "Mode of Transport: {$selectedMode}, " .
                "Time of Departure: {$travelDate}, ";
$qrImageUrl = "https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=" . urlencode($dataToEncode) . "&choe=UTF-8";


ob_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .qr-code {
            position: absolute;
            top: 10px;
            right: 10px;
        }
    </style>
</head>
<body>
    <div class="qr-code">
        <img src="<?php echo $qrImageUrl; ?>">
    </div>
    <h1>Invoice</h1>
    <p>Date: <?php echo date("Y-m-d"); ?></p>
    <p>Booking Time: <?php echo htmlspecialchars($BookingTime); ?></p>
    
    <h2>Customer Details</h2>
    <p>Name: <?php echo htmlspecialchars($first_name . ' ' . $last_name); ?></p>
    <p>Email: <?php echo htmlspecialchars($email); ?></p>
    <p>Phone: <?php echo htmlspecialchars($phone); ?></p>

    <h2>Booking Details</h2>
    <p>Number of Travelers: <?php echo htmlspecialchars($numPassengers); ?></p>
    <table>
        <tr>
            <th>Description</th>
            <th>Amount</th>
        </tr>
        <tr>
            <td>Mode of Transport</td>
            <td><?php echo htmlspecialchars($selectedMode); ?></td>
        </tr>
        <tr>
            <td>Time of Departure</td>
            <td><?php echo htmlspecialchars($travelDate); ?></td>
        </tr>
        <tr>
            <td>Transport Mode ID</td>
            <td><?php echo htmlspecialchars($selectedID); ?></td>
        </tr>
        <tr>
            <td>Transport Mode Class</td>
            <td><?php echo htmlspecialchars($selectedClass); ?></td>
        </tr>
        <tr>
            <td>Accomodation Type</td>
            <td><?php echo htmlspecialchars($selectedAccommodationType); ?></td>
        </tr>
        <tr>
            <td>Accomodation ID</td>
            <td><?php echo htmlspecialchars($selectedAccommodationID); ?></td>
        </tr>
        <tr>
            <td>Room Type</td>
            <td><?php echo htmlspecialchars($selectedRoomType); ?></td>
        </tr>
        <tr>
            <td>Cab Price</td>
            <td><?php echo htmlspecialchars($CabPrice); ?></td>
        </tr>
        <tr>
            <th>Total</th>
            <th><?php echo htmlspecialchars($FinalCost); ?></th>
        </tr>
    </table>

    <h2>Payment Details</h2>
    <p>Mode of Payment: <?php echo htmlspecialchars($mop); ?></p>
</body>
</html>

<?php
$htmlContent = ob_get_clean();

$options = new Dompdf\Options();
$options->set('isRemoteEnabled', true);

$dompdf = new Dompdf($options);
$dompdf->loadHtml($htmlContent);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
$dompdf->stream("invoice.pdf", array("Attachment" => 0));
?>
