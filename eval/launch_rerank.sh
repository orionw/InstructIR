#!/bin/bash
first_stage=castorini_repllama-v1-7b-lora-passage
first_stage=bm25
first_stage=facebook_contriever-msmarco

n_shards=4

# "mistralai/Mistral-7B-Instruct-v0.2"
for model in "jhu-clsp/FollowIR-7B" ; do 
    for shard_id in $(seq 0 $((n_shards-1))); do

        # if shard id is not one skip
        if [ $shard_id -ne 1 ]; then
            continue
        fi
        echo "Launching rerank for $model shard $shard_id / $n_shards"
        sbatch --gpus=1 -p ba100 rerank_script.sh $model $n_shards $shard_id $first_stage
        # if i >= 2 then break
        # if [ $shard_id -ge 2 ]; then
        #     break
        # fi
    done
done