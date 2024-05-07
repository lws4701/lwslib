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

#include "../include/datastructures/arraylist.h"
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const int DEFAULT_ARRAYLIST_SIZE = 16;
const size_t SIZE_OF_DATATYPE = sizeof(Item *);

List *create_list(const size_t cap) {
  if (cap < INT32_MAX) {
    int initial_capacity =
        cap < DEFAULT_ARRAYLIST_SIZE ? DEFAULT_ARRAYLIST_SIZE : cap;
    List *l = (List *)malloc(sizeof(List));
    l->_capacity = initial_capacity;
    l->_size = 0;
    l->_data = (Item **)malloc(SIZE_OF_DATATYPE * l->_capacity);
    return l;
  }
  return NULL;
}

void delete_list(List *l) {
  if (l->_data != NULL) {
    for (size_t i = 0; i < l->_size; i++) {
      if (l->_data[i] != NULL) {
        if (l->_data[i]->_type == ARRAY_LIST) {
          delete_list((List *)l->_data[i]->_item);
        } else {
          free(l->_data[i]);
        }
      }
    }
    free(l->_data);
  }
  free(l);
}

void double_capacity(List *l) {
  if (l->_capacity <= (INT32_MAX >> 1)) {
    l->_data =
        (Item **)realloc((void *)l->_data, SIZE_OF_DATATYPE * l->_capacity * 2);
    l->_capacity <<= 1;
  }
}

void insert_item(List *l, void *itm, const enum ItemType type,
                 const size_t idx) {
  if (l->_capacity == l->_size) {
    double_capacity(l);
  }
  if (idx <= l->_size) {
    if (idx < l->_size) {
      memmove(&l->_data[idx + 1], &l->_data[idx],
              (l->_size - idx) * SIZE_OF_DATATYPE);
    }
    Item *item_to_insert = (Item *)malloc(SIZE_OF_DATATYPE);
    item_to_insert->_item = itm;
    item_to_insert->_type = type;
    l->_data[idx] = item_to_insert;
    l->_size++;
  }
}

void modify_item(List *l, void *itm, const enum ItemType type,
                 const size_t idx) {
  if (0 <= idx <= l->_size) {
    if (l->_data[idx] != NULL) {
      free(l->_data[idx]);
      Item *new_item = (Item *)malloc(sizeof(Item *));
      new_item->_type = type;
      new_item->_item = itm;
      l->_data[idx] = new_item;
    }
  }
}

void push_item(List *l, void *itm, const enum ItemType type) {
  insert_item(l, itm, type, l->_size);
}

Item remove_item(List *l, const size_t idx) {
  if (l->_size > 0) {
    Item value = *l->_data[idx];
    free(l->_data[idx]);
    if (idx < l->_size) {
      memmove(&l->_data[idx], &l->_data[idx + 1],
              SIZE_OF_DATATYPE * (l->_size - idx - 1));
    }
    l->_size--;
    return value;
  }
  Item dummy;
  dummy._item = NULL;
  dummy._type = NONE;
  return dummy;
}

Item pop_item(List *l) { return remove_item(l, l->_size - 1); }

Item *get_item(const List *l, const size_t idx) {
  if (0 <= idx && idx < l->_size) {
    return l->_data[idx];
  }
  return NULL;
}

void print_array(const List *l) {
  char delim[] = ", ";
  printf("[ ");
  for (size_t i = 0; i < l->_size; i++) {
    switch (l->_data[i]->_type) {
    case CHAR:
      printf("%s%c", i == 0 ? "" : delim, *(char *)(l->_data[i]->_item));
      break;
    case STRING:
      printf("%s%d", i == 0 ? "" : delim, *(char *)l->_data[i]->_item);
      break;
    case INT:
      printf("%s%d", i == 0 ? "" : delim, *(int *)l->_data[i]->_item);
      break;
    case UNSIGNED_INT:
      printf("%s%u", i == 0 ? "" : delim, *(unsigned int *)l->_data[i]->_item);
      break;
    case LONG:
      printf("%s%ld", i == 0 ? "" : delim, *(long *)l->_data[i]->_item);
      break;
    case UNSIGNED_LONG:
      printf("%s%lu", i == 0 ? "" : delim,
             *(unsigned long *)l->_data[i]->_item);
      break;
    case LONG_LONG:
      printf("%s%lld", i == 0 ? "" : delim, *(long long *)l->_data[i]->_item);
      break;
    case UNSIGNED_LONG_LONG:
      printf("%s%llu", i == 0 ? "" : delim,
             *(unsigned long long *)l->_data[i]->_item);
      break;
    case FLOAT:
      printf("%s%f", i == 0 ? "" : delim, *(float *)l->_data[i]->_item);
    case DOUBLE:
      printf("%s%lf", i == 0 ? "" : delim, *(double *)l->_data[i]->_item);
      break;
    case ARRAY_LIST:
      print_array((List *)l->_data[i]->_item);
      break;
    case NONE:
      printf("%sNONE", i == 0 ? "" : delim);
      break;
    default:
      printf("%sUNKNOWN", i == 0 ? "" : delim);
    }
  }
  printf(" ]\n");
}

size_t get_array_size(const List *l) { return l->_size; }

size_t get_array_capacity(const List *l) { return l->_capacity; }

bool is_sortable(const List *l) {
  if (l->_size > 0 && l->_data[0]->_type != ARRAY_LIST) {
    enum ItemType check_type = l->_data[0]->_type;
    for (size_t i = 0; i < l->_size; i++) {
      if (l->_data[i]->_type != check_type)
        return false;
    }
    return true;
  }
  return false;
}
