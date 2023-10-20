# glaze hyperparameters

export TRANS_NUM=24
export SEED=0

export glaze_p=0.05
export glaze_alpha=30
export glaze_iters=500
export glaze_lr=0.01

# purify hyperparameters
export pur_eps=0.1
export pur_lr=0.01
export pur_iters=3000
export pur_alpha=0.1
export pur_noise=0.1
export neg_feed=-1.0

# diff hyperparameters
export batch_size=8
export grad_accum=1
export step=500


#adv_dir='adv_p{args.p}_alpha{args.alpha}_iter{args.glaze_iters}_lr{args.lr}'
export adv_dir="adv_adapt_p${glaze_p}_alpha${glaze_alpha}_iter${glaze_iters}_lr${glaze_lr}"
#pur_dir='pur_eps{args.pur_eps}-iters{args.pur_iters}-lr{args.pur_lr}-pur_alpha{args.pur_alpha}-noise{args.noise}-neg{args.neg_feed}'
export pur_dir="pur_adapt_eps${pur_eps}-iters${pur_iters}-lr${pur_lr}-pur_alpha${pur_alpha}-noise${pur_noise}-neg${neg_feed}"


all_artists='raphael-kirchner camille-pissarro pyotr-konchalovsky childe-hassam paul-cezanne claude-monet albrecht-durer eugene-boudin'

device1="cuda:0"
device2="cuda:1"
device3="cuda:2"
device4="cuda:3"

## glaze and pur all
# artists1="raphael-kirchner camille-pissarro"
# artists2="pyotr-konchalovsky childe-hassam"
# artists3="paul-cezanne claude-monet"
# artists4="albrecht-durer eugene-boudin"

artists1="camille-pissarro"
artists2="childe-hassam"
artists3="claude-monet"
artists4="eugene-boudin"

# test_datas="clean adv pur"
# test_datas="jpg15 gauss0.1 resize256"

test_datas="pur"
for data_type in ${test_datas}; do
  export test_data=${data_type}
  bash scripts/new/diff_cls.sh "${artists1}" ${device1} & bash scripts/new/diff_cls.sh "${artists2}" ${device2} & bash scripts/new/diff_cls.sh "${artists3}" ${device3} & bash scripts/new/diff_cls.sh "${artists4}" ${device4} & wait
done

# para_list="0.0 0.05 0.15 0.2"
# for para in ${para_list}; do
#   export test_data="pur"
#   export pur_eps=${para}
#   export pur_dir="pur_eps${pur_eps}-iters${pur_iters}-lr${pur_lr}-pur_alpha${pur_alpha}-noise${pur_noise}-neg${neg_feed}"
#   bash scripts/new/diff_cls.sh "${artists1}" ${device1} & bash scripts/new/diff_cls.sh "${artists2}" ${device2} & bash scripts/new/diff_cls.sh "${artists3}" ${device3} & bash scripts/new/diff_cls.sh "${artists4}" ${device4} & wait
# done

