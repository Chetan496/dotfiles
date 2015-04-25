# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
SCALA_HOME=/usr/local/share/scala/
SBT_HOME=/usr/local/share/sbt/
LEIN_HOME=/usr/local/share/lein
JAVA_HOME=/usr/java/jdk1.7.0_55
CLASSPATH=/usr/java/jdk1.7.0_55/lib/
SMLROOT=/usr/local/share/sml
M2_HOME=/usr/local/apache-maven-3.2.5/
GOPATH=/home/MAC/Study/myprojects/go_projects/go_workspace


export JAVA_HOME
export CLASSPATH
export SMLROOT
export M2_HOME
export GOPATH


PATH=$PATH:$HOME/.local/bin:$HOME/bin:$SCALA_HOME/bin:$SBT_HOME/bin:$HOME/.cabal/bin:$LEIN_HOME/:$JAVA_HOME/bin:$SMLROOT/bin:$M2_HOME/bin:/usr/local/go/bin:$GOPATH/bin


export PATH




