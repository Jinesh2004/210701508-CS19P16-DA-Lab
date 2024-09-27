-- Load data from local file
A = LOAD 'C:/ex4/uppercase.py' USING PigStorage(',') AS (field1:chararray, field2:chararray);

-- Perform some processing (example: uppercase conversion)
B = FOREACH A GENERATE UPPER(field1) AS field1_upper, field2;

-- Store the result to a new file
STORE B INTO 'C:/ex4/output';

-- Dump the results to the console (optional for debugging)
DUMP B;

-- Register the Python file (uppercase.py) from HDFS
register '/pig/ex4/uppercase.py' using jython as myfuncs;

-- Load your data (example)
data = LOAD '/pig/ex4/class.txt' USING PigStorage(',') AS (name:chararray);

-- Call a function from the Python script (uppercase.py)
uppercased_data = FOREACH data GENERATE myfuncs.uppercase(name);

-- Store the result
STORE uppercased_data INTO '/pig/ex4/output.txt';
