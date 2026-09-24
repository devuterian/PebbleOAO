/* SPDX-License-Identifier: Apache-2.0 */
#pragma once

#include <stdlib.h>

void *kino_test_zalloc(size_t size);
#define applib_zalloc(size) kino_test_zalloc(size)
#define applib_type_zalloc(Type) applib_zalloc(sizeof(Type))
#define applib_type_malloc(Type) malloc(sizeof(Type))
#define applib_type_size(Type) sizeof(Type)
#define applib_malloc(size) malloc(size)
#define applib_free(ptr) free(ptr)
