#!/usr/bin/env bats

@test "test kubectl version" {
    run bash -c "docker run --rm -e CONFIGURE_KUBECTL=false avenga/kubectl version --client -o json | jq -r '.clientVersion.gitVersion'"
    echo "$output"
    [[ $output =~ "v1.19" ]] || [[ $output =~ v1.2[[:digit:]] ]]
    [[ $status -eq 0 ]]
}
