/**
 * fat.h
 * Criado por Matheus Leme Da Silva
 * Licensa MIT
 */
#ifndef FAT_H
#define FAT_H

#include <keystone/types.h>

// pretendo fazer de um jeito mais... "universal"

// Constantes
#define FAT16_MAX_ROOT_DIR_ENTRIES 512
#define FAT16_CLUSTER_FREE 0x0000
#define FAT16_CLUSTER_BAD 0xfff7
#define FAT16_CLUSTER_END 0xfff8 // use com >=
// em fat16 é um CLUSTER END quando é >= que 0xfff8

#define FAT32_CLUSTER_FREE 0x00000000
#define FAT32_CLUSTER_BAD 0x0ffffff7
#define FAT32_CLUSTER_END 0x0ffffff8 // use com >=
// em fat32 é um CLUSTER END quando é >= que 0x0ffffff8

struct ATTR(packed) FatBpb{
  uint8_t jmp_boot[3];
  uint8_t oem_name[8];
  uint16_t bytes_per_sector;
  uint8_t sectors_per_cluster;
  uint16_t reserved_sector_count;
  uint8_t num_fats;
  uint16_t root_entry_count;
  uint16_t total_sectors_16;
  uint8_t media;
  uint16_t fat_size_16;
  uint16_t sectors_per_track;
  uint16_t num_heads;
  uint32_t hidden_sectors;
  uint32_t total_sectors_32;

  // fat32
  uint32_t fat_size_32;
  uint16_t ext_flags;
  uint16_t fs_version;
  uint32_t root_cluster;
  uint16_t fs_info;
  uint16_t backup_boot_sector;
  uint8_t reserved[12];
  uint8_t drive_number;
  uint8_t reserved1;
  uint8_t boot_signature;
  uint32_t volume_id;
  uint8_t volume_label[11];
  uint8_t fs_type[8];
};

struct ATTR(packed) FatDirEntry {
  uint8_t name[8];
  uint8_t ext[3];
  uint8_t attr;
  uint8_t reserved;
  uint8_t created_time_tenths;
  uint16_t create_time;
  uint16_t create_date;
  uint16_t last_access_date;
  uint16_t first_cluster_high; // fat32
  uint16_t write_time;
  uint16_t write_date;
  uint16_t first_cluster_low;
  uint32_t file_size;
};

#define ATTR_READ_ONLY 0x01
#define ATTR_HIDDEN 0x02
#define ATTR_SYSTEM 0x04
#define ATTR_VOLUME_ID 0x08
#define ATTR_DIRECTORY 0x10
#define ATTR_ARCHIVE 0x20
#define ATTR_LONG_NAME                                                         \
  (ATTR_READ_ONLY | ATTR_HIDDEN | ATTR_SYSTEM | ATTR_VOLUME_ID)

#endif // FAT_H
