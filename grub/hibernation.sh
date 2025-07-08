echo ''
echo 'IMPORTANT!'
echo '==========================================================================='
echo 'To disable kernel lockdown mode (if supported by kernel compilation flags):'
echo '==========================================================================='
echo ''
echo 'To properly enable hibernation support, run the below commands (depending on your setup).'
echo "sudo grubby --update-kernel=ALL --args='lockdown=none'"
echo ''
echo '==================================='
echo 'If hibernating to a swap partition:'
echo '==================================='
echo "sudo grubby --update-kernel=ALL --args='resume=UUID=<UUID_OF_YOUR_HIBERNATION_SWAP_PARTITION>'"
echo ''
echo "Get '<UUID_OF_YOUR_HIBERNATION_SWAP_PARTITION>' by inspecting the output of 'lsblk -o NAME,TYPE,SIZE,MOUNTPOINT,UUID'"
echo ''
echo '=========================================================='
echo 'If hibernating to a swap file (on a non-BTRFS filesystem):'
echo '=========================================================='
echo "sudo grubby --update-kernel=ALL --args='resume=UUID=<UUID_OF_THE_DEVICE_WHERE_THE_HIBERNATION_SWAP_FILE_RESIDES> resume_offset=<OFFSET_OF_THE_HIBERNATION_SWAP_FILE>'"
echo ''
echo "Get <UUID_OF_THE_DEVICE_WHERE_THE_HIBERNATION_SWAP_FILE_RESIDES> by inspecting the output of 'lsblk -o NAME,TYPE,SIZE,MOUNTPOINT,UUID'"
echo "Get <OFFSET_OF_THE_HIBERNATION_SWAP_FILE> by running 'sudo filefrag -v <ABSOLUTE_PATH_TO_YOUR_HIBERNATION_SWAP_FILE> | awk '\$1==\"0:\" {print substr(\$4, 1, length(\$4)-2)}''"
echo ''
echo '======================================================'
echo 'If hibernating to a swap file (on a BTRFS filesystem):'
echo '======================================================'
echo "sudo grubby --update-kernel=ALL --args='resume=UUID=<UUID_OF_THE_DEVICE_WHERE_THE_HIBERNATION_SWAP_FILE_RESIDES> resume_offset=<OFFSET_OF_THE_HIBERNATION_SWAP_FILE>'"
echo ''
echo "Get <UUID_OF_THE_DEVICE_WHERE_THE_HIBERNATION_SWAP_FILE_RESIDES> by inspecting the output of 'lsblk -o NAME,TYPE,SIZE,MOUNTPOINT,UUID'"
echo "Get <OFFSET_OF_THE_HIBERNATION_SWAP_FILE> by running 'sudo btrfs inspect-internal map-swapfile -r <ABSOLUTE_PATH_TO_YOUR_HIBERNATION_SWAP_FILE>'."
