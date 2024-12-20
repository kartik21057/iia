import random
from collections import defaultdict
import string
import numpy as np
import pandas as pd


def generate_phoneNumber():
    first_digit = str(random.randint(1, 9))
    remaining_digits = "".join([str(random.randint(0, 9)) for _ in range(9)])
    phone_number = first_digit + remaining_digits
    return phone_number


def generate_random_number_plate():
    random_digits = ''.join(random.choices(string.digits, k=4))
    random_letters = ''.join(random.choices(string.ascii_uppercase, k=2))
    random_string = f"BH {random_digits} {random_letters}"
    return random_string


cities = np.array(['Mussoorie' 'Calicut Mini (Beypore' 'Thane' 'Akola' 'Jalna' 'Naharlagun'
 'Jamui' 'Porbandar' 'Rohtak' 'Bomdila' 'Bikaner' 'Sitamarhi' 'Udupi'
 'Dehradun' 'Falaknuma' 'Haveri' 'Nalanda' 'Mangaluru' 'Nabha' 'Pune'
 'Bongaigaon' 'Hampi' 'Bharuch' 'Goa' 'Siwan' 'Tonk' 'Pattan' 'Kaithal'
 'Raigad' 'Moga' 'Nainital' 'Hubli' 'Salem' 'Ludhiana' 'Majorda' 'Kochi'
 'Alwar' 'Deoghar' 'Hisar' 'Ambala' 'Dindigul' 'Jhunjhunu' 'Cuddalore'
 'Balod' 'Cansaulim' 'Korba' 'Bidar' 'Aurangabad' 'Khammam' 'Vapi'
 'Haldwani' 'Rourkela' 'Nandyal' 'Nekonda' 'Vasco da Gama' 'Wardha' 'Leh'
 'Mukteshwar' 'Alipurduar' 'Hazaribagh Town' 'Midnapore' 'Raichur'
 'Bhadrachalam' 'Bilasipara' 'Gorakhpur' 'Jodhpur' 'Allahabad'
 'Kanchipuram' 'Chirala' 'Shimla' 'Jalgaon' 'Barauni' 'Saharsa'
 'Joginder Nagar' 'Gyalshing' 'Curchorem' 'Jaipur' 'Udaipur'
 'Jajpur Keonjhar Road' 'Lucknow' 'Yercaud' 'Chittorgarh' 'Kovalam'
 'Chittoor' 'Badarpur' 'Bhimtal' 'Coimbatore' 'Khunti' 'Durg' 'Gulbarga'
 'Sirsa' 'Shillong' 'Varanasi' 'Tumkur' 'Kanjirappalli' 'Panipat'
 'Mehsana' 'Karur' 'Vadodara' 'Nadiad' 'Srinagar' 'Daman' 'Kailashahar'
 'Vellore' 'Diu' 'Ukhrul' 'Bellary' 'Karnal' 'Kasaragod' 'Champa' 'Guntur'
 'Lunglei' 'Kanker' 'Kota' 'Bilimora' 'Tenali' 'Diglipur' 'Bageshwar'
 'Hubballi' 'Gurgaon' 'Bhagalpur' 'Saharanpur' 'Dagshai' 'Agra' 'Durgapur'
 'Sambalpur' 'Qazigund' 'Saraikela-Kharsawan' 'Jamtara' 'Tehri' 'Shiroda'
 'Manipal' 'Jind' 'Summer Hill' 'Kanoh' 'Tirupati' 'Sancoale' 'Banihal'
 'Chennai' 'Katihar' 'Bishnupur' 'Lohardaga' 'Guler' 'Gwalior' 'Khanna'
 'Bharatpur' 'Jagraon' 'Delhi' 'Jagatsinghpur' 'Yamunanagar' 'Puri'
 'Willingdon Island' 'Valsad' 'Nagrota' 'Sasaram' 'Sonipat' 'Hoshiarpur'
 'Alappuzha' 'Nanded' 'Bankura' 'Rajpura' 'Chandigarh' 'Ajmer' 'Faridkot'
 'Ambikapur' 'Ghaziabad' 'Lingampet-Jagityal' 'Bhilwara' 'Chandar'
 'Bagdogra' 'Chiplun' 'Davangere' 'Yanam' 'Baramulla' 'Bhojpur'
 'Residency Road' 'Patiala' 'Wayanad' 'Bagalkot' 'Amravati' 'Jagtial'
 'Karad' 'Bhavnagar' 'Angamaly' 'Ranchi' 'Chamoli' 'Mysuru'
 'Chikkamagaluru' 'Churu' 'Raipur' 'Sawai Madhopur' 'Sangli' 'Murarai'
 'Ujjain' 'Brahmapur' 'Siddipet' 'Kannur' 'Nayagarh' 'Kasauli' 'Sonamarg'
 'Moradabad' 'Meerut' 'St. Marys Road' 'Ponda' 'Bhilai' 'Shivamogga'
 'Nizamabad' 'Puducherry' 'Hinganghat' 'Kushinagar' 'Bokaro' 'Medchal'
 'Colem' 'Hanumangarh' 'Manchiryal' 'Jhajjar' 'Rayagada' 'Bargarh'
 'Ratlam' 'Bambolim' 'Junagadh' 'Kalyan' 'Bangalore' 'Kakinada'
 'Bengaluru' 'Gandhidham' 'Jalpaiguri' 'Balasore' 'Udhampur' 'Nashik'
 'Giridih' 'Siliguri' 'Margao' 'Latur' 'Mangalore' 'Panchkula' 'Solapur'
 'Keshod' 'Kangra' 'Dhanbad' 'Ambassa' 'Tinsukia' 'Dharmanagar' 'Gokarna'
 'Kakching' 'Kollam' 'Anand' 'Lumding' 'MG Road' 'Belagavi' 'Mahabubnagar'
 'Mount Abu' 'Hoja' 'Port Blair' 'Rewari' 'Palampur' 'Solan' 'Chandrapur'
 'Anantapur' 'Gaya' 'Ratnagiri' 'Fatehabad' 'Berhampur' 'Bekal'
 'Secunderabad' 'Rajnandgaon' 'Berhampore' 'Madurai' 'Thiruvananthapuram'
 'Phulbani' 'Sultanpur' 'Bhongir' 'Bhadrak' 'Aizawl' 'Bhopal' 'Ahmedabad'
 'Dharamshala' 'Bokaro Steel City' 'Mahabaleshwar' 'Baripada' 'Bardoli'
 'Rameswaram' 'Kausani' 'Indore' 'Palwal' 'Kottayam' 'Kolkata' 'Gangtok'
 'Sopore' 'Prayagraj' 'Vadnagar' 'Lonavala' 'Mandi' 'Balli' 'Jamnagar'
 'Bicholim' 'Idukki' 'Bareilly' 'Sikar' 'Tezpur' 'Ongole' 'Mumbai'
 'Pelling' 'Machilipatnam' 'Sibsagar' 'Lethpora' 'Punalur' 'Bathinda'
 'Himmatnagar' 'Zunheboto' 'Hamirpur' 'Gandhinagar' 'Surat' 'Tindivanam'
 'Jhansi' 'Eluru' 'Ashtamudi' 'Bhiwandi' 'Visakhapatnam' 'Bijapur'
 'Thiruvalla' 'Kullu' 'Mariani' 'Vizianagaram' 'Mamit' 'Sawantwadi'
 'Mohali' 'Dongargarh' 'Tiruppur' 'Begusarai' 'Pakur' 'Ramagundam'
 'Karaikudi' 'Cuttack' 'Ichalkaranji' 'Nellore' 'Dispur' 'Jaunpur'
 'Muzaffarpur' 'Aalo' 'Rajkot' 'Kozhikode' 'Hassan' 'Coorg' 'Rishikesh'
 'Hindupur' 'Dal Lake' 'Bettiah' 'Palanpur' 'Auli' 'Mahasamund' 'Belgaum'
 'Hyderabad' 'Palakkad' 'Nagpur' 'Tumakuru' 'Purnia' 'Tiruchirappalli'
 'Aligarh' 'Gurdaspur' 'Dhenkanal' 'Amritsar' 'Serchhip' 'Huzurabad'
 'Vikarabad' 'Manwal' 'Panaji' 'Pendra Road' 'Darbhanga' 'Parbhani'
 'Patan' 'Kapurthala' 'Bhusaval' 'Barsi Takht' 'Jalandhar' 'Gumla'
 'Nagaur' 'Mahbubnagar' 'Pampore' 'Karaikal' 'Jabalpur' 'Peddapalli'
 'Dharwad' 'Dausa' 'Tirunelveli' 'Dibrugarh' 'Kolasib' 'Kaithlighat'
 'Thrissur' 'Champhai' 'Kohima' 'Rudraprayag' 'Mapusa' 'Burdwan'
 'Thanjavur' 'Kanpur' 'Kayamkulam' 'Barpeta' 'Anantnag' 'Yeshwanthpur'
 'Janjgir' 'Agartala' 'Chandrapura' 'Bhatkal' 'Katra' 'Bilha' 'Ramgarh'
 'Rangpo' 'Surendranagar' 'Churachandpur' 'Buxar' 'Faizabad' 'Bodh Gaya'
 'Harihar' 'Cansarvornem' 'Bihar Sharif' 'Pahalgam' 'Cochin' 'Ahmednagar'
 'Vijayawada' 'Bilaspur' 'Gadag' 'Kakapora' 'Kendrapara' 'Dalli Rajhara'
 'Motihari' 'Mathura' 'Jammu' 'Kurnool' 'Matheran' 'Baharampur'
 'Vikasnagar' 'Cooch Behar' 'Pimpri-Chinchwad' 'Pathanamthitta' 'Thivim'
 'Canacona' 'Kavaratti' 'Keonjhar' 'Dhule' 'Haridwar' 'Jamalpur' 'Hospet'
 'Jiribam' 'Kancheepuram' 'Diphu' 'Latehar' 'Kolhapur' 'Dahod'
 'Rajahmundry' 'Nalgonda' 'Ayodhya' 'Pasighat' 'Panchgani' 'Gomoh'
 'Dwarka' 'Vasai-Virar' 'Kazipet' 'Hubballi-Dharwad' 'Namakkal' 'Koraput'
 'Raigarh' 'Sangamner' 'Shirdi' 'Tuensang' 'Rangat' 'Narwal' 'Anakapalle'
 'Kamakhya' 'Baijnath' 'Pantnagar' 'Osmanabad' 'Beed' 'Koderma' 'Warangal'
 'Manali' 'Ballari' 'Krishnanagar' 'Firozabad' 'Dhamtari' 'Jagdalpur'
 'Kadapa' 'Bhiwani' 'Pauri' 'Jaisalmer' 'Bhuj' 'Bemetara' 'Pushkar'
 'Gulmarg' 'Madgaon' 'Pernem' 'Kulem' 'Malappuram' 'Tawang' 'Kalka'
 'Buldhana' 'Barmer' 'Shoranur' 'Karimnagar' 'Sahebganj' 'Firozpur'
 'Shimoga' 'Malda' 'Silchar' 'Goraul' 'Bhubaneswar' 'Ara' 'Sakti'
 'Darjeeling' 'Morbi' 'Ernakulam' 'Almora' 'Pithoragarh' 'Botad'
 'Chitradurga' 'Nurpur Road' 'Satara' 'Dimapur' 'Chengannur' 'Singtam'
 'Muzaffarnagar' 'Mokokchung' 'Erode' 'Narayanpur' 'Nuapada Road'
 'Balurghat' 'Mancherial' 'Jamshedpur' 'Mansa' 'Tadipatri' 'Thekkady'
 'Hazaribagh Road' 'Suryapet' 'Thoothukudi' 'Yadadri Bhuvanagiri' 'Howrah'
 'Nidadavolu' 'Nahan' 'Pali' 'Imphal' 'Khowai' 'Kothagudem' 'Haldia'
 'Rangiya' 'Chapra' 'Mysore' 'Navsari' 'Daltonganj' 'Nagercoil'
 'Samastipur' 'Itanagar' 'Jagityal' 'Adilabad' 'Dumka' 'Guwahati'
 'Simdega' 'Mayabunder' 'Ranthambore' 'Malout' 'Dudhsagar'
 'Sanjuje Da Areyal' 'Angul' 'Kolar' 'Kharagpur' 'Bhatapara' 'Kawardha'
 'Ranikhet' 'Pondicherry' 'Chamba' 'Silvassa' 'Corbett' 'Hazaribagh'
 'Chaibasa' 'Ranaghat' 'Koppal' 'Pathankot' 'Faridabad' 'Uttarkashi'
 'Barnala' 'Kudchade' 'Dandeli' 'Sangrur' 'Nagargao' 'Hosur' 'Taradevi'
 'Wokha' 'Junagarh' 'Anuppur' 'Washim' 'Sirohi Road' 'Dharamsala'
 'Dalhousie' 'Bhadravati' 'Gevra Road' 'Sirmour' 'Kalaburagi' 'Kharsia'
 'Srikakulam' 'Hajipur' 'Ankleshwar' 'Vizag' 'Ooty' 'Medak' 'Barddhaman'
 'Patna' 'Mahe' 'Kalyani' 'Quepem' 'Thoubal' 'Dabolim' 'Navi Mumbai'
 'Havelock Island' 'Una' 'Jorhat' 'Haripad' 'Sealdah' 'Batala' 'Mangan'
 'Kurukshetra' 'Purulia' 'Ramanathapuram' 'Karmali' 'Pollachi'
 'Jharsuguda' 'Arrah' 'Asansol' 'Akot' 'Salogra' 'Madhubani' 'Godhra'
 'Namchi' 'Kendujhargarh' 'New Delhi' 'Badgam' 'Godda' 'Karauli' 'Gudur'
 'Valpoi' 'Chikmagalur'])

