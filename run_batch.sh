set -ex

export LIVEBENCH_API_KEY=http://localhost:32000/v1

start_run_id=$1
end_run_id=$2

echo "Running data generation from $start_run_id to $end_run_id"
for run_id in $(seq $start_run_id $end_run_id); do
    cd livebench && \
    mkdir -p data_multi/data-$run_id && \
    python gen_api_answer.py \
    --model Qwen/Qwen2.5-7B-Instruct \
    --model-id Qwen2.5-7B-Instruct \
    --api-base http://localhost:32000/v1 \
    --bench-name live_bench \
    --output-base-dir data_multi/data-$run_id \
    --default-temperature 0.7 \
    --parallel 128  &
done
wait

# echo "Running code eval from $start_run_id to $end_run_id"
# for run_id in $(seq $start_run_id $end_run_id); do
#     cd livebench && \
#     python gen_ground_truth_judgment.py \
#     --bench-name live_bench \
#     --output-base-dir data_multi/data-$run_id &
# done
# wait
