##English
###copy software file
copy file under this dir to the machine which you want to config

###install
execute sh install.sh to install all software in the machine

###config
####custom some configs
In config.sh
1.in `#add host` section, config the ip and hostname of csync host cluster
2.in `#config cysnc2.cfg` section, config the hostname of csync host cluster
3.in `#config csync2.cfg` section, config the dir path for which dir must be csynced by csync2
4.execute sh config.sh
5.IMPORTANT! when you are first time to config this csync cluster, choose a machine from the cluster to execute csync2 -k /etc/csync2.key in order to generate a key file, then copy this key file to other machine in the cluster under the /etc/ dir

###run
config the csync dir path in run_inotify.sh
execute sh run.sh
ps: now, you can find some program in running when you use ps aux | grep xinetd and ps aux | grep inotify
forgive my poor english




##中文
###拷贝文件
将该目录下的所有文件拷贝到要配置的机器上

###安装软件
执行sh install.sh 安装软件到机器上

###配置软件
#####定制配置项
1.在#add host中， 配置同步集群的ip和hostname
2.在#config csync2.cfg中，配置集群的hostname
3.在#config csync2.cfg中，配置要同步的路径(include dirpath)
4.执行sh config.sh
5.第一次配置时，任选集群中的一台机器执行csync2 -k /etc/csync2.key生成key文件，并通过scp copy该文件到另外几台机器的/etc/目录里(非常重要)

###运行软件
在run_inotify.sh中配置要同步的路径(include dirpath)
执行sh run.sh
注：执行后，通过ps aux | grep xinetd 和 ps aux | grep inotify 可以看到相关执行项
