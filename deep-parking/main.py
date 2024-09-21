import pyffe
from pyffe.models import mAlexNet, AlexNet

dataset_prefix = 'splits'

# Load datasets
PKLot = pyffe.Dataset(dataset_prefix + '/PKLot')
CNRParkAB = pyffe.Dataset(dataset_prefix + '/CNRParkAB')
CNRExt = pyffe.Dataset(dataset_prefix + '/CNRPark-EXT')

# Define input format
input_format = pyffe.InputFormat(
    new_width=256,
    new_height=256,
    crop_size=224,
    scale=1. / 256,
    mirror=True
)

# Initialize models
model = mAlexNet(input_format, num_output=2)
bigmodel = AlexNet(input_format)  # Adjust according to actual constructor

# Define the solver
solver = pyffe.Solver(
    base_lr=0.0008,
    train_epochs=6,
    lr_policy="step",
    gamma=0.75,
    stepsize_epochs=2,
    val_interval_epochs=0.15,
    val_epochs=0.1,
    display_per_epoch=30,
    snapshot_interval_epochs=0.15,
)

# Define experiments
exps = [

]

# Execute experiments
for exp in exps:
    exp.setup('runs/')
    exp.run(plot=False)