class String
	def levenshtein_rb(arg)
		a_len = length + 1
		b_len = arg.length + 1

		x_chars = chars
		y_chars = arg.chars

		ary = Array.new(b_len) { Array.new(a_len) }

		i = -1
		ary[0][i] = i while (i += 1) < a_len

		i = -1
		ary[i][0] = i while (i += 1) < b_len

		i = 0
		while (i += 1) < b_len
			j = 0
			i_1 = i - 1
			ary_i = ary[i]
			ary_i_1 = ary[i - 1]

			while (j += 1) < a_len
				j_1 = j - 1
				diag = ary_i_1[j_1]

				if x_chars[j_1] == y_chars[i_1]
					ary_i[j] = diag
				else
					up = ary_i_1[j]
					left = ary_i[j_1]

					min = diag
					min = up if up < min
					min = left if left < min

					ary_i[j] = min + 1
				end
			end
		end

		ary[b_len - 1][a_len - 1]
	end
end
