# Instructions for building a Couchbase Enterprise Server 6.0.1 custom amaxon linux 

# for now, navigate to the examples/couchbase-ami directory off the root of the repo..
MacBook-Pro:terraform-aws-couchbase Mac$ cd examples/couchbase-ami

# !!!!!!!  be sure to utilize the customized "couchbase-no-sync.json"
# !!!!!!!  and "install-couchbase-server-no-sync"

# !!!!!!! update "aws_region" to the desired region 

# verify "DEFAULT_COUCHBASE_ENTERPRISE_SHA256_CHECKSUM_AMAZON_LINUX" = "49c39ec85d96e50ed09dc94f575d7b1c9b5bc9442610abbaf141ae53e0a9fa8b"

# verify line 101 reads 'local readonly filepath="couchbase-server-${edition}-${version}-amzn2.x86_64.rpm"''

# check your aws credentials to ensure you use the correct profile
MacBook-Pro:terraform-aws-couchbase Mac$ subl ~/.aws/credentials

# set the appropriate profile to use with this deployment
MacBook-Pro:terraform-aws-couchbase Mac$ export AWS_PROFILE="gwiz-profile"

# run the packer build command from the root containing the customized "couchbase-no-sync.json"

# be sure to reference the correct packeter build configuration "couchbase-no-sync.json
MacBook-Pro:couchbase-ami Mac$ packer build -only=amazon-linux-ami -var edition=enterprise couchbase-no-sync.json

## OUTPUT is as follows....

amazon-linux-ami output will be in this color.

==> amazon-linux-ami: Prevalidating AMI Name: couchbase-amazon-linux-2019-04-15T15-02-29Z
    amazon-linux-ami: Found Image ID: ami-0de53d8956e8dcf80
==> amazon-linux-ami: Creating temporary keypair: packer_5cb49d05-370d-9aa0-d995-51e8560fa60f
==> amazon-linux-ami: Creating temporary security group for this instance: packer_5cb49d09-854e-ee56-24e4-6a737c1ba03e
==> amazon-linux-ami: Authorizing access to port 22 from 0.0.0.0/0 in the temporary security group...
==> amazon-linux-ami: Launching a source AWS instance...
==> amazon-linux-ami: Adding tags to source instance
    amazon-linux-ami: Adding tag: "Name": "Packer Builder"
    amazon-linux-ami: Instance ID: i-0438d48fd0eb9abd5
