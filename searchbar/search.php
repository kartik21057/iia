<?php
if (isset($_POST['query'])) {
    $query = $_POST['query'];
    $csvFile = 'Cities.csv'; // Path to your CSV file
    $delimiter = "\n"; // Assuming each city name is on a new line

    // Read the CSV file into an array
    $cities = explode($delimiter, file_get_contents($csvFile));

    // Initialize an array to store matching suggestions
    $suggestions = array();

    // Search for matching cities and add them to the suggestions array
    foreach ($cities as $city) {
        if (stripos($city, $query) !== false) {
            $suggestions[] = $city;
        }
    }

    // Output the suggestions as an unordered list
    if (!empty($suggestions)) {
        echo '<ul>';
        foreach ($suggestions as $suggestion) {
            echo '<li>' . $suggestion . '</li>';
        }
        echo '</ul>';
    } else {
        echo 'No suggestions found.';
    }
}
?>
