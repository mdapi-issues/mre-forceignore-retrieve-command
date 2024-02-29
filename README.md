# MRE: forceignore issue with retrieve command

> Minimal reproducible example to demonstrate a bug with `.forceignore` and `sf project retrieve start`

[![Actions Status](https://github.com/mdapi-issues/mre-forceignore-retrieve-command/actions/workflows/default.yml/badge.svg?branch=main)](https://github.com/mdapi-issues/mre-forceignore-retrieve-command/actions?query=branch:main)

> [!IMPORTANT]
> A green status badge means the issue was successfully reproduced.

https://github.com/mdapi-issues/mre-forceignore-retrieve-command/assets/789765/55d2f585-3ee3-4a88-ae58-c9f8599c75cc

Given the following `.forceignore` file

```text
**/Admin.profile-meta.xml
```

Retrieving the Admin Profile (which should be present in any org)

```console
$ sf project retrieve start -m "Profile:Admin"
Retrieving v60.0 metadata from xxx using the v60.0 SOAP API
Preparing retrieve request... Succeeded
Warning: Nothing retrieved
```

The output says "Nothing retrieved", **but the Profile was retrieved indeed**:

```console
$ tree force-app
force-app
└── main
    └── default
        └── profiles
            └── Admin.profile-meta.xml
```