==> amazon-linux-ami: Waiting for instance (i-0438d48fd0eb9abd5) to become ready...
==> amazon-linux-ami: Using ssh communicator to connect: 34.230.39.187
==> amazon-linux-ami: Waiting for SSH to become available...
==> amazon-linux-ami: Connected to SSH!
==> amazon-linux-ami: Pausing 30s before the next provisioner...
==> amazon-linux-ami: Provisioning with shell script: /var/folders/vx/bk0bcrnx3p7bxvd6zh_q54zw0000gn/T/packer-shell113738387
    amazon-linux-ami: Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
    amazon-linux-ami: Resolving Dependencies
    amazon-linux-ami: --> Running transaction check
    amazon-linux-ami: ---> Package chrony.x86_64 0:3.2-1.amzn2.0.4 will be updated
    amazon-linux-ami: ---> Package chrony.x86_64 0:3.2-1.amzn2.0.5 will be an update
    amazon-linux-ami: ---> Package ec2-instance-connect.noarch 0:1.0-3.amzn2 will be updated
    amazon-linux-ami: ---> Package ec2-instance-connect.noarch 0:1.1-7.amzn2 will be an update
    amazon-linux-ami: ---> Package kernel.x86_64 0:4.14.106-97.85.amzn2 will be installed
    amazon-linux-ami: --> Finished Dependency Resolution
    amazon-linux-ami:
    amazon-linux-ami: Dependencies Resolved
    amazon-linux-ami:
    amazon-linux-ami: ================================================================================
    amazon-linux-ami:  Package                 Arch      Version                  Repository     Size
    amazon-linux-ami: ================================================================================
    amazon-linux-ami: Installing:
    amazon-linux-ami:  kernel                  x86_64    4.14.106-97.85.amzn2     amzn2-core     20 M
    amazon-linux-ami: Updating:
    amazon-linux-ami:  chrony                  x86_64    3.2-1.amzn2.0.5          amzn2-core    249 k
    amazon-linux-ami:  ec2-instance-connect    noarch    1.1-7.amzn2              amzn2-core     17 k
    amazon-linux-ami:
    amazon-linux-ami: Transaction Summary
    amazon-linux-ami: ================================================================================
    amazon-linux-ami: Install  1 Package
    amazon-linux-ami: Upgrade  2 Packages
    amazon-linux-ami:
    amazon-linux-ami: Total download size: 21 M
    amazon-linux-ami: Downloading packages:
    amazon-linux-ami: Delta RPMs disabled because /usr/bin/applydeltarpm not installed.
    amazon-linux-ami: --------------------------------------------------------------------------------
    amazon-linux-ami: Total                                               57 MB/s |  21 MB  00:00
    amazon-linux-ami: Running transaction check
    amazon-linux-ami: Running transaction test
    amazon-linux-ami: Transaction test succeeded
    amazon-linux-ami: Running transaction
    amazon-linux-ami: ec2-instance-connect:x:998:996::/home/ec2-instance-connect:/sbin/nologin
    amazon-linux-ami:   Updating   : ec2-instance-connect-1.1-7.amzn2.noarch                      1/5
    amazon-linux-ami:   Installing : kernel-4.14.106-97.85.amzn2.x86_64                           2/5
    amazon-linux-ami:   Updating   : chrony-3.2-1.amzn2.0.5.x86_64                                3/5
    amazon-linux-ami:   Cleanup    : ec2-instance-connect-1.0-3.amzn2.noarch                      4/5
    amazon-linux-ami:   Cleanup    : chrony-3.2-1.amzn2.0.4.x86_64                                5/5
    amazon-linux-ami:   Verifying  : chrony-3.2-1.amzn2.0.5.x86_64                                1/5
    amazon-linux-ami:   Verifying  : kernel-4.14.106-97.85.amzn2.x86_64                           2/5
    amazon-linux-ami:   Verifying  : ec2-instance-connect-1.1-7.amzn2.noarch                      3/5
    amazon-linux-ami:   Verifying  : chrony-3.2-1.amzn2.0.4.x86_64                                4/5
    amazon-linux-ami:   Verifying  : ec2-instance-connect-1.0-3.amzn2.noarch                      5/5
    amazon-linux-ami:
    amazon-linux-ami: Installed:
    amazon-linux-ami:   kernel.x86_64 0:4.14.106-97.85.amzn2
    amazon-linux-ami:
    amazon-linux-ami: Updated:
    amazon-linux-ami:   chrony.x86_64 0:3.2-1.amzn2.0.5   ec2-instance-connect.noarch 0:1.1-7.amzn2
    amazon-linux-ami:
    amazon-linux-ami: Complete!
    amazon-linux-ami: Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
    amazon-linux-ami: Resolving Dependencies
    amazon-linux-ami: --> Running transaction check
    amazon-linux-ami: ---> Package git.x86_64 0:2.17.2-2.amzn2 will be installed
    amazon-linux-ami: --> Processing Dependency: perl-Git = 2.17.2-2.amzn2 for package: git-2.17.2-2.amzn2.x86_64
    amazon-linux-ami: --> Processing Dependency: git-core-doc = 2.17.2-2.amzn2 for package: git-2.17.2-2.amzn2.x86_64
    amazon-linux-ami: --> Processing Dependency: git-core = 2.17.2-2.amzn2 for package: git-2.17.2-2.amzn2.x86_64
    amazon-linux-ami: --> Processing Dependency: emacs-filesystem >= 25.3 for package: git-2.17.2-2.amzn2.x86_64
    amazon-linux-ami: --> Processing Dependency: perl(Term::ReadKey) for package: git-2.17.2-2.amzn2.x86_64
    amazon-linux-ami: --> Processing Dependency: perl(Git::I18N) for package: git-2.17.2-2.amzn2.x86_64
    amazon-linux-ami: --> Processing Dependency: perl(Git) for package: git-2.17.2-2.amzn2.x86_64
    amazon-linux-ami: --> Processing Dependency: libsecret-1.so.0()(64bit) for package: git-2.17.2-2.amzn2.x86_64
    amazon-linux-ami: ---> Package jq.x86_64 0:1.5-1.amzn2.0.2 will be installed
    amazon-linux-ami: --> Processing Dependency: libonig.so.2()(64bit) for package: jq-1.5-1.amzn2.0.2.x86_64
    amazon-linux-ami: --> Running transaction check
    amazon-linux-ami: ---> Package emacs-filesystem.noarch 1:25.3-3.amzn2.0.1 will be installed
    amazon-linux-ami: ---> Package git-core.x86_64 0:2.17.2-2.amzn2 will be installed
    amazon-linux-ami: ---> Package git-core-doc.noarch 0:2.17.2-2.amzn2 will be installed
    amazon-linux-ami: ---> Package libsecret.x86_64 0:0.18.5-2.amzn2.0.2 will be installed
    amazon-linux-ami: ---> Package oniguruma.x86_64 0:5.9.6-1.amzn2 will be installed
    amazon-linux-ami: ---> Package perl-Git.noarch 0:2.17.2-2.amzn2 will be installed
    amazon-linux-ami: --> Processing Dependency: perl(Error) for package: perl-Git-2.17.2-2.amzn2.noarch
    amazon-linux-ami: ---> Package perl-TermReadKey.x86_64 0:2.30-20.amzn2.0.2 will be installed
    amazon-linux-ami: --> Running transaction check
    amazon-linux-ami: ---> Package perl-Error.noarch 1:0.17020-2.amzn2 will be installed
    amazon-linux-ami: --> Finished Dependency Resolution
    amazon-linux-ami:
    amazon-linux-ami: Dependencies Resolved
    amazon-linux-ami:
    amazon-linux-ami: ================================================================================
    amazon-linux-ami:  Package              Arch       Version                   Repository      Size
    amazon-linux-ami: ================================================================================
    amazon-linux-ami: Installing:
    amazon-linux-ami:  git                  x86_64     2.17.2-2.amzn2            amzn2-core     217 k
    amazon-linux-ami:  jq                   x86_64     1.5-1.amzn2.0.2           amzn2-core     154 k
    amazon-linux-ami: Installing for dependencies:
    amazon-linux-ami:  emacs-filesystem     noarch     1:25.3-3.amzn2.0.1        amzn2-core      64 k
    amazon-linux-ami:  git-core             x86_64     2.17.2-2.amzn2            amzn2-core     4.0 M
    amazon-linux-ami:  git-core-doc         noarch     2.17.2-2.amzn2            amzn2-core     2.3 M
    amazon-linux-ami:  libsecret            x86_64     0.18.5-2.amzn2.0.2        amzn2-core     153 k
    amazon-linux-ami:  oniguruma            x86_64     5.9.6-1.amzn2             amzn2-core     129 k
    amazon-linux-ami:  perl-Error           noarch     1:0.17020-2.amzn2         amzn2-core      32 k
    amazon-linux-ami:  perl-Git             noarch     2.17.2-2.amzn2            amzn2-core      70 k
    amazon-linux-ami:  perl-TermReadKey     x86_64     2.30-20.amzn2.0.2         amzn2-core      31 k
    amazon-linux-ami:
    amazon-linux-ami: Transaction Summary
    amazon-linux-ami: ================================================================================
    amazon-linux-ami: Install  2 Packages (+8 Dependent packages)
    amazon-linux-ami:
    amazon-linux-ami: Total download size: 7.1 M
    amazon-linux-ami: Installed size: 37 M
    amazon-linux-ami: Downloading packages:
    amazon-linux-ami: --------------------------------------------------------------------------------
    amazon-linux-ami: Total                                               40 MB/s | 7.1 MB  00:00
    amazon-linux-ami: Running transaction check
    amazon-linux-ami: Running transaction test
    amazon-linux-ami: Transaction test succeeded
    amazon-linux-ami: Running transaction
    amazon-linux-ami:   Installing : git-core-2.17.2-2.amzn2.x86_64                              1/10
    amazon-linux-ami:   Installing : git-core-doc-2.17.2-2.amzn2.noarch                          2/10
    amazon-linux-ami:   Installing : 1:perl-Error-0.17020-2.amzn2.noarch                         3/10
    amazon-linux-ami:   Installing : libsecret-0.18.5-2.amzn2.0.2.x86_64                         4/10
    amazon-linux-ami:   Installing : oniguruma-5.9.6-1.amzn2.x86_64                              5/10
    amazon-linux-ami:   Installing : perl-TermReadKey-2.30-20.amzn2.0.2.x86_64                   6/10
    amazon-linux-ami:   Installing : 1:emacs-filesystem-25.3-3.amzn2.0.1.noarch                  7/10
    amazon-linux-ami:   Installing : perl-Git-2.17.2-2.amzn2.noarch                              8/10
    amazon-linux-ami:   Installing : git-2.17.2-2.amzn2.x86_64                                   9/10
    amazon-linux-ami:   Installing : jq-1.5-1.amzn2.0.2.x86_64                                  10/10
    amazon-linux-ami:   Verifying  : 1:emacs-filesystem-25.3-3.amzn2.0.1.noarch                  1/10
    amazon-linux-ami:   Verifying  : perl-TermReadKey-2.30-20.amzn2.0.2.x86_64                   2/10
    amazon-linux-ami:   Verifying  : git-2.17.2-2.amzn2.x86_64                                   3/10
    amazon-linux-ami:   Verifying  : oniguruma-5.9.6-1.amzn2.x86_64                              4/10
    amazon-linux-ami:   Verifying  : libsecret-0.18.5-2.amzn2.0.2.x86_64                         5/10
    amazon-linux-ami:   Verifying  : git-core-2.17.2-2.amzn2.x86_64                              6/10
    amazon-linux-ami:   Verifying  : jq-1.5-1.amzn2.0.2.x86_64                                   7/10
    amazon-linux-ami:   Verifying  : 1:perl-Error-0.17020-2.amzn2.noarch                         8/10
    amazon-linux-ami:   Verifying  : perl-Git-2.17.2-2.amzn2.noarch                              9/10
    amazon-linux-ami:   Verifying  : git-core-doc-2.17.2-2.amzn2.noarch                         10/10
    amazon-linux-ami:
    amazon-linux-ami: Installed:
    amazon-linux-ami:   git.x86_64 0:2.17.2-2.amzn2            jq.x86_64 0:1.5-1.amzn2.0.2
    amazon-linux-ami:
    amazon-linux-ami: Dependency Installed:
    amazon-linux-ami:   emacs-filesystem.noarch 1:25.3-3.amzn2.0.1
    amazon-linux-ami:   git-core.x86_64 0:2.17.2-2.amzn2
    amazon-linux-ami:   git-core-doc.noarch 0:2.17.2-2.amzn2
    amazon-linux-ami:   libsecret.x86_64 0:0.18.5-2.amzn2.0.2
    amazon-linux-ami:   oniguruma.x86_64 0:5.9.6-1.amzn2
    amazon-linux-ami:   perl-Error.noarch 1:0.17020-2.amzn2
    amazon-linux-ami:   perl-Git.noarch 0:2.17.2-2.amzn2
    amazon-linux-ami:   perl-TermReadKey.x86_64 0:2.30-20.amzn2.0.2
    amazon-linux-ami:
    amazon-linux-ami: Complete!
