<?php

$api_key = 'fca_live_E1mzGp82bRPXRhYlsv6Y7J3eHFhWf2Mj9t1p9mpY';


$base_currency = 'INR';

$currencies = array('AUD', 'USD', 'CNY', 'NZD', 'CHF', 'GBP', 'EUR', 'JPY', 'CHF');

$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, 'https://api.freecurrencyapi.com/v1/latest?apikey=' . $api_key . '&currencies=' . implode(',', $currencies) . '&base_currency=' . $base_currency);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

$response = curl_exec($ch);

curl_close($ch);

$response_object = json_decode($response);


$exchange_rates = $response_object->data;
echo "<table border='1'>";
echo "<tr><th>Currency Code</th><th>Currency Rate</th></tr>";
foreach ($exchange_rates as $currency => $rate) {
    echo "<tr><td>$currency</td><td>$rate</td></tr>";
    // echo $currency . ': ' . $rate . PHP_EOL;
}
echo "</table>";
?>