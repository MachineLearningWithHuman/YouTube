<h1>Machine Learning Classifier In Javascript</h1>
<li>We are using javascript and training on csv file</li>
<li>First line must be headers</li>
<li>Without these code cant take advantage of tensorflow</li>
<li>We will define a function for training asynchronously</li>
<li>we will load the data from server /pc folder</li>
<li>for csv management use tf.data.csv function</li>
<li>In columnconfig section mention which column needs to be treated as labels</li>
<li>As it is multiclass classification we are gonna use one hot encoding</li>
<li>Label will be in the form of [0,0,1] form</li>
<li>Objects.values will give me my array of features</li>
<li>lastly use batch to specify number of sample per batch</li>
<li>Then we are gonna tell our model how it looks</li>
<li>as usual use sequential to initiate</li>
<li>use dense layer to add hidden layer provide inputshape and activation and number of hidden unit</li>
<li>lastly provide output softmax layer</li>
<li>use categorical cross entropy for loss</li>
<li>for optimization use adam with learning rate 0.06</li>
<li> the name Adam is derived from adaptive moment estimation.</li>
<li>used for non convex problems</li>
<li>adam= Adaptive Gradient Algorithm+Root Mean Square Propagation</li>
<li>difference adam use variance where rmsprop use mean for avg gradient value</li>
<li><a href="https://machinelearningmastery.com/adam-optimization-algorithm-for-deep-learning/#:~:text=Adam%20is%20an%20optimization%20algorithm,iterative%20based%20in%20training%20data.&text=The%20algorithm%20is%20called%20Adam.">for more on adam click here</a></li>
<li>for training use model.fitDataset</li>

