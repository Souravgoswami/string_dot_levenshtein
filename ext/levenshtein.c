#include <string.h>
#include <inttypes.h>
#include "ruby.h"

VALUE levenshtein(VALUE obj, VALUE arg) {
	char *a = StringValuePtr(obj), *b = StringValuePtr(arg) ;
	char b_i_1 ;

	if (strcmp(a, b) == 0) return INT2FIX(0) ;
	if (strcmp(a, "") == 0) return INT2FIX(strlen(b)) ;
	if (strcmp(b, "") == 0) return INT2FIX(strlen(a)) ;

	uint64_t a_len = strlen(a) + 1 ;
	uint64_t b_len = strlen(b) + 1 ;

	if (a_len > 4096 || b_len > 4096)
		rb_raise(rb_eRuntimeError, "More than 4096 characters were given") ;

	uint16_t ary[b_len][a_len], *ary_i, *ary_i_1 ;
	uint16_t i, i_1 ;
	uint16_t j, j_1 ;
	uint16_t diag, up, left, min ;

	for(i = 0 ; i < a_len ; ++i) ary[0][i] = i ;
	for(i = 0 ; i < b_len ; ++i) ary[i][0] = i ;

	for(i = 1 ; i < b_len ; ++i) {
		i_1 = i - 1 ;
		ary_i = ary[i] ;
		ary_i_1 = ary[i_1] ;
		b_i_1 = b[i_1] ;

		for(j = 1 ; j < a_len ; ++j) {
			j_1 = j - 1 ;
			diag = ary_i_1[j_1] ;

			if (a[j_1] == b_i_1) {
				ary_i[j] = diag ;
			} else {
				up = ary_i_1[j] ;
				left = ary_i[j_1] ;

				min = diag ;
				if (up < diag) min = up ;
				if (left < diag) min = left ;

				ary_i[j] = min + 1 ;
			}
		}
	}

	return INT2FIX(ary[b_len - 1][a_len - 1]) ;
}

void Init_levenshtein() {
	VALUE _rb_string = rb_define_class("String", rb_cObject) ;
	rb_define_method(_rb_string, "levenshtein", levenshtein, 1) ;
}