==> amazon-linux-ami: Provisioning with shell script: /var/folders/vx/bk0bcrnx3p7bxvd6zh_q54zw0000gn/T/packer-shell059198495
    amazon-linux-ami: Cloning into '/tmp/bash-commons'...
    amazon-linux-ami: Note: checking out 'd738b92f16e7b30c93d295641b95c392efb41b11'.
    amazon-linux-ami:
    amazon-linux-ami: You are in 'detached HEAD' state. You can look around, make experimental
    amazon-linux-ami: changes and commit them, and you can discard any commits you make in this
    amazon-linux-ami: state without impacting any branches by performing another checkout.
    amazon-linux-ami:
    amazon-linux-ami: If you want to create a new branch to retain commits you create, you may
    amazon-linux-ami: do so (now or later) by using -b with the checkout command again. Example:
    amazon-linux-ami:
    amazon-linux-ami:   git checkout -b <new-branch-name>
    amazon-linux-ami:
==> amazon-linux-ami: Provisioning with shell script: /var/folders/vx/bk0bcrnx3p7bxvd6zh_q54zw0000gn/T/packer-shell751833739
==> amazon-linux-ami: Uploading /Users/Mac/Documents/Development/terraform-aws-couchbase/examples/couchbase-ami/../../ => /tmp/terraform-aws-couchbase
==> amazon-linux-ami: Provisioning with shell script: /var/folders/vx/bk0bcrnx3p7bxvd6zh_q54zw0000gn/T/packer-shell523905251
    amazon-linux-ami: 2019-04-15 15:07:57 [INFO] [install-couchbase-server-no-sync] Starting Couchbase install...
    amazon-linux-ami: 2019-04-15 15:07:57 [INFO] [install-couchbase-server-no-sync] Installing Couchbase 6.0.1 (enterprise edition) on Amazon Linux
    amazon-linux-ami: 2019-04-15 15:07:57 [INFO] [install-couchbase-server-no-sync] Installing Couchbase dependencies
    amazon-linux-ami: Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
    amazon-linux-ami: No packages marked for update
    amazon-linux-ami: Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
    amazon-linux-ami: Package 1:openssl-1.0.2k-16.amzn2.0.3.x86_64 already installed and latest version
    amazon-linux-ami: Nothing to do
    amazon-linux-ami: 2019-04-15 15:07:59 [INFO] [install-couchbase-server-no-sync] Downloading Couchbase from https://packages.couchbase.com/releases/6.0.1/couchbase-server-enterprise-6.0.1-amzn2.x86_64.rpm to couchbase-server-enterprise-6.0.1-amzn2.x86_64.rpm
    amazon-linux-ami: 2019-04-15 15:08:07 [INFO] [install-couchbase-server-no-sync] Validating sha256 checksum of couchbase-server-enterprise-6.0.1-amzn2.x86_64.rpm is 49c39ec85d96e50ed09dc94f575d7b1c9b5bc9442610abbaf141ae53e0a9fa8b
    amazon-linux-ami: couchbase-server-enterprise-6.0.1-amzn2.x86_64.rpm: OK
    amazon-linux-ami: 2019-04-15 15:08:08 [INFO] [install-couchbase-server-no-sync] Installing Couchbase from couchbase-server-enterprise-6.0.1-amzn2.x86_64.rpm
    amazon-linux-ami: Warning: Transparent hugepages looks to be active and should not be.
    amazon-linux-ami: Please look at https://developer.couchbase.com/documentation/server/current/install/thp-disable.html as for how to PERMANENTLY alter this setting.
    amazon-linux-ami: Warning: Swappiness is not set to 0.
    amazon-linux-ami: Please look at https://developer.couchbase.com/documentation/server/current/install/install-swap-space.html as for how to PERMANENTLY alter this setting.
    amazon-linux-ami: Minimum RAM required  : 4 GB
    amazon-linux-ami: System RAM configured : 15.66 GB
    amazon-linux-ami:
    amazon-linux-ami: Minimum number of processors required : 4 cores
    amazon-linux-ami: Number of processors on the system    : 4 cores
    amazon-linux-ami:
    amazon-linux-ami: Created symlink from /etc/systemd/system/multi-user.target.wants/couchbase-server.service to /usr/lib/systemd/system/couchbase-server.service.
    amazon-linux-ami: Skipping server start due to INSTALL_DONT_START_SERVER ...
    amazon-linux-ami:
    amazon-linux-ami: You have successfully installed Couchbase Server.
    amazon-linux-ami: Please browse to http://ip-172-31-91-124.ec2.internal:8091/ to configure your server.
    amazon-linux-ami: Please refer to http://couchbase.com for additional resources.
    amazon-linux-ami:
    amazon-linux-ami: Please note that you have to update your firewall configuration to
    amazon-linux-ami: allow connections to the following ports:
    amazon-linux-ami: 4369, 8091 to 8094, 9100 to 9105, 9998, 9999, 11207, 11209 to 11211,
    amazon-linux-ami: 11214, 11215, 18091 to 18093, and from 21100 to 21299.
    amazon-linux-ami:
    amazon-linux-ami: By using this software you agree to the End User License Agreement.
    amazon-linux-ami: See /opt/couchbase/LICENSE.txt.
    amazon-linux-ami:
    amazon-linux-ami: Note: Forwarding request to 'systemctl disable couchbase-server.service'.
    amazon-linux-ami: Removed symlink /etc/systemd/system/multi-user.target.wants/couchbase-server.service.
    amazon-linux-ami: 2019-04-15 15:08:45 [INFO] [install-couchbase-server-no-sync] Cleaning up couchbase-server-enterprise-6.0.1-amzn2.x86_64.rpm
    amazon-linux-ami: 2019-04-15 15:08:45 [INFO] [install-couchbase-server-no-sync] Creating symlink for libtinfo
    amazon-linux-ami: 2019-04-15 15:08:45 [INFO] [install-couchbase-server-no-sync] Updating OS swappiness settings to 0 in /etc/sysctl.conf
    amazon-linux-ami: 2019-04-15 15:08:45 [INFO] [install-couchbase-server-no-sync] Adding boot script /etc/init.d/disable-thp to disable transparent huge pages
    amazon-linux-ami: 2019-04-15 15:08:45 [INFO] [install-couchbase-server-no-sync] Copying /tmp/terraform-aws-couchbase/modules/install-couchbase-server/../run-couchbase-server/run-couchbase-server to /opt/couchbase/bin/run-couchbase-server
    amazon-linux-ami: 2019-04-15 15:08:45 [INFO] [install-couchbase-server-no-sync] Copying /tmp/terraform-aws-couchbase/modules/install-couchbase-server/../run-replication/run-replication to /opt/couchbase/bin/run-replication
    amazon-linux-ami: 2019-04-15 15:08:45 [INFO] [install-couchbase-server-no-sync] Copying /tmp/terraform-aws-couchbase/modules/install-couchbase-server/../couchbase-commons to /opt/couchbase-commons
    amazon-linux-ami: 2019-04-15 15:08:45 [INFO] [install-couchbase-server-no-sync] Couchbase installed successfully!
