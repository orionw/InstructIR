#!/bin/bash
echo $(date)
cd /brtx/606-nvme2/oweller2/FollowIR/InstructIR/eval
bash eval_rerank.sh $1 $2 $3 $4
echo $(date)