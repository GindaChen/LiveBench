# LiveBench



## Quick Start

## Installation Quickstart

Tested on Python 3.10. To generate answers with API models (i.e. with `gen_api_answer.py`), conduct judgments, and show results:

```bash
cd LiveBench
pip install -e .
```

```bash
cd livebench
```

Generate answer with API model (vLLM)
```bash
export LIVEBENCH_API_KEY=myapi # you API key if needed. Usually not needed for VLLM.
python gen_api_answer.py --model <api_model_name> --model-id <api_model_id> --bench-name live_bench --api-base http://localhost:8000/v1 --output-base-dir data 
# python gen_api_answer.py --model Qwen/Qwen2-7B-Instruct --model-id Qwen2-7B-Instruct --bench-name live_bench --api-base http://localhost:8000/v1 --output-base-dir data
```

To score the model outputs:

```bash
python gen_ground_truth_judgment.py --bench-name live_bench --output-base-dir data
```

To show all the results:
```bash
python show_livebench_result.py --result-base-dir data

# Alternatively, if you move all data into a folder like data_multi:
python show_livebench_result.py --result-base-dir 'data_multi/**'
```




## Question File
To optionally download `question.jsonl` files (for inspection) and answer/judgment files from the leaderboard, use
```bash
python download_questions.py
python download_leaderboard.py
```

To use `question.jsonl` files instead of using the questions from huggingface, set `--question-source jsonl` on `gen_api_answer.py`, `gen_model_answer.py`, and `gen_ground_truth_judgment.py`. This is also a useful feature if you want to tweak the question jsonls or experiment with your own questions.


## TODO

- [ ] `common.py` - Hack: make sure tokenizer is used wrt model.