fake_data = defaultdict(list)
first_Names = ['Sourav', 'Arun', 'Rajesh', 'Meera', 'Neha', 'Sanjay', 'Amit', 'Kavita', 'Ashwin', 'Vedant', 'Sita', 'Vikram', 'Priya', 'Shivam']
last_Names = ['Yadav', 'Sharma', 'Sheoran', 'Singh', 'Patel', 'Gupta', 'Kumar', 'Jha', 'Verma', 'Goyal', 'Reddy', 'Jindal', 'Mishra', 'Patil']
samples = 10000
for i in range(samples):
    fake_data["Driver_ID"].append(i+1)
    number_plate = generate_random_number_plate()
    while "Car_Number_Plater" in fake_data and number_plate in fake_data["Car_Number_Plate"]:
        number_plate = generate_random_number_plate()
    fake_data["Car_Number_Plate"].append(number_plate)
    fake_data["Driver_Name"].append(random.choice(first_Names) + " " + random.choice(last_Names))
    fake_data["Total_Rides"].append(random.randint(30,150))
    fake_data["Rating"].append(float(random.randint(20,50))/10)
    fake_data["Phone_Number"].append(generate_phoneNumber())
    fake_data["City"].append(np.random.choice(cities))

df = pd.DataFrame(fake_data)
df.to_csv("CarDriver.csv",index = False)
