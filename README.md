# goldendict.vim #

## 安装 ##

* vim-plug

```
    Plug 'jiazhoulvke/goldendict.vim'
```

* Vundle

```
    Plugin 'jiazhoulvke/goldendict.vim'
```

* Pathogen 
    
```
    git clone https://github.com/jiazhoulvke/goldendict.vim ~/.vim/bundle/goldendict.vim
```

## 配置 ##

* 修改绑定按键(默认为\<F12\>)

```
    let g:goldendict_translate_key = '<C-t>'
```

* 绑定命令(默认为GoldenDict)

```
    let g:goldendict_translate_command = 'FanYi'
```

* 禁止绑定按键

```
    let g:goldendict_nomap = 1
```

* 禁止绑定命令

```
    let g:goldendict_nocmd = 1
```

## 使用 ##

* 移动光标到需要翻译的单词上面按\<F12\>

* 选中需要翻译的文本按\<F12\>

* 输入":GoldenDict 要翻译的的单词"并按回车
