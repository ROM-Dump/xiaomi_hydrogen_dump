PK
     �8NA�k�   �      description.xml<?xml version="1.0" encoding="utf-8" standalone="no"?>
<MIUI-Theme category="clock" size="2:4">
    <autoChange>true</autoChange>
</MIUI-Theme>
PK
     �8Nr���       manifest.xml<?xml version="1.0" encoding="utf-8"?>
<Clock version="1" frameRate="0" type="awesome" useVariableUpdater="DateTime.Minute" resDensity="480" pivotX="0.25" pivotY="0.3">
    <VariableBinders>
         <ContentProviderBinder
            uri="content://weather/weather"
            columns="city_name,weather_type,temperature"
            countName="hasweather">
             <Variable name="weather_id" type="int" column="weather_type"/>
             <Variable name="temperature_unit" type="string" column="temperature_unit"/>
             <Variable name="weather_temperature" type="int" column="temperature"/>
             <Variable name="weather_temperature_str" type="string" column="temperature"/>
         </ContentProviderBinder>
    </VariableBinders>
    <Var name="weather_description" expression="eval('@weather_type_'+#weather_id)" type="string"/>
    <Var name="weather_description_null" expression="eval(@weather_type_null)" type="string"/>
	<Var name="color_time" type="string" expression="ifelse(#applied_light_wallpaper,'#b3000000','#ffffffff')" />
	<Var name="color_date" type="string" expression="ifelse(#applied_light_wallpaper,'#80000000','#ccffffff')" />
	
	<Var name="is_rain" expression="ge(#weather_id,4)*le(#weather_id,6)+ge(#weather_id,8)*le(#weather_id,11)+eq(#weather_id,25)" />
    <Var name="is_snow" expression="ge(#weather_id,13)*le(#weather_id,17)" />
    <Var name="is_dust" expression="ge(#weather_id,18)*le(#weather_id,21)+eq(#weather_id,23)" />
	
	<Var name="not_null" expression="#hasweather*len(@weather_temperature_str)*not(isnull(#weather_id))" />
    <Var name="icon_suffix" expression="ifelse(not(#not_null),1,gt(#weather_id,25),1,#weather_id)" />
    <Var name="icon_index" expression="ifelse(#is_rain,4,#is_snow,13,#is_dust,18,#icon_suffix)" />
		
    
	<DateTime x="34" y="-2" size="150" color="@color_time" format="h:mm" fontFamily="miui-thin" visibility="eq(#time_format,0)"/>
	<DateTime x="34" y="-2" size="150" color="@color_time" format="HH:mm" fontFamily="miui-thin" visibility="eq(#time_format,1)"/>
    <DateTime enableFontScale="true" x="40" y="172" w="450" marqueeSpeed="30" format="@date_time" size="36" color="@color_date" contentDescriptionFormat="@desc_date_format" visibility="#time_format"/>
    <DateTime enableFontScale="true" x="40" y="172" w="450" marqueeSpeed="30" format="@date_time_12" size="36" color="@color_date" contentDescriptionFormat="@desc_date_format_12" visibility="not(#time_format)"/>
    
	<Group visibility="#not_null">
	    <Text name="weather_temperature" enableFontScale="true" x="#view_width-40" y="168" align="right" textExp="#weather_temperature + ifelse(eq(@temperature_unit,'1'),'°C',eq(@temperature_unit,'0'),'°F','°C')" size="38" color="@color_date"/>
	    <Text name="text_description" enableFontScale="true" x="#view_width-64-#weather_temperature.text_width" y="170" w="310" marqueeSpeed="30" align="right" textExp="@weather_description" size="36" color="@color_date"/>
	</Group>
	<Text name="weather_degree" enableFontScale="true" x="#view_width-40" y="170" textExp="@weather_description_null" align="right" size="36" color="@color_date" visibility="not(#not_null)"/>
	<Image name="img_weather" srcExp="'weather/weather.png'" srcid="ifelse(gt(#weather_id,25)+lt(#weather_id,0),1,#icon_index)" x="#view_width-33" y="10" align="right" touchable="true"/>
           
	<Button x="#view_width-39" y="0" w="159" h="270" align="right" contentDescriptionExp="eval(@desc_weather)">
            <Triggers>
                <Trigger action="up">
                    <IntentCommand action="android.intent.action.MAIN" package="com.miui.weather2" class="com.miui.weather2.ActivityWeatherMain"/>
                </Trigger>
            </Triggers>
        </Button>
	<Button name="clock_button" x="0" y="0" width="480" height="193" contentDescriptionExp="eval(@desc_time)"/>
	<Button x="0" y="194" width="480" height="77" >
		<Triggers>
			<Trigger action="up">
				<IntentCommand action="android.intent.action.MAIN" package="com.android.calendar" class="com.android.calendar.AllInOneActivity"/>
			</Trigger>
		</Triggers>
	</Button>
</Clock>
PK
     6�8N               strings/PK
     �8NI�49~  ~     strings/strings_km_KH.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE dd MMMM</string>
    <string name="date_time_12">EEE dd MMMM</string>
    <string name="desc_date_format">EEEE dd MMM</string>
    <string name="desc_date_format_12">EEEE dd MMM</string>
    <string name="desc_time">'ពេលវេលាបច្ចុប្បន្ន\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', ប៉ះពីរដងដើម្បីបញ្ចូលកម្មវិធីនាឡិកា'</string>
    <string name="weather_type_null">'មិនមានទិន្នន័យ'</string>
    <string name="weather_type_0">ស្រឡះ</string>
    <string name="weather_type_1">មានពពក</string>
    <string name="weather_type_2">ចុះអ័ភ្រ</string>
    <string name="weather_type_3">ចុះអាប់ខ្លាំង</string>
    <string name="weather_type_4">ព្យុះភ្លៀង​ខ្លាំង</string>
    <string name="weather_type_5">ព្យុះភ្លៀង</string>
    <string name="weather_type_6">ភ្លៀងធ្លាក់​យ៉ាង​ខ្លាំង</string>
    <string name="weather_type_7">ព្យុះមានផ្គររន្ទះ</string>
    <string name="weather_type_8">ភ្លៀងរលឹម</string>
    <string name="weather_type_9">ភ្លៀងធ្លាក់​ខ្លាំង</string>
    <string name="weather_type_10">ភ្លៀង</string>
    <string name="weather_type_11">រលឹមរោយស្បៃ</string>
    <string name="weather_type_12">ភ្លៀងលាយព្រិល</string>
    <string name="weather_type_13">ព្យុះមានធ្លាក់ទឹកកកសំឡី</string>
    <string name="weather_type_14">កំណក​នៃ​ការធ្លាក់ទឹកកកសំឡី​ជា​អន្លើៗ</string>
    <string name="weather_type_15">ការធ្លាក់ទឹកកកសំឡី​ខ្លាំង</string>
    <string name="weather_type_16">ការធ្លាក់ទឹកកកសំឡី</string>
    <string name="weather_type_17">ការធ្លាក់ទឹកកកសំឡី​រ៉ុយៗ</string>
    <string name="weather_type_18">ព្យុះខ្សាច់​ខ្លាំង</string>
    <string name="weather_type_19">ព្យុះខ្សាច់</string>
    <string name="weather_type_20">ព្យុះខ្សាច់​ស្រាលៗ</string>
    <string name="weather_type_21">ព្យុះខ្សាច់</string>
    <string name="weather_type_22">ធ្លាក់ព្រិល</string>
    <string name="weather_type_23">ធូលី​អណ្ដែត</string>
    <string name="weather_type_24">ចុះអ័ភ្រ</string>
    <string name="weather_type_25">ភ្លៀង​ត្រជាក់កក</string>
</resources>
PK
     �8N����	  �	     strings/strings_pa_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'ਵਰਤਮਾਨ ਸਮਾਂ\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', ਘੜੀ ਐਪ ਵਿੱਚ ਦਾਖਲ ਹੋਣ ਲਈ ਦੋ ਵਾਰ ਟੈਪ ਕਰੋ'</string>
    <string name="weather_type_null">'ਕੋਈ ਡਾਟਾ ਨਹੀਂ'</string>
    <string name="weather_type_0">ਸਾਫ਼</string>
    <string name="weather_type_1">ਬੱਦਲਵਾਈ ਵਾਲਾ</string>
    <string name="weather_type_2">ਧੁੰਦਲਾ</string>
    <string name="weather_type_3">ਧੁੰਦ ਵਾਲਾ</string>
    <string name="weather_type_4">ਭਾਰੀ ਤੂਫ਼ਾਨੀ ਵਰਖਾ</string>
    <string name="weather_type_5">ਤੂਫ਼ਾਨੀ ਵਰਖਾ</string>
    <string name="weather_type_6">ਬਹੁਤ ਭਾਰੀ ਵਰਖਾ</string>
    <string name="weather_type_7">ਗਰਜਨ ਵਾਲਾ ਤੂਫ਼ਾਨ</string>
    <string name="weather_type_8">ਵਰਖਾ ਦੀ ਝੜੀ</string>
    <string name="weather_type_9">ਭਾਰੀ ਵਰਖਾ</string>
    <string name="weather_type_10">ਵਰਖਾ</string>
    <string name="weather_type_11">ਬੂੰਦਾਬਾਂਦੀ</string>
    <string name="weather_type_12">ਗੜਿਆਂ ਦੇ ਨਾਲ ਵਰਖਾ</string>
    <string name="weather_type_13">ਬਰਫ਼ੀਲਾ ਤੂਫ਼ਾਨ</string>
    <string name="weather_type_14">ਕਿਤੇ-ਕਿਤੇ ਬਰਫ਼ਬਾਰੀ</string>
    <string name="weather_type_15">ਭਾਰੀ ਬਰਫ਼ਬਾਰੀ</string>
    <string name="weather_type_16">ਬਰਫ਼ਬਾਰੀ</string>
    <string name="weather_type_17">ਹਲਕੀ ਬਰਫ਼ਬਾਰੀ</string>
    <string name="weather_type_18">ਭਾਰੀ ਰੇਤਲੀ ਹਨੇਰੀ</string>
    <string name="weather_type_19">ਰੇਤਲੀ ਹਨੇਰੀ</string>
    <string name="weather_type_20">ਹਲਕੀ ਰੇਤਲੀ ਹਨੇਰੀ</string>
    <string name="weather_type_21">ਰੇਤਲੀ ਹਨੇਰੀ</string>
    <string name="weather_type_22">ਗੜੇ</string>
    <string name="weather_type_23">ਅਸਥਾਈ ਧੂੜ</string>
    <string name="weather_type_24">ਧੁੰਦ</string>
    <string name="weather_type_25">ਬਹੁਤ ਠੰਡੀ ਬਾਰਸ਼</string>
</resources>
PK
     �8N+�
  
     strings/strings_ne_NP.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'हालको समय\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', घडी एप भित्र जान दुईपटक ट्याप गर्नुहोस्'</string>
    <string name="weather_type_null">'डाटा छैन'</string>
    <string name="weather_type_0">खाली गर्नुहोस्</string>
    <string name="weather_type_1">बादल लागेको</string>
    <string name="weather_type_2">धमिलो</string>
    <string name="weather_type_3">तुवाँलो लागेको</string>
    <string name="weather_type_4">तेज तूफान</string>
    <string name="weather_type_5">आँधी</string>
    <string name="weather_type_6">ठुलो भारी बर्षा</string>
    <string name="weather_type_7">चट्याङ्</string>
    <string name="weather_type_8">बर्सा</string>
    <string name="weather_type_9">भारी बर्षा</string>
    <string name="weather_type_10">बर्षा</string>
    <string name="weather_type_11">हल्का बर्षा</string>
    <string name="weather_type_12">असिना सहितको बर्षा</string>
    <string name="weather_type_13">हिमपात</string>
    <string name="weather_type_14">हिमपातको खण्डहरू</string>
    <string name="weather_type_15">भारी हिमपात</string>
    <string name="weather_type_16">हिमपात</string>
    <string name="weather_type_17">हलुका हिमपात</string>
    <string name="weather_type_18">बलियो बालुवाको आँधी</string>
    <string name="weather_type_19">धुलो सहितको तूफान</string>
    <string name="weather_type_20">हलुका धुलो सहितको तूफान</string>
    <string name="weather_type_21">तूफान</string>
    <string name="weather_type_22">असिना</string>
    <string name="weather_type_23">तैरिरहेको फोहोर</string>
    <string name="weather_type_24">तुवाँलो</string>
    <string name="weather_type_25">कठ्याँग्रिने वर्षा</string>
</resources>
PK
     �8N�H���  �     strings/strings_ur_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">MMMM dd, EEEE</string>
    <string name="desc_date_format_12">MMMM dd, EEEE</string>
    <string name="desc_time">'حالیہ وقت \' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\' گھڑی ایپ میں جانے کے لیے دو بار ٹیپ کریں'</string>
    <string name="weather_type_null">'کوئی ڈیٹا نہیں ہے'</string>
    <string name="weather_type_0">صاف</string>
    <string name="weather_type_1">ابرآلود</string>
    <string name="weather_type_2">گرد و غبار والا</string>
    <string name="weather_type_3">کہر آلود</string>
    <string name="weather_type_4">شدید طوفانی بارش</string>
    <string name="weather_type_5">طوفانی بارش</string>
    <string name="weather_type_6">بہت شدید بارش</string>
    <string name="weather_type_7">طوفان برق وباد</string>
    <string name="weather_type_8">بوچھار</string>
    <string name="weather_type_9">شدید بارش</string>
    <string name="weather_type_10">بارش</string>
    <string name="weather_type_11">پھوار</string>
    <string name="weather_type_12">ژالہ باری</string>
    <string name="weather_type_13">برف کا طوفان</string>
    <string name="weather_type_14">ٹکڑوں میں برف باری</string>
    <string name="weather_type_15">بھاری برف باری</string>
    <string name="weather_type_16">برف باری</string>
    <string name="weather_type_17">ہلکی برف باری</string>
    <string name="weather_type_18">شدید ریت کا طوفان</string>
    <string name="weather_type_19">ریت کا طوفان</string>
    <string name="weather_type_20">ہلکا ریت کا طوفان</string>
    <string name="weather_type_21">ریت کا طوفان</string>
    <string name="weather_type_22">اولا</string>
    <string name="weather_type_23">دھول کا غبار</string>
    <string name="weather_type_24">گردو غبار</string>
    <string name="weather_type_25">برفیلی بارش</string>
</resources>
PK
     �8N��  �     strings/strings_ms_MY.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'masa semasa\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', klik berganda untuk masuk apl jam'</string>
    <string name="weather_type_null">'Tiada data'</string>
    <string name="weather_type_0">Cerah</string>
    <string name="weather_type_1">Mendung</string>
    <string name="weather_type_2">Jerebu</string>
    <string name="weather_type_3">Berkabus</string>
    <string name="weather_type_4">Hujan lebat yang teruk</string>
    <string name="weather_type_5">Hujan kilat</string>
    <string name="weather_type_6">Hujan yang sangat lebat</string>
    <string name="weather_type_7">Ribut petir</string>
    <string name="weather_type_8">Hujan renyai</string>
    <string name="weather_type_9">Hujan lebat</string>
    <string name="weather_type_10">Hujan</string>
    <string name="weather_type_11">Hujan renyai</string>
    <string name="weather_type_12">Hujan Batu</string>
    <string name="weather_type_13">Ribut salji</string>
    <string name="weather_type_14">Tompok-tompok salji</string>
    <string name="weather_type_15">Salji lebat</string>
    <string name="weather_type_16">Salji</string>
    <string name="weather_type_17">Salji ringan</string>
    <string name="weather_type_18">Ribut pasir yang kuat</string>
    <string name="weather_type_19">Ribut pasir</string>
    <string name="weather_type_20">Ribut pasir yang ringan</string>
    <string name="weather_type_21">Ribut pasir</string>
    <string name="weather_type_22">Hujan batu</string>
    <string name="weather_type_23">Debu terapung</string>
    <string name="weather_type_24">Jerebu</string>
    <string name="weather_type_25">Hujan beku</string>
</resources>
PK
     �8Nz)N7�  �     strings/strings_iw_IL.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'שעה נוכחית\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', הקש פעמיים לכניסה ליישום השעון'</string>
    <string name="weather_type_null">'אין נתונים'</string>
    <string name="weather_type_0">בהיר</string>
    <string name="weather_type_1">מעונן</string>
    <string name="weather_type_2">אביך</string>
    <string name="weather_type_3">ערפילי</string>
    <string name="weather_type_4">סופת גשמים רצינית</string>
    <string name="weather_type_5">סופת גשמים</string>
    <string name="weather_type_6">גשם כבד מאוד</string>
    <string name="weather_type_7">סופת ברקים</string>
    <string name="weather_type_8">ממטר</string>
    <string name="weather_type_9">גשם כבד</string>
    <string name="weather_type_10">גשם</string>
    <string name="weather_type_11">טפטוף</string>
    <string name="weather_type_12">גשם ושלג</string>
    <string name="weather_type_13">סופת שלגים</string>
    <string name="weather_type_14">שלג חלקי</string>
    <string name="weather_type_15">שלג כבד</string>
    <string name="weather_type_16">שלג</string>
    <string name="weather_type_17">שלג קל</string>
    <string name="weather_type_18">סופת חול חזקה</string>
    <string name="weather_type_19">סופת חול</string>
    <string name="weather_type_20">סופת חול קלה</string>
    <string name="weather_type_21">סופת חול</string>
    <string name="weather_type_22">ברד</string>
    <string name="weather_type_23">אבק</string>
    <string name="weather_type_24">אובך</string>
    <string name="weather_type_25">גשם מקפיא</string>
</resources>
PK
     �8NH<e��  �     strings/strings_uz_UZ.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">dd MMMM, EEE</string>
    <string name="date_time_12">dd MMMM, EEE</string>
    <string name="desc_date_format">dd MMMM, EEEE</string>
    <string name="desc_date_format_12">dd MMMM, EEEE</string>
    <string name="desc_time">'hozirgi vaqt\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', soat ilovasiga kirish uchun ikki marta bosing'</string>
    <string name="weather_type_null">'Ma’lumot yo‘q'</string>
    <string name="weather_type_0">Tiniq</string>
    <string name="weather_type_1">Bulutli</string>
    <string name="weather_type_2">Tumanli</string>
    <string name="weather_type_3">Tumanli</string>
    <string name="weather_type_4">Qattiq yomg‘ir</string>
    <string name="weather_type_5">Jala</string>
    <string name="weather_type_6">Juda kuchli yog‘ingarchilik</string>
    <string name="weather_type_7">Momaqaldiroq</string>
    <string name="weather_type_8">Jala</string>
    <string name="weather_type_9">Kuchli yog‘ingarchilik</string>
    <string name="weather_type_10">Yomg‘ir</string>
    <string name="weather_type_11">Mayda yomg‘ir</string>
    <string name="weather_type_12">Qorli yomg‘ir</string>
    <string name="weather_type_13">Qor bo‘roni</string>
    <string name="weather_type_14">Qorli jala</string>
    <string name="weather_type_15">Kuchli qor</string>
    <string name="weather_type_16">Qor</string>
    <string name="weather_type_17">Yengil qor</string>
    <string name="weather_type_18">Kuchli qum bo‘roni</string>
    <string name="weather_type_19">Qum bo‘roni</string>
    <string name="weather_type_20">Engil qum bo‘roni</string>
    <string name="weather_type_21">Qum bo‘roni</string>
    <string name="weather_type_22">Do‘l</string>
    <string name="weather_type_23">Chang</string>
    <string name="weather_type_24">Tuman</string>
    <string name="weather_type_25">Qorli yomg‘ir</string>
</resources>
PK
     �8N]�i�w  w     strings/strings_ar_EG.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE، dd MMMM</string>
    <string name="date_time_12">EEE، dd MMMM</string>
    <string name="desc_date_format">EEEE، dd MMM</string>
    <string name="desc_date_format_12">EEEE، dd MMM</string>
    <string name="desc_time">'الوقت الحالي "+ #hour12+\' \'+ifelse(#minute,#minute,\'\')+"، انقر مرتين لدخول تطبيق الساعة'</string>
    <string name="weather_type_null">'لا توجد بيانات'</string>
    <string name="weather_type_0">صافٍ</string>
    <string name="weather_type_1">غائم</string>
    <string name="weather_type_2">ضبابي</string>
    <string name="weather_type_3">ضبابي</string>
    <string name="weather_type_4">عاصفة مطرية شديدة</string>
    <string name="weather_type_5">عاصفة مطرية</string>
    <string name="weather_type_6">أمطار غزيرة جدا</string>
    <string name="weather_type_7">عاصفة رعدية</string>
    <string name="weather_type_8">أمطار خفيفة</string>
    <string name="weather_type_9">أمطار غزيرة</string>
    <string name="weather_type_10">مطر</string>
    <string name="weather_type_11">رذاذ</string>
    <string name="weather_type_12">مطر متجمد</string>
    <string name="weather_type_13">عاصفة ثلجية</string>
    <string name="weather_type_14">قطع ثلوج متساقطة</string>
    <string name="weather_type_15">ثلج كثيف</string>
    <string name="weather_type_16">ثلوج</string>
    <string name="weather_type_17">ثلوج خفيفة</string>
    <string name="weather_type_18">عاصفة رملية قوية</string>
    <string name="weather_type_19">عاصفة رملية</string>
    <string name="weather_type_20">عاصفة رملية خفيفة</string>
    <string name="weather_type_21">عاصفة رملية</string>
    <string name="weather_type_22">برد</string>
    <string name="weather_type_23">غبار في الهواء</string>
    <string name="weather_type_24">ضباب</string>
    <string name="weather_type_25">امطار متجمدة</string>
</resources>
PK
     �8N��q�  �     strings/strings_es_ES.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'hora actual\' + #hora12+\' \'+ifelse(#minute,#minute,\'\')+\', doble toque para abrir la aplicación reloj'</string>
    <string name="weather_type_null">'Sin datos'</string>
    <string name="weather_type_0">Despejado</string>
    <string name="weather_type_1">Nublado</string>
    <string name="weather_type_2">Con bruma</string>
    <string name="weather_type_3">Niebla</string>
    <string name="weather_type_4">Aguacero fuerte</string>
    <string name="weather_type_5">Tormentas de lluvia</string>
    <string name="weather_type_6">Lluvia muy fuerte</string>
    <string name="weather_type_7">Tormenta</string>
    <string name="weather_type_8">Chubascos</string>
    <string name="weather_type_9">Lluvia intensa</string>
    <string name="weather_type_10">Lluvia</string>
    <string name="weather_type_11">Llovizna</string>
    <string name="weather_type_12">Aguanieve</string>
    <string name="weather_type_13">Tormenta de nieve</string>
    <string name="weather_type_14">Nevada intermitente</string>
    <string name="weather_type_15">Nevada intensa</string>
    <string name="weather_type_16">Nevada</string>
    <string name="weather_type_17">Nevada ligera</string>
    <string name="weather_type_18">Tormenta de arena fuerte</string>
    <string name="weather_type_19">Tormneta de arena</string>
    <string name="weather_type_20">Tormenta de arena ligera</string>
    <string name="weather_type_21">Tormneta de arena</string>
    <string name="weather_type_22">Granizo</string>
    <string name="weather_type_23">Polvo en suspensión</string>
    <string name="weather_type_24">Neblina</string>
    <string name="weather_type_25">Lluvia helada</string>
</resources>
PK
     �8N.P^�  �     strings/strings_tr_TR.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">dd MMMM, EEE</string>
    <string name="date_time_12">dd MMMM, EEE</string>
    <string name="desc_date_format">dd MMM, EEEE</string>
    <string name="desc_date_format_12">dd MMM, EEEE</string>
    <string name="desc_time">'mevcut saat\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', saat uygulaması açmak için iki kere dokunun'</string>
    <string name="weather_type_null">'Veri yok'</string>
    <string name="weather_type_0">Açık</string>
    <string name="weather_type_1">Bulutlu</string>
    <string name="weather_type_2">Puslu</string>
    <string name="weather_type_3">Sisli</string>
    <string name="weather_type_4">Şiddetli sağanak</string>
    <string name="weather_type_5">Sağanak</string>
    <string name="weather_type_6">Çok şiddetli sağanak</string>
    <string name="weather_type_7">Gök gürültülü sağanak</string>
    <string name="weather_type_8">Hafif yağışlı</string>
    <string name="weather_type_9">Yoğun sağanak</string>
    <string name="weather_type_10">Yağmurlu</string>
    <string name="weather_type_11">Çiseleme</string>
    <string name="weather_type_12">Sulu kar</string>
    <string name="weather_type_13">Kar fırtınası</string>
    <string name="weather_type_14">Kar kalıntıları</string>
    <string name="weather_type_15">Yoğun kar yağışı</string>
    <string name="weather_type_16">Kar yağışı</string>
    <string name="weather_type_17">Hafif kar yağışı</string>
    <string name="weather_type_18">Şiddetli kum fırtınası</string>
    <string name="weather_type_19">Kum fırtınası</string>
    <string name="weather_type_20">Hafif kum fırtınası</string>
    <string name="weather_type_21">Kum fırtınası</string>
    <string name="weather_type_22">Dolu</string>
    <string name="weather_type_23">Tozlu</string>
    <string name="weather_type_24">Sisli</string>
    <string name="weather_type_25">Buzlanma ve yağmur</string>
</resources>
PK
     �8N����Z  Z     strings/strings_kk_KZ.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMM</string>
    <string name="date_time_12">EEEE, d MMMM</string>
    <string name="desc_date_format">EEEE, d MMMM</string>
    <string name="desc_date_format_12">EEEE, d MMMM</string>
    <string name="desc_time">'ағымдағы уақыт\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', "Сағат" қолданбасына кіру үшін екі рет басыңыз'</string>
    <string name="weather_type_null">'Деректер жоқ'</string>
    <string name="weather_type_0">Тазалау</string>
    <string name="weather_type_1">Бұлтты</string>
    <string name="weather_type_2">Бұлыңғыр</string>
    <string name="weather_type_3">Тұман</string>
    <string name="weather_type_4">Қатты жаңбыр</string>
    <string name="weather_type_5">Дауыл</string>
    <string name="weather_type_6">Қатты нөсер</string>
    <string name="weather_type_7">Найзағай</string>
    <string name="weather_type_8">Нөсер</string>
    <string name="weather_type_9">Қатты жаңбыр</string>
    <string name="weather_type_10">Жаңбыр</string>
    <string name="weather_type_11">Ұсақ жауын</string>
    <string name="weather_type_12">Дымқыл қар</string>
    <string name="weather_type_13">Боран</string>
    <string name="weather_type_14">Кей жерлерде қар</string>
    <string name="weather_type_15">Қалың қар</string>
    <string name="weather_type_16">Қар</string>
    <string name="weather_type_17">Кішігірім қар</string>
    <string name="weather_type_18">Күшті шаңды дауыл</string>
    <string name="weather_type_19">Шаңды дауыл</string>
    <string name="weather_type_20">Шаң</string>
    <string name="weather_type_21">Шаңды дауыл</string>
    <string name="weather_type_22">Бұршақ</string>
    <string name="weather_type_23">Шаңды</string>
    <string name="weather_type_24">Мұнар</string>
    <string name="weather_type_25">Қылау</string>
</resources>
PK
     �8N&q9s  s     strings/strings_ja_JP.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">M月d日 EEE</string>
    <string name="date_time_12">M月d日 EEE</string>
    <string name="desc_date_format">M月d日 EEEE</string>
    <string name="desc_date_format_12">M月d日 EEEE</string>
    <string name="desc_time">'現在時刻\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', ダブルタップして時計アプリを開く'</string>
    <string name="weather_type_null">'データがありません'</string>
    <string name="weather_type_0">晴れ</string>
    <string name="weather_type_1">曇り</string>
    <string name="weather_type_2">スモッグ</string>
    <string name="weather_type_3">霧</string>
    <string name="weather_type_4">重度の暴風雨</string>
    <string name="weather_type_5">暴風雨</string>
    <string name="weather_type_6">激しい雨</string>
    <string name="weather_type_7">雷雨</string>
    <string name="weather_type_8">にわか雨</string>
    <string name="weather_type_9">強い雨</string>
    <string name="weather_type_10">雨</string>
    <string name="weather_type_11">霧雨</string>
    <string name="weather_type_12">みぞれ</string>
    <string name="weather_type_13">吹雪</string>
    <string name="weather_type_14">にわか雪</string>
    <string name="weather_type_15">強い雪</string>
    <string name="weather_type_16">降雪</string>
    <string name="weather_type_17">弱い雪</string>
    <string name="weather_type_18">強い砂嵐</string>
    <string name="weather_type_19">砂嵐</string>
    <string name="weather_type_20">弱い砂嵐</string>
    <string name="weather_type_21">砂嵐</string>
    <string name="weather_type_22">雹</string>
    <string name="weather_type_23">浮遊粉じん</string>
    <string name="weather_type_24">スモッグ</string>
    <string name="weather_type_25">氷晶雨</string>
</resources>
PK
     �8N�Êp�  �     strings/strings_ur_PK.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'حالیہ وقت \' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\' گھڑی ایپ میں جانے کے لیے دو بار ٹیپ کریں'</string>
    <string name="weather_type_null">'کوئی ڈیٹا نہیں ہے'</string>
    <string name="weather_type_0">صاف</string>
    <string name="weather_type_1">ابرآلود</string>
    <string name="weather_type_2">گرد و غبار والا</string>
    <string name="weather_type_3">کہر آلود</string>
    <string name="weather_type_4">شدید طوفانی بارش</string>
    <string name="weather_type_5">طوفانی بارش</string>
    <string name="weather_type_6">بہت شدید بارش</string>
    <string name="weather_type_7">طوفان برق وباد</string>
    <string name="weather_type_8">بوچھار</string>
    <string name="weather_type_9">شدید بارش</string>
    <string name="weather_type_10">بارش</string>
    <string name="weather_type_11">پھوار</string>
    <string name="weather_type_12">ژالہ باری</string>
    <string name="weather_type_13">برف کا طوفان</string>
    <string name="weather_type_14">ٹکڑوں میں برف باری</string>
    <string name="weather_type_15">بھاری برف باری</string>
    <string name="weather_type_16">برف باری</string>
    <string name="weather_type_17">ہلکی برف باری</string>
    <string name="weather_type_18">شدید ریت کا طوفان</string>
    <string name="weather_type_19">ریت کا طوفان</string>
    <string name="weather_type_20">ہلکا ریت کا طوفان</string>
    <string name="weather_type_21">ریت کا طوفان</string>
    <string name="weather_type_22">اولا</string>
    <string name="weather_type_23">دھول کا غبار</string>
    <string name="weather_type_24">گردو غبار</string>
    <string name="weather_type_25">برفیلی بارش</string>
</resources>
PK
     �8N!�6O�	  �	     strings/strings_hi_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'वर्तमान समय\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', घड़ी ऐप्प में प्रवेश करने के लिए दो बार टैप करें'</string>
    <string name="weather_type_null">'कोई डेटा नहीं'</string>
    <string name="weather_type_0">साफ</string>
    <string name="weather_type_1">बादल</string>
    <string name="weather_type_2">धुंधला</string>
    <string name="weather_type_3">कोहरा</string>
    <string name="weather_type_4">भारी वर्षा</string>
    <string name="weather_type_5">तूफानी बारिश</string>
    <string name="weather_type_6">बहुत भारी वर्षा</string>
    <string name="weather_type_7">गरज के साथ तूफान</string>
    <string name="weather_type_8">फुहार</string>
    <string name="weather_type_9">भारी वर्षा</string>
    <string name="weather_type_10">वर्षा</string>
    <string name="weather_type_11">बूंदा बांदी</string>
    <string name="weather_type_12">ओले के साथ वर्षा</string>
    <string name="weather_type_13">बर्फ का तूफान</string>
    <string name="weather_type_14">कहीं-कहीं पर बर्फ़बारी</string>
    <string name="weather_type_15">भारी बर्फबारी</string>
    <string name="weather_type_16">बर्फबारी</string>
    <string name="weather_type_17">हल्की बर्फबारी</string>
    <string name="weather_type_18">भीषण रेतीली आंधी</string>
    <string name="weather_type_19">रेतीली आंधी</string>
    <string name="weather_type_20">हल्की रेतीली आंधी</string>
    <string name="weather_type_21">रेतीली आंधी</string>
    <string name="weather_type_22">ओला</string>
    <string name="weather_type_23">अस्थायी धूल</string>
    <string name="weather_type_24">धुंध</string>
    <string name="weather_type_25">हिम वर्षा</string>
