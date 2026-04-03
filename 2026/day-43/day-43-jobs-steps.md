Task 3 Observations:

We are using outputs because we want to pass the output of job 1 to job 2 because both are running on different runners. Now to pass the output between
two runners we have to use github delivery service which is also called $GITHUB_OUTPUT

Lets break down the code:
```
 run: echo "date=$(date +'%Y-%m-%d')" >> $GITHUB_OUTPUT
```

Now, in that same job-one, we have given the step name and id as shown below:
```
jobs:
  # This Generates and sets the output
  job-one:
    runs-on: ubuntu-latest
    outputs: 
      today_date: ${{ steps.date_step.outputs.date }}
    steps:
    - name: Get current date
      id: date_step
      run: echo "date=$(date +'%Y-%m-%d')" >> $GITHUB_OUTPUT
```

Why we are doing this is because job-one could have multiple steps in real life outputting to github output, in that case how would you tell github give me this specific
date output that we stored earlier? This is the reason we give it key "id" and value "date_step".

Now lets get this job-one output exported to job 2.
```
outputs:
  today_date: ${{ steps.date_step.outputs.date }}
```
This is the most important part. Even though the step has the data, Job 1 must "export" it to make it visible to other jobs.

today_date: This is the "Public Name" you are giving the variable.

${{ steps.date_step.outputs.date }}: This tells GitHub to go to the step named date_step, look in its outputs, and grab the value 
stored under the key date.

Under job-two, we have the following:
```
needs: job-one
```
This tells Job 2: "Don't start until Job 1 is finished." If Job 2 tried to run at the same time, it would look for today_date, 
find nothing, and fail. This creates the sequence.

```
run: echo "The date passed from job_one is ${{ needs.job_one.outputs.today_date }}"
```

Now Job 2 reaches back into the finished Job 1 using the needs object. It looks for the job named job-one, finds the public output 
today_date, and prints the value.

Jobs are isolated. You pass outputs because it’s the only secure, official way to move a piece of information from one virtual machine
to another.
