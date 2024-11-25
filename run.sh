set -ex

export LIVEBENCH_API_KEY=http://localhost:32000/v1 

run_id=$1
debug=${2:-false}

args="--model Qwen/Qwen2.5-7B-Instruct \
--model-id Qwen2.5-7B-Instruct \
--api-base http://localhost:32000/v1 \
--bench-name live_bench \
--output-base-dir data-$run_id \
--default-temperature 0.7"


cd livebench && \
if [ "$debug" = true ]; then
    python -m pdb -c continue gen_api_answer.py $args
else
    python gen_api_answer.py $args
fi
;

# --parallel 128 \