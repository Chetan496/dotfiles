# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
SCALA_HOME=/usr/local/share/scala/
SBT_HOME=/usr/local/share/sbt/
LEIN_HOME=/usr/local/share/lein
JAVA_HOME=/usr/java/jdk1.8.0_45
JRE_HOME=/usr/java/jdk1.8.0_45/jre
CLASSPATH=/usr/java/jdk1.7.0_55/lib/
SMLROOT=/usr/local/share/sml
M2_HOME=/usr/local/apache-maven-3.2.5
GOPATH=/home/MAC/Study/myprojects/go_projects/go_workspace
ANT_HOME=/usr/local/apache-ant-1.9.4
ERLANG_HOME=/home/MAC/Study/erlang/18.1
#ELM_HOME environment variable needs to be set for Elm to work correctly, mentioned in Readme for Elm, when installed 
#as a node.js module
ELM_HOME=/home/MAC/Study/Elm_platform_installation/node_modules/elm/share
#Below Env. variable is just to make Elm available in the PATH
ELM_PLATFORM_HOME=/home/MAC/Study/Elm_platform_installation/node_modules/elm


EMAIL="yewalechetan@gmail.com"
NAME="Chetan Yewale"
SMTPSERVER="smtp.gmail.com"


export JAVA_HOME
export CLASSPATH
export SMLROOT
export M2_HOME
export GOPATH
export JRE_HOME
export CXX='clang++ -I/usr/local/include/c++/v1 -I /usr/lib/gcc/x86_64-redhat-linux/4.8.3/include'
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export ANT_HOME
export ERLANG_HOME

export EMAIL
export NAME
export SMTPSERVER


PATH=$PATH:$HOME/.local/bin:$HOME/bin:$SCALA_HOME/bin:$SBT_HOME/bin:$HOME/.cabal/bin:$LEIN_HOME/:$JAVA_HOME/bin:$JRE_HOME/bin:$SMLROOT/bin:$M2_HOME/bin:/usr/local/go/bin:$GOPATH/bin:$ANT_HOME/bin:$ERLANG_HOME/bin:$ELM_PLATFORM_HOME/bin


export PATH

