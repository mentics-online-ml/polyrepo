# polyrepo

This is just a convenience repo that uses submodules to put all the other repos as siblings of each other so that path dependencies can be relative. This repo contains no code but only some convenience scripts in dealing with the multiple repos/projects.

There are a number contributing factors in choosing between mono- vs. poly- repo. In this particular case, I was concerned about cargo's repo dependency mechanism. It cannot specify a subdirectory of a git repo. Rather it will download the entire repo and search for Cargo.toml files until it finds the one you're looking for. One of the particular long term goals of this project is to have all processes be exceptionally lean, and that might be a challenge. Granted... ultimately a private artifact/crate repo is likely how one would manage things in the long term rather than repo dependencies in order to be more precise with dependency management, however, this will work for now.

The challenge of managing changes across multiple repos can be mitigated via versioning, which is required anyway to manage deployments safely. Testing downstreams after upstream dependencies can also be automated for polyrepos.
