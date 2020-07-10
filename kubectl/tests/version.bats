# test the version
@test "test kubectl version" {
    run bash -c "docker run --rm -e CONFIGURE_KUBECTL=false avenga/kubectl version --client -o json | jq -r '.clientVersion.gitVersion'"
    echo "$output"
    [[ $output =~ "v1.18" ]]
    [[ $status -eq 0 ]]
}