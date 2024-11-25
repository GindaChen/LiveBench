set -ex

export LIVEBENCH_API_KEY=http://localhost:32000/v1 

run_id=$1

cd livebench && \
python gen_api_answer.py \
--model Qwen/Qwen2.5-7B-Instruct \
--model-id Qwen2.5-7B-Instruct \
--api-base http://localhost:32000/v1 \
--bench-name live_bench \
--parallel 128 \
--output-base-dir data-$run_id \
--default-temperature 0.7 \
;
