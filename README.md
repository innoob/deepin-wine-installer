## 声明：软件来源于deepin，衷心感谢deepin团队。
#### 目前仅在Ubuntu16.04,Ubuntu18.04和Mint17上测试通过，且仅支持deb系包环境，如果有什么需求或者缺陷请提Issues我会尽力解决的.
### 结构：
	deepin-wine_commons文件夹中包含有deepin-wine所需的共有依赖包.
	deepin-wine_<版本号>中为对应版本deepin-wine和deepin-wine-helper相关依赖包.

### 环境：
	终端输入：dpkg --print-foreign-architectures 如果结果为i386则你的系统已经包含32位库。
	如果结果为amd64而非i386的话，请先执行：
		sudo dpkg --add-architecture i386
		sudo apt-get update

### 安装：
	在终端中执行:
		sudo bash install.sh
	或者：
		sudo chmod +x install.sh;./install.sh

### 卸载
	终端中执行:
		sudo bash remove.sh
	或者：
		sudo chmod +x remove.sh;./remove.sh

### 附注：
	为了能在ubuntu中顺利执行安装，本人对其中大部分的软件包进行了依赖移除。
	经测试发现，在ubuntu上的运行效果并不如在deepin上的完美，
	如ubuntu上deepinqq点击视频通话即崩溃、deepinthunder部分图片无法显示等。
	不过这一版的deepinqq和deepinthunder比起其他版本的wineqq和thunder来说更加高效和稳定。
	qq能够记住密码，除视频通话、远程演示和内嵌音乐播放组件外几乎无bug。
	thunder能够使用手机号登录，能够完美下载和加速。

### 支持国产deepin，支持wine。 个人娱乐，请勿恶意传播。