==> amazon-linux-ami: Stopping the source instance...
    amazon-linux-ami: Stopping instance, attempt 1
==> amazon-linux-ami: Waiting for the instance to stop...
==> amazon-linux-ami: Creating unencrypted AMI couchbase-amazon-linux-2019-04-15T15-02-29Z from instance i-0438d48fd0eb9abd5
    amazon-linux-ami: AMI: ami-082586503a4f9557c
==> amazon-linux-ami: Waiting for AMI to become ready...
==> amazon-linux-ami: Modifying attributes on AMI (ami-082586503a4f9557c)...
    amazon-linux-ami: Modifying: description
==> amazon-linux-ami: Modifying attributes on snapshot (snap-0217335888c7881f7)...
==> amazon-linux-ami: Terminating the source AWS instance...
==> amazon-linux-ami: Cleaning up any extra volumes...
==> amazon-linux-ami: No volumes to clean up, skipping
==> amazon-linux-ami: Deleting temporary security group...
==> amazon-linux-ami: Deleting temporary keypair...
Build 'amazon-linux-ami' finished.

==> Builds finished. The artifacts of successful builds are:
--> amazon-linux-ami: AMIs were created:
us-east-1: ami-082586503a4f9557c

MacBook-Pro:couchbase-ami Mac$

