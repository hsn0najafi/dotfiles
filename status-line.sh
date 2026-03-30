#!/usr/bin/env bash

input=$(cat)

read -r cwd model total_in total_out used_pct rem_pct win_size five_pct five_rst seven_pct seven_rst < <(
	echo "$input" | jq -r '[
    (.workspace.current_dir // "-"),
    (.model.id // "-"),
    (.context_window.total_input_tokens // "-"),
    (.context_window.total_output_tokens // "-"),
    (.context_window.used_percentage // "-"),
    (.context_window.remaining_percentage // "-"),
    (.context_window.context_window_size // "-"),
    (.rate_limits.five_hour.used_percentage // "-"),
    (.rate_limits.five_hour.resets_at // "-"),
    (.rate_limits.seven_day.used_percentage // "-"),
    (.rate_limits.seven_day.resets_at // "-")
  ] | @tsv'
)

has_value() { [ -n "$1" ] && [ "$1" != "-" ]; }

format_tokens() {
	awk -v n="$1" 'BEGIN {
    if (n >= 1000000) printf "%.1fM", n / 1000000
    else if (n >= 1000) printf "%.1fK", n / 1000
    else printf "%d", n
  }'
}

format_pct() { has_value "$1" && printf '%.0f%%' "$1" || printf '-'; }

format_rate() {
	if ! has_value "$1"; then
		echo "-"
		return
	fi
	local out="$(printf '%.0f' "$1")%"
	has_value "$2" && out="$out $(date -r "$2" "+%m-%d %H:%M" 2>/dev/null)"
	echo "$out"
}

branch=$(git -C "$cwd" branch --show-current 2>/dev/null)
if has_value "$cwd"; then cwd="${cwd/#$HOME/~}"; else cwd="-"; fi
if ! has_value "$branch"; then branch="-"; fi

if has_value "$total_in" && has_value "$total_out"; then
	tok=$(format_tokens $((total_in + total_out)))
else
	tok="-"
fi

five=$(format_rate "$five_pct" "$five_rst")
seven=$(format_rate "$seven_pct" "$seven_rst")
used=$(format_pct "$used_pct")
rem=$(format_pct "$rem_pct")
ctx=$(has_value "$win_size" && format_tokens "$win_size" || printf '-')

echo "$cwd | $branch | $model | T: $tok | U: $used | R: $rem | Cx: $ctx | $five | $seven"
