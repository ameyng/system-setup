# LTS kernel.
efibootmgr --create --disk /dev/nvme0n1 --part 1 --label "Archlinux (LTS)" --loader '\EFI\Linux\archlinux-lts.efi' --unicode

# Stable kernel.
efibootmgr --create --disk /dev/nvme0n1 --part 1 --label "Archlinux" --loader '\EFI\Linux\archlinux.efi' --unicode
