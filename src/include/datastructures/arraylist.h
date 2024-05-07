/*
   Copyright (C) 2024 by Lewis Smith

   Permission to use, copy, modify, and/or distribute this software for any
   purpose with or without fee is hereby granted.

   THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
   WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
   MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
   SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER
   RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF
   CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
   CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*/

#ifndef ARRAY_LIST_H
#define ARRAY_LIST_H
#include <stddef.h>

enum ItemType {
  CHAR,
  STRING,
  INT,
  UNSIGNED_INT,
  LONG,
  UNSIGNED_LONG,
  LONG_LONG,
  UNSIGNED_LONG_LONG,
  FLOAT,
  DOUBLE,
  ARRAY_LIST,
  NONE
};

typedef struct DataStructureItem {
  void *_item;
  enum ItemType _type;
} Item;

typedef struct ArrayList {
  Item **_data;
  size_t _size;
  size_t _capacity;
} List;

List *create_list(const size_t);
void delete_list(List *);
void double_capacity(List *);
void insert_item(List *, void *, const enum ItemType, const size_t);
void modify_item(List *, void *, const enum ItemType, const size_t);
void push_item(List *, void *, const enum ItemType);
Item remove_item(List *, const size_t);
Item pop_item(List *);
void print_array(const List *);
size_t get_array_size(const List *);
size_t get_array_capacity(const List *);
#endif
