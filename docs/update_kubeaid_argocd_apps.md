# Update kubeaid apps managed via argocd

* This scripts need to be run manually during the service or a day before and raise the PR and get it to merged.
* The script basically point to the given tag as a flag to the script
* Make sure the same tag is used for the entire service window cycle **DO NOT: use latest/recent tag in the middle of service window cycle**


## Update the tags for a cluster

```sh
docker run -it  -v $(pwd):/workspace -v <path-to-KubeAid>:/KubeAid  harbor.obmondo.com/obmondo/kubeaid-update-apps:1.0.0 /KubeAid/bin/update-kubeaid-argocd-app.sh -c <cluster-name> -r <tag-for-the-current-window-cycle>
```
