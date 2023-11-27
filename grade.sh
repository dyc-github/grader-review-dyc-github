CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

# grading-area
# student-submission

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point
submissionPath="student-submission"
if ! [[ -e $submissionPath ]]
then
    echo "No submission found"
    exit
elif ! [[ -f "$submissionPath/ListExamples.java" ]]
then
    echo "Submission found but no file"
    exit
else
    echo "Valid submission"
fi

cp -r $submissionPath/* grading-area
cp -r *.java grading-area
cp -r lib grading-area
cd grading-area






# Then, add here code to compile and run, and do any post-processing of the
# tests
javac -cp $CPATH *.java

responseCode=$?
if [[ $responseCode -ne 0 ]]
then
    echo "failed to compile error code: " $responseCode
    exit
else
    echo "successfully compiled"
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > testOutput.txt
stringsWithFailure=`grep "FAILURES!!!" testOutput.txt` 
if [[ "$stringsWithFailure" == "" ]]
then
    echo "passed 100% good job"
else
    input_string=`grep "Tests run:*" testOutput.txt` 
    numbers=($(echo "$input_string" | grep -oE '[0-9]+'))
    passedTests=$((${numbers[0]} - ${numbers[1]}))
    totalTests=${numbers[0]}
    echo "Something Failed"
    echo "Score: $passedTests / $totalTests"

fi

