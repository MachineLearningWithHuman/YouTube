<h1>90 days of portfolio project in IIT ROORKEE</h1>
<h1>Building Conversional Experience Using Dialogflow</h1>
<h2>End to End Projects</h2>
<h2>Project 1: create a conversational interface</h2>
<h2> Use case Pizza ordering system</h2>
<h3>Objectives</h3>
<li>Build a conversational agent for a fictional pizza shop that will let users place orders</li>

<li>Define intents for a pizza-ordering use case to match typical user queries</li>

<li>Identify entities to extract data from user queries</li>
<li>Enter into your google console </li>
<li>Enable your APIS <b>dialogflow</b> API and <b>cloud Natural language</b> API</li>
<li>go to  http://dialogflow.com</li>
<li>enter into dialogflow console</li>
<li>sign in using google account</li>
<li>create an agent named as "pizzabot"</li>
<li>google project:define the project </li>
<li>if you are first into google console see internet how to create a project into google cloud </li>
<li>Dialogflow will create your virtual agent </li>
<li>click your intent page </li>
<li>Default Fallback Intent: when bot failed to understand users request</li>
<li>Default Welcome Intent : When bot greets your user</li>
<li>these two are default bots in your account</li>
<img src="https://github.com/MachineLearningWithHuman/YouTube/blob/master/chatbot/image/image1.png" width="800" height ="600">
<li>try saying hi in console and you will have response like below</li>
<img src="https://github.com/MachineLearningWithHuman/YouTube/blob/master/chatbot/image/image2.png" width="800" height ="600">
<li>change the default response in the response section of the intent say "Welcome to our store " or "How may i HELP YOU TODAY" any thing your wish under the hood your agent is a NLU module which will included in your project</li>
<li>create ana intent</li>
<li>intent are intention of the user that was captured by your agent </li>
<li>click on the + sign in left add opening.hours in intent name</li>
<li>great next add training phrase </li><li>What time do you open ?</li><li>Are you open right now ?</li>Are you open today ?</li>
<li><img src="https://github.com/MachineLearningWithHuman/YouTube/blob/master/chatbot/image/image3.png" width="800" height ="600"></li>
<li>In response section under text response add We are open from 10 am to 9 pm every day. Can I help you place an order ? </li>
<li>save after the training was over try on console</li>
<li><img src="https://github.com/MachineLearningWithHuman/YouTube/blob/master/chatbot/image/image4.png" width="800" height ="600"></li>
<li>Now we will extract data with entity</li>
<li>create a new intent </li>
<li>name it order pizza</li>
<li>add training phase 
<li>can I order a cheese pizza for pickup today at noon ?</li>
<li>I want to order a cheese pizza for 1 PM tomorrow</li>
<li>I want to order a small pizza with chicken only</li>
<li>I'd like a small pizza with mushrooms</li>
<li>I want a pizza with pepper and mushroom</li>
<li>I'd like to order a pizza for pickup in 1 hour</li>
<li>I want a chicken pizza</li>
<li>I want to order a large pizza</li></li>
<li><img src="https://github.com/MachineLearningWithHuman/YouTube/blob/master/chatbot/image/image5.png" width="800" height ="600"></li>
<li>in ressponse type Great! We've placed your order for $date at $time. See you then!</li>
<li><img src="https://github.com/MachineLearningWithHuman/YouTube/blob/master/chatbot/image/image6.png" width="800" height ="600"></li>
<li>create entity size , check define synonyms</li>
<li><img src="https://github.com/MachineLearningWithHuman/YouTube/blob/master/chatbot/image/image7.png" width="800" height ="600"></li>
<li>create other values as well pizza_topping </li>
<table style="width:100%">
<tr>
<th>Values</th>	<th>Synonyms</th>
</tr>
<tr><td>pepper</td>	<td>pepper</td></tr>
<tr><td>mushroom</td>	<td>mushroom, mushrooms</td></tr>
<tr><td>bacon</td>	<td>bacon, bacon pieces, bacon bits, bacon slices</td></tr>
<tr><td>vegetarian</td>	<td>vegetarian, veggie</td></tr>
<tr><td>cheese</td>	<td>cheese</td></tr>
<tr><td>jalapeno</td>	<td>jalapeno, hot peppers</td></tr>
<tr><td>sausage</td>	<td>sausage</td></tr>
<tr><td>onion</td>	<td>onion</td></tr>
<tr><td>ham</td>	<td>ham</td></tr>
<tr><td>pineapple</td>	<td>pineapple</td></tr>
<tr><td>chicken</td>	<td>chicken</td></tr>
</table>
<li> then tag it into order pizza intent</li>
<li>modify response We have placed your order for a $size pizza with $pizza\_topping, for pickup on $date.original at $time.original. See you then!</li>
<li>use slot filling</li>
<li>check the tickbox and give questions when user forget to mention required entities</li>
<li>crate composite entity</li>
<li>click on the Entity section add drink</li>
<li>check define synonyms</li>
<li>list smoothie and milkshake there</li>
<li>creart same for flavours edit ur flavours </li>
<li>create milk type</li>
<li>create composite_drink</li>
<li>enter following @drink:drink
@flavor:flavor @drink:drink
@flavor:flavor @drink:milkshake with @milk_type:milk_type
@flavor:flavor @milk_type:milk_type @drink:milkshake
@milk_type:milk_type @flavor:flavor @drink:milkshake</li>
<li>add intent order drink</li>
<li>response portion add I have added your drink </li>
<li>Export your solution</li>
<li>video</li>


