#!/usr/bin/env bats

@test "sloppy version" {
    run docker run --rm 7val/sloppy
    echo "$output"
    [[ $status -eq 0 ]]
    [[ $output == "1.13.1" ]]
}