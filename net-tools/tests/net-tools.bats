#!/usr/bin/env bats

@test "socat installed" {
    run docker run --rm avenga/net-tools which socat
    echo "$output"
    [[ $status -eq 0 ]]
    [[ $output == "/usr/bin/socat" ]]
}
