> 我们在使用软件或开发工具时候，比如DockerHub拉取、Alpine的安装包下载、Compose安装、Yarn使用、Brew安装、Go install等等，通常会遇到原始源网络下载很慢的问题，我们通常做法是走镜像代理，该仓库对此进行了相关备份，方便查看！

### 1. CentOS源

#### 1.1. yum源配置

以下支持阿里云OPSX站点支持，更多源，比如openstack软件支持，可以查看 https://opsx.alibaba.com/guide?lang=zh-CN&document=69a1db68-801e-11e8-b6bd-00163e04cdbb

```
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
wget http://mirrors.aliyun.com/repo/epel-7.repo http://mirrors.aliyun.com/repo/Centos-7.repo -P /etc/yum.repos.d
```

### 2. Mac Brew

#### 2.1. 替换为中科大源
```
cd "$(brew --repo)" && \
    git remote set-url origin https://mirrors.ustc.edu.cn/brew.git
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core" && \
    git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
```

#### 2.2. 替换回来
```
cd "$(brew --repo)" && \
    git remote set-url origin https://github.com/Homebrew/brew.git
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core" && \
    git remote set-url origin https://github.com/Homebrew/homebrew-core.git
```

### 3. Alpine

#### 3.1. 替换为阿里云的镜像

```
sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
```

### 4. Docker

#### 4.1. Docker镜像pull

- 参考：
    + https://www.cnblogs.com/wushuaishuai/p/9984228.html

有阿里云账号的，推荐使用阿里云代理（速度很快，而且比较稳定），需要阿里云账号！

```
https://xxxxx.mirror.aliyuncs.com/

Registry Mirrors:
  https://xxxx.mirror.aliyuncs.com/
 Live Restore Enabled: false
 Product License: Community Engine
```

### 5. Golang

- 参考：
    + https://goproxy.io/zh/

```
 # 启用 Go Modules 功能（1.13以上可以忽略）
export GO111MODULE=on

 # 配置 GOPROXY 环境变量
export GOPROXY=https://goproxy.io
```

### 6. PHP Composer

- 参考：
    + https://pkg.phpcomposer.com/

```
// 方式1：修改 composer 的全局配置文件（推荐方式）
composer config -g repo.packagist composer https://packagist.phpcomposer.com

~/yarn_test # ping packagist.phpcomposer.com
PING packagist.phpcomposer.com (116.196.85.93): 56 data bytes
64 bytes from 116.196.85.93: seq=0 ttl=37 time=39.731 ms
64 bytes from 116.196.85.93: seq=1 ttl=37 time=71.900 ms

// 方式2：配置在composer.json中
composer config repo.packagist composer https://packagist.phpcomposer.com

// 上面方式实际是在composer.json中添加了以下内容：
"repositories": {
    "packagist": {
        "type": "composer",
        "url": "https://packagist.phpcomposer.com"
    }
}
```

### 7. NPM
参考：https://npm.taobao.org/

```
// 方式1：全局
$ npm install -g cnpm --registry=https://registry.npm.taobao.org

// 方式2：alias别名
$ alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"

// 方式3：alias别名加.bashrc或者.zshrc
$ echo 'alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"' >> ~/.zshrc && source ~/.zshrc

// 方式4：npm设置代理
npm config set registry http://registry.npm.taobao.org/
npm config set registry https://registry.npmjs.org/
```

### 8. YARN

```
yarn config set registry http://registry.npm.taobao.org/
yarn config set registry https://registry.npmjs.org/
```

在公司默认的`registry.yarnpkg.com`差不多，两者对比：

```
~/yarn_test # ping registry.yarnpkg.com
PING registry.yarnpkg.com (104.16.17.35): 56 data bytes
64 bytes from 104.16.17.35: seq=0 ttl=37 time=17.186 ms
64 bytes from 104.16.17.35: seq=1 ttl=37 time=17.393 ms
64 bytes from 104.16.17.35: seq=2 ttl=37 time=15.215 ms

~/yarn_test # ping registry.npm.taobao.org
PING registry.npm.taobao.org (183.57.82.166): 56 data bytes
64 bytes from 183.57.82.166: seq=0 ttl=37 time=26.823 ms
64 bytes from 183.57.82.166: seq=1 ttl=37 time=17.835 ms
64 bytes from 183.57.82.166: seq=2 ttl=37 time=15.967 ms
64 bytes from 183.57.82.166: seq=3 ttl=37 time=15.247 ms
```

#### USTC - 中科大相关开源的镜像源
- https://mirrors.ustc.edu.cn/help/alpine.html
- github: https://github.com/ustclug/mirrorhelp/tree/master/source