</resources>
PK
     �8NֽUU�  �     strings/strings_sq_AL.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'ora aktuale\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', prek dy herë për të hyrë në aplikacionin e orës'</string>
    <string name="weather_type_null">'Nuk ka të dhëna'</string>
    <string name="weather_type_0">Kthjellët</string>
    <string name="weather_type_1">Me re</string>
    <string name="weather_type_2">I mjegullt</string>
    <string name="weather_type_3">Me mjegull</string>
    <string name="weather_type_4">Shi i stuhishëm</string>
    <string name="weather_type_5">Stuhi shiu</string>
    <string name="weather_type_6">Shumë shi i rëndë</string>
    <string name="weather_type_7">Stuhi me bubullima</string>
    <string name="weather_type_8">Rrebesh</string>
    <string name="weather_type_9">Shi i rëndë</string>
    <string name="weather_type_10">Shi</string>
    <string name="weather_type_11">Shi i imët</string>
    <string name="weather_type_12">Borë me shi</string>
    <string name="weather_type_13">Stuhi dëbore</string>
    <string name="weather_type_14">Fjolla bore</string>
    <string name="weather_type_15">Borë e rëndë</string>
    <string name="weather_type_16">Reshje bore</string>
    <string name="weather_type_17">Borë e lehtë</string>
    <string name="weather_type_18">Stuhi e fortë rëre</string>
    <string name="weather_type_19">Stuhi rëre</string>
    <string name="weather_type_20">Stuhi e lehtë rëre</string>
    <string name="weather_type_21">Stuhi rëre</string>
    <string name="weather_type_22">Breshër</string>
    <string name="weather_type_23">Pluhur qarkullues</string>
    <string name="weather_type_24">Mjegullim</string>
    <string name="weather_type_25">Shi i akullt</string>
</resources>
PK
     �8N�1�  �     strings/strings_fa_IR.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE، dd MMMM</string>
    <string name="date_time_12">EEE، dd MMMM</string>
    <string name="desc_date_format">EEEE، dd MMM</string>
    <string name="desc_date_format_12">EEEE، dd MMM</string>
    <string name="desc_time">'زمان کنونی\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', دوبار بزنید تا وارد برنامه ساعت شوید'</string>
    <string name="weather_type_null">'بدون داده'</string>
    <string name="weather_type_0">صاف</string>
    <string name="weather_type_1">ابری</string>
    <string name="weather_type_2">غبارآلود</string>
    <string name="weather_type_3">مه‌آلود</string>
    <string name="weather_type_4">رگبار شدید</string>
    <string name="weather_type_5">رگبار باران</string>
    <string name="weather_type_6">بارش بسیار سنگین باران</string>
    <string name="weather_type_7">توفان رعد و برق</string>
    <string name="weather_type_8">بارندگی</string>
    <string name="weather_type_9">بارش سنگین باران‌</string>
    <string name="weather_type_10">بارانی</string>
    <string name="weather_type_11">نم‌نم باران</string>
    <string name="weather_type_12">برف و باران</string>
    <string name="weather_type_13">کولاک</string>
    <string name="weather_type_14">بارش پراکنده برف</string>
    <string name="weather_type_15">بارش سنگین برف</string>
    <string name="weather_type_16">بارش برف</string>
    <string name="weather_type_17">بارش سبک برف</string>
    <string name="weather_type_18">توفان شدید شن</string>
    <string name="weather_type_19">توفان شن</string>
    <string name="weather_type_20">توفان سبک شن</string>
    <string name="weather_type_21">توفان شن</string>
    <string name="weather_type_22">تگرگ</string>
    <string name="weather_type_23">گرد و غبار شناور</string>
    <string name="weather_type_24">مه</string>
    <string name="weather_type_25">باران یخی</string>
</resources>
PK
     �8Nۚ��U
  U
     strings/strings_as_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'বৰ্তমানৰ সময়\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', ঘড়ী এপত প্ৰৱেশ কৰিবলৈ দুবাৰ টেপ কৰক'</string>
    <string name="weather_type_null">'কোনো ডাটা নাই'</string>
    <string name="weather_type_0">ফৰকাল</string>
    <string name="weather_type_1">ডাৱৰীয়া</string>
    <string name="weather_type_2">ধুৱলী-কুঁৱলী</string>
    <string name="weather_type_3">কুঁৱলীময়</string>
    <string name="weather_type_4">অত্যাধিক ধুমুহা-বৰষুণ</string>
    <string name="weather_type_5">ধুমুহা-বৰষুণ</string>
    <string name="weather_type_6">অতি তীব্ৰ বৰষুণ</string>
    <string name="weather_type_7">বিজুলী-ঢেৰেকনি</string>
    <string name="weather_type_8">বৃষ্টিপাত</string>
    <string name="weather_type_9">প্ৰচণ্ড বৰষুণ</string>
    <string name="weather_type_10">বৰষুণ</string>
    <string name="weather_type_11">কিনকিনীয়া বৰষুণ</string>
    <string name="weather_type_12">শিলাবৃষ্টি</string>
    <string name="weather_type_13">তুষাৰ-ধুমুহা</string>
    <string name="weather_type_14">পাতলীয়া তুষাৰপাত</string>
    <string name="weather_type_15">প্ৰচণ্ড তুষাৰপাত</string>
    <string name="weather_type_16">তুষাৰপাত</string>
    <string name="weather_type_17">পাতল তুষাৰপাত</string>
    <string name="weather_type_18">শক্তিশালী ধুলি-ধুমুহা</string>
    <string name="weather_type_19">ধুলি-ধুমুহা</string>
    <string name="weather_type_20">পাতল ধুলি-ধুমুহা</string>
    <string name="weather_type_21">ধুলি-ধুমুহা</string>
    <string name="weather_type_22">শিলাবৃষ্টি</string>
    <string name="weather_type_23">উৰি ফুৰা ধুলি</string>
    <string name="weather_type_24">কুঁৱলী</string>
    <string name="weather_type_25">গোট মৰা বৰষুণ</string>
</resources>
PK
     �8N��"��  �     strings/strings_it_IT.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'ora attuale\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', doppio tocco per entrare nell\'applicazione orologio'</string>
    <string name="weather_type_null">'Nessun dato'</string>
    <string name="weather_type_0">Sereno</string>
    <string name="weather_type_1">Nuvoloso</string>
    <string name="weather_type_2">Foschia</string>
    <string name="weather_type_3">Nebbia</string>
    <string name="weather_type_4">Forte temporale</string>
    <string name="weather_type_5">Temporale</string>
    <string name="weather_type_6">Precipitazioni molto forti</string>
    <string name="weather_type_7">Temporale</string>
    <string name="weather_type_8">Acquazzone</string>
    <string name="weather_type_9">Forti piogge</string>
    <string name="weather_type_10">Pioggia</string>
    <string name="weather_type_11">Pioggerella</string>
    <string name="weather_type_12">Nevischio</string>
    <string name="weather_type_13">Bufera di neve</string>
    <string name="weather_type_14">Neve a tratti</string>
    <string name="weather_type_15">Forti nevicate</string>
    <string name="weather_type_16">Nevicate</string>
    <string name="weather_type_17">Nevicate leggere</string>
    <string name="weather_type_18">Forte tempesta di sabbia</string>
    <string name="weather_type_19">Tempesta di sabbia</string>
    <string name="weather_type_20">Leggera tempesta di sabbia</string>
    <string name="weather_type_21">Tempesta di sabbia</string>
    <string name="weather_type_22">Grandine</string>
    <string name="weather_type_23">Polvere sospesa</string>
    <string name="weather_type_24">Foschia</string>
    <string name="weather_type_25">Nevischio</string>
</resources>
PK
     �8N4Tfk�  �     strings/strings_hy_AM.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM
 </string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'Ընթացիկ ժամանակը\' +#hour12+\' \'+ifelse(#minute,#minute,\'\')+\', կրկնակի սեղմեք Ժամացույց հավելվածը մուտք գործելու համար'</string>
    <string name="weather_type_null">'Տվյալներ չկան'</string>
    <string name="weather_type_0">Մաքրել</string>
    <string name="weather_type_1">Ամպոտ է</string>
    <string name="weather_type_2">Ամպամած է</string>
    <string name="weather_type_3">Մառախուղ</string>
    <string name="weather_type_4">Ուժեղ անձրևամրրիկ</string>
    <string name="weather_type_5">Անձրևամրրիկ</string>
    <string name="weather_type_6">Շատ ուժեղ անձրև</string>
    <string name="weather_type_7">Ամպրոպ</string>
    <string name="weather_type_8">Հորդառատ անձրեւ</string>
    <string name="weather_type_9">Ուժեղ անձրև</string>
    <string name="weather_type_10">Անձրև</string>
    <string name="weather_type_11">Թեթև անձրև</string>
    <string name="weather_type_12">Ձյունախառն անձրև</string>
    <string name="weather_type_13">Ձնաբուք</string>
    <string name="weather_type_14">Տեղ-տեղ ձյուն</string>
    <string name="weather_type_15">Ուժեղ ձյունատեղում</string>
    <string name="weather_type_16">Ձյունատեղում</string>
    <string name="weather_type_17">Թեթև ձյունատեղում</string>
    <string name="weather_type_18">Ուժեղ ավազահողմ</string>
    <string name="weather_type_19">Ավազահողմ</string>
    <string name="weather_type_20">Թեթև ավազահողմ</string>
    <string name="weather_type_21">Ավազահողմ</string>
    <string name="weather_type_22">Կարկուտ</string>
    <string name="weather_type_23">Փոշի</string>
    <string name="weather_type_24">Մշուշ</string>
    <string name="weather_type_25">Ձնախառն անձրև</string>
</resources>
PK
     �8N����	  �	     strings/strings_mr_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE dd MMM</string>
    <string name="desc_date_format_12">EEEE dd MMM</string>
    <string name="desc_time">'सद्य वेळ\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', घड्याळ अॅपमध्ये प्रवेश करण्यासाठी डबल टॅप करा'</string>
    <string name="weather_type_null">'डेटा नाही'</string>
    <string name="weather_type_0">निरभ्र</string>
    <string name="weather_type_1">ढगाळ</string>
    <string name="weather_type_2">धुरकट</string>
    <string name="weather_type_3">धुके</string>
    <string name="weather_type_4">जोरदार वादळी पाऊस</string>
    <string name="weather_type_5">वादळवारे</string>
    <string name="weather_type_6">मुसळधार पाऊस</string>
    <string name="weather_type_7">वादळ</string>
    <string name="weather_type_8">पाऊसधारा</string>
    <string name="weather_type_9">जोरदार पाऊस</string>
    <string name="weather_type_10">पाऊस</string>
    <string name="weather_type_11">रिमझिम पाऊस</string>
    <string name="weather_type_12">गारा व पाऊस</string>
    <string name="weather_type_13">हिमवादळ</string>
    <string name="weather_type_14">बर्फवृष्टीचे पट्टे</string>
    <string name="weather_type_15">जोरदार बर्फवृष्टी</string>
    <string name="weather_type_16">बर्फवृष्टी</string>
    <string name="weather_type_17">हलकी बर्फवृष्टी</string>
    <string name="weather_type_18">वाळूचे जोराचे वादळ</string>
    <string name="weather_type_19">धुळीचे वादळ</string>
    <string name="weather_type_20">वाळूचे हलके वादळ</string>
    <string name="weather_type_21">धुळीचे वादळ</string>
    <string name="weather_type_22">गारा</string>
    <string name="weather_type_23">तरंगती धुळ</string>
    <string name="weather_type_24">धुकट</string>
    <string name="weather_type_25">थंड पाऊस</string>
</resources>
PK
     �8N�����  �     strings/strings_lt_LT.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, MMMM dd</string>
    <string name="desc_date_format">EEEE, MMM dd</string>
    <string name="desc_date_format_12">EEEE, MMM dd</string>
    <string name="desc_time">'dabartinis laikas\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', norėdami atidaryti laikrodį, dukart palieskite'</string>
    <string name="weather_type_null">'Nėra duomenų'</string>
    <string name="weather_type_0">Giedra</string>
    <string name="weather_type_1">Debesuota</string>
    <string name="weather_type_2">Miglota</string>
    <string name="weather_type_3">Ūkanota</string>
    <string name="weather_type_4">Stiprus lietus</string>
    <string name="weather_type_5">Audra</string>
    <string name="weather_type_6">Labai stiprus lietus</string>
    <string name="weather_type_7">Perkūnija</string>
    <string name="weather_type_8">Liūtis</string>
    <string name="weather_type_9">Stiprus lietus</string>
    <string name="weather_type_10">Lietus</string>
    <string name="weather_type_11">Dulksna</string>
    <string name="weather_type_12">Kruša</string>
    <string name="weather_type_13">Pūga</string>
    <string name="weather_type_14">Vietomis sninga</string>
    <string name="weather_type_15">Stipriai sninga</string>
    <string name="weather_type_16">Sninga</string>
    <string name="weather_type_17">Lengvai sninga</string>
    <string name="weather_type_18">Smarki smėlio audra</string>
    <string name="weather_type_19">Smėlio audra</string>
    <string name="weather_type_20">Silpna smėlio audra</string>
    <string name="weather_type_21">Smėlio audra</string>
    <string name="weather_type_22">Kruša</string>
    <string name="weather_type_23">Dulkėta</string>
    <string name="weather_type_24">Migla</string>
    <string name="weather_type_25">Plikledis</string>
