set -ex

export LIVEBENCH_API_KEY=http://localhost:32000/v1 

start_run_id=$1
end_run_id=$2

echo "Running from $start_run_id to $end_run_id"
for run_id in $(seq $start_run_id $end_run_id); do
    bash run.sh $run_id &
done
wait
