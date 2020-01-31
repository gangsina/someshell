which_git=`git --version`
echo "${which_git}"
if [[ "${which_git}" == "git version 2.5.0" ]]; then
	#statements
	echo "Git already been installed"
	exit 1;
fi

yum remove git -y

cd /usr/src/



yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker -y

#yum install gcc perl-ExtUtils-MakeMaker

#wget http://10.172.203.98/resource/git-2.5.0.tar.gz
wget https://www.kernel.org/pub/software/scm/git/git-2.5.0.tar.gz
tar -zxvf git-2.5.0.tar.gz
cd /usr/src/git-2.5.0

make prefix=/usr/local/git all && make prefix=/usr/local/git install
echo "export PATH=$PATH:/usr/local/git/bin" >> /etc/bashrc
source /etc/bashrc

git --version