</resources>
PK
     3�8N��`�-  -     strings/strings_zh_HK.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">M月d日 E</string>
    <string name="date_time_12">M月d日 Eaa</string>
    <string name="desc_date_format">M月d日 EEEE</string>
    <string name="desc_date_format_12">M月d日 Eaa</string>
    <string name="desc_time">ifelse(eq(#time_format,0),#hour12,eq(#time_format,1),#hour24,#hour24)+\'點\'+ifelse(gt(#minute,0)*le(#minute,9),0,\'\')+ifelse(#minute,#minute+\'分\',\'整\')+\', 按兩下進入時鐘App\'</string>
    <string name="desc_weather">\@weather_description+\', \'+#weather_temperature+\'度\'</string>
    <string name="desc_weather_null">'點擊獲取天氣數據'</string>
    <string name="weather_type_null">'點擊獲取天氣數據'</string>
    <string name="weather_type_0">晴</string>
    <string name="weather_type_1">多雲</string>
    <string name="weather_type_2">陰</string>
    <string name="weather_type_3">霧</string>
    <string name="weather_type_4">特大暴雨</string>
    <string name="weather_type_5">大暴雨</string>
    <string name="weather_type_6">暴雨</string>
    <string name="weather_type_7">雷陣雨</string>
    <string name="weather_type_8">陣雨</string>
    <string name="weather_type_9">大雨</string>
    <string name="weather_type_10">中雨</string>
    <string name="weather_type_11">小雨</string>
    <string name="weather_type_12">雨夾帶雪</string>
    <string name="weather_type_13">暴雪</string>
    <string name="weather_type_14">陣雪</string>
    <string name="weather_type_15">大雪</string>
    <string name="weather_type_16">中雪</string>
    <string name="weather_type_17">小雪</string>
    <string name="weather_type_18">強沙塵暴</string>
    <string name="weather_type_19">沙塵暴</string>
    <string name="weather_type_20">沙塵</string>
    <string name="weather_type_21">揚沙</string>
    <string name="weather_type_22">冰雹</string>
    <string name="weather_type_23">浮塵</string>
    <string name="weather_type_24">霾</string>
    <string name="weather_type_25">凍雨</string>
</resources>
PK
     �8N��=�|  |     strings/strings_ml_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'നിലവിലെ സമയം\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', ക്ലോക്ക് ആപ്പ് നൽകാൻ രണ്ടുതവണ ടാപ്പുചെയ്യുക'</string>
    <string name="weather_type_null">'ഡാറ്റ ഇല്ല'</string>
    <string name="weather_type_0">മായ്ക്കുക</string>
    <string name="weather_type_1">മേഘാവൃതം</string>
    <string name="weather_type_2">തെളിച്ചമില്ലാത്തത്</string>
    <string name="weather_type_3">മൂടിക്കെട്ടിയത്</string>
    <string name="weather_type_4">കൊടുങ്കാറ്റോടുകൂടിയ കടുത്ത പേമാരി</string>
    <string name="weather_type_5">കടുത്ത പേമാരി</string>
    <string name="weather_type_6">വളരെ കടുത്ത മഴ</string>
    <string name="weather_type_7">ഇടിയും മിന്നലുമുള്ള കൊടുങ്കാറ്റ്‌</string>
    <string name="weather_type_8">ചാറ്റല്‍മഴ</string>
    <string name="weather_type_9">കനത്ത മഴ</string>
    <string name="weather_type_10">മഴ</string>
    <string name="weather_type_11">ചാറ്റൽമഴ</string>
    <string name="weather_type_12">ആലിപ്പഴം പൊഴിയൽ</string>
    <string name="weather_type_13">കടുത്ത ഹിമപാതം</string>
    <string name="weather_type_14">അങ്ങ് ഇങ്ങ് മഞ്ഞുവീഴ്ച</string>
    <string name="weather_type_15">കടുത്ത മഞ്ഞുവീഴ്ച്ച</string>
    <string name="weather_type_16">മഞ്ഞുവീഴ്ച്ച</string>
    <string name="weather_type_17">ചെറിയ മഞ്ഞുവീഴ്ച്ച</string>
    <string name="weather_type_18">കടുത്ത പൊടിക്കാറ്റ്</string>
    <string name="weather_type_19">പൊടിക്കാറ്റ്</string>
    <string name="weather_type_20">ചെറിയ പൊടിക്കാറ്റ്</string>
    <string name="weather_type_21">പൊടിക്കാറ്റ്</string>
    <string name="weather_type_22">ആലിപ്പഴം</string>
    <string name="weather_type_23">പറന്നുനടക്കുന്ന പൊടിക്കാറ്റ്</string>
    <string name="weather_type_24">മൂടല്‍മഞ്ഞ്</string>
    <string name="weather_type_25">മരവിപ്പിക്കുന്ന മഴ</string>
</resources>
PK
     �8NPD��t  t     strings/strings_nl_NL.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE dd MMMM</string>
    <string name="date_time_12">EEE dd MMMM</string>
    <string name="desc_date_format">EEEE dd MMM</string>
    <string name="desc_date_format_12">EEEE dd MMM</string>
    <string name="desc_time">'huidige tijd\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', dubbelklik om klokapp te openen'</string>
    <string name="weather_type_null">'Geen data'</string>
    <string name="weather_type_0">Helder</string>
    <string name="weather_type_1">Bewolkt</string>
    <string name="weather_type_2">Nevelig</string>
    <string name="weather_type_3">Mistig</string>
    <string name="weather_type_4">Hevige regenbuien</string>
    <string name="weather_type_5">Regenbui</string>
    <string name="weather_type_6">Zeer zware regenval</string>
    <string name="weather_type_7">Onweersbui</string>
    <string name="weather_type_8">Regenbui</string>
    <string name="weather_type_9">Zware regenval</string>
    <string name="weather_type_10">Regen</string>
    <string name="weather_type_11">Motregen</string>
    <string name="weather_type_12">IJzel</string>
    <string name="weather_type_13">Sneeuwstorm</string>
    <string name="weather_type_14">Plaatselijke sneeuwval</string>
    <string name="weather_type_15">Zware sneeuwval</string>
    <string name="weather_type_16">Sneeuwval</string>
    <string name="weather_type_17">Lichte sneeuwval</string>
    <string name="weather_type_18">Sterke zandstorm</string>
    <string name="weather_type_19">Zandstorm</string>
    <string name="weather_type_20">Lichte zandstorm</string>
    <string name="weather_type_21">Zandstorm</string>
    <string name="weather_type_22">Hagel</string>
    <string name="weather_type_23">Zwevend stof</string>
    <string name="weather_type_24">Nevel</string>
    <string name="weather_type_25">IJzel</string>
</resources>
PK
     �8N\XI��  �     strings/strings_bg_BG.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'в момента\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', двойно почукване за отваряне на часовника'</string>
    <string name="weather_type_null">'Няма данни'</string>
    <string name="weather_type_0">Ясно</string>
    <string name="weather_type_1">Облачно</string>
    <string name="weather_type_2">Мъгливо</string>
    <string name="weather_type_3">Мъгла</string>
    <string name="weather_type_4">Силна буря</string>
    <string name="weather_type_5">Дъждовна буря</string>
    <string name="weather_type_6">Много обилни валежи</string>
    <string name="weather_type_7">Гръмотевична буря</string>
    <string name="weather_type_8">Превалявания</string>
    <string name="weather_type_9">Силни валежи</string>
    <string name="weather_type_10">Дъжд</string>
    <string name="weather_type_11">Ръмеж</string>
    <string name="weather_type_12">Суграшица</string>
    <string name="weather_type_13">Снежна буря</string>
    <string name="weather_type_14">Сняг на парцали</string>
    <string name="weather_type_15">Силен снеговалеж</string>
    <string name="weather_type_16">Снеговалеж</string>
    <string name="weather_type_17">Слаб снеговалеж</string>
    <string name="weather_type_18">Силна пясъчна буря</string>
    <string name="weather_type_19">Пясъчна буря</string>
    <string name="weather_type_20">Лека пясъчна буря</string>
    <string name="weather_type_21">Пясъчна буря</string>
    <string name="weather_type_22">Градушка</string>
    <string name="weather_type_23">Силно запрашено</string>
    <string name="weather_type_24">Мараня</string>
    <string name="weather_type_25">Леден дъжд</string>
</resources>
PK
     �8N��je�	  �	     strings/strings_th_TH.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE dd MMMM</string>
    <string name="date_time_12">EEE dd MMMM</string>
    <string name="desc_date_format">EEEE dd MMM</string>
    <string name="desc_date_format_12">EEEE dd MMM</string>
    <string name="desc_time">'เวลาปัจจุบัน\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', แตะสองครั้งติดกันเพื่อเข้าสู่แอปนาฬิกา'</string>
    <string name="weather_type_null">'ไม่พบข้อมูล'</string>
    <string name="weather_type_0">แจ่มใส</string>
    <string name="weather_type_1">มีเมฆมาก</string>
    <string name="weather_type_2">หมอกหนา</string>
    <string name="weather_type_3">มีหมอกจัด</string>
    <string name="weather_type_4">ฝนฟ้าคะนองรุนแรง</string>
    <string name="weather_type_5">ฝนฟ้าคะนอง</string>
    <string name="weather_type_6">ฝนตกหนักมาก</string>
    <string name="weather_type_7">ฟ้าคะนอง</string>
    <string name="weather_type_8">ฝนซู่</string>
    <string name="weather_type_9">ฝนตกหนัก</string>
    <string name="weather_type_10">ฝนตก</string>
    <string name="weather_type_11">ฝนประปราย</string>
    <string name="weather_type_12">ลูกเห็บตก</string>
    <string name="weather_type_13">พายุหิมะ</string>
    <string name="weather_type_14">หิมะตกหนา</string>
    <string name="weather_type_15">หิมะตกหนัก</string>
    <string name="weather_type_16">หิมะตก</string>
    <string name="weather_type_17">หิมะตกเล็กน้อย</string>
    <string name="weather_type_18">พายุทรายรุนแรง</string>
    <string name="weather_type_19">พายุทราย</string>
    <string name="weather_type_20">พายุทรายเล็กน้อย</string>
    <string name="weather_type_21">พายุทราย</string>
    <string name="weather_type_22">ลูกเห็บตก</string>
    <string name="weather_type_23">ทัศนวิสัยต่ำ</string>
    <string name="weather_type_24">มีเมฆหมอก</string>
    <string name="weather_type_25">ฝนเยือกแข็ง</string>
</resources>
PK
     �8N�)�E
  E
     strings/strings_bn_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'এখনকার সময়\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', ঘড়ির অ্যাপে প্রবেশ করার জন্য দুবার ট্যাপ করুন'</string>
    <string name="weather_type_null">'কোনো ডেটা নেই'</string>
    <string name="weather_type_0">পরিষ্কার আকাশ</string>
    <string name="weather_type_1">মেঘলা</string>
    <string name="weather_type_2">অস্পষ্ট</string>
    <string name="weather_type_3">কুয়াশাচ্ছন্ন</string>
    <string name="weather_type_4">মারাত্মক ঝড়বৃষ্টি</string>
    <string name="weather_type_5">ঝড়বৃষ্টি</string>
    <string name="weather_type_6">প্রচন্ড বৃষ্টিপাত</string>
    <string name="weather_type_7">বজ্রবিদ্যুতসহ ঝড়</string>
    <string name="weather_type_8">বর্ষণ</string>
    <string name="weather_type_9">ভারী বৃষ্টিপাত</string>
    <string name="weather_type_10">বৃষ্টি</string>
    <string name="weather_type_11">গুঁড়ি গুঁড়ি বৃষ্টি</string>
    <string name="weather_type_12">শিলাবৃষ্টি</string>
    <string name="weather_type_13">তুষারঝড়</string>
    <string name="weather_type_14">হালকা তুষারপাত</string>
    <string name="weather_type_15">প্রচন্ড তুষারপাত</string>
    <string name="weather_type_16">তুষারপাত</string>
    <string name="weather_type_17">হালকা তুষারপাত</string>
    <string name="weather_type_18">প্রচন্ড বালিঝড়</string>
    <string name="weather_type_19">বালুঝড়</string>
    <string name="weather_type_20">হালকা বালুঝড়</string>
    <string name="weather_type_21">বালুঝড়</string>
    <string name="weather_type_22">শিলাবৃষ্টি</string>
    <string name="weather_type_23">ভাসমান ধুলো</string>
    <string name="weather_type_24">কুয়াশা</string>
    <string name="weather_type_25">তুষার ও বৃষ্টি</string>
</resources>
PK
     �8N�.��  �     strings/strings_ro_RO.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEE, dd MMM</string>
    <string name="desc_date_format_12">EEE, dd MMM</string>
    <string name="desc_time">'ora curentă\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', atingeți de două ori pentru a intra în aplicația Ceas'</string>
    <string name="weather_type_null">'Nu există date'</string>
    <string name="weather_type_0">Senin</string>
    <string name="weather_type_1">Înnorat</string>
    <string name="weather_type_2">Ceaţă</string>
    <string name="weather_type_3">Ceață</string>
    <string name="weather_type_4">Furtună severă</string>
    <string name="weather_type_5">Furtună</string>
    <string name="weather_type_6">Precipitații puternice</string>
    <string name="weather_type_7">Furtună cu trăsnete</string>
    <string name="weather_type_8">Averse</string>
    <string name="weather_type_9">Precipitații puternice</string>
    <string name="weather_type_10">Ploaie</string>
    <string name="weather_type_11">Burniță</string>
    <string name="weather_type_12">Lapoviță</string>
    <string name="weather_type_13">Viscol</string>
    <string name="weather_type_14">Ninsoare moderată</string>
    <string name="weather_type_15">Ninsoare puternică</string>
    <string name="weather_type_16">Ninsoare</string>
    <string name="weather_type_17">Ninsoare slabă</string>
    <string name="weather_type_18">Furtună de nisip puternică</string>
    <string name="weather_type_19">Furtună de nisip</string>
    <string name="weather_type_20">Furtună de nisip ușoară</string>
    <string name="weather_type_21">Furtună de nisip</string>
    <string name="weather_type_22">Grindină</string>
    <string name="weather_type_23">Praf</string>
    <string name="weather_type_24">Ceaţă</string>
    <string name="weather_type_25">Polei</string>
</resources>
PK
     �8N<H�]�  �     strings/strings_in_ID.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'waktu sekarang\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', ketuk 2x untuk masuk ke apl jam'</string>
    <string name="weather_type_null">'Tidak ada data'</string>
    <string name="weather_type_0">Cerah</string>
    <string name="weather_type_1">Berawan</string>
    <string name="weather_type_2">Berkabut</string>
    <string name="weather_type_3">Berkabut</string>
    <string name="weather_type_4">Hujan badai parah</string>
    <string name="weather_type_5">Hujan badai</string>
    <string name="weather_type_6">Hujan sangat deras</string>
    <string name="weather_type_7">Badai petir</string>
    <string name="weather_type_8">Hujan lebat</string>
    <string name="weather_type_9">Hujan deras</string>
    <string name="weather_type_10">Hujan</string>
    <string name="weather_type_11">Gerimis</string>
    <string name="weather_type_12">Hujan es salju</string>
    <string name="weather_type_13">Badai salju</string>
    <string name="weather_type_14">Gerimis salju</string>
    <string name="weather_type_15">Hujan salju deras</string>
    <string name="weather_type_16">Hujan salju</string>
    <string name="weather_type_17">Hujan salju ringan</string>
    <string name="weather_type_18">Badai pasir kuat</string>
    <string name="weather_type_19">Badai pasir</string>
    <string name="weather_type_20">Badai pasir ringan</string>
    <string name="weather_type_21">Badai pasir</string>
    <string name="weather_type_22">Hujan es</string>
    <string name="weather_type_23">Berdebu</string>
    <string name="weather_type_24">Kabut</string>
    <string name="weather_type_25">Hujan yang dingin</string>
</resources>
PK
     �8N	����  �     strings/strings_gl_ES.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'hora actual\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', duplo toque para abrir o reloxo'</string>
    <string name="weather_type_null">'Sen datos'</string>
    <string name="weather_type_0">Ceo claro</string>
    <string name="weather_type_1">Anubrado</string>
    <string name="weather_type_2">Brétema</string>
    <string name="weather_type_3">Bretemoso</string>
    <string name="weather_type_4">Tempestade</string>
    <string name="weather_type_5">Tormenta</string>
    <string name="weather_type_6">Choivas fortes</string>
    <string name="weather_type_7">Tormenta</string>
    <string name="weather_type_8">Chuvieira</string>
    <string name="weather_type_9">Chuvias fortes</string>
    <string name="weather_type_10">Chuvia</string>
    <string name="weather_type_11">Orballo</string>
    <string name="weather_type_12">Auganeve</string>
    <string name="weather_type_13">Nevarada</string>
    <string name="weather_type_14">Nevadas intermitentes</string>
    <string name="weather_type_15">Nevada intensa</string>
    <string name="weather_type_16">Nevada</string>
    <string name="weather_type_17">Nevada leve</string>
    <string name="weather_type_18">Tempestade de area</string>
    <string name="weather_type_19">Tormenta de area</string>
    <string name="weather_type_20">Tormentas febles de area</string>
    <string name="weather_type_21">Tormenta de area</string>
    <string name="weather_type_22">Sarabia</string>
    <string name="weather_type_23">Poeira</string>
    <string name="weather_type_24">Brétema</string>
    <string name="weather_type_25">Coriscada</string>
</resources>
PK
     �8N"!�d�  �     strings/strings_cs_CZ.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd. MMMM</string>
    <string name="date_time_12">EEE, dd. MMMM</string>
    <string name="desc_date_format">EEEE, dd. MMM</string>
    <string name="desc_date_format_12">EEEE, dd. MMM</string>
    <string name="desc_time">'aktuální čas\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', klepněte dvakrát pro otevření hodin'</string>
    <string name="weather_type_null">'Žádná data'</string>
    <string name="weather_type_0">Jasno</string>
    <string name="weather_type_1">Oblačno</string>
    <string name="weather_type_2">Zataženo</string>
    <string name="weather_type_3">Mlhavo</string>
    <string name="weather_type_4">Silné bouřky</string>
    <string name="weather_type_5">Bouřka</string>
    <string name="weather_type_6">Velmi silný déšť</string>
    <string name="weather_type_7">Bouřky s blesky</string>
    <string name="weather_type_8">Přehánky</string>
    <string name="weather_type_9">Silný déšť</string>
    <string name="weather_type_10">Déšť</string>
    <string name="weather_type_11">Mrholení</string>
    <string name="weather_type_12">Déšť se sněhem</string>
    <string name="weather_type_13">Sněhová bouře</string>
    <string name="weather_type_14">Sněhové jazyky</string>
    <string name="weather_type_15">Silné sněžení</string>
    <string name="weather_type_16">Sněžení</string>
    <string name="weather_type_17">Slabé sněžení</string>
    <string name="weather_type_18">Silná písečná bouře</string>
    <string name="weather_type_19">Písečná bouře</string>
    <string name="weather_type_20">Slabá písečná bouře</string>
    <string name="weather_type_21">Písečná bouře</string>
    <string name="weather_type_22">Krupobití</string>
    <string name="weather_type_23">Prach</string>
    <string name="weather_type_24">Mlha</string>
    <string name="weather_type_25">Mrznoucí déšť</string>
</resources>
PK
     �8N�9�  �     strings/strings_hu_HU.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">MMMM dd., EEE</string>
    <string name="date_time_12">MMMM dd., EEE</string>
    <string name="desc_date_format">MMM dd., EEEE</string>
    <string name="desc_date_format_12">MMM dd., EEEE</string>
    <string name="desc_time">'jelenlegi idő\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', érintse meg kétszer az óra megnyitásához'</string>
    <string name="weather_type_null">'Nincs adat'</string>
    <string name="weather_type_0">Tiszta</string>
    <string name="weather_type_1">Felhős</string>
    <string name="weather_type_2">Párás</string>
    <string name="weather_type_3">Ködös</string>
    <string name="weather_type_4">Intenzív felhőszakadás</string>
    <string name="weather_type_5">Felhőszakadás</string>
    <string name="weather_type_6">Nagyon heves esőzés</string>
    <string name="weather_type_7">Zivatar</string>
    <string name="weather_type_8">Zápor</string>
    <string name="weather_type_9">Heves esőzés</string>
    <string name="weather_type_10">Eső</string>
    <string name="weather_type_11">Szitálás</string>
    <string name="weather_type_12">Ónos eső</string>
    <string name="weather_type_13">Hóvihar</string>
    <string name="weather_type_14">Foltokban hóesés</string>
    <string name="weather_type_15">Sűrű havazás</string>
    <string name="weather_type_16">Havazás</string>
    <string name="weather_type_17">Hószállingózás</string>
    <string name="weather_type_18">Erős homokvihar</string>
    <string name="weather_type_19">Homokvihar</string>
    <string name="weather_type_20">Enyhe homokvihar</string>
    <string name="weather_type_21">Homokvihar</string>
    <string name="weather_type_22">Jégeső</string>
    <string name="weather_type_23">Szálló por</string>
    <string name="weather_type_24">Pára</string>
    <string name="weather_type_25">Ónos eső</string>
</resources>
PK
     �8N�A�8�	  �	     strings/strings_or_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'ବର୍ତ୍ତମାନର ସମୟ\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', କ୍ଲକ ଆପରେ ପ୍ରବେଶ କରିବାକୁ ଦୁଇଥର ଟ୍ୟାପ କରନ୍ତୁ'</string>
    <string name="weather_type_null">'କୌଣସି ଡାଟା ନାହିଁ'</string>
    <string name="weather_type_0">ସଫା ପାଗ</string>
    <string name="weather_type_1">ମେଘୁଆ</string>
    <string name="weather_type_2">କୁହୁଡ଼ିଆ</string>
    <string name="weather_type_3">ଘନକୁହୁଡି</string>
    <string name="weather_type_4">ପ୍ରଚଣ୍ଡ ଝଡ଼ବର୍ଷା</string>
    <string name="weather_type_5">ଝଡ଼ବର୍ଷା</string>
    <string name="weather_type_6">ଅତି ବୃଷ୍ଟିପାତ</string>
    <string name="weather_type_7">ଘଡ଼ଘଡ଼ି ବର୍ଷା</string>
    <string name="weather_type_8">ହାଲୁକା ବର୍ଷା</string>
    <string name="weather_type_9">ଭାରି ବୃଷ୍ଟିପାତ</string>
    <string name="weather_type_10">ବର୍ଷା</string>
    <string name="weather_type_11">ଅଳ୍ପ ବର୍ଷା</string>
    <string name="weather_type_12">କୁଆପଥର ବର୍ଷା</string>
    <string name="weather_type_13">ତୁଷାର ଝଡ଼</string>
    <string name="weather_type_14">ଜାଗାଏ ଜାଗାଏ ତୁଷାରପାତ</string>
    <string name="weather_type_15">ଭାରି ତୁଷାରପାତ</string>
    <string name="weather_type_16">ତୁଷାରପାତ</string>
    <string name="weather_type_17">ହାଲୁକା ତୁଷାରପାତ</string>
    <string name="weather_type_18">ଭାରି ଧୂଳିଝଡ଼</string>
    <string name="weather_type_19">ଧୂଳିଝଡ଼</string>
    <string name="weather_type_20">ହାଲୁକା ଧୂଳିଝଡ଼</string>
    <string name="weather_type_21">ଧୂଳିଝଡ଼</string>
    <string name="weather_type_22">କରକା</string>
    <string name="weather_type_23">ଭାସମାନ ଧୂଳି</string>
    <string name="weather_type_24">କୁହୁଡ଼ି</string>
    <string name="weather_type_25">ହିମ ବର୍ଷା</string>
</resources>
PK
     �8N�q��       strings/strings_az_AZ.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">dd MMMM, EEE</string>
    <string name="date_time_12">dd MMMM, EEE</string>
    <string name="desc_date_format">dd MMM, EEEE</string>
    <string name="desc_date_format_12">dd MMM, EEEE</string>
    <string name="desc_time">'cari vaxt\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', saat tətbiqini açmaq üçün iki dəfə toxunun'</string>
    <string name="weather_type_null">'Məlumat yoxdur'</string>
    <string name="weather_type_0">Təmiz</string>
    <string name="weather_type_1">Buludlu</string>
    <string name="weather_type_2">Çənli</string>
    <string name="weather_type_3">Dumanlı</string>
    <string name="weather_type_4">Sərt yağış fırtınası</string>
    <string name="weather_type_5">Yağış fırtınası</string>
    <string name="weather_type_6">Çox şiddətli yağıntı</string>
    <string name="weather_type_7">Göy gurultulu yağış</string>
    <string name="weather_type_8">Yüngül yağışlı</string>
    <string name="weather_type_9">Şiddətli yağıntı</string>
    <string name="weather_type_10">Yağış</string>
    <string name="weather_type_11">Çiskin</string>
    <string name="weather_type_12">Sulu qar</string>
    <string name="weather_type_13">Qar fırtınası</string>
    <string name="weather_type_14">Qar qalıntıları</string>
    <string name="weather_type_15">Şiddətli qar yağışı</string>
    <string name="weather_type_16">Qar yağışı</string>
    <string name="weather_type_17">Yüngül qar yağışı</string>
    <string name="weather_type_18">Güclü qum fırtınası</string>
    <string name="weather_type_19">Qum fırtınası</string>
    <string name="weather_type_20">Yüngül qum fırtınası</string>
    <string name="weather_type_21">Qum tufanı</string>
    <string name="weather_type_22">Dolu</string>
    <string name="weather_type_23">Tozlu</string>
    <string name="weather_type_24">Sisli</string>
    <string name="weather_type_25">Donmuş yağış</string>
</resources>
PK
     �8N��m*  *     strings/strings_en_US.xml<?xml version="1.0" encoding="utf-8"?>
<resources> 
    <string name="date_time">EEE, MMMM dd</string>
    <string name="date_time_12">EEE, MMMM dd</string>
    <string name="desc_date_format">EEEE, MMM dd</string>
    <string name="desc_date_format_12">EEEE, MMM dd</string>
    <string name="desc_time">'current time' + #hour12+' '+ifelse(#minute,#minute,'oclock')+', double tap to enter clock app'</string>
	<string name="weather_type_null">'No data'</string>
	<string name="weather_type_0">Clear</string>
    <string name="weather_type_1">Cloudy</string>
    <string name="weather_type_2">Hazy</string>
    <string name="weather_type_3">Foggy</string>
    <string name="weather_type_4">Severe rainstorm</string>
    <string name="weather_type_5">Rainstorm</string>
    <string name="weather_type_6">Very heavy rainfall</string>
    <string name="weather_type_7">Thunderstorm</string>
    <string name="weather_type_8">Shower</string>
    <string name="weather_type_9">Heavy rainfall</string>
    <string name="weather_type_10">Rain</string>
    <string name="weather_type_11">Drizzle</string>
    <string name="weather_type_12">Sleet</string>
    <string name="weather_type_13">Snowstorm</string>
    <string name="weather_type_14">Patches of snowfall</string>
    <string name="weather_type_15">Heavy snowfall</string>
    <string name="weather_type_16">Snowfall</string>
    <string name="weather_type_17">Light snowfall</string>
    <string name="weather_type_18">Strong sandstorm</string>
    <string name="weather_type_19">Sandstorm</string>
    <string name="weather_type_20">Light sandstorm</string>
    <string name="weather_type_21">Sandstorm</string>
    <string name="weather_type_22">Hail</string>
    <string name="weather_type_23">Floating Dust</string>
    <string name="weather_type_24">Haze</string>
</resources>
PK
     �8NN�(�  �     strings/strings_ru_RU.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, d MMMM</string>
    <string name="date_time_12">EEE, d MMMM</string>
    <string name="desc_date_format">EEEE, d MMMM</string>
    <string name="desc_date_format_12">EEEE, d MMMM</string>
    <string name="desc_time">'текущее время\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', нажмите дважды для входа в приложение "Часы"'</string>
    <string name="weather_type_null">'Данных нет'</string>
    <string name="weather_type_0">Ясно</string>
    <string name="weather_type_1">Облачно</string>
    <string name="weather_type_2">Пасмурно</string>
    <string name="weather_type_3">Туман</string>
    <string name="weather_type_4">Сильный ливень</string>
    <string name="weather_type_5">Ливень</string>
    <string name="weather_type_6">Сильный ливень</string>
    <string name="weather_type_7">Гроза</string>
    <string name="weather_type_8">Дождь</string>
    <string name="weather_type_9">Сильный дождь</string>
    <string name="weather_type_10">Дождь</string>
    <string name="weather_type_11">Изморось</string>
    <string name="weather_type_12">Мокрый снег</string>
    <string name="weather_type_13">Метель</string>
    <string name="weather_type_14">Местами снег</string>
    <string name="weather_type_15">Сильный снег</string>
    <string name="weather_type_16">Снег</string>
    <string name="weather_type_17">Небольшой снег</string>
    <string name="weather_type_18">Сильная пыльная буря</string>
    <string name="weather_type_19">Пыльная буря</string>
    <string name="weather_type_20">Небольшая пыльная буря</string>
    <string name="weather_type_21">Пыльная буря</string>
    <string name="weather_type_22">Град</string>
    <string name="weather_type_23">Пыль</string>
    <string name="weather_type_24">Смог</string>
    <string name="weather_type_25">Изморозь</string>
</resources>
PK
     6�8N�����  �     strings/strings_zh_TW.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">M月d日 EEEE</string>
    <string name="date_time_12">M月d日 Eaa</string>
    <string name="desc_date_format">M月d日 EEEE</string>
    <string name="desc_date_format_12">M月d日 Eaa</string>
    <string name="desc_time">ifelse(eq(#time_format,0),#hour12,eq(#time_format,1),#hour24,#hour24)+\'點\'+ifelse(gt(#minute,0)*le(#minute,9),0,\'\')+ifelse(#minute,#minute+\'分\',\'整\')+\', 按兩下進入時鐘App\'</string>
    <string name="desc_weather">\'今天\'+\', \'+@weather_location+\', \'+int(#month+1)+\'月\'+#date+\'日\'+\', \'+\'週\'+int(#day_of_week-1)+\',\'+#weather_temperature+\'度\'+\',\'+@weather_description+\',\'+@weather_aqi</string>
    <string name="desc_weather_null">'點擊獲取天氣數據'</string>
    <string name="weather_type_null">'點擊獲取天氣數據'</string>
    <string name="weather_type_0">晴</string>
    <string name="weather_type_1">多雲</string>
    <string name="weather_type_2">陰</string>
    <string name="weather_type_3">霧</string>
    <string name="weather_type_4">特大暴雨</string>
    <string name="weather_type_5">大暴雨</string>
    <string name="weather_type_6">暴雨</string>
    <string name="weather_type_7">雷陣雨</string>
    <string name="weather_type_8">陣雨</string>
    <string name="weather_type_9">大雨</string>
    <string name="weather_type_10">中雨</string>
    <string name="weather_type_11">小雨</string>
    <string name="weather_type_12">雨夾帶雪</string>
    <string name="weather_type_13">暴雪</string>
    <string name="weather_type_14">陣雪</string>
    <string name="weather_type_15">大雪</string>
    <string name="weather_type_16">中雪</string>
    <string name="weather_type_17">小雪</string>
    <string name="weather_type_18">強沙塵暴</string>
    <string name="weather_type_19">沙塵暴</string>
    <string name="weather_type_20">沙塵</string>
    <string name="weather_type_21">揚沙</string>
    <string name="weather_type_22">冰雹</string>
    <string name="weather_type_23">浮塵</string>
    <string name="weather_type_24">霾</string>
    <string name="weather_type_25">凍雨</string>
</resources>
PK
     �8Nٗ��s  s     strings/strings_et_EE.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd. MMMM</string>
    <string name="date_time_12">EEE, dd. MMMM</string>
    <string name="desc_date_format">EEEE, dd. MMM</string>
    <string name="desc_date_format_12">EEEE, dd. MMM</string>
    <string name="desc_time">'praegune aeg\' + #hour12+’ifelse(#minute,#minute,\'\')+\', topelttokse kellarakendusse sisenemiseks'</string>
    <string name="weather_type_null">'Andmed puuduvad'</string>
    <string name="weather_type_0">Selge</string>
    <string name="weather_type_1">Pilvine</string>
    <string name="weather_type_2">Hägune</string>
    <string name="weather_type_3">Udune</string>
    <string name="weather_type_4">Tõsine vihmatorm</string>
    <string name="weather_type_5">Vihmatorm</string>
    <string name="weather_type_6">Väga tugev sadu</string>
    <string name="weather_type_7">Äikesetorm</string>
    <string name="weather_type_8">Sadu</string>
    <string name="weather_type_9">Tugev sadu</string>
    <string name="weather_type_10">Vihm</string>
    <string name="weather_type_11">Tibutamine</string>
    <string name="weather_type_12">Lörts</string>
    <string name="weather_type_13">Lumetorm</string>
    <string name="weather_type_14">Hootine lumesadu</string>
    <string name="weather_type_15">Tugev lumesadu</string>
    <string name="weather_type_16">Lumesadu</string>
    <string name="weather_type_17">Kerge lumesadu</string>
    <string name="weather_type_18">Tugev liivatorm</string>
    <string name="weather_type_19">Liivatorm</string>
    <string name="weather_type_20">Kerge liivatorm</string>
    <string name="weather_type_21">Liivatorm</string>
    <string name="weather_type_22">Rahe</string>
    <string name="weather_type_23">Hõljuv udu</string>
    <string name="weather_type_24">Hägu</string>
    <string name="weather_type_25">Külm vihm</string>
</resources>
PK
     �8N��	h�	  �	     strings/strings_kn_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE dd MMMM</string>
    <string name="date_time_12">EEE dd MMMM</string>
    <string name="desc_date_format">EEEE dd MMM</string>
    <string name="desc_date_format_12">EEEE dd MMM</string>
    <string name="desc_time">'ಪ್ರಸ್ತುತ ಸಮಯ\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', ಗಡಿಯಾರ ಆ್ಯಪ್‌‌ ಪ್ರವೇಶಿಸಲು ಡಬಲ್‌ ಟ್ಯಾಪ್‌ ಮಾಡಿ'</string>
    <string name="weather_type_null">'ಡೇಟಾ ಇಲ್ಲ'</string>
    <string name="weather_type_0">ನಿಚ್ಛಳ</string>
    <string name="weather_type_1">ಮೋಡ ಕವಿದಿದೆ</string>
    <string name="weather_type_2">ಮಬ್ಬು ಕವಿದಿದೆ</string>
    <string name="weather_type_3">ಮಂಜು ಮುಸುಕಿದೆ</string>
    <string name="weather_type_4">ತೀವ್ರ ಮಳೆ-ಗಾಳಿ</string>
    <string name="weather_type_5">ಮಳೆ-ಗಾಳಿ</string>
    <string name="weather_type_6">ತೀವ್ರ ಮಳೆ-ಗಾಳಿ</string>
    <string name="weather_type_7">ಬಿರುಗಾಳಿ</string>
    <string name="weather_type_8">ತುಂತುರು ಮಳೆ</string>
    <string name="weather_type_9">ಭಾರೀ ಮಳೆ</string>
    <string name="weather_type_10">ಮಳೆ</string>
    <string name="weather_type_11">ತುಂತುರು ಮಳೆ</string>
    <string name="weather_type_12">ಆಲಿಕಲ್ಲು ಮಳೆ</string>
    <string name="weather_type_13">ಮಂಜು-ಗಾಳಿ</string>
    <string name="weather_type_14">ತುಂತುರು ಹಿಮಮಳೆ</string>
    <string name="weather_type_15">ತೀವ್ರ ಹಿಮಮಳೆ</string>
    <string name="weather_type_16">ಹಿಮಮಳೆ</string>
    <string name="weather_type_17">ಹಗುರ ಹಿಮಮಳೆ</string>
    <string name="weather_type_18">ತೀವ್ರ ಮರಳು-ಗಾಳಿ</string>
    <string name="weather_type_19">ಮರಳು-ಗಾಳಿ</string>
    <string name="weather_type_20">ಹಗುರ ಮರಳು-ಗಾಳಿ</string>
    <string name="weather_type_21">ಮರಳು-ಗಾಳಿ</string>
    <string name="weather_type_22">ಆಲಿಕಲ್ಲು</string>
    <string name="weather_type_23">ಧೂಳು</string>
    <string name="weather_type_24">ಮಬ್ಬುಮುಸುಕು</string>
    <string name="weather_type_25">ಚಳಿ-ಮಳೆ</string>
</resources>
PK
     �8N���  �     strings/strings_be_BY.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, d MMMM</string>
    <string name="date_time_12">EEE, d MMMM</string>
    <string name="desc_date_format">EEEE, d MMMM</string>
    <string name="desc_date_format_12">EEEE, d MMMM</string>
    <string name="desc_time">'цяперашні час\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', націсніце двойчы, каб зайсці ў праграму «Гадзіннік»'</string>
    <string name="weather_type_null">'Няма дадзеных'</string>
    <string name="weather_type_0">Ясна</string>
    <string name="weather_type_1">Хмарна</string>
    <string name="weather_type_2">Пахмурна</string>
    <string name="weather_type_3">Туман</string>
    <string name="weather_type_4">Моцная залева</string>
    <string name="weather_type_5">Залева</string>
    <string name="weather_type_6">Моцная залева</string>
    <string name="weather_type_7">Навальніца</string>
    <string name="weather_type_8">Дождж</string>
    <string name="weather_type_9">Моцны дождж</string>
    <string name="weather_type_10">Дождж</string>
    <string name="weather_type_11">Дробны дождж</string>
    <string name="weather_type_12">Дождж са снегам</string>
    <string name="weather_type_13">Завіруха</string>
    <string name="weather_type_14">Месцамі снег</string>
    <string name="weather_type_15">Моцны снегапад</string>
    <string name="weather_type_16">Снегапад</string>
    <string name="weather_type_17">Невялікі снег</string>
    <string name="weather_type_18">Моцная пясчаная бура</string>
    <string name="weather_type_19">Пясчаная бура</string>
    <string name="weather_type_20">Cлабая пясчаная бура</string>
    <string name="weather_type_21">Пясчаная бура</string>
    <string name="weather_type_22">Град</string>
    <string name="weather_type_23">Пыльна</string>
    <string name="weather_type_24">Смуга</string>
    <string name="weather_type_25">Шэрань</string>
</resources>
PK
     �8N��\�A
  A
     strings/strings_gu_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'ઘડિયાળ ઍપ્લિકેશનમાં દાખલ થવા માટે વર્તમાન સમય\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', ને બેવાર ટૅપ કરો'</string>
    <string name="weather_type_null">'કોઇ ડેટા નથી'</string>
    <string name="weather_type_0">સાફ</string>
    <string name="weather_type_1">વાદળછાયું</string>
    <string name="weather_type_2">ધૂંધળું</string>
    <string name="weather_type_3">ધુમ્મસભર્યું</string>
    <string name="weather_type_4">અતિથી અતિ ભારે વાવાઝોડું</string>
    <string name="weather_type_5">વરસાદ સાથે વાવાઝોડું</string>
    <string name="weather_type_6">બહુ ભારે વરસાદ</string>
    <string name="weather_type_7">ગાજવીજ સાથે વાવાઝોડું</string>
    <string name="weather_type_8">નાનું ઝાપટું</string>
    <string name="weather_type_9">ભારે વરસાદ</string>
    <string name="weather_type_10">વરસાદ</string>
    <string name="weather_type_11">ઝરમર વરસાદ</string>
    <string name="weather_type_12">કરા સાથે વરસાદ</string>
    <string name="weather_type_13">બરફીલું તોફાન</string>
    <string name="weather_type_14">ક્યાંક-ક્યાંક હિમવર્ષા</string>
    <string name="weather_type_15">ભારે હિમવર્ષા</string>
    <string name="weather_type_16">હિમવર્ષા</string>
    <string name="weather_type_17">હળવી હિમવર્ષા</string>
    <string name="weather_type_18">જોરદાર આંધી</string>
    <string name="weather_type_19">આંધી</string>
    <string name="weather_type_20">હળવી આંધી</string>
    <string name="weather_type_21">આંધી</string>
    <string name="weather_type_22">કરા</string>
    <string name="weather_type_23">ઉડતી ધૂળ</string>
    <string name="weather_type_24">ધુમ્મસ</string>
    <string name="weather_type_25">થીજવી નાંખે એવો વરસાદ</string>
</resources>
PK
     �8N�)�E
  E
     strings/strings_bn_BD.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'এখনকার সময়\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', ঘড়ির অ্যাপে প্রবেশ করার জন্য দুবার ট্যাপ করুন'</string>
    <string name="weather_type_null">'কোনো ডেটা নেই'</string>
    <string name="weather_type_0">পরিষ্কার আকাশ</string>
    <string name="weather_type_1">মেঘলা</string>
    <string name="weather_type_2">অস্পষ্ট</string>
    <string name="weather_type_3">কুয়াশাচ্ছন্ন</string>
    <string name="weather_type_4">মারাত্মক ঝড়বৃষ্টি</string>
    <string name="weather_type_5">ঝড়বৃষ্টি</string>
    <string name="weather_type_6">প্রচন্ড বৃষ্টিপাত</string>
    <string name="weather_type_7">বজ্রবিদ্যুতসহ ঝড়</string>
    <string name="weather_type_8">বর্ষণ</string>
    <string name="weather_type_9">ভারী বৃষ্টিপাত</string>
    <string name="weather_type_10">বৃষ্টি</string>
    <string name="weather_type_11">গুঁড়ি গুঁড়ি বৃষ্টি</string>
    <string name="weather_type_12">শিলাবৃষ্টি</string>
    <string name="weather_type_13">তুষারঝড়</string>
    <string name="weather_type_14">হালকা তুষারপাত</string>
    <string name="weather_type_15">প্রচন্ড তুষারপাত</string>
    <string name="weather_type_16">তুষারপাত</string>
    <string name="weather_type_17">হালকা তুষারপাত</string>
    <string name="weather_type_18">প্রচন্ড বালিঝড়</string>
    <string name="weather_type_19">বালুঝড়</string>
    <string name="weather_type_20">হালকা বালুঝড়</string>
    <string name="weather_type_21">বালুঝড়</string>
    <string name="weather_type_22">শিলাবৃষ্টি</string>
    <string name="weather_type_23">ভাসমান ধুলো</string>
    <string name="weather_type_24">কুয়াশা</string>
    <string name="weather_type_25">তুষার ও বৃষ্টি</string>
</resources>
PK
     �8N�1�<�  �     strings/strings_sl_SI.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd. MMMM</string>
    <string name="date_time_12">EEE, dd. MMMM</string>
    <string name="desc_date_format">EEEE, dd. MMM</string>
    <string name="desc_date_format_12">EEEE, dd. MMM</string>
    <string name="desc_time">'trenutni čas\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', dvakrat tapnite odprtje aplikacije za uro'</string>
    <string name="weather_type_null">'Ni podatkov'</string>
    <string name="weather_type_0">Jasno</string>
    <string name="weather_type_1">Oblačno</string>
    <string name="weather_type_2">Megleno</string>
    <string name="weather_type_3">Megla</string>
    <string name="weather_type_4">Močan dež</string>
    <string name="weather_type_5">Nevihta z dežjem</string>
    <string name="weather_type_6">Zelo huda ploha</string>
    <string name="weather_type_7">Nevihta</string>
    <string name="weather_type_8">Ploha</string>
    <string name="weather_type_9">Huda ploha</string>
    <string name="weather_type_10">Dež</string>
    <string name="weather_type_11">Rahel dež</string>
    <string name="weather_type_12">Sodra</string>
    <string name="weather_type_13">Snežna nevihta</string>
    <string name="weather_type_14">Nanosi snega</string>
    <string name="weather_type_15">Močno sneženje</string>
    <string name="weather_type_16">Sneženje</string>
    <string name="weather_type_17">Rahlo sneženje</string>
    <string name="weather_type_18">Huda peščena nevihta</string>
    <string name="weather_type_19">Peščena nevihta</string>
    <string name="weather_type_20">Rahla peščena nevihta</string>
    <string name="weather_type_21">Peščena nevihta</string>
    <string name="weather_type_22">Toča</string>
    <string name="weather_type_23">Plavajoč prah</string>
    <string name="weather_type_24">Meglica</string>
    <string name="weather_type_25">Leden dež</string>
</resources>
PK
     �8N�͙��  �     strings/strings_sr_RS.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd. MMMM</string>
    <string name="date_time_12">EEE, dd. MMMM</string>
    <string name="desc_date_format">EEEE, dd. MMM.</string>
    <string name="desc_date_format_12">EEEE, dd. MMM.</string>
    <string name="desc_time">'време\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', двапут додирните да уђете у апликацију за сат'</string>
    <string name="weather_type_null">'Нема података'</string>
    <string name="weather_type_0">Ведро</string>
    <string name="weather_type_1">Облачно</string>
    <string name="weather_type_2">Измаглица</string>
    <string name="weather_type_3">Магловито</string>
    <string name="weather_type_4">Јака кишна олуја</string>
    <string name="weather_type_5">Невреме</string>
    <string name="weather_type_6">Веома јаки пљусак</string>
    <string name="weather_type_7">Олуја са грмљавином</string>
    <string name="weather_type_8">Пљусак</string>
    <string name="weather_type_9">Снажни пљусак</string>
    <string name="weather_type_10">Киша</string>
    <string name="weather_type_11">Слаба киша</string>
    <string name="weather_type_12">Поледица</string>
    <string name="weather_type_13">Снежна олуја</string>
    <string name="weather_type_14">Наноси снега</string>
    <string name="weather_type_15">Снажaн снег</string>
    <string name="weather_type_16">Снег</string>
    <string name="weather_type_17">Слаб снег</string>
    <string name="weather_type_18">Снажна пешчана олуја</string>
    <string name="weather_type_19">Пешчана олуја</string>
    <string name="weather_type_20">Слаба пешчана олуја</string>
    <string name="weather_type_21">Пешчана олуја</string>
    <string name="weather_type_22">Град</string>
    <string name="weather_type_23">Прашина</string>
    <string name="weather_type_24">Сумаглица</string>
    <string name="weather_type_25">Ледена киша</string>
</resources>
PK
     �8Nk�_�m  m     strings/strings_da_DK.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, d. MMMM</string>
    <string name="date_time_12">EEE, d. MMMM</string>
    <string name="desc_date_format">EEEE, d. MMM</string>
    <string name="desc_date_format_12">EEEE, d. MMM</string>
    <string name="desc_time">'aktuel\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', dobbeltklik for at indtaste ur-app'</string>
    <string name="weather_type_null">'Ingen data'</string>
    <string name="weather_type_0">Klart</string>
    <string name="weather_type_1">Skyet</string>
    <string name="weather_type_2">Diset</string>
    <string name="weather_type_3">Tåget</string>
    <string name="weather_type_4">Alvorligt regnvejr</string>
    <string name="weather_type_5">Regnvejr</string>
    <string name="weather_type_6">Meget kraftigt regnvejr</string>
    <string name="weather_type_7">Tordenvejr</string>
    <string name="weather_type_8">Byge</string>
    <string name="weather_type_9">Kraftig nedbør</string>
    <string name="weather_type_10">Regn</string>
    <string name="weather_type_11">Støvregn</string>
    <string name="weather_type_12">Slud</string>
    <string name="weather_type_13">Snestorm</string>
    <string name="weather_type_14">Pletvis snevejr</string>
    <string name="weather_type_15">Kraftigt snevejr</string>
    <string name="weather_type_16">Snefald</string>
    <string name="weather_type_17">Let snefald</string>
    <string name="weather_type_18">Kraftig sandstorm</string>
    <string name="weather_type_19">Sandstorm</string>
    <string name="weather_type_20">Let sandstorm</string>
    <string name="weather_type_21">Sandstorm</string>
    <string name="weather_type_22">Hagl</string>
    <string name="weather_type_23">Flydende støv</string>
    <string name="weather_type_24">Dis</string>
    <string name="weather_type_25">Frysende regn</string>
</resources>
PK
     �8Nvy���  �     strings/strings_pl_PL.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'aktualna godzina\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', dotknij dwukrotnie, aby przejść do aplikacji Zegar'</string>
    <string name="weather_type_null">'Brak danych'</string>
    <string name="weather_type_0">Pogodnie</string>
    <string name="weather_type_1">Pochmurno</string>
    <string name="weather_type_2">Zamglenia</string>
    <string name="weather_type_3">Mgła</string>
    <string name="weather_type_4">Ulewne deszcze</string>
    <string name="weather_type_5">Ulewa</string>
    <string name="weather_type_6">Bardzo intensywne opady deszczu</string>
    <string name="weather_type_7">Burza z piorunami</string>
    <string name="weather_type_8">Mżawka</string>
    <string name="weather_type_9">Intensywne opady deszczu</string>
    <string name="weather_type_10">Deszczowo</string>
    <string name="weather_type_11">Przelotne opady</string>
    <string name="weather_type_12">Deszcz ze śniegiem</string>
    <string name="weather_type_13">Zamieć śnieżna</string>
    <string name="weather_type_14">Śnieg</string>
    <string name="weather_type_15">Intensywne opady śniegu</string>
    <string name="weather_type_16">Opady śniegu</string>
    <string name="weather_type_17">Lekkie opady śniegu</string>
    <string name="weather_type_18">Silna burza piaskowa</string>
    <string name="weather_type_19">Burza piaskowa</string>
    <string name="weather_type_20">Lekka burza piaskowa</string>
    <string name="weather_type_21">Burza piaskowa</string>
    <string name="weather_type_22">Grad</string>
    <string name="weather_type_23">Unoszący się pył</string>
    <string name="weather_type_24">Zamglenia</string>
    <string name="weather_type_25">Marznący deszcz</string>
</resources>
PK
     �8NGt��  �     strings/strings_mk_MK.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'тековно време\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', двапати допрете за да влезете во апликацијата часовник'</string>
    <string name="weather_type_null">'Нема податоци'</string>
    <string name="weather_type_0">Ведро</string>
    <string name="weather_type_1">Облачно</string>
    <string name="weather_type_2">Матно</string>
    <string name="weather_type_3">Магливо</string>
    <string name="weather_type_4">Тешка бура</string>
    <string name="weather_type_5">Бура</string>
    <string name="weather_type_6">Многу обилни врнежи</string>
    <string name="weather_type_7">Грмотевици</string>
    <string name="weather_type_8">Краток дожд</string>
    <string name="weather_type_9">Обилни врнежи</string>
    <string name="weather_type_10">Дожд</string>
    <string name="weather_type_11">Ситен дожд</string>
    <string name="weather_type_12">Лапавица</string>
    <string name="weather_type_13">Снежна виелица</string>
    <string name="weather_type_14">Парчиња од снежните врнежи</string>
    <string name="weather_type_15">Обилни снежни врнежи</string>
    <string name="weather_type_16">Снежните врнежи</string>
    <string name="weather_type_17">Лесни врнежи од снег</string>
    <string name="weather_type_18">Силна песочна бура</string>
    <string name="weather_type_19">Песочна бура</string>
    <string name="weather_type_20">Песочна бура</string>
    <string name="weather_type_21">Песочна бура</string>
    <string name="weather_type_22">Град</string>
    <string name="weather_type_23">Лебдејќи</string>
    <string name="weather_type_24">Магла</string>
    <string name="weather_type_25">Леден дожд</string>
</resources>
PK
     �8N.\�x�  �     strings/strings_de_DE.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd. MMMM</string>
    <string name="date_time_12">EEE, dd. MMMM</string>
    <string name="desc_date_format">EEEE, dd. MMM</string>
    <string name="desc_date_format_12">EEEE, dd. MMM</string>
    <string name="desc_time">'Aktuelle Uhrzeit\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', doppeltippen, um die Uhr zu öffnen'</string>
    <string name="weather_type_null">'Keine Daten'</string>
    <string name="weather_type_0">Sonnig</string>
    <string name="weather_type_1">Bewölkt</string>
    <string name="weather_type_2">Dunstig</string>
    <string name="weather_type_3">Neblig</string>
    <string name="weather_type_4">Schwere Gewitter</string>
    <string name="weather_type_5">Regensturm</string>
    <string name="weather_type_6">Sehr starke Regenfälle</string>
    <string name="weather_type_7">Gewitter</string>
    <string name="weather_type_8">Schauer</string>
    <string name="weather_type_9">Starker Regen</string>
    <string name="weather_type_10">Regen</string>
    <string name="weather_type_11">Nieselregen</string>
    <string name="weather_type_12">Schneeregen</string>
    <string name="weather_type_13">Schneesturm</string>
    <string name="weather_type_14">Vereinzelt Schneefall</string>
    <string name="weather_type_15">Starker Schneefall</string>
    <string name="weather_type_16">Schneefall</string>
    <string name="weather_type_17">Leichter Schneefall</string>
    <string name="weather_type_18">Starker Sandsturm</string>
    <string name="weather_type_19">Sandsturm</string>
    <string name="weather_type_20">Leichter Sandsturm</string>
    <string name="weather_type_21">Sandsturm</string>
    <string name="weather_type_22">Hagel</string>
    <string name="weather_type_23">Schwebender Staub</string>
    <string name="weather_type_24">Nebel</string>
    <string name="weather_type_25">Schneeregen</string>
</resources>
PK
     �8N�=
��  �     strings/strings_lv_LV.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd. MMMM</string>
    <string name="date_time_12">EEE, dd. MMMM</string>
    <string name="desc_date_format">EEEE, dd. MMMM</string>
    <string name="desc_date_format_12">EEEE, dd. MMMM</string>
    <string name="desc_time">'current time\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', pieskarieties divreiz, lai ieietu pulksteņa lietotnē'</string>
    <string name="weather_type_null">'Nav datu'</string>
    <string name="weather_type_0">Skaidrs</string>
    <string name="weather_type_1">Mākoņains</string>
    <string name="weather_type_2">Neskaidrs</string>
    <string name="weather_type_3">Miglains</string>
    <string name="weather_type_4">Stipra vētra ar lietu</string>
    <string name="weather_type_5">Vētra ar lietu</string>
    <string name="weather_type_6">Ļoti spēcīgas lietusgāzes</string>
    <string name="weather_type_7">Pērkona negaiss</string>
    <string name="weather_type_8">Stiprs lietus</string>
    <string name="weather_type_9">Spēcīgas lietusgāzes</string>
    <string name="weather_type_10">Lietus</string>
    <string name="weather_type_11">Smidzina</string>
    <string name="weather_type_12">Slapjdraņķis</string>
    <string name="weather_type_13">Sniega vētra</string>
    <string name="weather_type_14">Vietām sniegs</string>
    <string name="weather_type_15">Spēcīgs sniegputenis</string>
    <string name="weather_type_16">Sniegputenis</string>
    <string name="weather_type_17">Viegls sniegputenis</string>
    <string name="weather_type_18">Spēcīga smilšu vētra</string>
    <string name="weather_type_19">Smilšu vētra</string>
    <string name="weather_type_20">Neliela smilšu vētra</string>
    <string name="weather_type_21">Smilšu vētra</string>
    <string name="weather_type_22">Krusa</string>
    <string name="weather_type_23">Putekļains gaiss</string>
    <string name="weather_type_24">Dūmaka</string>
    <string name="weather_type_25">Atkala</string>
</resources>
PK
     �8N��9       strings/strings_bo_CN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">ཟླ M ཚེས d E</string>
    <string name="date_time_12">ཟླ་ M ཚེས་ d ཉིན། Eaa</string>
    <string name="desc_date_format">ཟླ་ M ཚེས་ d E</string>
    <string name="desc_date_format_12">ཟླ་ M ཚེས་ d ཉིན། Eaa</string>
    <string name="desc_time">ifelse(eq(#time_format,0),#hour12,eq(#time_format,1),#hour24,#hour24)+\'点\'+ifelse(gt(#minute,0)*le(#minute,9),0,\'\')+ifelse(#minute,#minute+\'སྐར་མ་\',\'ཏག་ཏག\')+\', ཉིས་རེག་བྱས་ནས་ཆུ་ཚོད་App\'ལ་འཛུལ་བ།</string>
    <string name="desc_weather">\@weather_description+\', \'+#weather_temperature+\'ཏུའུ།\'</string>
    <string name="desc_weather_null">'གནས་སྐབས་སུ་གཞི་གྲངས་མི་འདུག'</string>
    <string name="weather_type_null">'གནས་སྐབས་གཞི་གྲངས་མི་འདུག'</string>
    <string name="weather_type_0">གནམ་དྭངས།</string>
    <string name="weather_type_1">སྤྲིན་མང་།</string>
    <string name="weather_type_2">གནམ་འཐིབས།</string>
    <string name="weather_type_3">སྨུག་པ།</string>
    <string name="weather_type_4">དྲག་ཆར་ཤིན་ཏུ་ཆེན་པོ།</string>
    <string name="weather_type_5">དྲག་ཆར་ཆེན་པོ།</string>
    <string name="weather_type_6">དྲག་ཆར།</string>
    <string name="weather_type_7">འབྲུག་ཆར།</string>
    <string name="weather_type_8">ཐོལ་ཆར།</string>
    <string name="weather_type_9">ཆར་ཆེན།</string>
    <string name="weather_type_10">ཆར་འབྲིང་།</string>
    <string name="weather_type_11">ཆར་ཆུང་།</string>
    <string name="weather_type_12">ཁ་ཆར་འདྲེས་མ།</string>
    <string name="weather_type_13">ཁ་བ་དྲག་པོ།</string>
    <string name="weather_type_14">ཁ་བ་ཡུད་ཙམ་འབབ་པ།</string>
    <string name="weather_type_15">ཁ་བ་ཆེན་པོ།</string>
    <string name="weather_type_16">ཁ་བ་འབྲིང་ཙམ།</string>
    <string name="weather_type_17">ཁ་བ་ཆུང་ཆུང་།</string>
    <string name="weather_type_18">བྱེ་རླུང་འཚུབ་མ་དྲག་པོ།</string>
    <string name="weather_type_19">བྱེ་རླུང་འཚུབ་མ།</string>
    <string name="weather_type_20">བྱེ་རྡུལ།</string>
    <string name="weather_type_21">བྱེ་རླུང་།</string>
    <string name="weather_type_22">སེར་བ།</string>
    <string name="weather_type_23">ཐལ་རྡུལ།</string>
    <string name="weather_type_24">རྡུལ་ཞག</string>
    <string name="weather_type_25">འཁྱགས་ཆར།</string>
</resources>
PK
     �8N+�
  
     strings/strings_ne_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'हालको समय\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', घडी एप भित्र जान दुईपटक ट्याप गर्नुहोस्'</string>
    <string name="weather_type_null">'डाटा छैन'</string>
    <string name="weather_type_0">खाली गर्नुहोस्</string>
    <string name="weather_type_1">बादल लागेको</string>
    <string name="weather_type_2">धमिलो</string>
    <string name="weather_type_3">तुवाँलो लागेको</string>
    <string name="weather_type_4">तेज तूफान</string>
    <string name="weather_type_5">आँधी</string>
    <string name="weather_type_6">ठुलो भारी बर्षा</string>
    <string name="weather_type_7">चट्याङ्</string>
    <string name="weather_type_8">बर्सा</string>
    <string name="weather_type_9">भारी बर्षा</string>
    <string name="weather_type_10">बर्षा</string>
    <string name="weather_type_11">हल्का बर्षा</string>
    <string name="weather_type_12">असिना सहितको बर्षा</string>
    <string name="weather_type_13">हिमपात</string>
    <string name="weather_type_14">हिमपातको खण्डहरू</string>
    <string name="weather_type_15">भारी हिमपात</string>
    <string name="weather_type_16">हिमपात</string>
    <string name="weather_type_17">हलुका हिमपात</string>
    <string name="weather_type_18">बलियो बालुवाको आँधी</string>
    <string name="weather_type_19">धुलो सहितको तूफान</string>
    <string name="weather_type_20">हलुका धुलो सहितको तूफान</string>
    <string name="weather_type_21">तूफान</string>
    <string name="weather_type_22">असिना</string>
    <string name="weather_type_23">तैरिरहेको फोहोर</string>
    <string name="weather_type_24">तुवाँलो</string>
    <string name="weather_type_25">कठ्याँग्रिने वर्षा</string>
</resources>
PK
     �8N�:Go  o     strings/strings_en_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'current time\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', double tap to enter clock app'</string>
    <string name="weather_type_null">'No data'</string>
    <string name="weather_type_0">Clear</string>
    <string name="weather_type_1">Cloudy</string>
    <string name="weather_type_2">Hazy</string>
    <string name="weather_type_3">Foggy</string>
    <string name="weather_type_4">Severe rainstorm</string>
    <string name="weather_type_5">Rainstorm</string>
    <string name="weather_type_6">Very heavy rainfall</string>
    <string name="weather_type_7">Thunderstorm</string>
    <string name="weather_type_8">Shower</string>
    <string name="weather_type_9">Heavy rainfall</string>
    <string name="weather_type_10">Rain</string>
    <string name="weather_type_11">Drizzle</string>
    <string name="weather_type_12">Sleet</string>
    <string name="weather_type_13">Snowstorm</string>
    <string name="weather_type_14">Patches of snowfall</string>
    <string name="weather_type_15">Heavy snowfall</string>
    <string name="weather_type_16">Snowfall</string>
    <string name="weather_type_17">Light snowfall</string>
    <string name="weather_type_18">Strong sandstorm</string>
    <string name="weather_type_19">Sandstorm</string>
    <string name="weather_type_20">Light sandstorm</string>
    <string name="weather_type_21">Sandstorm</string>
    <string name="weather_type_22">Hail</string>
    <string name="weather_type_23">Floating Dust</string>
    <string name="weather_type_24">Haze</string>
    <string name="weather_type_25">Freezing rain</string>
</resources>
PK
     �8N�"���  �     strings/strings_bs_BA.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd. MMMM</string>
    <string name="date_time_12">EEE, dd. MMMM</string>
    <string name="desc_date_format">EEEE, dd. MMM.</string>
    <string name="desc_date_format_12">EEEE, dd. MMM.</string>
    <string name="desc_time">'trenutno vrijeme\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', dodirnite dva puta za ulazak u aplikaciju sata'</string>
    <string name="weather_type_null">'Nema podataka'</string>
    <string name="weather_type_0">Vedro</string>
    <string name="weather_type_1">Oblačno</string>
    <string name="weather_type_2">Izmaglica</string>
    <string name="weather_type_3">Maglovito</string>
    <string name="weather_type_4">Jaka kišna oluja</string>
    <string name="weather_type_5">Kišna oluja</string>
    <string name="weather_type_6">Vrlo jake padavine</string>
    <string name="weather_type_7">Oluja sa grmljavinom</string>
    <string name="weather_type_8">Pljusak</string>
    <string name="weather_type_9">Jake padavine</string>
    <string name="weather_type_10">Kiša</string>
    <string name="weather_type_11">Rosulja</string>
    <string name="weather_type_12">Susnježica</string>
    <string name="weather_type_13">Snježna oluja</string>
    <string name="weather_type_14">Nanosi snijega</string>
    <string name="weather_type_15">Jak snijeg</string>
    <string name="weather_type_16">Snijeg</string>
    <string name="weather_type_17">Slab snijeg</string>
    <string name="weather_type_18">Jaka pješčana oluja</string>
    <string name="weather_type_19">Pješčana oluja</string>
    <string name="weather_type_20">Blaga pješčana oluja</string>
    <string name="weather_type_21">Pješčana oluja</string>
    <string name="weather_type_22">Grad</string>
    <string name="weather_type_23">Prašina u vazduhu</string>
    <string name="weather_type_24">Izmaglica</string>
    <string name="weather_type_25">Ledena kiša</string>
</resources>
PK
     �8N��3�  �     strings/strings_sk_SK.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd. MMMM</string>
    <string name="date_time_12">EEE, dd. MMMM</string>
    <string name="desc_date_format">EEEE, dd. MMM</string>
    <string name="desc_date_format_12">EEEE, dd. MMM</string>
    <string name="desc_time">'aktuálny čas\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', dvojitý dotyk pre spustenie hodín'</string>
    <string name="weather_type_null">'Žiadne údaje'</string>
    <string name="weather_type_0">Jasno</string>
    <string name="weather_type_1">Oblačno</string>
    <string name="weather_type_2">Hmlisto</string>
    <string name="weather_type_3">Hmlisto</string>
    <string name="weather_type_4">Silná búrka</string>
    <string name="weather_type_5">Búrka</string>
    <string name="weather_type_6">Veľmi silný lejak</string>
    <string name="weather_type_7">Búrka</string>
    <string name="weather_type_8">Prehánky</string>
    <string name="weather_type_9">Silný dážď</string>
    <string name="weather_type_10">Dážď</string>
    <string name="weather_type_11">Mrholenie</string>
    <string name="weather_type_12">Dážď so snehom</string>
    <string name="weather_type_13">Snehová búrka</string>
    <string name="weather_type_14">Sneženie</string>
    <string name="weather_type_15">Husté sneženie</string>
    <string name="weather_type_16">Sneženie</string>
    <string name="weather_type_17">Slabé sneženie</string>
    <string name="weather_type_18">Silná piesočná búrka</string>
    <string name="weather_type_19">Piesočná búrka</string>
    <string name="weather_type_20">Slabá piesočná búrka</string>
    <string name="weather_type_21">Piesočná búrka</string>
    <string name="weather_type_22">Krupobitie</string>
    <string name="weather_type_23">Prašno</string>
    <string name="weather_type_24">Hmla</string>
    <string name="weather_type_25">Mrznúci dážď</string>
</resources>
PK
     �8NW3fp       strings/strings_ha_NG.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'loakaci na yanzu\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', taɓa sau biyu ka shiga manhajar agogo'</string>
    <string name="weather_type_null">'Babu bayanai'</string>
    <string name="weather_type_0">Sama ta washe</string>
    <string name="weather_type_1">Akwai girgije</string>
    <string name="weather_type_2">Hazo</string>
    <string name="weather_type_3">Hazo so sai</string>
    <string name="weather_type_4">Ruwa da iska mai tsanani</string>
    <string name="weather_type_5">Ruwa da iska</string>
    <string name="weather_type_6">Ruwa mai yawan gaske</string>
    <string name="weather_type_7">Tsawa da iska</string>
    <string name="weather_type_8">Ruwan sama mai tsanani</string>
    <string name="weather_type_9">Ruwa mai yawa</string>
    <string name="weather_type_10">Ruwan sama</string>
    <string name="weather_type_11">Yayyafi</string>
    <string name="weather_type_12">Garin kankara da ruwa</string>
    <string name="weather_type_13">Garin kankara da iska</string>
    <string name="weather_type_14">Faduwar garin kankara</string>
    <string name="weather_type_15">Garin kankara mai yawa</string>
    <string name="weather_type_16">Garin kankara</string>
    <string name="weather_type_17">Yayyafin garin kankara</string>
    <string name="weather_type_18">Iska da rairai mai tsanani</string>
    <string name="weather_type_19">Iska da rairai</string>
    <string name="weather_type_20">Yayyafin rairai</string>
    <string name="weather_type_21">Iska da rairai</string>
    <string name="weather_type_22">Ƙanƙara</string>
    <string name="weather_type_23">Bambarowar Kura</string>
    <string name="weather_type_24">Hazo</string>
    <string name="weather_type_25">Ruwan sama mai daskarewa</string>
</resources>
PK
     �8N��BK       strings/strings_zh_CN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">M月d日 E</string>
    <string name="date_time_12">M月d日 Eaa</string>
    <string name="desc_date_format">M月d日 E</string>
    <string name="desc_date_format_12">M月d日 Eaa</string>
    <string name="desc_time">ifelse(eq(#time_format,0),#hour12,eq(#time_format,1),#hour24,#hour24)+'点'+ifelse(gt(#minute,0)*le(#minute,9),0,'')+ifelse(#minute,#minute+'分','整')+', 双击进入时钟App'</string>
	<string name="desc_weather">@weather_description+', '+#weather_temperature+'度'</string>
    <string name="desc_weather_null">'点击获取天气数据'</string>
	<string name="weather_type_null">'点击获取天气数据'</string>
	<string name="weather_type_0">晴</string>
    <string name="weather_type_1">多云</string>
    <string name="weather_type_2">阴</string>
    <string name="weather_type_3">雾</string>
    <string name="weather_type_4">特大暴雨</string>
    <string name="weather_type_5">大暴雨</string>
    <string name="weather_type_6">暴雨</string>
    <string name="weather_type_7">雷阵雨</string>
    <string name="weather_type_8">阵雨</string>
    <string name="weather_type_9">大雨</string>
    <string name="weather_type_10">中雨</string>
    <string name="weather_type_11">小雨</string>
    <string name="weather_type_12">雨夹雪</string>
    <string name="weather_type_13">暴雪</string>
    <string name="weather_type_14">阵雪</string>
    <string name="weather_type_15">大雪</string>
    <string name="weather_type_16">中雪</string>
    <string name="weather_type_17">小雪</string>
    <string name="weather_type_18">强沙尘暴</string>
    <string name="weather_type_19">沙尘暴</string>
    <string name="weather_type_20">沙尘</string>
    <string name="weather_type_21">扬沙</string>
    <string name="weather_type_22">冰雹</string>
    <string name="weather_type_23">浮尘</string>
    <string name="weather_type_24">霾</string>
    <string name="weather_type_25">冻雨</string>
</resources>
PK
     �8NZ�$ڪ
  �
     strings/strings_te_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'ప్రస్తుత సమయం\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', గడియార అప్లికేషన్‌లో ప్రవేశించేందుకు రెండుసార్లు నొక్కండి'</string>
    <string name="weather_type_null">'డేటా లేదు'</string>
    <string name="weather_type_0">నిర్మలంగా ఉంది</string>
    <string name="weather_type_1">మేఘావృతంగా ఉంటుంది</string>
    <string name="weather_type_2">మసక</string>
    <string name="weather_type_3">పొగమంచు</string>
    <string name="weather_type_4">తీవ్రమైన గాలివాన</string>
    <string name="weather_type_5">గాలివాన</string>
    <string name="weather_type_6">అత్యంత భారీ వర్షపాతం</string>
    <string name="weather_type_7">ఉరుములతో కూడిన గాలివాన</string>
    <string name="weather_type_8">వానజల్లు</string>
    <string name="weather_type_9">భారీ వర్షపాతం</string>
    <string name="weather_type_10">వర్షం</string>
    <string name="weather_type_11">చినుకులు</string>
    <string name="weather_type_12">మంచు వాన</string>
    <string name="weather_type_13">మంచు తుఫాను</string>
    <string name="weather_type_14">హిమపాతం పొగమంచు</string>
    <string name="weather_type_15">భారీ హిమపాతం</string>
    <string name="weather_type_16">హిమపాతం</string>
    <string name="weather_type_17">తేలికపాటి హిమపాతం</string>
    <string name="weather_type_18">భారీ ఇసుక తుఫాను</string>
    <string name="weather_type_19">ఇసుక తుఫాను</string>
    <string name="weather_type_20">తేలికపాటి ఇసుక తుఫాను</string>
    <string name="weather_type_21">ఇసుక తుఫాను</string>
    <string name="weather_type_22">వడగళ్లు</string>
    <string name="weather_type_23">తేలియాడే దుమ్ముధూళి</string>
    <string name="weather_type_24">పొగమంచు</string>
    <string name="weather_type_25">మంచుగడ్డల వర్షం</string>
</resources>
PK
     �8N{E d  d     strings/strings.xml<?xml version="1.0" encoding="utf-8"?>
<resources> 
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, MMM dd</string>
    <string name="desc_date_format_12">EEEE, MMM dd</string>
    <string name="desc_time">'current time' + #hour12+' '+ifelse(#minute,#minute,'oclock')+', double tap to enter clock app'</string>
	<string name="weather_type_null">'No data'</string>
	<string name="weather_type_0">Clear</string>
    <string name="weather_type_1">Cloudy</string>
    <string name="weather_type_2">Hazy</string>
    <string name="weather_type_3">Foggy</string>
    <string name="weather_type_4">Severe rainstorm</string>
    <string name="weather_type_5">Rainstorm</string>
    <string name="weather_type_6">Very heavy rainfall</string>
    <string name="weather_type_7">Thunderstorm</string>
    <string name="weather_type_8">Shower</string>
    <string name="weather_type_9">Heavy rainfall</string>
    <string name="weather_type_10">Rain</string>
    <string name="weather_type_11">Drizzle</string>
    <string name="weather_type_12">Sleet</string>
    <string name="weather_type_13">Snowstorm</string>
    <string name="weather_type_14">Patches of snowfall</string>
    <string name="weather_type_15">Heavy snowfall</string>
    <string name="weather_type_16">Snowfall</string>
    <string name="weather_type_17">Light snowfall</string>
    <string name="weather_type_18">Strong sandstorm</string>
    <string name="weather_type_19">Sandstorm</string>
    <string name="weather_type_20">Light sandstorm</string>
    <string name="weather_type_21">Sandstorm</string>
    <string name="weather_type_22">Hail</string>
    <string name="weather_type_23">Floating Dust</string>
    <string name="weather_type_24">Haze</string>
    <string name="weather_type_25">Freezing rain</string>
</resources>
PK
     �8N]4�lx  x     strings/strings_sv_SE.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'nuvarande tid\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', dubbeltryck för att starta klockappen'</string>
    <string name="weather_type_null">'Ingen data'</string>
    <string name="weather_type_0">Klar</string>
    <string name="weather_type_1">Molnigt</string>
    <string name="weather_type_2">Disigt</string>
    <string name="weather_type_3">Dimmigt</string>
    <string name="weather_type_4">Kraftig regnstorm</string>
    <string name="weather_type_5">Regnstorm</string>
    <string name="weather_type_6">Väldigt kraftigt regn</string>
    <string name="weather_type_7">Åskväder</string>
    <string name="weather_type_8">Skur</string>
    <string name="weather_type_9">Kraftigt regn</string>
    <string name="weather_type_10">Regn</string>
    <string name="weather_type_11">Duggregn</string>
    <string name="weather_type_12">Slask</string>
    <string name="weather_type_13">Snöstorm</string>
    <string name="weather_type_14">Bitvis snöfall</string>
    <string name="weather_type_15">Kraftigt snöfall</string>
    <string name="weather_type_16">Snöfall</string>
    <string name="weather_type_17">Lätt snöfall</string>
    <string name="weather_type_18">Kraftig sandstorm</string>
    <string name="weather_type_19">Sandstorm</string>
    <string name="weather_type_20">Mild sandstorm</string>
    <string name="weather_type_21">Sandstorm</string>
    <string name="weather_type_22">Hagel</string>
    <string name="weather_type_23">Flygande damm</string>
    <string name="weather_type_24">Dis</string>
    <string name="weather_type_25">Nedkylt regn</string>
</resources>
PK
     �8NvW��  �     strings/strings_me_ME.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'trenutno vrijeme\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', dodirnite dva puta za ulazak u aplikaciju sata'</string>
    <string name="weather_type_null">'Nema podataka'</string>
    <string name="weather_type_0">Vedro</string>
    <string name="weather_type_1">Oblačno</string>
    <string name="weather_type_2">Izmaglica</string>
    <string name="weather_type_3">Maglovito</string>
    <string name="weather_type_4">Jako nevrijeme</string>
    <string name="weather_type_5">Kišno nevrijeme</string>
    <string name="weather_type_6">Veoma jak pljusak</string>
    <string name="weather_type_7">Oluja sa grmljavinom</string>
    <string name="weather_type_8">Pljusak</string>
    <string name="weather_type_9">Jak pljusak</string>
    <string name="weather_type_10">Kiša</string>
    <string name="weather_type_11">Lagana kiša</string>
    <string name="weather_type_12">Poledica</string>
    <string name="weather_type_13">Snježna oluja</string>
    <string name="weather_type_14">Nanosi snijega</string>
    <string name="weather_type_15">Jak snijeg</string>
    <string name="weather_type_16">Snijeg</string>
    <string name="weather_type_17">Lagan snijeg</string>
    <string name="weather_type_18">Jaka pješčana oluja</string>
    <string name="weather_type_19">Pješčana oluja</string>
    <string name="weather_type_20">Lagana pješčana oluja</string>
    <string name="weather_type_21">Pješčana oluja</string>
    <string name="weather_type_22">Grad</string>
    <string name="weather_type_23">Prašina u vazduhu</string>
    <string name="weather_type_24">Izmaglica</string>
    <string name="weather_type_25">Ledena kiša</string>
</resources>
PK
     �8N���Ws
  s
     strings/strings_ug_CN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">M -ئاينىڭ d -كۈنى E</string>
    <string name="date_time_12">M-ئاينىڭ d-كۈنى Eaa</string>
    <string name="desc_date_format">M ـ ئاينىڭ d ـ كۈنى EEEE</string>
    <string name="desc_date_format_12">M-ئاينىڭ d-كۈنى Eaa</string>
    <string name="desc_time">#hour+\'دىن\'+ifelse(#minute,#minute+\'مىنۇت\',\'ئۆتتى\')+\', \'+int(#month+1)+\'-ئاينىڭ\'+#date+\'-كۈنى\'+\', \'+\'ھەپتىگە\'+int(#day_of_week-1)+\', \'+#weather_temperature+\'سېلسىيە گرادۇس\'+\', \'+@weather_description</string>
    <string name="desc_weather">\@weather_description+\', \'+#weather_temperature+\' گرادۇس\'</string>
    <string name="desc_weather_null">'سانلىق مەلۇمات يوق'</string>
    <string name="weather_type_null">'سانلىق مەلۇمات يوق'</string>
    <string name="weather_type_0">ئوچۇق</string>
    <string name="weather_type_1">بۇلۇتلۇق</string>
    <string name="weather_type_2">تۇتۇق</string>
    <string name="weather_type_3">تۇمانلىق</string>
    <string name="weather_type_4">ئالاھىدە چوڭ قارا يامغۇر</string>
    <string name="weather_type_5">چوڭ قارا يامغۇر</string>
    <string name="weather_type_6">قاتتىق يامغۇر</string>
    <string name="weather_type_7">گۈلدۈرماملىق ئۆتكۈنچى يامغۇر</string>
    <string name="weather_type_8">مەزگىللىك يامغۇر</string>
    <string name="weather_type_9">چوڭ يامغۇر</string>
    <string name="weather_type_10">ئوتتۇر ھال يامغۇر</string>
    <string name="weather_type_11">ئازراق يامغۇر</string>
    <string name="weather_type_12">يامغۇر ئارىلاش قار</string>
    <string name="weather_type_13">دەھشەت قار</string>
    <string name="weather_type_14">ئۆتكۈنچى قار</string>
    <string name="weather_type_15">چوڭ قار</string>
    <string name="weather_type_16">ئوتتۇرا ھال قار</string>
    <string name="weather_type_17">ئازراق قار</string>
    <string name="weather_type_18">كۈچلۈك قۇم بوران</string>
    <string name="weather_type_19">قۇم بوران</string>
    <string name="weather_type_20">قۇم</string>
    <string name="weather_type_21">قۇم ئۇچۇش</string>
    <string name="weather_type_22">مۆلدۈر</string>
    <string name="weather_type_23">چاڭ توزان</string>
    <string name="weather_type_24">تۈتەك</string>
    <string name="weather_type_25">توڭ يامغۇر</string>
</resources>
PK
     �8N���wD	  D	     strings/strings_el_GR.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'τρέχουσα ώρα\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', διπλό άγγιγμα για άνοιγμα εφαρμογής ρολογιού'</string>
    <string name="weather_type_null">'Δεν υπάρχουν δεδομένα'</string>
    <string name="weather_type_0">Αίθριος</string>
    <string name="weather_type_1">Συνvεφιασμένος</string>
    <string name="weather_type_2">Αιθαλομίχλη</string>
    <string name="weather_type_3">Ομιχλώδης</string>
    <string name="weather_type_4">Έντονη νεροποντή</string>
    <string name="weather_type_5">Καταιγίδα</string>
    <string name="weather_type_6">Πολύ έντονη βροχόπτωση</string>
    <string name="weather_type_7">Καταιγίδα με κεραυνούς</string>
    <string name="weather_type_8">Μπόρα</string>
    <string name="weather_type_9">Έντονη βροχόπτωση</string>
    <string name="weather_type_10">Βροχή</string>
    <string name="weather_type_11">Ψιλόβροχο</string>
    <string name="weather_type_12">Χιονόνερο</string>
    <string name="weather_type_13">Χιονοθύελλα</string>
    <string name="weather_type_14">Νιφάδες χιονιού</string>
    <string name="weather_type_15">Έντονη χιονόπτωση</string>
    <string name="weather_type_16">Χιονόπτωση</string>
    <string name="weather_type_17">Ασθενής χιονόπτωση</string>
    <string name="weather_type_18">Έντονη αμμοθύελλα</string>
    <string name="weather_type_19">Αμμοθύελλα</string>
    <string name="weather_type_20">Ασθενής αμμοθύελλα</string>
    <string name="weather_type_21">Αμμοθύελλα</string>
    <string name="weather_type_22">Χαλάζι</string>
    <string name="weather_type_23">Αιωρούμενη σκόνη</string>
    <string name="weather_type_24">Καταχνιά</string>
    <string name="weather_type_25">Παγωμένη βροχή</string>
</resources>
PK
     �8N���>x  x     strings/strings_hr_HR.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd. MMMM</string>
    <string name="date_time_12">EEE, dd. MMMM</string>
    <string name="desc_date_format">EEEE, dd. MMM</string>
    <string name="desc_date_format_12">EEEE, dd. MMM</string>
    <string name="desc_time">'trenutno vrijeme\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', dodirnite dva puta za prikaz sata'</string>
    <string name="weather_type_null">'Nema podataka'</string>
    <string name="weather_type_0">Vedro</string>
    <string name="weather_type_1">Oblačno</string>
    <string name="weather_type_2">Maglovito</string>
    <string name="weather_type_3">Maglovito</string>
    <string name="weather_type_4">Jaka kiša</string>
    <string name="weather_type_5">Kišna oluja</string>
    <string name="weather_type_6">Pljusak</string>
    <string name="weather_type_7">Oluja</string>
    <string name="weather_type_8">Pljusak</string>
    <string name="weather_type_9">Teška kiša</string>
    <string name="weather_type_10">Kiša</string>
    <string name="weather_type_11">Slaba kiša</string>
    <string name="weather_type_12">Kiša s snijegom</string>
    <string name="weather_type_13">Mećava</string>
    <string name="weather_type_14">Nanosi snijega</string>
    <string name="weather_type_15">Snijeg</string>
    <string name="weather_type_16">Snijeg</string>
    <string name="weather_type_17">Snijeg</string>
    <string name="weather_type_18">Pješčana oluja</string>
    <string name="weather_type_19">Pješčana oluja</string>
    <string name="weather_type_20">Pješčana oluja</string>
    <string name="weather_type_21">Pješčana oluja</string>
    <string name="weather_type_22">Tuča</string>
    <string name="weather_type_23">Prašina</string>
    <string name="weather_type_24">Ledena kiša</string>
    <string name="weather_type_25">Ledena kiša</string>
</resources>
PK
     �8N2k��_  _     strings/strings_nb_NO.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE d. MMMM</string>
    <string name="date_time_12">EEE d. MMMM</string>
    <string name="desc_date_format">EEEE d. MMM</string>
    <string name="desc_date_format_12">EEEE d. MMM</string>
    <string name="desc_time">'nåværende tid\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', trykk dobbelt for å gå til klokke-appen'</string>
    <string name="weather_type_null">'Ingen data'</string>
    <string name="weather_type_0">Klart</string>
    <string name="weather_type_1">Skyet</string>
    <string name="weather_type_2">Disig</string>
    <string name="weather_type_3">Tåke</string>
    <string name="weather_type_4">Regnstorm</string>
    <string name="weather_type_5">Regnvær</string>
    <string name="weather_type_6">Tungt regnvær</string>
    <string name="weather_type_7">Torden</string>
    <string name="weather_type_8">Regn</string>
    <string name="weather_type_9">Kraftig nedbør</string>
    <string name="weather_type_10">Regn</string>
    <string name="weather_type_11">Yr</string>
    <string name="weather_type_12">Slaps</string>
    <string name="weather_type_13">Snøstorm</string>
    <string name="weather_type_14">Noe snøfall</string>
    <string name="weather_type_15">Tungt snøfall</string>
    <string name="weather_type_16">Snøfall</string>
    <string name="weather_type_17">Lett snøfall</string>
    <string name="weather_type_18">Kraftig sandstorm</string>
    <string name="weather_type_19">Sandstorm</string>
    <string name="weather_type_20">Lett sandstorm</string>
    <string name="weather_type_21">Sandstorm</string>
    <string name="weather_type_22">Hagl</string>
    <string name="weather_type_23">Flytende støv</string>
    <string name="weather_type_24">Dis</string>
    <string name="weather_type_25">Underkjølt regn</string>
</resources>
PK
     �8N����  �     strings/strings_pt_PT.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd \'de\' MMMM</string>
    <string name="date_time_12">EEE, dd \'de\' MMMM</string>
    <string name="desc_date_format">EEEE, d \'de\' MMMM</string>
    <string name="desc_date_format_12">EEEE, d \'de\' MMMM</string>
    <string name="desc_time">'hora atual\' + #hour24+\' \'+ifelse(#minute,#minute,\'\')+\', toque duas vezes para abrir o relógio'</string>
    <string name="weather_type_null">'Sem dados'</string>
    <string name="weather_type_0">Céu limpo</string>
    <string name="weather_type_1">Nublado</string>
    <string name="weather_type_2">Nebuloso</string>
    <string name="weather_type_3">Nebuloso</string>
    <string name="weather_type_4">Tempestade severa</string>
    <string name="weather_type_5">Tempestade chuvosa</string>
    <string name="weather_type_6">Chuva muito forte</string>
    <string name="weather_type_7">Trovoada</string>
    <string name="weather_type_8">Aguaceiros</string>
    <string name="weather_type_9">Chuvas fortes</string>
    <string name="weather_type_10">Chuva</string>
    <string name="weather_type_11">Chuviscos</string>
    <string name="weather_type_12">Chuva com neve</string>
    <string name="weather_type_13">Nevão</string>
    <string name="weather_type_14">Períodos de queda de neve</string>
    <string name="weather_type_15">Nevão</string>
    <string name="weather_type_16">Queda de neve</string>
    <string name="weather_type_17">Ligeira queda de neve</string>
    <string name="weather_type_18">Forte tempestade de areia</string>
    <string name="weather_type_19">Tempestade de areia</string>
    <string name="weather_type_20">Ligeira tempestade de areia</string>
    <string name="weather_type_21">Tempestade de areia</string>
    <string name="weather_type_22">Granizo</string>
    <string name="weather_type_23">Poeiras</string>
    <string name="weather_type_24">Neblina</string>
    <string name="weather_type_25">Chuva gelada</string>
</resources>
PK
     �8N����  �     strings/strings_fi_FI.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEEE d. MMMM</string>
    <string name="date_time_12">EEEE d. MMMM</string>
    <string name="desc_date_format">EEEE d. MMMM</string>
    <string name="desc_date_format_12">EEEE d. MMMM</string>
    <string name="desc_time">'nykyinen aika\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', tupla-napauta kello-sovellukseen'</string>
    <string name="weather_type_null">'Ei dataa'</string>
    <string name="weather_type_0">Selkeää</string>
    <string name="weather_type_1">Pilvinen</string>
    <string name="weather_type_2">Usvainen</string>
    <string name="weather_type_3">Sumuinen</string>
    <string name="weather_type_4">Kova rankkasade</string>
    <string name="weather_type_5">Rankkasade</string>
    <string name="weather_type_6">Kova sade</string>
    <string name="weather_type_7">Ukonilma</string>
    <string name="weather_type_8">Sataa</string>
    <string name="weather_type_9">Kova sade</string>
    <string name="weather_type_10">Sateinen</string>
    <string name="weather_type_11">Tihkusade</string>
    <string name="weather_type_12">Räntä</string>
    <string name="weather_type_13">Lumimyrsky</string>
    <string name="weather_type_14">Lumisadekuuro</string>
    <string name="weather_type_15">Rankka lumisade</string>
    <string name="weather_type_16">Lumisade</string>
    <string name="weather_type_17">Kevyt lumisade</string>
    <string name="weather_type_18">Kova hiekkamyrsky</string>
    <string name="weather_type_19">Hiekkamyrsky</string>
    <string name="weather_type_20">Kevyt hiekkamyrsky</string>
    <string name="weather_type_21">Hiekkamyrsky</string>
    <string name="weather_type_22">Raekuuro</string>
    <string name="weather_type_23">Leijailevaa pölyä</string>
    <string name="weather_type_24">Usva</string>
    <string name="weather_type_25">Jäätävä sade</string>
</resources>
PK
     �8N�vY��  �     strings/strings_pt_BR.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd \'de\' MMMM</string>
    <string name="date_time_12">EEE, dd \'de\' MMMM</string>
    <string name="desc_date_format">EEEE, d \'de\' MMMM</string>
    <string name="desc_date_format_12">EEEE, d \'de\' MMMM</string>
    <string name="desc_time">'hora atual\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', toque duas vezes para abrir o app relógio'</string>
    <string name="weather_type_null">'Nenhum dado'</string>
    <string name="weather_type_0">Limpo</string>
    <string name="weather_type_1">Nublado</string>
    <string name="weather_type_2">Nublado</string>
    <string name="weather_type_3">Névoa</string>
    <string name="weather_type_4">Chuva forte</string>
    <string name="weather_type_5">Tempestade chuvosa</string>
    <string name="weather_type_6">Chuva muito intensa</string>
    <string name="weather_type_7">Tempestade</string>
    <string name="weather_type_8">Chuva</string>
    <string name="weather_type_9">Chuva intensa</string>
    <string name="weather_type_10">Chuva</string>
    <string name="weather_type_11">Garoa</string>
    <string name="weather_type_12">Granizo</string>
    <string name="weather_type_13">Tempestade de neve</string>
    <string name="weather_type_14">Queda de neve esparsa</string>
    <string name="weather_type_15">Queda de neve intensa</string>
    <string name="weather_type_16">Queda de neve</string>
    <string name="weather_type_17">Queda de neve fraca</string>
    <string name="weather_type_18">Forte tempestade de areia</string>
    <string name="weather_type_19">Tempestade de areia</string>
    <string name="weather_type_20">Leve tempestade de areia</string>
    <string name="weather_type_21">Tempestade de areia</string>
    <string name="weather_type_22">Granizo</string>
    <string name="weather_type_23">Poeira</string>
    <string name="weather_type_24">Nevoeiro</string>
    <string name="weather_type_25">Chuva congelada</string>
</resources>
PK
     �8N�:Go  o     strings/strings_en_GB.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'current time\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', double tap to enter clock app'</string>
    <string name="weather_type_null">'No data'</string>
    <string name="weather_type_0">Clear</string>
    <string name="weather_type_1">Cloudy</string>
    <string name="weather_type_2">Hazy</string>
    <string name="weather_type_3">Foggy</string>
    <string name="weather_type_4">Severe rainstorm</string>
    <string name="weather_type_5">Rainstorm</string>
    <string name="weather_type_6">Very heavy rainfall</string>
    <string name="weather_type_7">Thunderstorm</string>
    <string name="weather_type_8">Shower</string>
    <string name="weather_type_9">Heavy rainfall</string>
    <string name="weather_type_10">Rain</string>
    <string name="weather_type_11">Drizzle</string>
    <string name="weather_type_12">Sleet</string>
    <string name="weather_type_13">Snowstorm</string>
    <string name="weather_type_14">Patches of snowfall</string>
    <string name="weather_type_15">Heavy snowfall</string>
    <string name="weather_type_16">Snowfall</string>
    <string name="weather_type_17">Light snowfall</string>
    <string name="weather_type_18">Strong sandstorm</string>
    <string name="weather_type_19">Sandstorm</string>
    <string name="weather_type_20">Light sandstorm</string>
    <string name="weather_type_21">Sandstorm</string>
    <string name="weather_type_22">Hail</string>
    <string name="weather_type_23">Floating Dust</string>
    <string name="weather_type_24">Haze</string>
    <string name="weather_type_25">Freezing rain</string>
</resources>
PK
     �8N����  �     strings/strings_es_US.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd \'de\' MMMM</string>
    <string name="date_time_12">EEE, dd \'de\' MMMM</string>
    <string name="desc_date_format">EEEE, MMM dd</string>
    <string name="desc_date_format_12">EEEE, MMM dd</string>
    <string name="desc_time">'hora actual\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', toque dos veces para abrir la aplicación del reloj'</string>
    <string name="weather_type_null">'Sin datos'</string>
    <string name="weather_type_0">Despejado</string>
    <string name="weather_type_1">Nublado</string>
    <string name="weather_type_2">Bruma</string>
    <string name="weather_type_3">Niebla</string>
    <string name="weather_type_4">Tormenta severa</string>
    <string name="weather_type_5">Tormenta</string>
    <string name="weather_type_6">Lluvia muy intensa</string>
    <string name="weather_type_7">Tormenta eléctrica</string>
    <string name="weather_type_8">Chubascos</string>
    <string name="weather_type_9">Lluvia intensa</string>
    <string name="weather_type_10">Lluvia</string>
    <string name="weather_type_11">Llovizna</string>
    <string name="weather_type_12">Aguanieve</string>
    <string name="weather_type_13">Tormenta de nieve</string>
    <string name="weather_type_14">Nevada intermitente</string>
    <string name="weather_type_15">Nevada intensa</string>
    <string name="weather_type_16">Nevada</string>
    <string name="weather_type_17">Nevada ligera</string>
    <string name="weather_type_18">Tormenta de arena intensa</string>
    <string name="weather_type_19">Tormenta de arena</string>
    <string name="weather_type_20">Tormenta de arena ligera</string>
    <string name="weather_type_21">Tormenta de arena</string>
    <string name="weather_type_22">Granizo</string>
    <string name="weather_type_23">Polvo</string>
    <string name="weather_type_24">Neblina</string>
    <string name="weather_type_25">Lluvia gélida</string>
</resources>
PK
     �8N�J�G1
  1
     strings/strings_ka_GE.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, MMMM dd</string>
    <string name="date_time_12">EEE, MMMM dd</string>
    <string name="desc_date_format">EEEE, MMM dd</string>
    <string name="desc_date_format_12">EEEE, MMM dd</string>
    <string name="desc_time">'მიმდინარე დრო\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', ორჯერ შეეხეთ საათის აპლიკაციაში შესასვლელად'</string>
    <string name="weather_type_null">'მონაცემები არ არის'</string>
    <string name="weather_type_0">მოწმენდილი</string>
    <string name="weather_type_1">მოღრუბლული</string>
    <string name="weather_type_2">ნისლიანი</string>
    <string name="weather_type_3">ნისლიანი</string>
    <string name="weather_type_4">წვიმიანი შტორმი</string>
    <string name="weather_type_5">თავსხმა წვიმა შტორმით</string>
    <string name="weather_type_6">კოკისპირული წვიმა</string>
    <string name="weather_type_7">ჭექა-ქუხილი</string>
    <string name="weather_type_8">შხაპუნა წვიმა</string>
    <string name="weather_type_9">ძლიერი წვიმა</string>
    <string name="weather_type_10">წვიმა</string>
    <string name="weather_type_11">ჟინჟვლა</string>
    <string name="weather_type_12">თოვლჭყაპი</string>
    <string name="weather_type_13">ქარბუქი</string>
    <string name="weather_type_14">თოვა</string>
    <string name="weather_type_15">ძლიერი თოვლი</string>
    <string name="weather_type_16">თოვლი</string>
    <string name="weather_type_17">მცირე თოვლი</string>
    <string name="weather_type_18">ძლიერი ქარბორბალა</string>
    <string name="weather_type_19">ქარბორბალა</string>
    <string name="weather_type_20">მცირე ქარბორბალა</string>
    <string name="weather_type_21">ქარბორბალა</string>
    <string name="weather_type_22">სეტყვა</string>
    <string name="weather_type_23">მოფარფატე მტვერი</string>
    <string name="weather_type_24">ნისლი</string>
    <string name="weather_type_25">წვიმა ყინვით</string>
</resources>
PK
     �8Nt�D�  �     strings/strings_ko_KR.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">M월d일 EEE</string>
    <string name="date_time_12">M월d일 EEE</string>
    <string name="desc_date_format">M월d일 EEEE</string>
    <string name="desc_date_format_12">M월d일 EEEE</string>
    <string name="desc_time">'현재 시간\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', 시계 앱을 실행하려면 두 번 탭하십시오.'</string>
    <string name="weather_type_null">'데이터 없음'</string>
    <string name="weather_type_0">맑음</string>
    <string name="weather_type_1">흐림</string>
    <string name="weather_type_2">연무</string>
    <string name="weather_type_3">안개</string>
    <string name="weather_type_4">집중 호우</string>
    <string name="weather_type_5">폭풍우</string>
    <string name="weather_type_6">집중 폭우</string>
    <string name="weather_type_7">뇌우</string>
    <string name="weather_type_8">소나기</string>
    <string name="weather_type_9">집중 호우</string>
    <string name="weather_type_10">비</string>
    <string name="weather_type_11">이슬비</string>
    <string name="weather_type_12">진눈깨비</string>
    <string name="weather_type_13">눈보라</string>
    <string name="weather_type_14">곳에 따라 강설</string>
    <string name="weather_type_15">폭설</string>
    <string name="weather_type_16">강설</string>
    <string name="weather_type_17">약한 강설</string>
    <string name="weather_type_18">강한 모래폭풍</string>
    <string name="weather_type_19">모래폭풍</string>
    <string name="weather_type_20">약한 모래폭풍</string>
    <string name="weather_type_21">모래폭풍</string>
    <string name="weather_type_22">우박</string>
    <string name="weather_type_23">미세먼지</string>
    <string name="weather_type_24">실안개</string>
    <string name="weather_type_25">얼음비</string>
</resources>
PK
     �8N�e���  �     strings/strings_vi_VN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'thời gian hiện tại\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', nhấp đúp để vào ứng dụng đồng hồ'</string>
    <string name="weather_type_null">'Không có dữ liệu'</string>
    <string name="weather_type_0">Quang</string>
    <string name="weather_type_1">Nhiều mây</string>
    <string name="weather_type_2">Âm u</string>
    <string name="weather_type_3">Sương mù</string>
    <string name="weather_type_4">Mưa bão dữ dội</string>
    <string name="weather_type_5">Mưa bão</string>
    <string name="weather_type_6">Mưa rất lớn</string>
    <string name="weather_type_7">Dông</string>
    <string name="weather_type_8">Mưa nặng hạt</string>
    <string name="weather_type_9">Mưa lớn</string>
    <string name="weather_type_10">Mưa vừa</string>
    <string name="weather_type_11">Mưa phùn</string>
    <string name="weather_type_12">Mưa tuyết</string>
    <string name="weather_type_13">Bão tuyết</string>
    <string name="weather_type_14">Tuyết rơi dữ dội</string>
    <string name="weather_type_15">Tuyết rơi dày</string>
    <string name="weather_type_16">Tuyết rơi</string>
    <string name="weather_type_17">Tuyết rơi nhẹ</string>
    <string name="weather_type_18">Bão cát mạnh</string>
    <string name="weather_type_19">Bão cát</string>
    <string name="weather_type_20">Bão cát nhẹ</string>
    <string name="weather_type_21">Bão cát</string>
    <string name="weather_type_22">Mưa đá</string>
    <string name="weather_type_23">Bụi</string>
    <string name="weather_type_24">Sương mù</string>
    <string name="weather_type_25">Băng tuyết</string>
</resources>
PK
     �8NJC�o  o     strings/strings_my_MM.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, MMMM dd</string>
    <string name="date_time_12">EEE, MMMM dd</string>
    <string name="desc_date_format">EEEE, MMM dd</string>
    <string name="desc_date_format_12">EEEE, MMM dd</string>
    <string name="desc_time">'လက်ရှိအချိန်\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', နာရီအက်ပ်သို့ ဝင်ရန် နှစ်ချက်ထိနှိပ်ပါ'</string>
    <string name="weather_type_null">'ဒေတာ မရှိပါ'</string>
    <string name="weather_type_0">နေသာသော</string>
    <string name="weather_type_1">တိမ်ထူသော</string>
    <string name="weather_type_2">မြူဆိုင်းသော</string>
    <string name="weather_type_3">မြူဆိုင်းသော</string>
    <string name="weather_type_4">ပြင်းထန်သော မိုးလေမုန်တိုင်း</string>
    <string name="weather_type_5">မိုးလေမုန်တိုင်း</string>
    <string name="weather_type_6">မိုးရေချိန်အလွန်မြင့်သည်</string>
    <string name="weather_type_7">မိုးသက်မုန်တိုင်း</string>
    <string name="weather_type_8">ပြတ်တောင်းမိုး</string>
    <string name="weather_type_9">အားပြင်းသော မိုးလေမုန်တိုင်း</string>
    <string name="weather_type_10">မိုး</string>
    <string name="weather_type_11">မိုးဖွဲ</string>
    <string name="weather_type_12">မိုးနှင်း</string>
    <string name="weather_type_13">နှင်းမုန်တိုင်း</string>
    <string name="weather_type_14">ကွက်ကျား ဆီးနှင်းကျခြင်း</string>
    <string name="weather_type_15">ဆီးနှင်းအလွန်ကျခြင်း</string>
    <string name="weather_type_16">ဆီးနှင်းကျခြင်း</string>
    <string name="weather_type_17">ဆီးနှင်းပါးပါးကျခြင်း</string>
    <string name="weather_type_18">အားပြင်းသော သဲမုန်တိုင်း</string>
    <string name="weather_type_19">သဲမုန်တိုင်း</string>
    <string name="weather_type_20">အားနည်းသော သဲမုန်တိုင်း</string>
    <string name="weather_type_21">သဲမုန်တိုင်း</string>
    <string name="weather_type_22">မိုးသီးကြွေခြင်း</string>
    <string name="weather_type_23">ဖုန်မှုန့်</string>
    <string name="weather_type_24">မြူ</string>
    <string name="weather_type_25">ရေခဲမိုး</string>
</resources>
PK
     �8N�Z�l�  �     strings/strings_fr_FR.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'heure actuelle\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', appuyez deux fois pour ouvrir l\'horloge'</string>
    <string name="weather_type_null">'Aucune donnée'</string>
    <string name="weather_type_0">Dégagé</string>
    <string name="weather_type_1">Nuageux</string>
    <string name="weather_type_2">Brumeux</string>
    <string name="weather_type_3">Très brumeux</string>
    <string name="weather_type_4">Fortes pluies</string>
    <string name="weather_type_5">Pluie torrentielle</string>
    <string name="weather_type_6">Orages</string>
    <string name="weather_type_7">Orage</string>
    <string name="weather_type_8">Averses</string>
    <string name="weather_type_9">Fortes pluies</string>
    <string name="weather_type_10">Pluie</string>
    <string name="weather_type_11">Bruine</string>
    <string name="weather_type_12">Giboulée</string>
    <string name="weather_type_13">Tempête de neige</string>
    <string name="weather_type_14">Chutes de neige</string>
    <string name="weather_type_15">Fortes chutes de neige</string>
    <string name="weather_type_16">Chutes de neige</string>
    <string name="weather_type_17">Faibles chutes de neige</string>
    <string name="weather_type_18">Forte tempête de sable</string>
    <string name="weather_type_19">Tempête de sable</string>
    <string name="weather_type_20">Petite tempête de sable</string>
    <string name="weather_type_21">Tempête de sable</string>
    <string name="weather_type_22">Grêle</string>
    <string name="weather_type_23">Poussière dans l\'air</string>
    <string name="weather_type_24">Brouillard</string>
    <string name="weather_type_25">Pluie verglaçante</string>
</resources>
PK
     �8N.co\  \     strings/strings_uk_UA.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEEE, d MMMM</string>
    <string name="date_time_12">EEEE, d MMMM</string>
    <string name="desc_date_format">EEEE, d MMMM</string>
    <string name="desc_date_format_12">EEEE, d MMMM</string>
    <string name="desc_time">'поточний час\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', натисніть двічі для входу у програму "Годинник"'</string>
    <string name="weather_type_null">'Немає даних'</string>
    <string name="weather_type_0">Ясно</string>
    <string name="weather_type_1">Хмарно</string>
    <string name="weather_type_2">Серпанок</string>
    <string name="weather_type_3">Туман</string>
    <string name="weather_type_4">Сильний дощ</string>
    <string name="weather_type_5">Злива</string>
    <string name="weather_type_6">Буревій</string>
    <string name="weather_type_7">Гроза</string>
    <string name="weather_type_8">Злива</string>
    <string name="weather_type_9">Сильний дощ</string>
    <string name="weather_type_10">Дощ</string>
    <string name="weather_type_11">Мряка</string>
    <string name="weather_type_12">Мокрий сніг</string>
    <string name="weather_type_13">Заметіль</string>
    <string name="weather_type_14">Зливи зі снігом</string>
    <string name="weather_type_15">Сильний снігопад</string>
    <string name="weather_type_16">Снігопад</string>
    <string name="weather_type_17">Невеликий сніг</string>
    <string name="weather_type_18">Сильна піщана буря</string>
    <string name="weather_type_19">Піщана буря</string>
    <string name="weather_type_20">Невеликий пил</string>
    <string name="weather_type_21">Пил</string>
    <string name="weather_type_22">Град</string>
    <string name="weather_type_23">Бруд</string>
    <string name="weather_type_24">Імла</string>
    <string name="weather_type_25">Крижаний дощ</string>
</resources>
PK
     �8N���na
  a
     strings/strings_ta_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM </string>
    <string name="desc_date_format_12">EEEE, dd MMM </string>
    <string name="desc_time">'current time\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', கடிகார பயன்பாட்டில் நுழைய இருமுறை தட்டவும்'</string>
    <string name="weather_type_null">'தரவு இல்லை'</string>
    <string name="weather_type_0">தெளிவான வானிலை</string>
    <string name="weather_type_1">மேக மூட்டம்</string>
    <string name="weather_type_2">தெளிவற்ற வானிலை</string>
    <string name="weather_type_3">மூடுபனி</string>
    <string name="weather_type_4">கடுமையான புயல்மழை</string>
    <string name="weather_type_5">புயல்மழை</string>
    <string name="weather_type_6">மிகவும் பலத்த மழை</string>
    <string name="weather_type_7">இடியுடன் கூடிய மழை</string>
    <string name="weather_type_8">மழைத் தூறல்</string>
    <string name="weather_type_9">கன மழை</string>
    <string name="weather_type_10">மழை</string>
    <string name="weather_type_11">தூறல்</string>
    <string name="weather_type_12">பனி மழை</string>
    <string name="weather_type_13">பனிப்புயல்</string>
    <string name="weather_type_14">அவ்வப்போது பனிப்பொழிவு</string>
    <string name="weather_type_15">கடும் பனிப்பொழிவு</string>
    <string name="weather_type_16">பனிப்பொழிவு</string>
    <string name="weather_type_17">லேசான பனிப்பொழிவு</string>
    <string name="weather_type_18">வலுவான மணற்புயல்</string>
    <string name="weather_type_19">மணற்புயல்</string>
    <string name="weather_type_20">லேசான மணற்புயல்</string>
    <string name="weather_type_21">மணற்புயல்</string>
    <string name="weather_type_22">ஆலங்கட்டி மழை</string>
    <string name="weather_type_23">மிதக்கும் தூசு</string>
    <string name="weather_type_24">மேகமூட்டம்</string>
    <string name="weather_type_25">உறைபனி மழை</string>
</resources>
PK
     �8N.�r�  �     strings/strings_eu_ES.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'ordua\' + #hour12+\' \'+ifelse(#minute,#minute,\'puntuan\')+\', ukitu bi aldiz ordulari aplikazioan sartzeko'</string>
    <string name="weather_type_null">'Daturik ez'</string>
    <string name="weather_type_0">Garbitu</string>
    <string name="weather_type_1">Lainotsua</string>
    <string name="weather_type_2">Nahastua</string>
    <string name="weather_type_3">Behe-lainoa</string>
    <string name="weather_type_4">Ekaitz gogorra</string>
    <string name="weather_type_5">Ekaitza</string>
    <string name="weather_type_6">Zaparrada bortitza</string>
    <string name="weather_type_7">Ekaitza</string>
    <string name="weather_type_8">Euria</string>
    <string name="weather_type_9">Euri asko</string>
    <string name="weather_type_10">Euria</string>
    <string name="weather_type_11">Zirimiria</string>
    <string name="weather_type_12">Elur bustia</string>
    <string name="weather_type_13">Elurtea</string>
    <string name="weather_type_14">Elur-estalkiak</string>
    <string name="weather_type_15">Elurte gogorra</string>
    <string name="weather_type_16">Elurtea</string>
    <string name="weather_type_17">Elurte arina</string>
    <string name="weather_type_18">Hondar erauntsi gogorra</string>
    <string name="weather_type_19">Hondar erauntsia</string>
    <string name="weather_type_20">Hondar erauntsi arina</string>
    <string name="weather_type_21">Hondar erauntsia</string>
    <string name="weather_type_22">Kazkabarra</string>
    <string name="weather_type_23">Flotatzen duen hautsa</string>
    <string name="weather_type_24">Lanbroa</string>
    <string name="weather_type_25">Euri izoztea</string>
</resources>
PK
     �8N�7�(�  �     strings/strings_ca_ES.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'hora actual\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', pulseu dues vegades per obrir el rellotge'</string>
    <string name="weather_type_null">'Sense dades'</string>
    <string name="weather_type_0">Clar</string>
    <string name="weather_type_1">Ennuvolat</string>
    <string name="weather_type_2">Calitjós</string>
    <string name="weather_type_3">Emboirat</string>
    <string name="weather_type_4">Temporal fort</string>
    <string name="weather_type_5">Aiguat</string>
    <string name="weather_type_6">Pluja molt forta</string>
    <string name="weather_type_7">Tempesta</string>
    <string name="weather_type_8">Ruixat</string>
    <string name="weather_type_9">Diluvi</string>
    <string name="weather_type_10">Pluja</string>
    <string name="weather_type_11">Plugim</string>
    <string name="weather_type_12">Aiguaneu</string>
    <string name="weather_type_13">Temporal de neu</string>
    <string name="weather_type_14">Flocs de neu</string>
    <string name="weather_type_15">Neu forta</string>
    <string name="weather_type_16">Neu</string>
    <string name="weather_type_17">Neu feble</string>
    <string name="weather_type_18">Fuerte tormenta de arena</string>
    <string name="weather_type_19">Tormenta de arena</string>
    <string name="weather_type_20">Ligera tormenta de arena</string>
    <string name="weather_type_21">Tormenta de arena</string>
    <string name="weather_type_22">Calamarsa</string>
    <string name="weather_type_23">Calima</string>
    <string name="weather_type_24">Boirina</string>
    <string name="weather_type_25">Pluja gelant</string>
</resources>
PK
     �8N�:Go  o     strings/strings_lo_LA.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'current time\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', double tap to enter clock app'</string>
    <string name="weather_type_null">'No data'</string>
    <string name="weather_type_0">Clear</string>
    <string name="weather_type_1">Cloudy</string>
    <string name="weather_type_2">Hazy</string>
    <string name="weather_type_3">Foggy</string>
    <string name="weather_type_4">Severe rainstorm</string>
    <string name="weather_type_5">Rainstorm</string>
    <string name="weather_type_6">Very heavy rainfall</string>
    <string name="weather_type_7">Thunderstorm</string>
    <string name="weather_type_8">Shower</string>
    <string name="weather_type_9">Heavy rainfall</string>
    <string name="weather_type_10">Rain</string>
    <string name="weather_type_11">Drizzle</string>
    <string name="weather_type_12">Sleet</string>
    <string name="weather_type_13">Snowstorm</string>
    <string name="weather_type_14">Patches of snowfall</string>
    <string name="weather_type_15">Heavy snowfall</string>
    <string name="weather_type_16">Snowfall</string>
    <string name="weather_type_17">Light snowfall</string>
    <string name="weather_type_18">Strong sandstorm</string>
    <string name="weather_type_19">Sandstorm</string>
    <string name="weather_type_20">Light sandstorm</string>
    <string name="weather_type_21">Sandstorm</string>
    <string name="weather_type_22">Hail</string>
    <string name="weather_type_23">Floating Dust</string>
    <string name="weather_type_24">Haze</string>
    <string name="weather_type_25">Freezing rain</string>
</resources>
PK
     �8N�g��  �     strings/strings_mt_MT.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEEE, dd MMMM</string>
    <string name="date_time_12">EEEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'ħin bħalissa\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', taptap biex tidħol fl-app tal-arloġġ'</string>
    <string name="weather_type_null">'L-ebda dejta'</string>
    <string name="weather_type_0">Ċar</string>
    <string name="weather_type_1">Imsaħħab</string>
    <string name="weather_type_2">Imċajpar</string>
    <string name="weather_type_3">Imċajpar</string>
    <string name="weather_type_4">Tempesta tax-xita</string>
    <string name="weather_type_5">Maltempata tax-xita</string>
    <string name="weather_type_6">Xita qalila ħafna</string>
    <string name="weather_type_7">Maltempata bir-ragħad</string>
    <string name="weather_type_8">Xita rxiex</string>
    <string name="weather_type_9">Xita qalila</string>
    <string name="weather_type_10">Xita</string>
    <string name="weather_type_11">Irxiex</string>
    <string name="weather_type_12">Xita bis-silġ</string>
    <string name="weather_type_13">Maltempata bis-silġ</string>
    <string name="weather_type_14">Dbabar bis-silġ</string>
    <string name="weather_type_15">Maltempata qalila tas-silġ</string>
    <string name="weather_type_16">Borra</string>
    <string name="weather_type_17">Borra ħafifa</string>
    <string name="weather_type_18">Maltempata tar-ramel qalila</string>
    <string name="weather_type_19">Maltempata tar-ramel</string>
    <string name="weather_type_20">Maltempata ħafifa tar-ramel</string>
    <string name="weather_type_21">Maltempata tar-ramel</string>
    <string name="weather_type_22">Silġ</string>
    <string name="weather_type_23">Trab li jvarju</string>
    <string name="weather_type_24">Arja maħmuġa</string>
    <string name="weather_type_25">Xita ffriżata</string>
</resources>
PK
     �8N               weather/PK
     �8N�9��       weather/weather_0.png�PNG

   IHDR   �   �   ��   tEXtSoftware Adobe ImageReadyq�e<  &iTXtXML:com.adobe.xmp     <?xpacket begin="﻿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:9D37EFA9474E11E7A2E38C21EC31C084" xmpMM:InstanceID="xmp.iid:9D37EFA8474E11E7A2E38C21EC31C084" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:BFAAA713474D11E7A36DF4B7D635BCE0" stRef:documentID="xmp.did:BFAAA714474D11E7A36DF4B7D635BCE0"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>̡�?  �IDATx��	xT���}��L&3�L2� � �(KX���Zei�l�dik�ZіRi��R�K�*Z�R��VP�"tQ���X	�� d��LfKϝ6�@2�L����?.	�$�9��;w}�
��B��u�>T_	�C!|(��B�P
��>
�C!|(B�P(���P
�C�>B�P(���P
�C�>BE/	CУ��^,b��B�&�]Q�E	�]�>J+/�;Ҋ�PF(&V&��%�t���y�	#�61�l4Kh�(�J��R"B���]#�P�h��B�Uk��_9��R�N��X��L��]x�?\�U��?���2�E��70c��e�Jl��$�D�"�)���r M���~s�U$YB
���%)rP�N�<��g��e[v׽�PwF ��s5���s��!15I��Z7zB~N´$�TYmt��UȎGZ�r��*ߞ�w��l�]�u�"���3_�c7��A��c�&υ�4�Ќ��$�c��Vn�{���B���͊��p�����P� ��ۉ��:��Z8Ғ��ޑ�r2MMFa���x�t�oK��ʗ**�Nb�ۇQd>������%G�o~0la�ð�\&�1��Kmmcp�]�|�yǞ���֘eB�/j���3��3b� ��{�@R�頪�y�1�ۅkNlz���bՊ��>��l6	��n7:+!�e�c�2�9��{���;�~�	1�b���:��j{f���Y_H} �(�����n�QC̏;_����7�+���/��z�P��%~jX�����ii��;x����MS�^����ŀ���=𒶮Qt`۸�Y�)%�~w��{��������@�ާ��EF�$�~.��������m�1�g+i��1��,xf�b6�6a]���%Y0�ńņň�
��9�,�}��o�=5IZ��u,#+3�v�϶~�����j���	ԕ;#�~�l�.h�̃��*؅�u���_���@���	n�aߝ��RJ�T
1��5�R<����gNq���HE&v�Ι����aĲ<� 
q�uۚ�q ޳^P@�f|α��,����йxbEޘ�צ���@���͖�.�2b{2�3_������dF�f�6 :=V��nb���0��I�#-г�h4�D��;!,�,���z���,�=>�gf�P���F,�,�,����t칢�q 9�b1>����{r.�g���qU~��>D�w4|��>�Z�+|�A�K��?�s��ؾ�XC�׳؇�D�K�lyd��le"ѻ������y��3�ș��������{GE;��|���� #b�gկaƔ����~���m�f����zx���?�G���������^b^0Oh7�O�Y7�d�"�>ӏ�̓�f?^�J��`t���x��y�O�W�,�]/;	ē�����0Y�>�6��tp
M�o1�"m�� �������P�o�e�G3Iۖrq�%7+a!Z�o�G�"�z������i4��yļ���/�%N)L����!�{+�,.�c{ '[�h+�[��̳��;���m��~$$<�H�v�����!���R��]Ǽ�>���ϣ�|	<��O|bE�0�D���|�������'�
�iZ�}"Zɧ���O�J��+|�����T�]1!�/��-|�	B�ȧ��B^���Fl�q��~M����B=�'�Z2�m{����+�ι�;�P���N��񭰇��g����>����>�l��}|<d����ǎ�G��x8�G�Q�)h���O�D|P�{�������G)�Ih�m��#u�	���~��%|V��{�,<�'�#|���V��o�����G�4��{�T>�#Z��9|Ds���(ĉ��-�y�|�ք�q��5��j5h��3/����WN�}|<��>�٥�A��x�������9�	��o�=�"|z|NB���ʯ���ݹ>5!�(I%D�|�h�t�IvBخ]�����B7��FB�g����Zކ�"1=�tz����<§�Q������.'�9�D�M خ�KEx�J
!��D��4��Dr�&R��N�b޽V�ܪ����u�<>�"�*^>՘I�o�,W��ۢQG� �`�bbhx�H�/"E�xw�y������ P�,�RXJ|#~O�������kp�ﾅx�7Ռ�uGa︅���;��;�v �Dv���bT���o��$�� i�Pa���V8:~�����]�>�r������W/Dt�'��kH'�����)�体��W�k�e?�G����Y�o��^/�u���o�.�\��?�������G޿�����/g5��;�e]�*���=����]G�������9\���/H�M�6�7���ݠ*�c��C�#�9���;4&��6M��&�Z��U���:��>�����XF9tuUT"��+�����9������_�ȂQ�5BᏨ���4�`"�\���S ����#�B�������s$I��%�����!q�t�Ʒ>�#��N�Yrr���8�	�B�C�͸�Ʀ�2o-H���P�G�W��w�)�VW���%���;|��+��Q������IOL���&a������|'�|�����n��՞���3/��w�yk�N�RC�h�QOٯÌhp�>ʗ��9F�Տ��-x�J�V��hs�U�^�|&�#�gp�{�e?~l���2����z~�|c�O��������!�ìB �Q��	V*|�?w5���9h��,��$�z��aB����S��ϥQ�� ���
�U�_����6Ҷ���c�7\�c�Q�۸_$ �K���.�����v�^�']��K��>pL���	�\�y.�G^���f��5|�+�y�����-�e��yV�3�X���ZyITI@��Ti>Ҷ��eK���e��Z>z��G�ڡ�,;�h4խ��SEi$��p���JL��k��B��:���ֳcO����z�zj<�'���v�i����*��?�8�7}p�{���'x���}z�/��l���4�)���[�S\��l����>� ���N�#|�-7���m2�5 �ɣi������".b7�A���[�_M�1��]�����=����D�JT���H��D.��ډ�<��yu���x���Su��g"�˨�P3끩\T�����U;��/u7oz��l��*<��z���eY>������< He}o;�����=s����0������n��#�Y�R$�� ��˄z�O��g�v��3o�q6��c)���dB�n��]yZ� `3 ��Ah�U�ת�v���ٳ����tY������}��P�օ爤��`k �7��+�?����;�~�b��o�:^k�x�/���O���w���W�].@�ڜ�1��*Wj�TYW���}+�8=s��'�x<��~���z�;��- }��MEHrj���EG#XO�O�m ��Y�^�CO�;����1�~y�W����oU�����=����xj���>W��'A��=q�{���w�甧:�)� _��N��_�{���@��E�:��\2���i��`���4��?Ao�>�3A�����6��- ݅�@�x<T9!%55��������o�;;DRAmM4��7b@5?1V�'"�x��]��)�~����l��"��o����q۸��1${��O�u���ڂ�H�aU�6˂�F#bL;#��$1}�\౥����Ậ��� xg{juJ�|�Ų^��U��.��-��SDQ̊x̍�-��jg�����!�����}Ok���}_�W�s��������U�_^=�������l�E��x����5b5Q��ٖ����L���J���1��0�`0�'�L��N��hT"��=IDS#���lo�K��Rv�7u�[{��=W�o|�gMLf+��O"q  �u,�ؔ@d�V��"�R��FJ��%�[6tq�øHH��`�4�46��ȇ�v�i`�x�;@���A�ـ�����16Ƕ5�_��2-0�Xb=���j�[��s��}�أ�X��n/��B3q�C��}v\��U�Qoِe9�#�[[����у�m����2��꡸,Ա�nLz����/'Y�Ȉ��`�@�w��-���=7�}lu}����@,z�����zpf*['x@d�K�a��;��Xtc���c�-Q�h��p��K�v��ˣ�;W(ۼ�v���f���[�õ�y�+f��ۇlw���iJa��G��e'��mb��$��%
�!�$�j����C׮A����F4���&E��)�^�r�B�R��Y_�[�g!^��5�bގ�j�ۛYjW�p�+!�ȥS��(�"�+�no�(���j����T'��P
�C�>B!|(��B�P
��>
�C!|(B�P(�����  V�zW��d[    IEND�B`�PK
     �8Nb�l�P  P     weather/weather_13.png�PNG

   IHDR   �   �   ��   tEXtSoftware Adobe ImageReadyq�e<  &iTXtXML:com.adobe.xmp     <?xpacket begin="﻿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:DC379EAE474E11E78D96877FDF53257F" xmpMM:InstanceID="xmp.iid:DC379EAD474E11E78D96877FDF53257F" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:BFAAA713474D11E7A36DF4B7D635BCE0" stRef:documentID="xmp.did:BFAAA714474D11E7A36DF4B7D635BCE0"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>T7H,  �IDATx��]pT���~��tI��BiP	��j�E+j��֎3Z����P��<��(�(ҁ���R�fx���eKєjx�GA�,I����9�_�������ݛ����������s��6sB
�y>ig��#d
D>��@�#�|"�@�#�"��G �D>��G �D>��@ ��|"�@�#�"��G �D>!uX�
���������&�b��>��z�����Ž'�e:xl�n�f2!�\H�ٳg�-Y�����`���)��l��e��lv�?{\y�h�h4�����Dڻ����?�C���;�t0"�oh����|�K8�l�r����cǎ����b�Z�g�.����\������ѣ�VUU�aҰ�!B�o��M&�p�͛7�;�xxРA������ �sss�N��- ��k׮�ihhXi���0@�o�H>F:���o7n�#��<�h8n=r��K@��
	,����ٹs�tPO���/�>x �Ǡ9s�^F�0�K��̛7o�������u �=�1���F���J�� �/&����~PRR�3�=Hύu�y��ɕ�G��`D)8`$�SQQQ ��#G�\�w��$4��y�2���x��l�2����=��s�NT���c�!��2dß��n񚚚n�^���.9����W���i�ރ��H��\�>|xnee�:#�,,��d	h5:�ƍ����i�2Aٰ����\2vL�l������ۻw�-�H�ZF+�mEoo�/��J��+8������={��fMN��g�jB�|�ܹ[��;T\���յo׮]�͙3���fNE>\�2{���7�xc��b��#|Q��p�#�Ϸ:+;	�D>mɗ���Y�r��߄�;
ڰa��=�X+���38�n�w�ĉG�^��1Y����_1b�Z&3���C-�n�.]:������+Ep�-�ۚ��B�?7I>R�������,��ڵ�p�_���z���JI�j-]�r��+�����$�r�]�l��F�R��'n���o766��/0�m>\�|�СYD<M$���۷����W�O����u��.gΜ�1|�!�IK=[}}}��n/#�h��Ç?�iӦ	P�N���ɗw�������M���P������3�|�p���TU�P������[��>"_��s@��X,�|�Jz�x���8`�!�	��cƌ�MIp�~'��|�u6�$�Hz�ߌ3~�N�U���y��555U����#� ������J��d�&i
k��.??H[[�����Z��ᬧ�|���y�^=��^,<'�\<�@�#
bi�D���*��H/�=w֬Y[;;;��|��'��qN�eX�j�m���m�@�'y��v
����XRR�"��2,������~�kS�LY'C���'"�>�EҒ�'�W�4�җJ[.��DD��h� ���.�[�:%ޠ;v�TSS�&ζ�U6*�!9���D@�axyUM�χ\�i����_�jU-��'x��aȇ���|sn����M����.NĶ�$�41{P�4�%��$�˿�m(dיd��'aF�2i�l����YXX� ��/�u�V��O>y����Ʉ��H+5Q�tT�O2>Ii�F�*�h�!��{�k/^���h24�x������S�@���͛�	l����Eo��w�}�F(��t�'ҋ����������+jFa2.�Ю�έ�޺��O��T>�{�u^�z�b��~(�X���O��Su���G8�� ��v=[�n]�z���v�L�I���?I�G*��4�
H�Z�%�s	q(��
���,**zd����B�]����+++_���<�������z�辷��<y�S�����.52��*N���t8��d�FI}H��wh1\	�_���T���a󴼌�OF�*U�RaRIG��'�7�<����;�Q4��I���z����.2C��vW.]�tH??H�^=J>��]�n��l��ܻ%��Hg~衇D�U��+**�!9aL<x:�wC�.�.�D���'	��[�dIH����Q=I>{cc�T�ٜCjʰ�T[[;>�z�|��c�N�������?��[W������%;�&N͸�زw���B��-�O�x��%����r�J���	�k�^n'<w�fLJn1dT�8���j|���q�x?]M����	�ɋ�/5m(5�'�WɜsT$��_���T��&�L`�QAN�/��1�����R�#�0�J�+W�T����7;���;�Ch��36ddJ�Y�|�kc�I>��g|D�ш\;g���C��2��L�O�I�B	=�A������M�����\	C6���j*5~�!*��چ2��&.�m��,���ߔ T���Xw����~]�\���	�CL��������A����'�+����8��'����
���b�c����C�w>�l�e����NOO�E��L��7��������+#�G*�\<r�J�O6n����lY�����>���"�r��ta���駟~�m��G�ȑ#-M�������ϐó�1,
��W��K8|2''�;�鸬�q����?���WCMe<\�re�w�9�7�������'�dHY�n�[��P:ޓ	�M���v��d�qp�ڵ}C�����J��{�mmm�$)���ؾ}�o�SщU=%��r^�ti#H�"�ُ����Æ[ Rϯ�F�j	�577�fL��b�F;�~��_)��t!�rA�-����Z��خ6�͎P�����ŞǇ
'v�g⎺�x�_b�b��G,obyʟ`#���G�~��;�L�5�����p�o��z|>_�=��3�l6Ӹ_����-))Y��tҌ��G*466�{���!rź���8����pR���S�L^�LbG�����_�^�m���i$9u�}�=�F�fz�9��A�,��曟����	v-V)QN�0kN%9��9%�ҊOOhّ�>
��ʒ_|�RD4I�$R��<EE̴/��.,_��	g�{��|�� �΃�0a�|�7��?V�F �c��n�"r��1�H��qQ��JmJ2	C�ѕl��oR!���'V7�,���/���g�y�_�^����Q��ڿpҤI?ХP�ɩA5����I��+L3��BԦ�z�u(:�x��'V�^}�V����S����믟����l�d��j,o���߿��ڔ�����kx8xMMMa]]�cC��)�o%�ȕS�+x��b��c�à~�ؠ�ԅ0r�(͋ڋ_����@������:q��7����zSm{�_���qOCCô�ӧ?�p8Fd(�V X.v�W�-�1��C�]�zu�E�^Y�~�)5�xYM�8�].װݻwW����$ُY4��{�Λ�r��H��m۶�?����ġ-�]֑/^Ç�I8+//o�����GU{����>�F��,�\4��p���+V�$��t�N�����b���ڰaØ����`�t:� ��aܱ���Ӓ"�r�J3���Ȇ��|v���G"������ GW�Z�7�c_�����vp�#!�V�����ff]���ٹYE=Errr̖j����Сd��>a����8��&�U�'��~�*�շo�
��P��p��$�N)�
���D��noooV��'�J�d��x=���@��V �Π_Nf��
��p��:��g�����'-���>��ܳ�>�
�uJ�x���J���������ŭ��߻z��+����w|�����H�N��T���������w�ҥ�~��~�g����YX��C�o�9|�~�o��n*�]3��'ǎ�s�]�ˆ'���M(՚���8�R5����'@��(m3������a�x@���P��=(�/Y8�m��9�!�O]]�,N���J�(,,��R�̯��G�V��9Z��t:GqY:KE��~�4��p��`0ئ�3��!��@�ܹs��zf~CD>������aR��e=p"!e���|�-[�X����,B�<ݘMЈ|_�r���{[[[����-��;>�w\���p4i���'s�3*�f��/g8����U��`ΐ ��Y)E���3�G�K���V[��I�x	"A�t���Ң���J��;��r]�ϡ�z����5jT�����ӽ%1[@�|�������TVV6���x�f�~�g���c@�Ψ
���@�y�\N�s���`0x��o|�رc��`��P�l< �T9�!�T�͛7O�0��6 �m`1bD�R�̯�l>����6J=3�"!�S�|ڑ)�U��^��D>��q<��������p�т�(r~����"�f���ŋo r��"�A�Tc4Ȭ���L6��e˖�z��IN�s#�%P��jkk$N��Af"_z ������>� �p�!#�l>��@ ��|��@�#�|"�@�#�"��G �D>��@ ����0 �&���L    IEND�B`�PK
     �8N_@��E  E     weather/weather_4.png�PNG

   IHDR   �   �   ��   tEXtSoftware Adobe ImageReadyq�e<  &iTXtXML:com.adobe.xmp     <?xpacket begin="﻿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:D53E8C814B2C11E7827DEACBEB1DBF30" xmpMM:InstanceID="xmp.iid:D53E8C804B2C11E7827DEACBEB1DBF30" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:F04902ED474E11E79AD1D1248EDC18DE" stRef:documentID="xmp.did:F04902EE474E11E79AD1D1248EDC18DE"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>�㈳  �IDATx��]	pי~=�4#�.p�d�
(�b��Ce�%6�`p�w\[E�c�6)�JX{���u�#�7�l(��*d��&�,&`�2`ÆCh���\��?у���94==�W�jz����_����qA Rɇ@�!H>��@�!�|���C �|$��C �$ɇ@ �H>��@�!�|���C �|$��C �$ɇ@ ����a,u�eg������"��,�0�� 8��yF@n4���K9���-�nΜ9y+W��+..��t:�Z��R��\d2���&�%Z�eY8��y<��=��g���w��������"�P^��¤��I�\WWW�������pL�X,�xm¡P���=t������������4"�t��tT�T�9^{��[x����͝	�
��H<��r������j��;v�i��I�ˤzLFk>�t΃�7iҤ%v�}b
bl �ӱc�~�� �H���X���4�={f��{�f���ʃ�s�ow�u�>����/#�Z��r�.]:��v���а�W����@e�^��Q��hv��"ڮ���GO��\�wS����7n\�^� j>u�䬩�)�򟕕�?�;�"��Je���<靘2�x�[�l�z����N�=:1��ŧ2���E��]�:;;�V��]s@Yy�U�������G��s�w���ӧOo1�ɢy�y�y2���x�&Mz�`���<A�hw��f,�6L��>$�po߾}��K��A�h��5���_����S��ұ侾������>?j :�3\���&Z1_�`�V����Nl�x<�;::6̝;�HFNp�㛂�ϙ3���7��e6�G��bǏ9�+{x"�K�������z�xq���í��?{������8_ ����>}��eee+�c��;w�7����y-�O���B���U�����t9�J�%%%O��x���q��hn��P��MMM�֯_�%��N͗��������W�T���2v͚5oA��A(˳@/j>��188���:��<={����ۿ�R��:��|���YH��h���۷�����%����pN�0៑:����={�'p����zֶ���6�m�&q=z�7m�4�7�|��˻r�ʯ���B�$~�����x��e��Þ��ӀTIB������_هf7�k�C�4���B�Jr�����v�;�|"u㪪�9ȑ䁮����~$��l�N��Hr��w��X2�_Z����7����L�-ȏ��Է�رc:��7MJ(,�B����������Y,��|K����9�V=�\*<�K)"GtsP*MF"^�ҿX��z:8�0P�Y�fm�h���+���I�a�EWKd�74.��9h�Ѩ�R��|�Ν{����E"��eȮ���+u���M�֢@<ᆌBG$���{�DZr��d�KS)}���d�dd��O�]��4��<o޼�D,Q��x��v������Aݎ��RI	HT�$��j�pd�L��n�������߯]��xO_P3l�K�w�ȑ���v��?����X��Hԭ�L=M�>(VF��=F&]NB~��!��o�tT�B�2ӕro��ƣ�#���٥���/WWW7��1+R������h1NA�)�XNAF�k� �R^��䈊�2�E*x��7477���;Ƥ'�>|���c�>Mp�Դ p�ҥK7Aݜ�����K+����w!�&�?	�\x<�N����pٛVf��W���{�/���������XeQc�I�y�%OR���_��Y��ӳ�h����ܺuk3ߪ��u����
ME7Id��XZ�rrH�ɪ %�е��<'Qq���aE�e��%%%K�~��piK�K�̞>}�oIz홇7�����Hh~ukvS�N}��<�����h#%S�Y�U�X��*3�W0��`Ŧ��~�$��O>�ˏ�r
�?��],Z�I����Uf.������]/)%_YY����@7���pL_�jU9QqZS��g����j���f,�0�i��ŏR�W�9jjj~�Utc"??��N�i>Pϵ�%��x��/�r��%~��|����Z�ɔ�fʰ�y�G�_ٵ��C��?��dءǙ����jr�`l]���r����|��4����/zjG����ݏ~&��K^���<E_�ܲ��+���
�k�Vn1Q�ʤ�'�4���O��-�TB'.c���$��49�����Q?%�������'��ڤ7��@}� A������#�S��V9�r�ͯR�]K��������Mh��gl(��J�Y�|���u����`Y6���S���@� Q^�0����1i�(��4f�u���4�o:풩�ƻ_K�
�X����(F��ΐ��a��6�ҕ"7K���Xw�c���eh��@*�H�;D���}�_,��~T"F���9�����W&����8����sRa������HypJ�u�E�MĿ�����tB��_���RA�p ��n@��� �_��0b~��*ţ��\�X�V+��u�y�/��������}}}�;<����t��g�]��8v�����Fv�͛7�~5���H�߿�G�#D�K Г���}������n������F|U�Coo�~r�s�7�K����O��ɐ.����6ms���I�I��l6[�
㠿�QQѓp�����N��ƻ���PS���}����-������1/^|�_	��G__߾�#G6��;rO�;�|��]]]�����ySu��q,�<������������.�����ґ����P��~�W%ܘ:F�Nj#k��Ro�'l2g_5���yl���c}�2
Ӕ�G��h���$&��K�x&�\���w�T�^�8q�T��ɮ��óp���`0H�Z0r-v?Z[
V,�����C��1�1�G˸����Җˇ�R���ʧ��x��W�������k�&�^�Z�_F�����w�y�_%�XW���KT��[�p�yL�,�X�/ЀkzO"!�[��ٰ�����m�&��)�2��%(�絘�Tw2Gp�ʡ���3f�x�\[r'�ٵT��Dz3k���bӜ�al��_{"XOF�e抅�_c����r����%:>F�G������
eb%�i���.�^��g�<�"
�tK>��> ����O�<�)^6F⋕:HlwuN�Č�o�<&�-��Nc�ٷ��З"�D�*�(�!��KW��G�?�A+��O�l贸����K���s�}N�p�\��[[[���C�VA��G�n�ewu�����Z�dL.)��Y.�C4l%�`՞��f=9�K�0�q����+V,kjj:>��c��v}��s�ƍ��ϟ���j�j�|fs>�� 7:�}y�-Z���Z:U^��+]w��t��l޼�񂂂�$�;ĄS�O�V��%��V���lA2$4"8�H�y�iT�B������2`fN�:�ʔ)S�$��^Gwqiy��3�QB����5j�/v���SP�_J�KԚ��v����zY�?:�L햳j[�Jy�g+[��������O,�����]����~��:���?���&L�0�n�W��ɩ�oNv'�#�dA�l��pv�]�z��m۶�-[���JI�҂|���sþ����M�gΜ9+//o����%ar�.ق�G6(�ĦϘ��y��k&��α�$f��/\������/���W� ]Z�Oh�i�HH'+gkmm�����
��ʬ��b��R�tDN2�_s<i�5����g���rc�3[*"�1��R>"<�\�qEͲ�'
����y���5��ڵk��E��d��?�O@B�^�yr��#|^�|=�IPcʺ�͞���l�:W�l��pF-�����Y����`��[ʊ~��b����k�͐́D�"�䋧�~�.��u��[��4�Ҳ�����f�r��^���0����ٛ�m���>�t��0zy���֮N�����
����*਼o�SD�8s���g�t/\$�<���>ߠ��S'_!*g��h=ˬW��f�ɝ-Yp8g�f��~�|���-3��
z=�+�t���[n��N&^�W~�=���ǉ�36<M˖�|�NIs��u���	�zLф��P����מ�?��5�4�ϸ�����3m����_����涏:�>J�����a ������k��H�a`2���K�D�'���>�0gwk���"(7�ʦ�(��']��oWթ��W^����8�	ɗ>�x���{V~A�j5�̩!
g]��E�Vf�m�Z��"��Og��0V~G��;D���GT�|�D U#*H>�Z�N�4�$�1������e���,��*[ԩQA��x9�w�ip�U<�*+_��]w�{*�ۈ
��xĳ|�{�K�;�E��1S?�7U��V3`�GTR
�"K����3���

����RV�$�٧2�n�SQI�|�DC�{2U��I�5r�@���j4�0����52b(�O�u�L���ӡ�˔I�H>}i������2j(�O_�e�ɇH2j(�O_ȨI�H>��c&ME��ާ���ɗ(d�$P$���Q�@�|:B�ME��3	4a]X	�~�u�̙�,|�]���֨��Vk}Oy�����̻���/��$�D'�&�L%'��n���ɤ�\����@�·@�!H>��@�!�|���C �|$ɇ@ ����` ��ރ"Y+    IEND�B`�PK
     �8N�AZ�l  l     weather/weather_12.png�PNG

   IHDR   �   �   ��   tEXtSoftware Adobe ImageReadyq�e<  &iTXtXML:com.adobe.xmp     <?xpacket begin="﻿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:D098696D474E11E7ACBDC6EA836CA91A" xmpMM:InstanceID="xmp.iid:D098696C474E11E7ACBDC6EA836CA91A" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:BFAAA713474D11E7A36DF4B7D635BCE0" stRef:documentID="xmp.did:BFAAA714474D11E7A36DF4B7D635BCE0"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>�}Z  �IDATx��]pT�����&�M�&$!4� ��@�iFE,U�`��SZ�"Lˠ#2�G-�V@�XP4���Dвc1��B�(!�}fo�C��e��ݻٻ7�7sf����{�=������B � M�-f"^@�!�|$��C �$ɇ@ �H>ɇ@�!H>��@�!�|���C �$ɇ@ �H>ɇ@�!�C�Y &&�t�ǫaBt�o B'?O�u$_�@�MP,�4B63!��ɓS�,YR���9�j���l�N�[��Z@��>�h�@ �����������s�/���w�}��!�d==�kF��H8�٬D���Ԍ8p��-��^��h�h����/vtt|~�������0ڰ������~��p�7�x���sϯSRR���4�����l6[�ȑ#D����z����U��+��.�|=D�1��=z�����6�LEq���^��Ǐ�H�aO!a�%�Y���?��3F��'
�Hx
���&L8ȐЋM-�2��s��)hiiym�ر��x�J�IHZ M����4����S��j�����rss���%�M[}}�ꂂ��jԂ=F�Ѭ�#4�����U:����������/񈗲m۶�G���j�ޡ+:�$͐��wH���n񪫫�Z䋉�9 �ڡV>����C�ߊ�O��/��>jԨj0Y�Ȼ�wR�ԫ�x�~Ae�i$��Fޱ"T1R��K&7�Շ��n�<x�(�*}G=�۪���?1�>�(�M�/�����|���x)�vߩ��#��8�ӧO߮�ڡT����퇪��6M�2�ߔ�zNTE>2
e����o���^�N�A!��f��[�t:�Bee?CB7�O^򥷵������{v{<�c7n\��O���6:���!��Ξ=�ۜ����c��444�ԯ_����˸BU4�s�|�������W�`�����J�YZZ��gA͇������,X�`����!���ZeW�ֳTWW��+F*E@ �>���;�V|/��y `j>����vd0
�JQi���&M����������#���;6�'��۽{��k�|� ��a4h��:�.�ϟ�=�MF��k=Cyyy��h���}����-[�B�&���M�ԫW�����zRF^x<�/,˽P6WP�Ô��<���5��9r�ff�/L� sJu:]:R%6Y<d��`oE��ƅ����#��E��[��|�y>�0�Hl�߸q����K(��y�TWW���#�Gl>�m�H�%�h���'
��������ggg?����25u��7�&O�����\�S,�z����85ϥDʳ��PK�w�m�ĉ����>Y�r��p|��q���Z����rq���x�]_�Gq+'WCC�˹��/S2��*Y��W���ҲiĈ�� ch�8���s4G\|rBi�S(~����J��<iv�� ��ֲ��9�(�J���{��VZZ�.ķ�%*%#)��bD@����*��כ�����=k֬�	�t�,���9��)7�|�������.�÷�x�4.��5�y�ix��J?�o���iޏ�����`M3�ܙ���ߙ���+(#g�� �J#��ӧg���?�6Zm%E#JՎR���#ԆR4�贁EJ{��6]�t�(���P�$�;v�^ �"
WLM o�3g���3"i�QDm�8���ޭ��Ǣ=	[���W�l�_��&)�0q�|į#_Νw޹�!�@I</tM���n�����N\���V�����~6%q�̮u�����Zm��%�At��$��O"���+΀R�Vh��T�3�6�X������-Z��-���.��3iԨQ�k�<��=��10�M��������E%��K�G��UE�lb�%C�#��4o���s����##a�Y�7�f��駟Na�ii���k��&9��l�i�eH��w2DT�G<5�%''�Q
�"S,˨�˗���گS���XUUu��`���-�n@:��Y�~Ex�T�kq8���P'z��5��ڡS�f��D��'���/�d�;h��P�%i>cee�H�V��fJ�A3s��q�4�g8p`	V4ԍ���!T��؊"��f�v�"mO�OJ� װw���l����@�C�9��l6�
�+fW��L���PJ���`Ȁ�v*����{"�CChwY �94�1�'�?_�!_����>� G����&3�Z�4ͧ/M1(YZBa��GL!E�FZd:ž��;F�v)y~�1�ځFq�c�A�O�`/ͧG�L+N�QH<�#���9��<ă�t�?&�%���F�f^/�4�G3�N�x�hg�K��Ц��@�RJ#�k��aF3�J���0� )��G�@gg����@
$�A5~�<9f�/�|�=�=�q����{������y���g�����溗��!&-(�Z(������"/�����x�~�%��x�����6��E���l����&�w��s���?�g�M/��H�5�~��:::�*�|����-nآb|��w_��VZ��{���#v��9tnݺ�0�z�8�ݍ>�g��jG�h��>99yT:�*�������ijjj)�����t����R��%p}��g{�<�2�6l���s�m��N�;�Fc�
�����P�޽��۬T�w�6^WWW��B]�ݻw�~E�X�U�fs��˗_�gG���hnn>اO���Z���u���u���f-��4��@�m�ҥ��)B�1���[a���w��j#��j?8zz.x>�^���v��Q���4�?/<N��`{Wڸ�Ė>�B�����e���9p���N[�:���t:O����Z-��% ZZZ��殑�:iܗH#K*TVV6�ڵ�9�-�Ů�Gq�K���o��P|b����nBs*��ϗ/B˶QR����}���� ��ƻ�9��nP�gff.=z�2�k��b�\�����$��m�S�,���؆�ͣ�[,��]?5<��p�oh�n���@��+W�\��[(CB��!����ѣ��:�I�����Hh�5�]|؈�y4�kl\�%�|��4,�`+t1x��5�2[������+��aٲe_G�!���&f���Ç�Æ���f��M�J�.ta|��8��/Dj�GX{<��ŋ/\�v��Պ����;C��7o�|a�ԩ��,t�Ֆwhƌ�S�X��{�,^ZZ��u��'���&p�[�1B��+l>��ʷ!�شH��E�u�d�̶�:u�[n��m�k��h�^�{���
�����������#��o8����H	�ZŬ
/v{�ڹP�U�
�RV�{�S�T$����?�䓳�xo��9��H�F@�ං�2��_~���c4�d2�uC�dr�M�ӑ%^�k�y@�3�G���Iv�ڵOv��Q>w�ܯHS�\�S���2��c!�N�3fbjj���7�`�N��gP�z�~�E�Cx�޳/^<�jժ�^}��ocA��$_9��&5a�ƍ�����_�����	����w2"D��xf��$9���kLPH�b��j�w�����8�f͚��}�����[�Q�f����A��!�Q�q2�c�XM����4`����Ȟ>}z���x?Q-+��nG�ld������b�N>�~	�SS�$�f�ۋ�
3�� �P*��򈆫Z
q���~b�A6��2{��U�w�5CZ63���� ������4Z1�����ba�4L��RN���@�7��ٽކ����7�3e�8q�k׮�>�
�r�\���#�/1�y衇�@�����YJ`V~$�[�h�����u����h�d�	�?9G��D' ��F�����m|���ׄu��Ȭ&�r�?bjA�e,\��9�ɔ�%G��Ñ�IDg/��H�:��;??��Ν;'���(����V����?s�Lcp ���oB?\PP0[�p]]݆༉xq0�o+�JHu
��Kf�{IH���6����ƋfdI]���H>��
7��YC���T Vd�'r�ϗ�:a��O&�k���Y��&����:R�U5�%,Q��@,+	"�=����}6#�A�!؈�:����Y������gΜ�4�Z�,�e�I�|H����k��]j��d�ު�䜀G;��+V�X�G@rd�%���͆>_l�����L��c^�qV��
˦O�kg�?�����{����[o�u��no0��a����544TM�6��������&r>a#s*���>weURZ��7�Ԧ�7��~
d��*a����x��'\�%b#3�]�����Mo:�x��_�sOڲc8�Q�.M�cBsN���|�Òwפ��
`��;�&�Xk�D{E�|���_�v�19e���b��q������Y����������"�ri=M�AE����*$kJ�U����^�$BƯZ��h�������׽B��3"�r��6�P����~y?��WD@�!$���+m�h5iMvP]+�"�QC�3E���\���0!�d�K��E�@�����H>��>	����"_d�����D����ɜ_$_�DGө�7��z��k���|^�k���F���h�@Hd�m�m���$B.�W-�;��rUs�[��d��t�GQ8�Tn��Y��9w��#޷s�#�gܧ3
ɵN��T�/������W���Ld{z~�`��嫅	�+Lu0A5���
,Ƭ�cV�χ@�!H>���C �|$��C �$ɇ@ �H>ɇ@�!H>���? GϜ.���    IEND�B`�PK
     �8NR ��k  k     weather/weather_2.png�PNG

   IHDR   �   �   ��   tEXtSoftware Adobe ImageReadyq�e<  &iTXtXML:com.adobe.xmp     <?xpacket begin="﻿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:E5C72E86474E11E783E3F35E868F32F4" xmpMM:InstanceID="xmp.iid:E5C72E85474E11E783E3F35E868F32F4" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:BFAAA713474D11E7A36DF4B7D635BCE0" stRef:documentID="xmp.did:BFAAA714474D11E7A36DF4B7D635BCE0"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>p:>  �IDATx��	p��W�,Y�O�ˀ1��2M�`h�$`$�&4	�)�&M�2@��)���-�	�I	L�$a �(��uK�5�8`���9dll۲e��~/Tq�յ�V��?�F��}������k�� ��rd,>�A�� � �A�� � �A�� � �A�� � �A�|� �A�|� �A�|�Z
d���J
Ѷ���}'�����^Y�R�`��vde �c[]��d$z���b����˺E��899�Q�F�?::Z�(��5t��.��v��j������������޽[Q^^�Unn�����6�mt`t����$Mvvvºu�{����Z�~L�Pl��W�Y,��MMM�ϝ;W8q�į�;3��E|���N_\\������J������Udo577��g�f͚u��ja��9|k�i_��^˖-[����}�����"VVWWo2d�N�-�/��#�X��]�dIߥK��>..��@X9��͚�����?�Ah|a ��>|�CG�}�G�3�+�T�������t��ѣ�a��I]��O�ɔKJJ����/�E��B��}�ݠP��9�Cjn��A:�,,_�Y>f����􅅅�mUl���(/��������Q`��a����#��v��9����(�79T���1x��5w��y?%%%�>k�>E�C� �^�xq��A�VH��u7Y�z���jЊ+�P���#V�0x�����7�z�k�8�ÒQtt�+W�8p��)���̀O:�i�������r�h�JQQQQϝ;� 99�UJ�	�&|����mhh�kbb�a��d	�&M�r�С�����f?�������Wq׮]���B�tI�dj�#��|�Y}64g�Zل�ۭ��շo�.۴i�q��&�5��
�B���y�����SSS�r����� kM&ӹӧOo���.ar]]6<����'NL5j�F�]�@4���deem$ϹQ���� �b.\������s�Y1�~SQQQL͔����Z���-��//���=*�j8��Nl�j�7Ǐ��&��s--�s� x>z�
E�q�>���_CV0�~f6�sl�To��v:U� qjco����f̘ч���!u�Gm��\x�IFJ�r�֭[y�\�2X�w���5�KKK����L���$e��Ż[ZZ�����ɬ�u8(C6���Y[�������>WTTt�ʲ-��|��]�t)��I+,,��5ql=�ph���'#@b=	F�q�����y�'O�|�����E���y�ȑ��숖\���knn�F��O�D`e�X�3���V�Y>6]*''GG�=/6��ʕ+�j�Ԫ]ͺu��=P�RRR~���#���={N�STT�CgΜ������u�����,V�;Ɍp0/���d����K�P����Derϟ;(($ ی���������-�>}�����o�|np]QE_����н��{�̙�X��>�u�
IDl�H}}}~FFƺ����bO@��c���3R6n��A7���di�?�L�����Ʃ'O�\J��)���c�:f�._��JZZ3�q(�QG]]�&�����ϓ��isrr�477��ׯ�r�z~��&��Ӭ�,��p� ��~���]�vT�գQ��+�J�ıc��̟?���}�� ��w�ޑӦM�L�P|�/6�v��=mmm�Q��x���_�|��m߾��^z���^/ �����r�VUUuӛ�@�U�6�j�x[^xJ�T:���k"�L�1�6;;��y��v~��3P~��~����J��i����B�H�}���{��}�2=��~�z�eee��Zm��g�Aa�L�<y�N��7���+<���^���y�yd��9��Ӹ�]�s����u�7�ϼ@�y�q��.3��UWW��I�+����w����r`"O���w233�<{�l�;;b�f�ئ�˖-�?Ɂ���˹����y�;��|L��i�D���5o���8�Vjj���khhX����l@D[��J�rqQ����dee騺}N���s!��9Y?��S��"$���x�������d�8>�(yedd�E`Ǹ�g���^?�A����Rt91�g�X�;eʔD���d�z�v��1��h�U˧Z�z�x��my'N�;P� o�h�ر��4�fv�(�"�S ^)>>~���W˧P�����{(����6p.��'|Q���zS�*�QUj�����T��Ε9�����ޕ���E<�,�;���=��7O�*��P�ɜ�K�lel�W5��1�#���?�d�֝*�ո)��8w�dݍǓ��������n~x����r��s�/)
|�m6�;999qd�꜍���p������������S��Ճk[��[����>�~�:y�6_�H?f̘x!�|�|2�^���}��Ӫ���B,���<O�ӝ�T��y)����й��Ǘ����ʅ����w��c��gGGG	�O�����j�P*���f���p����lm��w��~��_��$�w[�P >聈��@�g���|d9t_��������r�޽����Ǒ��}ݺu�Ɔ�1bL,h���(ᰀ��op�Ν��\L&eG�=z���R{�:��^�F�y��h�w��5666���|;���`���zW����9׃���g��8����	ܯ�AzWi�]�$]�����G(/\M�xp<�pʕ���ej���<bwV;O�~��ㄗ?:;��\/g�:����7����z9����&���wpm΍4t�:�]h�sr������8����P�u�e>�+hD[:If�WCCç���P�D�L&�׉���;��|̵�s���hlGv(--��t�1�˲���8p`�\.O��<��������9^�]�؜-���ի;���;EyN.������:D��u����|�����{�`0�$��=G�?|��;���s<�������]���1�/��ʹ�ދ#�ݗ��z���b�gϞ��'VO�j��������������3W��Mh�9��}{���<Y����#g}[����n�]�	O�9�jqt2��,~W����yНD�mٿ�����nx�d"��Fo۵jMlll&*��_YY��aÆm#L���χ�����Vkkk9� �3��]�vo��+|l���g�gΜ��\�*Vx�����iii�z��H�kW�*srrR�l��G�Z���*���k׮mKOO���z  /Y�l Fgdd�?�?���Z�meee�1b��Um��|��Z.\�p]������j��q�b��u�m ����Bx��^�w����zY�@|B�(�E$���������ox��^�,_7+�ްaã�����jx(��e����?u��d@j���źpPsϪazє��L<xp�m�!Hb�lSS��v�����賉y+���g����C���O0�*�*edo��;�޽���ݻ,Xp��Tt�#���g!�H<f���C'L�01))iYÞ@!`�����V��/V�Z��O>����u�3^�D��6��-D���r���ӧOL����h4)d{���X�8ݶ/�E>���J�C��l�mnn�Q^^~qɒ%��=Ƕ�`��6>@;}Jy�扳M����.@^�g�6/���������©B��2�������A�� � �A�� � �A�� � �A�� � �A�|� �A�|� �A�|� �A�|� �>|�� ����'� f0��}�    IEND�B`�PK
     �8N؁�E�  �     weather/weather_7.png�PNG

   IHDR   �   �   ��   tEXtSoftware Adobe ImageReadyq�e<  &iTXtXML:com.adobe.xmp     <?xpacket begin="﻿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:EB117C34474E11E7BF4FB206D8B66F7C" xmpMM:InstanceID="xmp.iid:EB117C33474E11E7BF4FB206D8B66F7C" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:BFAAA713474D11E7A36DF4B7D635BCE0" stRef:documentID="xmp.did:BFAAA714474D11E7A36DF4B7D635BCE0"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>g�S  BIDATx��]tU��U�H�;tHH42H#,9a�����EP��Yq�,
��x��=��cG\WA����q�!Cx9dy,��0�H�N:I�����m����~�+��wN����{�������{y�@�Ji��ŇH�|$ɇ@ �H>ɇ@�!H>��@�!�|���C �|$��C �H>ɇ@�!H>��@�!�|���C �|$�3�jppd�a��$���x�@�>8�p�����ɗj�RY�e�1���jjj�/^\UXXX�p8Y,���ԏ�y;\g�#�Oo0l���M��lss�	��'�|����z��mF��H8��L��߿�z�Сc��G���Q�Ń` ������S�>����-jC��5_����4�}�����w�}ߧO�qp.'�ɘ���N��x̘1? "^moo߽}���!��Dv��K�'��q�С����s222���!&�|��ǏH�y��0m�'�i��;w�����j��ʃ	O��e	{D����X&6k޼y��n���������Ed20Y@���lLF&+j>h���khhx�����𻏞+ʦ���q�����Q����9***
A������w�44����dgy@��>�����G<x�s��1I'&V��Lf���,��A�F�����Њ|��k(+���;�s�ގ�O���ѣ3*++��d�<���<A��N����W�O+���q{�b$�?��&��P�����gϞIPI?7h͐���`�_��~�)���X���:�{��߈�&>���;��|�41�|ƌ���:�
���x��ڵkݴiӎ����|,
����d˖-��L�����}>����ׯ���N���H�Ē/���c��f�|�.n��{d�ڵ�ϝ;�$��)\7���w�ܹ'KKK_@�)�����ƀV�Z0%q���ja�v�ҥ����<��R�����/ +�ˉ'C��Q��q�?.\��իW�g��=�d7�ֳ���}�W�T�� f�+V|����,�v��SO������Y,��H��4๩S�>P[[{��|�^��(�#G�LA�%Dܶm���r�|�p6�)�Nb�\�����i���䋮�,7nn�Z�!m����'?����P����ɓ/���������2����=j�����OYYY�H�$lFƈ�Ng�!�"�^�D�ɔ�TIN�1�u�;�|��!Cj�#��E��;��|�e>�]H��j����?�L�׫�����ȯ����{�#� ����۷W��KqѤ���[H�������0����	��\$�ԩ�gxK�J��i��r��g)=�H<#�GA.MN�D��R�V����rwN�2eSGG��-[���#I`���ZB���q1���⧠�P�������~QVV���0,^��޺�۽n���k�� c�Ad���sT&�h�)�-M�����$+�"��y��Vg!h�>�`i"�(�uJ�>�}���'N|-̷�+�$��D%I����AV����`��ݸq��+W���t�-�a�1����O��;^�n�?%�wߊD����A)ׄF9�EIWN�h���_�)���FQ�4$e��p��?uTk�Yo�;s���A��!M��Ң�jG-�i�������Z6�H93g�\w�ҥ�Po�b! �'�9r�~ �"�+��
 ��͛����t�袵˜�O?��{����џ�H.<O���|��i�I��c~{s����D��$D�y��-K�֭�9�y�k�\�t8U���s��8@=�]ǦM�����X};�P@4�n���'��H��!������B�
��?�x���A�B�g����,Z�hP��z7�l������7I�Z3!m~���}Lo��[���Q�F�H����wiyɢU�],Z�!	�=�kc-5���`~ǂc�0��,�J�k?p��4q��*��X̯Zs�x�I��\��4��࿳9 �F?R��쥥�Gp/2C�n�W.]�t h?7h��5�u׮]w[,��$�n���H�Ϟ=�1�C��]{EE�t��D߾}Ǒ�;t���H�1z�q;��r�/�Z��XГ���֎�y>͔an֬Y��3So��:t�б��06rssG��c�|��9��k��}Z���ޣ��K=_)D?Y��jC�e��f��)�+f���B"=v��OJ)R��O%7�~���_0�."�Ce~�4�L�ц��I]�f�Y��/���g�s�y�i>��� Q��*CM:j*)�J9��W)��ʮ��o�-�v��|�"4�����|f$��!ֱ�4A�� ���9
��� >M�ˤ5PB/h�2��z��4�vFqd㝍��Pû���V��s$�i��Q)=��P���Xw����h�;A*V$�!5~�<�-u_���{��=�i�5L#��#��97�Ϟ!�����+��0��>TT�"��ȼI\�(k�gd:�@��R�T*���|߰�U�QK�W{��5��Uz�R�����j��k^#��������w�\��v;n�b`\�|��k�58|Ǐ?@p���GpÆ��ӫ���i�{��Fت]+L�+���<VG�X�>�<����nUcVV��B��Uo����v��N��\��	W�(x��P����b�|����%�w8'z$_��Ç?N/�Q�/�
.9�i_����_�fͯX�CmO*�v��l�ZK����B[>O<}��	�Eg�����������1hv�^5ߵ�xCC�ƴ0�������2K�jhl۶��T�bUJW	��l�---���oX�G3�8 ���{��]A��?!�.�kO~~�B�znU� ��vuu]ٿ�*q�i#�D/��g�����y���_�W5��.4�'h��;�ο�����~�K��t>�w�����{����3rF]�s"e�|^�5&r5��yQG.���.�U�YJ2I�'Y�2�I='Z�J�w��P�>�}�p��n��#P__r����y�7L�G��&�Z�������7���v�)++[�uuҔ/�ƖT����f�֭?��b]��zD�^��h��һ�>���b6�_^,��RSdx��<K�-W^D&_�(�l�X�~����?��s�.���u�����p�=�ܳ�\�r'�ص\�D~1k���RaN����ӻ)��D[�84��R��HK��{d� Qj��"�He�^&�L ��e˖=���a�W�O$`p�C���9r�('������̚�.>RD��<��ƸAF�^��hguyf�$�$E8-[�]�?(��Ȳaaq��z��,Y�n�������j߾}�w�u�s�ڢ�7�
/[���4Ѷ�o��K�|=�A��,!�uF�d�^���^z~ժUg�Պ��u��H�_���{�=�Ћ���w��y�p�t?/�>yK7�e�Y\.��Gyd�hj��K�[�&��6<�ܜ��	2]Dj6�Q�R�g��o�����kZIZ�^�@N����_q0��O�~��;��B��w$�n�^co�]�/�ر�'�����%4J+�(�Zլ
���=O�}y����7K鷚O�
�ZV�W���u�!��ֶ�g����%�H�t�����vЂ�l6ۉ/���zذaeddԍ���Z�c����Э�e�z���7o޼q���_���D��W�/� �c~H�|��-:=nܸ)��٣%���10;e�K��i3�`���5
��w��ŋ{�/_����~�B2H׫�n���$d��_�a]�v퐪��Q����,4�������NF�Q�s1G|���BR��`c��@ ����͝��� N�\���b�������vL;򅑐uh���:�b^L�ˑ$�[�<t�ȡ�u�֎�#�=�y�,F�ߎL���>>ڃ�Ŧ�|r� 
S�b��X��y�z۲ŷ��]۪x��ؖ�ݐN��Ղ,)��x���;j�l�0ߒ7gf�j�'q��-��3��g:Uj)v��6`��D�iC���������}3�r��f���!���2�Gg� a���^?�G>��zY���;�/ȳ<��	������6�����G�r�$�1������[�x��8�_�yQ��
����l|�⹅�L<W���5�qH������w���҃0��'����3��sl]=����������ٟ^ *�&"�z/�L�[4�{�7�ßjy����Q�>�??o�Z�>$���xgɀ����� L�E�+��={ �Ni$_�Af���у �.aGy�W��W��
���Q�3���@����l�W�Z�"���FRͽC�:罶��y ��h��b�&���+��ໂ@\�{|<��W�W?v��H~^88�4ظ+�x��7�
�#���o:���Ɠ~�W80�ONon�_ Y��.|�X���	ȴ�K<T����Ǔ.hڶ5�qy.����"$_h���29~��ٟ��p��e�B�%�|.f�>溿�~j�����K��>��i�����Sg�Z5�t(($_�"��~��~<Or�;�ĳ�mO<�d�He$_k����1��3罋~���Q ^g��/��+)�h6��aKy���@<w:�/��s�1ij�0�'����t��|I$�=���?�Z���ګ�F	�B򥴥˩�|F�B򥦥��~[f��ĕ��ިaRH������[p�򐥑ä�|)2���Դt����c�0)$_�ȧ&���IM���t��|I"�R@�3�[`��ɗP�E(H�0)$_��g��r�K�0)$_j����H���
�M�0)$���S�z����������	��֦a��/5��ʂ.���-�Ȉ��aR��,��"�\��Zۅ�ZC���5���d�24�$��C �$ɇ@ �H>ɇ�5�O� w�G��'F�    IEND�B`�PK
     �8N�B���  �     weather/weather_1.png�PNG

   IHDR   �   �   ��   tEXtSoftware Adobe ImageReadyq�e<  &iTXtXML:com.adobe.xmp     <?xpacket begin="﻿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:A0ACFAE8474E11E7A3E9BE6F79A280EE" xmpMM:InstanceID="xmp.iid:A0ACFAE7474E11E7A3E9BE6F79A280EE" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:BFAAA713474D11E7A36DF4B7D635BCE0" stRef:documentID="xmp.did:BFAAA714474D11E7A36DF4B7D635BCE0"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>hx��  TIDATx��	tT���{�f�l3YH !$!�J�Ji�R+�ukQQ�A<�bY���`�ڂ�Zj�rR�U�M�PdK@��L����~wE�Lf&o�{��Ϲg&�0������*
����e��P�B�P
��>
�C!|(B�P(���P
�C�>B!|(���P
�C�>B!|(��B�P
��$�@���M�P��}.@��>��7Xx�O����컘k�P�P�Pt��+.���2$=�+1��|��,�Ʋ����I�@�E":�������.�p���?�ɡ��~Tv�0|����#ȥm�+��pL8�33���91k\�M{���ޠa��h?�'���A���*_�8u
^vA����>���r�Q��l��ҷ��.�AS�0=�D����ݚz�k����сv;���5D��@G�6�IY�KΛ������&u��M7�i�?���W_��P�Ї�> /iƄ��e��{8#U;��l��[�O�<�f���P�v�OE�tFx0�~�=�y�2��2�VO���u=7h��m����i�p���3��5��:����|�+r��^�>z��z�uc��P��G�-�&)4/���:�+>{�X�ܡ���)�h��c���{�+G.�߼^I����뽲�\N���#6��{���g�<֖�����dn���B��呻��^�X>��-x�'����h�f����:���˟���-���;.��!x���S�䡼?k9�HMu�R��ٹ�CF|'��h� D����&e�Y�`�v��ԫ����m�������� (�\=�`=X��j�+��'�o0�G��,s�+��hl��������F��k���ov�ҳ�H���m>%ځh�/�8o���A��/'b��(0�L��0��^��&f.S� r�D'E@��τ�Ik��n�jj��y������ �/��9q��p��~�E�����E����F��E�Zh}�}Č	��y���ϐ��� �Q�5�Q;| �n�S�3���Q���LFS?�N��q����L:���B�y��{=��Ǟ����}��[������U�B;�Mx� 8.8�_�jM����NHMMm0JX�M�.���x]�)<�[�:J4����=�zN'|���u��-Y�@w�����h�k^�zmѝ��~���tX��Xƶ�|ܥz���!��*�5nK(��+{}�j!�מ0�ݪ);;'u�;��ڻOZmaO%S`��%�L8�u�$Z�����+�&d����U��@Q����+;.c��͏��gЬ+����e.e�.�Ⱦ�5���6�G�U��'�sJ��-��������K�S��I�nF��~��O�آ2>X�7���B������n��6����5����>�x��Ϗ�~�����T�w����D��x3�Ǡ�O�Iu���E��B�����K�7����V�W����S����ȥw�2�*\ϭj�O3cB�8؁A�n����O��޿x�b�UY�q�Ѻ�K�b'ѝ^I��ݪ�����e���z��z��g2ӡ�4��z����f�eb|-��#?TQc$�>�/i$��.%��m%�^�hp�F0�����1x��O�/<ZS����Ğ��Q|j)q��NU4|,KR��c�X���T^�ix��ok����_�(Ix"��W���S4��X���-Je�G�۱s��S�N3x+,�20���U������T|!�Ɣ޼%^�E<-�7q���
^ �P$|=ۗf
)>�mܲ� o3�a"���|T@d������)>���UL�G��g.*������לb\��h&�*P�X�FC��aK�Ҭ�L�jwBr1@���B%���Y�	b<|?Q�0��O3jO�(��r�|�C�O��+xA�΄,؝�@1��a��w�4l�/��������S�>�����>Ӳ����=Mp������"�z��:���ḋxvz�����:�n���q���e-�_�b���>;t�>%�'���܎5�'��V�7�RA�m�4׎e����r#��j<�fC�ie�Z>i'5�|����ǲl���-Y�'r�ēu�l��jIg�I��t�t��6UY���,�?��N���˲�\n����N@j���>.���
3{�k����'��jj�?'�/e�1�j�Ky���#|��d�Z���8 7����?8b=�2��"�B��q�te�oX	i����#��|R���[1#��Sk8��Y��W'�1"$��5����SO�}��Σ=~=r\���`�4 o(Q�D�F~�oEFs��p���)~�H���Qě5ÿn�u~A�杄k}�����z���s��^��3��үn'����)�Q������O�D��>�կ����m��X.|R�]�r���Aɝ'W���ִ���N-�B��X��t�A��D���bn�����xr~5un�q��_
�4˖�꫰;�j.A��.QC��7���1���t���-;��p]�T��o?���iS���:�9�U������ml�n��jmw{4����l�W��B���^h�ĝ�'��F����*��r%s�:��WA_��i|$�[�w��.����X�����n.	|�e��2�]�:c� L��Q�2��}������'QJ�F��\��c�o�r���s�;~���uo��]�'|��$�̗@���s�#���2��-�=��>U�tt��A�O�'���	���o�y������J�?�Ui��=�y� Y=���ϫ�9�|�ţ��n�}�ԭ�����t
�j��n>M�@��j��)�?�����Q�),�<>J���~%��zfO+�v�(K�;Y�G�Q�K"^��/4���,˦��7~J�<m\*��I� Ϋ^ ��}����3��(�ڕ>A:I�( ��\p�oR�k����o��I�>���I)��� +-���7��"��}���$� *�����ť��dg��s�e��no�KP4&"Js��OW���Őx��rz������]y����miv�z�JI��]]��4�js�� H���=2�H�24���5��t�\g��&��nCj�G�{<�C$�
������H�t��I�w����Y_wz'��u,H!���L���C��	4MR�I����I�NGz����t|�{c�o���e�Gz�/��dc���D��c��B��-���N����Q[sb+օ-`����L!���}3y��El}=�����9�ᣟ�C�������f��*s�*�%��W,w���Z�������@A�$�1\���y��p��m���;K"<�Kj�|�|����n�#v�:���W$½�Ɒ�s��I/	�Ђ]�|9:;�0���|���|d��wv��u���w����l�\)��+�%�G��C �<���x��ul����F��_��� �S��v/
��s9x��ɗH�N�R��|VN"أEn7$kCs�f��t3v�r	cC��V�!�ϐ�6�cn���5إ�QCC�z����-���������b�^�ȫ�\-|�* vZ��сK��~�]�3c�.��jkN��D��-�X��x_? �v��}�қ���)�����9`K6����п�WKw@l���[�����!�������~��A�ͽ�a�ε�����}ϴm8�J>����s ��#5���|�kI+ ~
���l��Zm������T�m;<UZ�s,�);;���g��0[,ߗ[��(�����+=y<=���,���.����tT��/1�����+^���E+�[��J�UW�lX�ha���"x;N����e3�73^�W���^��m�﫞ܿx��!�@Fz$�u՜8�����uA�.�Y�j��E@uA�_3슭�F76�Y��8��z�G�l�0��-�u���K(�w��[4�Jǎ˨ظ�1��6�a�T�'bk�hjj�p��A�Z��[�]�p�_4�O��������L��{�Zmf�a�IE����^�����Nb���"�'lZ�zmѝ��~���4&���x��kkkmݱtɢ_�]��H�
��B��9Q�b՚�[o�������t���:I�c��K_���r�?Y[���-p��]%_�n�NR���=�pQ6X�k!F,1M��:].XG�� �f�\��B�C�=��|>��nI�v�m��;���c?}�	�4sB��d���ዃ��!��	��Z�C���G"\_ۅ�F�Pq���(T�\
��>
�C!|(B�P(���P
�C�>B!|(��B�P
�C�>B!|(�����/� �ίx���O    IEND�B`�PK
     �8N/���  �     weather/weather_3.png�PNG

   IHDR   �   �   ��   tEXtSoftware Adobe ImageReadyq�e<  &iTXtXML:com.adobe.xmp     <?xpacket begin="﻿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:F733D381474E11E784089FACD3D27037" xmpMM:InstanceID="xmp.iid:F733D380474E11E784089FACD3D27037" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:BFAAA713474D11E7A36DF4B7D635BCE0" stRef:documentID="xmp.did:BFAAA714474D11E7A36DF4B7D635BCE0"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>�Q  SIDATx��leǧ��v��.��m�P)\{�N.ȁn�arxR�&����I�)���$���m���;�"b@��X/G8{x�VĂ@k���ϝ{�z�twgvg����?���ξ3�y��y�}��	�DQ�{ӡ����� � �A�� � �A�� � �A�� � �A�|� �A�|� �A�|� �A�e@�v3�h3Ju��>�����~��m��Ai@U� >^�*\E�1�E3p����͛7�,)))�l6�4�w���x�Ng�]cG]3�6�v���w���p����������~���5k������O������|�A� ��ԃ:RSS������`0$��t��k���%0�ُ��}��j��ҢZZZ��vuu}x�ܹc��Yڭ��^q�I�0Y,�7��f�MihhX����03O�zAY�����w�y�����I���|A������<u�Ν��ϦN���=_�r�J�9s�,A��">������3v�ر}ʔ)�$+'��vq�ϱu"ʨ+�C9�>��;do\�z�Ŭ���%{_�G�Y������ON�6m5�������q�OJ>a�dJ-DR a�-�̙3�V�������	V�ϟ�Bgg�+�d������ck�x��;�;����ej\[�BQ�p�B�y�^��∎�#��xֺ��{N�<y��+G�F���}���HIII�[�D�:�y,N��(;;�B�]��ˢ��>�lvEEE)]SS�FĆ0��YKss������#�aL&ӝ����gff�е�' ��6��&a|�֭�v�}M�v������(--�KMM]O���H���1h斖���l��G|�H��@���˫�z�-��5�z�h���n�\�}��Ox���>���䱯�23���醋! �����џF~4�v�]CCC���������buu�{��M	��p�V��/_���A�#���)�����Ξ=[�l�2��+�(�����:uj٢E���`�"���7��t�Қ��&��=Z�0,�#آ7l�0���G��-��y��+yyy/����Y��IFBww��bcc����8�Ӓ��s
�'
06�`�QQ6���h��dɒ#�nݪ�`-Y	yM�Gd����JNN.1��wC�5�+�l~"d��inn~���p:�mF��������Ų����ݻ����4Q~�f�|�P�̙3�0�� /o0��ڵ�ETח'bX�f-U�4��u�|�t��@�󂂂GN�>}=�Y5���s:�+	��"O��X�I��O�2�<����r���cE{+W���|���'N��N�,L��Ü��������{�=�n?�tl�`�>@��/�ƻ.QI�111?� ����>G����&�if�"@Q��F�,��	�������7OS��O�oߤ��xF{{��qqq�dV�x3�<�3v�@��`%�6v��@�����୤6�z�u��s8U�=��� �/�볉
�+(�_ɹ	2}F9e�ި��u�ҥ�P������>�����tF!���iY3f�(��l<��wRY>R4��	:����B<z��>�U(&/i���g���	lX HJOO��u��&|<l�R��š�5�8�CP���|�3�����H�L�\x��e8������g���Em�̹�:@g��{JKK3rrr�ǒ�l^�A𝤕���'��KNp!�������nآ��߬^�:��+�<a�i�e���w�]�v��j]*�F�v�{���������ھV���a���yŊ)555�:A��y5(^�555u]sss��S�vS��Vs{H-��ZyN�suVV�F�������
]�~�&##���2;.d>���c:�C����[o���a��ԧ����O,H� 1,�]�f���3������`H���$L�O����_(++�L��E ρ� �����U�V��ǎ��L��Ç��r��R�^�w`P}>���*������NA�E��������x �f���Q��޵u�֗��%��"S]]]����-�A�&��S�D>��^d�j����ŋ���⁨���,Ǐ�I���S"^���e��7��n���[>N�466>Hw�}#=���q��}�>ZR2�N�1�''�o�=?��U(K�qx��ʕ+��ש����0-''g�p��O����s!�εp{���
s{�XO�;���p����� lne�w�%wF�r:����R��Y:��y��\(]m@�RI��o?%ex�GTx\���W�@9rf����mǟ9s�cs��M�;A���۴i�t��V ������z���7���I���j�~yɵk�v%&&>��X����5�ltY�i�l9�%���/x�����<Ja[�jO^��l6?,g�N%��`��iv��@AH�"'�fw%���/�/�5Pz~����e8���r�TKLuu�r��b�Z�rss��^p �E����� ��j�E<}Z���]�r/^�;��(�H�����k�l5,�i߾}<��.o����￟���H�2�W��ӧO�E��V||�l_|��!...�A��������ePx�R��%�M3(�G���(B�r���"%On����D_�T�/^�F�L 
��N��7�G�(i2	�]�{\8+�����G�v��������Z��$c����C���i�(�|�Z�����)Y�5���ϟ���
�����_�ׯe�+YO|?j�;nO��������]5��y���lA�y����	�ȯߔ���o���=P__�9>w0�t�\,K�1�ISSS��j�Zz�?~����Ѯ�×T�c
��#Z�����7��ח�v�,���fB�i���W����dgg����l0�>�I�������?z�����}M&ReT/�E���~=O�Q�[�'��
�b�=r&��6uR:X��+� |�� �>
�B�2)��xf�0ᯑt�K�aM���7���;���x��j�+M���T������Y[[�j[g ���~������ʞ�e��t৑�:u�O6nܘ��럥6��_�eqy	���d�l���������!��p��E3E��m(��v�0�\� ;������y)��$|��������T��r�
��7��.GAt��}��G�5��0�>��#��񫯾���m�>$���!�Q
�$���h7�.� �A�|��ȖA�'�o5����	�TW���X?O�K�d�fK~����F����9�֭�7>>>]�ә��z�|��ۿ8r���T��a �i�@�פ�c�z꩜-[����h��nf��6k�֭3��_�:�D��d���KJJ�����Zropp�pW4B#��A�E��B���k����F�FT�W���q�_SS�0<<�4�|�Ss]s���ؚ�v�������F�E}��Z��{�S-�H�[$��x�K]-[<w �"�,��T`� ��� � �A�|� �A�|� �A�|� �A�|� �>|�� �>|�� �>�S�` �����_�)    IEND�B`�PK
     �8N�xz��  �     weather/weather_22.png�PNG

   IHDR   �   �   ��   tEXtSoftware Adobe ImageReadyq�e<  viTXtXML:com.adobe.xmp     <?xpacket begin="﻿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:OriginalDocumentID="xmp.did:b4aeaf45-2b51-724e-a5a2-43b8b182f6d2" xmpMM:DocumentID="xmp.did:8C245E9D3F9011E78D0AEAA6D391801A" xmpMM:InstanceID="xmp.iid:8C245E9C3F9011E78D0AEAA6D391801A" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:b4aeaf45-2b51-724e-a5a2-43b8b182f6d2" stRef:documentID="xmp.did:b4aeaf45-2b51-724e-a5a2-43b8b182f6d2"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>��  IDATx��p�������]C1!Ob��H(Cxh`xd@m-MaZ;>�N5�ic�:C�[#X�%�[���D��v�1"X"	!1b ����������s��������v���|�������]9�B� ��r,>�XB�P
�C�>B!|(��B�P
��>
�C!|(B�P(���>
�C!|(B�P(���P
�C�>B��E X2jJ����+�U�ͯ��	���f;�'vȫ���M&#�E�


b^}�������Z�6C�T�(��r�\��l�C@3X,��l0�=###_���}�O���� ����p�����˦%V�ԩS����~��h�,��[;_d6�Lߌ����Ο?�oG��h���*�Ɉ��TUU����?��&��4
�8):::i�ܹ� �7���N�����u��p-_�X>:�3gVdgg�J�V�#�@�b0�hoo�P�>���mhhȃ�o�J��������tɒ%M<���"�&6�^���t{-Z�.�7������Ҵ������-�,���utt<����[�Es�@�wuu�effVH�
���д999�`Q�2mڴ�i�j�IZI�I�I��/����aKK�q�V�OI+8�$͐��HB��f�����0�|3�-�����`���<���r����V������,���')X@V��eggo�X>U$O�7��:[���.�L���>�/��555�C%�^�yd!o�����#�)��#sɃ����8q�?kb`(���\��4M�c^XX���F���86����lll|�����l�DR�/�����>��B�H`P���`0�;{��0Xi�!G��_���puDD���qq���֊���}��9'�%��uvv>����s+}OO�[iii�ůP�ZHs�e˖�RRR~�\	�:99�Z�˖-K��Ӡ���6�2�L�֭[�����2���!������y)�7Q� ��(++;��G�,� ��h���7>>��R��(�d;z�U�������t��x!����D��b�>|�mX�B��>��Θ1�yD�?"]�+W�����k������G�R�@l���S�>WYYy����s_�����111��J�׷i4�G�n���s,udd�"D% �V�lii���C�쬞
g�B��ETS�3g�$7������������<E��Y�>۲�>�lD$��o�������|�?���E���#���ﯫ��%ӗ�K��*6T��������Q����y�	��r�^�r����ßl۶m#�������[-�զ���ʜ�����ME$D��ў��]���?�a�)�괏?�x�N��7gΜ�<��C��z�=D���(��f4�رc,]�����UO�m����-++[�t���C2��>����{����X��	BRqq����C}��@�6�.^��LFFF	�/�������}���?!�hz�*�	����U^HWTT���� ћ[1T�vI��ȑ#�X��������Xsdd�ZX�Γ�0�[>�Y���˗����� �����Uz�HC�������X��`��|III�'ͯ��i[ZZV��� V_h��|饗�0��
�2���y�	��5��7��:t(G��>���5��&b�IFr軯j�Ą�L�<��%9�7w�֭i`��§jjj�cY���r$O?�� ?@�n�jg͚���/0JR111y̭/tR	�D���IS����dhz8�3�����.9�LI30�W�^����a��YYY�[/�FIT�'O���4��j��,lr�-�Z�θ�>��)�JeZ>i��ZN|rHX͟�G�.~�CF|2�\�F�'mA�4�g=/�'�;.>� !x��b1�T�	ӃYVaIW�Gf胏<l �� :���6�/�r�{��%�o�F�,f��:˲�V�:�#̿�6c27�V&���aW���3|�e���	�Ǔ}������� ���u|�]�J�L���=���iN@b�o@sl�<8�sq~ʇ��������GGG�{]L�������a�H����o����gV�p,0�����M�u"�b��~��n��������pN�qN�ùY��ȃ�<	7���I��|���O�����4��|��X�Nč���ϒF�#rG����Qʭ��mgHl���>����	i�O�����(Ύ�.->�]���|�q���`脖�g�� m�.�~pp�yҤI�m2(��\ ��~��[�(2��_�]�����l� ����I���.'��|�<�5/�Dx8M)s0P��gW��h[�����ҝ���%oii9bg��|�8X�����stN����y�.�%4���uW&��]� �v���Ǆ\	bi<��]o�!C����EE��E;�	 ��j�n��ϟ?���,I �E��K���������<"�jMIW�^}K�R��͉�׍7>NHHx ���o,�oCC�.�!����6�j�D�|�"{{{7���.A���.T��ٳ��;0�[>k�o͚5{�Fc7eW3�MX@s� ��<*��[���z+++w�V���?��@�-�^iժU��&�=��L֖���5??##�iw��2�L�%%%��O��%F$$�� ?ill�cnn.�ڵ��j��v��QZ^^�ug��T�x���ѣG�yyy/��r-V3}�j���[+**:I���q�{�;`�Ν;��|���ju*M�3�٩&�~��̦.���u8�w����W�^�4�=PW&_�E����w^�͛�TSS�6>>~9#܋֑�#/eg�����1���B�1��5/�,�+n��إ�Qٻ��v�llW�͹ɷ�r�fv���}�?bn}{��<�?�Gҧ��������""""C�tx� �]���+ �[���b���]��qqq��<���Q��ځI�Ox�jkkg��j�w�4g�ݴ
�6 𲄠3t'������͛;`�(���L�ė~��E/@��'w��}w~~~^\\��e'��ǪR]�w{?�j�S��l�d0���������p����7�Q$��ddE�	�~?#�f����/�{ʔ))`T*U��#�Wr��G�J�2�O��Ei6��^�`ن�F� ��7<<�Mwww�����k�-GP��P����[/�f�@��|�|͛ꟃ�/ery����[��N*�v ��Ρ$� ��It��g�緎p��,���׸ys+��c �e	iz}�ª�A9�H���m�F�8�1^�s���Ӣέ�X�=5_�D�MM�$$ε�{7?13�$��y��:�3��c�-�|��������R!���e$����A�������H �dن�I��qB ����3x�Vw]Bj�k0�%�,úb�M
 "|>H�5���D* "|x���F�b ���Oj ��3 ����"@ �z�k��y e� �B��d?~q��0����l �T�Y����!]�P+Klv����ԍ�FJL�F�g��P���8j��nFᣨ/����=Bnh[��/|%ڌ
�O��%@����� ���Q[x��n =���\��� ̨ |���@>z��陲�\�sw&��#��t��wK�������(�G1xRwE�B<���N�n�r�$}�h�����	�Y�C���sE��RX9�"|�_�����ptE��RX9�"|tY��rE�B@��Rv��p�1p��R�H�'ϗ7��KU�$Y'PlvQ
��>
�C!|(B�P(���>*���  ��B�8O    IEND�B`�PK
     �8NZa>G%  %     weather/weather_24.png�PNG

   IHDR   �   �   ��   tEXtSoftware Adobe ImageReadyq�e<  &iTXtXML:com.adobe.xmp     <?xpacket begin="﻿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:FD41037F474E11E78700D7B2426494D9" xmpMM:InstanceID="xmp.iid:FD41037E474E11E78700D7B2426494D9" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:BFAAA713474D11E7A36DF4B7D635BCE0" stRef:documentID="xmp.did:BFAAA714474D11E7A36DF4B7D635BCE0"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>$D!i  �IDATx��p՚��I&�#$������D�5�*Z������x�R�]٫(U(����%<��AWW(�^�g���H!$�DHB�Ifz�3��=99��������J�L�t���|�s��IP�$IRЋ�)!|(���P
�C�>B!|(��B�P
��>
�C!|(B�P
��>
�C!|(B�P(���P
�C�>B!|�(RL�,��qw�_���l#ɋ�fy���]�r0���	aڅm��4˯�𕔔h~���F�E��5kV߉'����s���N���M����ሗ�I��F������\YWWWr�ҥ�֭;z����y#,�ϠA����8mÆsȝ0nȐ!)3g�쟚�ڷK�.�qqq�cbb�B��9�N�.����@��z��_�MJ+++/~��W����{��6����ѣ�H�������?�O?�t�I�&�KJJ�r�Riu(=��Nx�)�`�H?4|qyy��sss?۽{w�_�n�H�t��8jԨ�͛7��:ah��9U�KZ��8���*�^�z��/��f͚5�h��f�i�С�| ��	����p���ߟ��p�a�S��T����y��|�[SS��
�.]z\��)����q�/Z�h��	2�v�:�Ρ���<~{��s���� ��Hccc9@���������o�5bĈ�`��*��C��9�����eT�i�.転��ܗ_~���:8_����O�6���?>��S�?�A�g���5���5,;~�x@x�vL��]�G]�)S�/\�pzbb�Pj�PX˥X�6P2�99��X��`���j��o��������i���������ӧ�����lX��yb���[
Ok���vp�'���?tC��Z����)T��d�q0q�����g�)���o/������]�`A:t���8� .$�'�����ӧ?�={� ��z�/г�l�2%99�nލ*�0���ȻY�s>���/o�X�[�����ۜ�������WXo�> �I�x�S:u���/�/�ڼ�p2�M��Yq(�E���)##�߮]�~�����Z�QR���͉�o���f[�3�u�F)�z�M7=u���m�O���;,�6�Z�ƍ���(��,x-��{�%%%�ٺu�����[��V����s�3���W�m\�b��8��~"��YE�Q���#d�g�9��3f� ��l)�x;v�޳g�L&�0��j��1�Z��뽸f͚�>��bh��f���X�bA\\\�bmK�(`�KF�j|�Ւ�$q�{�u$�~����֏���:��ѣG�y�ر|h�� I�p�~%�ݶm[��$<��s�dɒe�Ǐ�E�9v�1^��'2�M.�D��QK>DV�/�8���1#o�ؚ����ׯ�Ȏ�ɖ�"x.�(�ׯ��P�"�Uu�ZV����xΜ9�_���𹋊�榤��ŀ��jw�I��/�����8��LA�!�\a�I��*++?Z�|�[���/S��d�k׮�>|�堂-��+��OY�v���'N|ڢ6��n\~~�� ��j$�{D�N����~A"��&�λ_?���� ��켼��<��=�ܓ %���M�>}�}D<bar�.y��`<�t��9����z���;w��zX儶�8��X�BT�W?����xQ��k��[� ��ΐ	/��o>���r �d�8A�<���AX�`��r�`��޷oߩ�=�u��J�\.W�) 8�X�E�V�%��� A��/JT�Y??/{lF:GLLL�[o��'O������� v���V���o��o?�p(��N.�����'�#��6\���rssG���~���ܯȺ�9�HT�"&jm��
���m��U W:ڀ�#G�8qb3�r Y7�	��@��S��Yi��}x������!�$xM�9 �N0`�$0I��	�85�Kq��0VT+>3��׀گ�~���m؃>�������ŋ� �0�	���>z?�۸`��p��P�S�!�xt3��E>��p1�, �����TG,�QT"+�W��yQ�Y3��qO>������U����˖-���;M�S�d�!�G�����0o޼��c�Ī�̎��̴^�z�ၣVH��I�?�@K�g�U:�������D�M>hR�K%��;j�!�$8��u淉��㤙qrr�?C�1���|Kuu�ס ��g�d�����w�����������HX>����3�@�D2���֗����(k�\�!�X��	�����oA�F���U�����}�7҉�T�xAZ<b!xl��5cƌ�X?K���g�޽Gk�[��h�G5��W�%-�s�����C���}�u����..2�\9dfI��� %%%e��ѣ����
�b�.]z;������G;�����g���7P��6�|��K�m���-���������v] ˿��\���8�Ȇ����~%�W�q���0��~ݯ�����ߴ����Պ�KMM�|�Q�F�JHHd`[Q�WRz�s�!��$���d�����6�X��6�S�]�����������m��n�bgΜy���6FkD��$��шy u�d����_SS�X�;r9Ec��~�#�<2�z@���;�� �֏��: �̀Vu�*�?�01P�����.��\��\�m����c8i���^����V����Tx��2[�Qz#Z�U���=��+F@��9,.�������k�m�ϙ���Jo�̗�jz��&<0���Qh iĞ���W���YN�tȌ&��::u�<k֬T��/��u�뮻R���� (�������R#���Y�zɇ��r��^�~����11 ^�Ǝ��g��j�RRRz��}�����'�ӌ��Dٯ�ڟj����x���5Yh��AL�Z~���䛉��mX�x/9���~ySD�������Hp��5'�.��Y<G�����r���+�n��v�
��Л�������~Ւ?Q��G��Q���������z��S�� D#x$T��
��BZ�h|H6���w$=��p��q��E�K��~Ւ�vCo�o744\
cVkG9���d��ѹ@-���?K�/5�6��U�#|��EGD��6���U���ųc�,W����!�l��L�	p*�O��G���{#�?B�k�f_�n�Ȗ;	DC�'�Qw�hX�̡\F��53��h�O
�����*D�6
G.�q��j��c���`�`2�z��5���BM��$�?SSS,b�M{"�jYfA�h9|�24��:��W�#a평׌��������Vt�!3����Oh���� ��n�����j1wͯfL�[`���0
Ynu�\�m3���ˌ���k����ږ.����S�3�~�V��#�o���Zm�I����6����N�G���X������G�j�)a���Z]2$U!f�����;%�O<������B5�y�LX-���&F�������w�?����z�טqܐ]���U�-�t/��벝��jjj��a���L�Om��ڴ{B4��Aǫ�����'��B���C�K'��l�|���b��_'��K�U�c���ܺ(��G�B%�d�w��r�
}�J�m��/�(��=I�5?�Ok���-7DVS���[�(��b��l�vjZ0K{��=�W���۹sg)d��VD��/����������@>�z���1;�pOk�<�����R��f����\[[{�� ����x.\�?�k�}D��>fc<�O�����'=�k	|/^<m{f���`jj���4t���D��0Y<#:���<fw�9`6m��#� ���O��������UFL�@L��bM�$�'������F��}"-�6�>�СC�������	.:R-
�F�ݫ&'^���tܫ̴�Z#u�6�(�	��_���Sn�	Vܫ�{��٣���rCR�v�wͯ�y��Q�\�Y�`�3s�pv�D�%�]{���ɳ��U�V� wTk�!%D�v�����S��m"y�`G.\��}h�%KD>��r�7�~�d�A��k~�i�`�j��՚/��B�j���^�����FJd՝I�}��C��[ T��!��Ǽ�':Cp���̙3�e�n����x��e�x�ݼ6l��FO�U�It���%�Q����]t$�ɣ�g}�!�z?''g����������K���m����)�,UUUվ>����1[	_����� ��`���H>��(#Vu���׮];�x��#G�m<u�������������|AZ���n��9��xr��_�z�{�jj>���I<���?�ӻߟ�_"rɌ��@�����,EEE?=���;v�XYWW�}k�F�6e��ţ�eee�߿�Č�S3�a}����۟���O��?�ѥ��>�R>�"x�4���������] �
�h��^�+W�6z��l���[�iZD;��ī����_T]]]b�駖?{�t׮][����d�!�����_`�x<�fϞ��x�%��R�|��/Ǎ���c��NNy�xF��a<�P����{�qy0�ݵ㩓������~-�Wm]�q`�ƍs!�*3�o�xXj,X�w�ĉ�ϝ;�Y�� �tk^sa<����/���Q���l�!a���s����>�/��s��Ǖ��֜9s����x+*�O֦��2dȍ/����=z��ۄ�%F ����3������3X����n�i#|�O=�ԇ���g"l������]����x�)x�XA����y��֮]����� ��Z��:����kll<����ZI�:|t���/���2v'��HPf!���.�/_�3eʔmpܞPFɌw��y������-[�,��xD�Z�ju-����swb��6�Dcܐ\�_������?���Sm؟��tFgee��'O·FnS�
��jd�	�V�������D�?-*������k��KQQ�9Z�o:�C�8��F��bŊ����V�ǔWZ�=Z���M�:u;^8�c �wsJ���w�m�=�G�����Ǖ+W.߳g�/
x���!�N[�~��)))6(��.Ҧ����̝;w���7|�q]�v�	�1>--m�|W[,�NVKjjj�Ϝ9󏲫m�vT��sssǦ��?�d�V�_����.���?,\�n�I���*���,`�իWgA��ǜb/�r
t���gϮ�6m�.�\ x�F0:4|p��#Rc���Θ1��Ν;�a���Ygii�>j������x4�h�������ʺ	���nݺ��c����mhh�Kaa��?i�;<|T  ���ꫯ�1bĽqqq�-�~t��_�n��ɦM���f�v��@H�$��g�����đl�j�����ɓoϛ7� -�x���^�)c\.W�5k��1x��1��s����ȧ�~����<z�����������e��n	Se]at����3�bw�����]��c���c ��Uu-Z���1c��޽{:X�A�n�,���;�s�믿�d�H��C8~��.\8b�1�Qȷ�5e�hY���]�S�>����y�W~���(t�5|���i��B��w���}{���b�> cw�Dsh�8��U���^���*]hw�aÆs�N��$-�oh�}J�o$��bBz���Çw_�`���N��%n���M�I���)�����\�]�x<%W�\9�o߾�!����`�ѳ]S�A��`eq��#�u�t�1�D�O9��ɴ�h�2�&�2t�Pw�lE1���l"���/��%В�P
�C�>B!|(��B�P
��>
�C!|(B�P(���>
�C!|(B�P(���P
�C�>B!|(��B�P
�C�>B!|(��B�P
��>
�C!|(B�P(���P
�C!|(���� �L�P?H�;    IEND�B`�PK
     �8N�?��'  '     weather/weather_18.png�PNG

   IHDR   �   �   ��   tEXtSoftware Adobe ImageReadyq�e<  &iTXtXML:com.adobe.xmp     <?xpacket begin="﻿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:0236C5D4474F11E7BA6FD70D91EA4C93" xmpMM:InstanceID="xmp.iid:0236C5D3474F11E7BA6FD70D91EA4C93" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:BFAAA713474D11E7A36DF4B7D635BCE0" stRef:documentID="xmp.did:BFAAA714474D11E7A36DF4B7D635BCE0"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>�Gf�  #�IDATx��	��ǫ���{�f�9EAt/L1c�x%�]]׬FMB��U�F�I<��&&FE%D�w ��澧�:�}����������i���)��������=��x��LUմ?ka���X������333f>f>f�|�|̘1��1��1c�1c�1c��c��cƌ�ǌ�ǌ�ǌ����333f>f>f�|�F�ܰT�W�ܚ��Qx+ݻ��=�7��y�32�7�� fcg��E�����~�1	�v�j|���yMUU��Y.�sx7��i�(J��f�\��#�}����������|QH4���7���Cp�N�����D�sx���1�/���<|��9q��Y���	���2[yY��]�:vKA���t8���l�o�?EUTXϋ���{ܙ$�Jx�%�+�ODQ	�D��P���g��5|��Pe6�����iբ�>��C($41����2��j��sNs�O�uTU�;�J��� c�����"H\�R��*��j��m�qw#����<�ӟ����O����:��惭B��%�2d*0¶~8޿�����XD�������5��a5�9���ys�)��\SPQ^�,).t�2qhF�P�LR`��x0��qh!G�J�`� ���ʉ��[,��k'U�t��AR����;�C{�5�P�0� �x���{\m(��>����o����E��O���*[NY8�v�)��k�&M�,�$��x�Xxh���F�i���I������j���@v����6n�ط��V���|�K!Q:m	����,w�e��-^PZ?uR�LK<Su �A���:�D�A;�w������<����yA�p7f]��j!���:κb���^zry��ڲ���b��06��/.r�;.��a��n���5�-V��t�G�W;���a�a%�F$CD�D��(�JH�e!��*AH,��?�?�A@'����A�WXLz"ǥ(]���[�����f�2n�C��ح��|��oN��������BBFj/-)*�l���2��Q
�d�I�"	c�%���� �a���y}�����~Q��DJkFeV8Vn`����?������A��K����)W�늚����  a	 ��M E��& h%&��MB���噅6�/����P(�=��u��t�R���'Yh p�~�i��5��CqԻc_
�A�:��ߺ�n@G�����@x7��WC��ȆJ� ��m�B�q'�(I�~���g���o�7�8P�����^����^|�	����3�����^Z?��&
�[IiqQ]A�k2�_��s  �e��2����j�kl����o(��|Z)Hd*��u2�_"".d��5
�JEx/���l�i��9���m���ke�o@Ǳ��#a����U��mk>�z]1�/A"1����gw~�n������²��).���͕"`NT; �	4�`[���O*�e
��"& p�� #,������7��/�y�hm�>�I��5O���@H\���Z�~n]ӑ\jq�ŏ��,�g���k���ǂK- �Z[\T4��� h. � =�d˲�d{_2�f~��~H� #v�L��P{����Ξ�@ �pL��u�gM��\�<�'�%|�M�{��������i�]��� �@�j�0���`֌�����ҙ��9���tX v�����ӫY�VH��Z^x�!�;��;�o_kG�A��D�/z�:��n��/�����z��1/n�0 Г&x���z�vK�&O<b�9�l�p�8L5��|&�d�TaEO AD9�}��y���:z��I��ږ���n���}�8�%��u� �Î%�7_y���fϸ�a���uq@K�~��,p�$�K%��! �`������k�U�=d�� �6 q A,��m�]����O�P��c�*=�7��t8N���okɔӾ�����̾b�u��p����}���8��o�TNʹ�1����X	���C�d���Iɮ����հ�~aL��]��|���&!cѫ%��a:ǽw�8�+瞾��E�E���U�n*��4RZ,���b�ޓ�k����_�.�E[�������W�A�U�w9�Z�1��d=B3���ee%�c�����#Q�i�S�>�`��i7\s� ��F�E��1_�Сͯ�����u�۰��A��F��8���-s.���ŐHL�Db��a��G2V.��i�5�`+\?�=���e'��H]�Oʕ�b1(a'@HU��~H,>�������^v�V3�w����Fb:Ǐ~p�����%p7N�Z-E��lV�D`ɭs��k#�Yɱ�Yr���,�������T룇�	�b���7�g( %�&+� ��mP�����n�U�N�>���gSH�q�'l%ŅE+�o��ٯ:��"{ޕZ���M7X�;��S���Sk'U�Ö��^nv!����Z�;	a�(�RU-��/S�!�Q4Q�3��@x\�^�d�K��A �}������A�y_���dꗗ-D�/=����f-Upb���rNWN*xz�,)��mS)],���Q$Y�W<��q�jv��wn�o�OH�<���?�B��/��cB���Ӧ��?]���9gx�̥��� �Ix \,���^��0�K>JL��u��.��v<n8'�R�����8����C�͢[F|����(;���F�`;��࿗�z��d|��<���^t�Sϲ�ln��*,t7��'`�k�Y,���X>%�s�n|�At�S�	5L9&Z�y��

ؑl[���/**��E� �~��bX��RWSI<����a�ĺ?�j��9�,&wL� @�\KH����l�Ʌ��KWk��P� "B� 4}N )�Z9E����Y�������������]��~C^�W3kYݦןZR7i��h�j���L�N�2B�dg!k��dl�()WF	C�k�a@���q'�oB�6^�wȌ'OT�p��A2NUR���M;��)^z|YEYI}�$جp\��O���4x�.ǧ	���l��j��+��2�O�,��-��~Q�~>X%(JР�c��P�x<�/��ݓ�T��������>���x*F�ة�	x`�
�Jt'Φ<t
�Fm.�s��r�P`�D��Ǘ��}N,kO%�5���>�j��?C��+�,�b>���˟~�xBEi��鬀�%=�#Y��Vg�-z���L��� L�dy�# �,o����+Ƃ�$� І�:���d�����6�iU:����duɱ�����{Ϩ�;Ԯ��GZ�HPg�UQe��-���(Կ�A�'�pj �*�X�e��؍7v�F�~��ʈ�N� tA��_2f$���/^���쥋΅Lv:�s�ǩ"&�t���~
.:��O󷪹N��L��K�����MtR�8х����o��S|��y�:�!λ���h.�v���,�c)�v�4�d�Tc��0>Ջ����4�Y.Z�x���z�[��ù���_�t��m
	���/�.y/��]o(�C�0�x��Ǘ���,�w��W�@��ç�P#�/^4���E�/�l�(�lP����x\O�c�&?""�U��ݿ�K�)"��u�*�K�^zv�	�SkOջY�B��%8�J�'%�HCy��ݕ��Z�H�H8D7����hY�%j� ���~���I#m��xO����ښ�:�b+�h�������(&�\��OT�H�����'Q�l��r��x�m `Y��&�cT�K�Y���n�Ɇ��ף��7��<f���*��5A��Q�Ѿx8��d�:�^�P
�ʟN�["@�DJ�?=0��j�IEAL�zFQ�,T�[{g��7���?���޻o�7�a�����,KP�S��N��T�D���OYR>I�$�~�ċG�g��e.~��D	�"�biu�̽��r�&x+�V�\���r�Գ�.�ID{��uRH<N�d�.â�X�SP�\����G�p�	��dc*�mY�i'��Ҳ.�Ы^'D|�xO�e��G�aw���~X.����O�Z����/�S�j.Ղ#�u���8K:����2�"YV�n5���-�U\� n9��)�t	x�'�z�/k�Y��̠�р�r��_�1�zB����p:Y.v�݈��cN��<�e�)�������Lg�T�s��c�2 ���ft� ��� <�k��nգ��N�\��k�.UQ	 ��}/I�7R;�6��F ��/iP��Aj�֗�O[��3}�V��+�\o�o�������u�����/��FS:��
>'Ю��(�2����i^-�0|ѩtYo��*� ć�e���:��t_�3P9��d���A�J�֔��k�x��\����?����݉1�!5��3�Y�z���D�b&,�%i�n��NԈr��U�P��$7$��M�b�b�,*\��p�1nL���W�����;>޾{�W/��]�w0ӧ�D��L.�����\.W��6�;��׃��r:�(�F����&��͒w���2�(l>�%E�^YuI�:����_�n5�w� ���/�	|%%E8ӥ�j%O�	+ ���{KK��x�c8EK��7H�v�$���\��*I�Y�l6R���yW�#�4��]�}��=�����c�q�y	�d�r��VP4Y	��~�c�q�;Ga�M;�R|��%(
D�&?�I��j�i	�@z�X����@��/��w\d�Ĭ�9�X���$1�����n&�g�t��N��NE�1�F��*QA��3�tQ2��I���Ǜ�"!Ό�D��Q�??�k �)�;'O��	|�,���M�
���w���!�)��u�fC�Z��E��'��/]Hs��\.ڄEx~��J�]OH�n���袳/�c��+�5|j0(��øO�ӃV¾��C�(��@*mo+JR�0�j�(Z��"��;�&[2�&�ύ�`�S��ʊ���?y��V���k��G#��*|�}^z"��ܨ�=}{p�.�X�v�>H<�݄H�o�eIpa��b��4!M&�(B�&�, � �ؠv�}}o�������������1SJfΘ6���R9���A,,t�`!+ن�2�Ҫ���Z�9�#����Ė仲2�J���m2y��l�q�jn��4i��5���q��+�셇}v7�gz�@k�伂O=p��y�gOćgc&�A,?L���l �tT�vD���68���j�@z8�WI$�ْ�g���b���+�qɒ�H�\,�ͦ)?No惐�����o>غy�e��탭;��=�/���$�h��n?x��g8�#��d���C]ݽ�������`X|$#6�
��T%.(T̩������;U�is��h�J�sp��,�|���ֽ����_���O_?���v��.hWw����O�H����nn���z��`0��t:ܠr��X�ȇp.P?�A3�VZ��g�zW�A���u"�qXZ��D���� �u��o`Ȼ�<�,ɞ�~���W=�+��|s�akm��̛s�{rMU���:\,���4h��G��tê��a� 1GZ?�����&q���)B��ԚE(Rm	I������q��#��X�(�-�$u���O!����׿����<�7U7{D��'���i9��K�!�sQn0�EBAmMde($��A��ᴻ�$�-�����PT	IV,�ﵘ�+Pf�g0H�]|�`7�t���b&�J��n�����=������ӟe
^>�o�A�����y�V],���"#�(��Y��v{!�[T?��Տꂟ���D���ʅ�R,g��m<�;�s����݊*�(� 9^��x}�=�x��{��z�c;�^^Ç���;40�QN>�*��j�i�_���(	p�v����lN��K/���$���zO@Hk�<��L\�X�J(���ǛK&�p��ta��m���'�����-�o�く��9 ��C��t��Ze��Y@n��j���8"OT@�m�	���,8�v,�p��K&סŇZ�Zk��|h�ɔ�l>�^a�Eb@Q�^|ܕ�������P���߽����1[ݡ���v������%,^8��n����P�zQù	����,�u��a�l 0Q>3	�F��o��K�����N�����:"���[���S(���C�,5�
7j�Y�3:�TGg���V|w}.Z-��К���e{��'��jjE�h���|�k��H���4�֑��Z��L��A�Y�2��2@� �%DK�Ӗ �9?Q0�h.?��*�]�pZ3P�p�*q�����5�ڵr�P��Aρ/]t��-���Vw���60���+o��:��:���i�ȏ��x��#�� Yq_A��2b�KX" `����'K
�HMJ5eݫD��!S��+�v1�tq���3u�a *'x�C�5�M�@ġ[��ߗv�nj����sG=|�E{wӶ�/��?n����]H�}Q�,����\5��Z����R��U}�@�ײ\TF�K�yf��#�\o�5ԋ���G�|?��aB�O��A�bóϯ���Y�/[��x�/|�Z�>�vC��h�V[�r9��z)�E�q�#�{Gw���R�B_ ��(S@�t���|

h�^�(ѐi����ƅcK�����fx�qXr$`Mb��A�`�������qtm����W䉒���9g.YT_Q^2�ϊ��9@+A�j��u�e�sA=ϊ�@izyz��Gb2��}��L���MԽ����y�ێ�;�"��t��(�3t��k�����_z��pn��~���G6|�i�pͥ3.�ଆ�U��YW>�h>B��TUV��r:�	_<�u���DЙ� @�
�ݐ����hO��E��ʞ�n�癷7nm���>=��,�?���\R;{f�4P�R����<�kX�L����:)|�#ݳ M� b��S��k�X��w�Rt�0��>\{�M+s�n�-|�<��߹����V;m��I b���fu�TW^
�K��!�q`Ts��1���H � �-^-��x�eK`gWϧ�ξ��\w?*�3Pðs����.Y^3����X�p�ݚ�[V9��b|Bj2�3L�c!�����9c ��H�� �C�,jI
�i !�\uÏ����'F�_^&���S'�@����Ӵh0^zѹS�=���)u5e�����P^z1��6S�SA����񼉞:n�W"��@�~��_��V�-Gf�
�]��bgppx
~�m�o�խ;������*���%QE�=k�h��'�9e��;-� �d6⦵�B���/�
)n ������s�f:�l��BttH(;�oTʹLل*tV���Zf/�hu.�9�ʗ`���Y�����=�?w�G�Q�u +�%�-G�y�L�AH!���F EaQT��U3JY�놕��L* ��փ����m�c>Ү۸P��X���?|c���x�C�t]��D�(: U]-��MᲡ���}�O8��ώFM/��g�Ʊ�Y|�/~����f��F�%��D�vܱ���n�O�֕��U:Ҟ�1r���wbY���~�w.���1��CD���s�<��i�K4�u�
h�Zk�VK-d��EI�M₳���m]�O^v��F��/����]��V�}FD2�����qL��a_P�r.�٬��3X(�3P�M�[���#U���4 �,���o�����t�<r< ��;VW�)u���8�/4 -.����5��==������#��r��G .��{�`ێ�9_NWa (\MW�ש�%���b `tv��_ް�HV��>�����;�އC
M�}# E����?I���	��[<^o��<��)���|9��+�s������D�F �]�!Q��'O��MhI7޵g�'\
���W�qG�!��r�P�]��t�O �K�+���)~[�v~Vd\���~��[ �:`�.]��*]����$*D�67��}{�=
��7� � �=���뱇~|���:�,� ����`��4�t�E< 9x�p"��;�;�{����pG��d��sO��g}}�f���/D�xpr�$��o�ٸ�3�oߑ���?�Z��78���Z`�-!10 �e��d�;�y���(��= U�u�I�~o˽ع3�
ȧZ�	������s��	a��W߶��<uG($�' �:������K��<��o�,>�;=������j�F g��C �惭���;��5XC���8	1,Dc��?�D[6g�b��7�
,���o�H��&!	Ѣ$�CR44��/������|϶����vpÛu�R<�!�l)��@a��7�����%3F��&cxU�Q�O�ҕ/���~�������)���}��������d�ZN�`�lh��G_�pG�;�g/���W���!i�%�r����r�6�Q��Ջ>\0���~��w*+˿�'B��ᒌ����n�9�#��L�F3پ��e�I+~���V�
�f[�v[�x��)_� DU�
��aZm�k���j�
�Ζ�9hƛX0�ˁ
6n{�e��W?�vÈ�8]t�\��W+���}��z�G�3Ͼ���+�����nS>f)eİ,<�[��}��7z>�7(����Z1�F���g��:�{�~o�OC!�%U %I���Y��%� �い佊�=o������u߰Z�%f�����q�}�)��b,N�+��wxSWw�k\d�w\đq<��u�8Z";*&
�W#�Z�o�����kK�O�t��$�[>����Kn|3�N�Ԏ�9��f�(�nz���g�l����b[�?����w������9�3Q�1�	[2�D����h����i|��>�p0c�.33f>f>f�|�|̘1��1��1c�1c�1c��c��cƌ�ǌ�ǌ������333f>f>f̲o�/� ��5e6�"�    IEND�B`�PK
     �8NA�k�   �              �    description.xmlPK
     �8Nr���               큽   manifest.xmlPK
     6�8N                      �A  strings/PK
     �8NI�49~  ~             �*  strings/strings_km_KH.xmlPK
     �8N����	  �	             ��  strings/strings_pa_IN.xmlPK
     �8N+�
  
             �'  strings/strings_ne_NP.xmlPK
     �8N�H���  �             �M1  strings/strings_ur_IN.xmlPK
     �8N��  �             �<:  strings/strings_ms_MY.xmlPK
     �8Nz)N7�  �             �B  strings/strings_iw_IL.xmlPK
     �8NH<e��  �             �CJ  strings/strings_uz_UZ.xmlPK
     �8N]�i�w  w             �$R  strings/strings_ar_EG.xmlPK
     �8N��q�  �             ��Z  strings/strings_es_ES.xmlPK
     �8N.P^�  �             ��b  strings/strings_tr_TR.xmlPK
     �8N����Z  Z             ��j  strings/strings_kk_KZ.xmlPK
     �8N&q9s  s             �rs  strings/strings_ja_JP.xmlPK
     �8N�Êp�  �             �{  strings/strings_ur_PK.xmlPK
     �8N!�6O�	  �	             �	�  strings/strings_hi_IN.xmlPK
     �8NֽUU�  �             �%�  strings/strings_sq_AL.xmlPK
     �8N�1�  �             �&�  strings/strings_fa_IR.xmlPK
     �8Nۚ��U
  U
             ��  strings/strings_as_IN.xmlPK
     �8N��"��  �             �t�  strings/strings_it_IT.xmlPK
     �8N4Tfk�  �             �p�  strings/strings_hy_AM.xmlPK
     �8N����	  �	             큜�  strings/strings_mr_IN.xmlPK
     �8N�����  �             큇�  strings/strings_lt_LT.xmlPK
     3�8N��`�-  -             �U�  strings/strings_zh_HK.xmlPK
     �8N��=�|  |             큹�  strings/strings_ml_IN.xmlPK
     �8NPD��t  t             �l�  strings/strings_nl_NL.xmlPK
     �8N\XI��  �             ��  strings/strings_bg_BG.xmlPK
     �8N��je�	  �	             �$�  strings/strings_th_TH.xmlPK
     �8N�)�E
  E
             � �  strings/strings_bn_IN.xmlPK
     �8N�.��  �             큜 strings/strings_ro_RO.xmlPK
     �8N<H�]�  �             큣 strings/strings_in_ID.xmlPK
     �8N	����  �             �s strings/strings_gl_ES.xmlPK
     �8N"!�d�  �             �3 strings/strings_cs_CZ.xmlPK
     �8N�9�  �             �8% strings/strings_hu_HU.xmlPK
     �8N�A�8�	  �	             �- strings/strings_or_IN.xmlPK
     �8N�q��               �G7 strings/strings_az_AZ.xmlPK
     �8N��m*  *             큄? strings/strings_en_US.xmlPK
     �8NN�(�  �             ��F strings/strings_ru_RU.xmlPK
     6�8N�����  �             큝O strings/strings_zh_TW.xmlPK
     �8Nٗ��s  s             큍X strings/strings_et_EE.xmlPK
     �8N��	h�	  �	             �7` strings/strings_kn_IN.xmlPK
     �8N���  �             �6j strings/strings_be_BY.xmlPK
     �8N��\�A
  A
             �&s strings/strings_gu_IN.xmlPK
     �8N�)�E
  E
             큞} strings/strings_bn_BD.xmlPK
     �8N�1�<�  �             �� strings/strings_sl_SI.xmlPK
     �8N�͙��  �             �� strings/strings_sr_RS.xmlPK
     �8Nk�_�m  m             �� strings/strings_da_DK.xmlPK
     �8Nvy���  �             큌� strings/strings_pl_PL.xmlPK
     �8NGt��  �             큸� strings/strings_mk_MK.xmlPK
     �8N.\�x�  �             �� strings/strings_de_DE.xmlPK
     �8N�=
��  �             �й strings/strings_lv_LV.xmlPK
     �8N��9               ��� strings/strings_bo_CN.xmlPK
     �8N+�
  
             �F� strings/strings_ne_IN.xmlPK
     �8N�:Go  o             큅� strings/strings_en_IN.xmlPK
     �8N�"���  �             �+� strings/strings_bs_BA.xmlPK
     �8N��3�  �             �#� strings/strings_sk_SK.xmlPK
     �8NW3fp               �
� strings/strings_ha_NG.xmlPK
     �8N��BK               �L� strings/strings_zh_CN.xmlPK
     �8NZ�$ڪ
  �
             큏  strings/strings_te_IN.xmlPK
     �8N{E d  d             �p strings/strings.xmlPK
     �8N]4�lx  x             � strings/strings_sv_SE.xmlPK
     �8NvW��  �             클 strings/strings_me_ME.xmlPK
     �8N���Ws
  s
             큨" strings/strings_ug_CN.xmlPK
     �8N���wD	  D	             �R- strings/strings_el_GR.xmlPK
     �8N���>x  x             ��6 strings/strings_hr_HR.xmlPK
     �8N2k��_  _             �|> strings/strings_nb_NO.xmlPK
     �8N����  �             �F strings/strings_pt_PT.xmlPK
     �8N����  �             �'N strings/strings_fi_FI.xmlPK
     �8N�vY��  �             ��U strings/strings_pt_BR.xmlPK
     �8N�:Go  o             ��] strings/strings_en_GB.xmlPK
     �8N����  �             큛e strings/strings_es_US.xmlPK
     �8N�J�G1
  1
             큛m strings/strings_ka_GE.xmlPK
     �8Nt�D�  �             �x strings/strings_ko_KR.xmlPK
     �8N�e���  �             �� strings/strings_vi_VN.xmlPK
     �8NJC�o  o             �χ strings/strings_my_MM.xmlPK
     �8N�Z�l�  �             �u� strings/strings_fr_FR.xmlPK
     �8N.co\  \             큀� strings/strings_uk_UA.xmlPK
     �8N���na
  a
             �� strings/strings_ta_IN.xmlPK
     �8N.�r�  �             큫� strings/strings_eu_ES.xmlPK
     �8N�7�(�  �             큆� strings/strings_ca_ES.xmlPK
     �8N�:Go  o             �>� strings/strings_lo_LA.xmlPK
     �8N�g��  �             ��� strings/strings_mt_MT.xmlPK
     �8N                      �A� weather/PK
     �8N�9��               �8� weather/weather_0.pngPK
     �8Nb�l�P  P             큃� weather/weather_13.pngPK
     �8N_@��E  E             �� weather/weather_4.pngPK
     �8N�AZ�l  l             � weather/weather_12.pngPK
     �8NR ��k  k             �& weather/weather_2.pngPK
     �8N؁�E�  �             큽8 weather/weather_7.pngPK
     �8N�B���  �             ��O weather/weather_1.pngPK
     �8N/���  �             ��d weather/weather_3.pngPK
     �8N�xz��  �             ��v weather/weather_22.pngPK
     �8NZa>G%  %             �� weather/weather_24.pngPK
     �8N�?��'  '             �h� weather/weather_18.pngPK    _ _ �  ��   