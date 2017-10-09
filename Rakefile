#  _  ___      _                        __      ___
# | |/ (_)    | |        /\             \ \    / (_)
# | ' / _  ___| | __    /  \   ___ ___   \ \  / / _ _ __ ___
# |  < | |/ __| |/ /   / /\ \ / __/ __|   \ \/ / | | '_ ` _ \
# | . \| | (__|   <   / ____ \\__ \__ \    \  /  | | | | | | |
# |_|\_\_|\___|_|\_\ /_/    \_\___/___/     \/   |_|_| |_| |_|

@cwd = File.expand_path("../", __FILE__)
@windows = (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil

desc "Install all plugins and dependencies and compile YouCompleteMe"
task :default => ["config_files", "plugins", "packages", "tern", "ycm"] do
    print_output "Installation", "Complete!"
end

desc "create config files"
task:config_files do
    if @windows
        home_dir = Dir.home
        vimrc = "#{home_dir}/vimfiles/vimrc"
        gvimrc = "#{home_dir}/vimfiles/gvimrc"

        sh "echo source " + vimrc + " > #{home_dir}/_vimrc" 
        sh "echo source " + gvimrc + " > #{home_dir}/_gvimrc" 
    else
        sh 'echo "source ~/.vim/vimrc" > ~/.vimrc'
        sh 'echo "source ~/.vim/gvimrc" > ~/.gvimrc'
    end
end

desc "Install Vim plugins"
task:plugins do
    install_vimplug
    install_plugins
end

desc "Install packages"
task:packages do
    install_packages()
end

desc "Build tern runtime and tern for vim"
task :tern do
    print_output "tern for Vim"
    dir = File.expand_path("#{@cwd}/plugins/tern_for_vim")
    Dir.chdir dir do
        print_output "tern_for_vim dependencies"
        sh "npm install"
    end
end

desc "Compile YouCompleteMe"
task :ycm do
    print_output "tern runtime"
    dir = File.expand_path("#{@cwd}/plugins/YouCompleteMe/third_party/ycmd/third_party/tern_runtime")
    Dir.chdir dir do
        sh "npm install --production"
    end

    print_output "/ Compiling YouCompleteMe"
    dir = File.expand_path("#{@cwd}/plugins/YouCompleteMe")
    Dir.chdir dir do
        # TODO: only compile when no binary. Where is it?
        if @windows
            sh "python install.py --tern-completer" # this takes an eTERNity
        else
            sh "./install.py --tern-completer" # this takes an eTERNity
        end
    end
end

def install_vimplug
    print_output "Vim plug"

    autoloaddir = File.expand_path "#{@cwd}/autoload"
    FileUtils.mkdir_p(autoloaddir) unless File.exists?(autoloaddir)

    pluginsdir = File.expand_path "#{@cwd}/plugins"
    FileUtils.mkdir_p(pluginsdir) unless File.exists?(pluginsdir)

    plug_file = File.expand_path "#{@cwd}/autoload/plug.vim"

    unless File.exists?(plug_file)
        sh "curl -LSsok #{plug_file} https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    end
end

def install_plugins
    print_output "/ updating Vim plugins"

    vim_config = '~/.vimrc'
    if @windows
        vim_config = "#{Dir.home}/_vimrc"
    end
    sh "vim -S #{vim_config} -c PlugUpgrade -c PlugUpdate -c PlugClean! -c qa" #; clear"

    print_output "VimProc"
    dir = File.expand_path("#{@cwd}/plugins/vimproc.vim")
    Dir.chdir dir do
        sh "make"
    end
end

def install_packages
    packages =
        [
            "instant-markdown-d",
            "jshint",
            "eslint",
            "typescript",
            "tslint",
            "dtsm",
            "@angular/cli",
            "ts-server",
            "typescript-formatter",
            "js-beautify",
            "remark-cli", # formatter for markdown
            "instant-markdown-d",
            "git+https://github.com/ramitos/jsctags.git"
    ]
        packages.each do |p|
            print_output p
            sh "npm install -g #{p}"
        end

        print_output "sass"
        sh "gem install sass"
end

def print_output(verb, name = nil)
    if !name
        name = verb
        verb = "Installing"
    end
    puts
    puts "*" * 42
    puts "*#{"#{verb} #{name}".center(40)}*"
    puts "*" * 42
    puts
end
<<<<<<< HEAD

install_pathogen
install_sensible

# Colors
Bundle "croaky/vim-colors-github"
Bundle "twerth/ir_black"
Bundle "nelstrom/vim-mac-classic-theme"
Bundle "vim-scripts/pyte"
Bundle "vim-scripts/Colour-Sampler-Pack"
Bundle "wgibbs/vim-irblack"
Bundle "chriskempson/base16-vim"

# Languages
# Bundle "vim-scripts/Arduino-syntax-file"
# Bundle "guns/vim-clojure-static"
Bundle "kchmck/vim-coffee-script"
Bundle "chrisbra/csv.vim"
Bundle "tpope/vim-cucumber"
# Bundle "elixir-lang/vim-elixir"
Bundle "tpope/vim-git"
# Bundle "jnwhiteh/vim-golang"
Bundle "tpope/vim-haml"
Bundle "nono/vim-handlebars"
# Bundle "wlangstroth/vim-haskell"
Bundle "pangloss/vim-javascript"
Bundle "itspriddle/vim-jquery"
Bundle "groenewege/vim-less"
Bundle "tpope/vim-markdown"
Bundle "maba/vim-markdown-preview"
Bundle "juvenn/mustache.vim"
Bundle "sunaku/vim-ruby-minitest"
# Bundle "ecomba/vim-ruby-refactoring" # Refactoring tool for Ruby in vim!
# Bundle "ajf/puppet-vim"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-rake"
# Bundle "rosstimson/scala-vim-support"
Bundle "cakebaker/scss-syntax.vim"
Bundle "timcharper/textile.vim"
Bundle "mmalecki/vim-node.js"
Bundle "vim-ruby/vim-ruby"
Bundle "slim-template/vim-slim" # slim syntax highlighting for vim
Bundle "nanki/treetop.vim"
Bundle "jimenezrick/vimerl"

# Plugins
# Bundle "tpope/vim-abolish"
Bundle "mileszs/ack.vim" # like grep but better. Currently used with Ag, if available
Bundle "bling/vim-airline" # lean & mean statusline for vim that's light as air
# Bundle "Townk/vim-autoclose" # automatically closes quotes, parens, brackets, etc
Bundle "Chiel92/vim-autoformat" # Provides easy code formatting in Vim by integrating existing code formatters.
Bundle "bonsaiben/bootstrap-snippets" # Twitter Bootstrap snippets for vim-snipmate
# Bundle "vim-scripts/bufexplorer.zip"
Bundle "jeetsukumaran/vim-buffergator" # list, select and switch between buffers.
Bundle "duff/vim-bufonly" # quickly close all other buffers
Bundle "tpope/vim-bundler" # Lightweight support for Ruby's Bundler
# Bundle "vim-scripts/camelcasemotion"
Bundle "vim-scripts/ctags.vim"
Bundle "kien/ctrlp.vim" # quick search window
# Bundle "vim-scripts/dbext.vim"
Bundle "Raimondi/delimitMate" # provides insert mode auto-completion for quotes, parens, brackets, etc.
Bundle "Lokaltog/vim-easymotion" # Vim motions on speed!
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-fugitive"
# Bundle "vim-scripts/greplace.vim"
Bundle "sjl/gundo.vim" # provides an undo graph window
# Bundle "henrik/vim-indexed-search"
# Bundle "hallettj/jslint.vim"
# Bundle "vim-scripts/matchit.zip"
Bundle "MarcWeber/vim-addon-mw-utils" # (snipmate dependency) interpret a file by function and cache file automatically
# Bundle "ddollar/nerdcommenter" # easy syntax appropriate commenting
Bundle "scrooloose/nerdtree" # provides a file system tree view
Bundle "jistr/vim-nerdtree-tabs" # NERDTree and tabs together in Vim, painlessly
# Bundle "greyblake/vim-preview"
# Bundle "tpope/vim-ragtag"
Bundle "danro/rename.vim"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-rbenv"
Bundle "drewolson/ruby_focused_unit_test_vim" # run a focused ruby unit test in vim
Bundle "vim-scripts/ruby-matchit"
# Bundle "csexton/rvm.vim"
# Bundle "vim-scripts/searchfold.vim"
# Bundle "vim-scripts/simplefold"
# Bundle "hallison/vim-ruby-sinatra"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets" # additional snippits to use with snipmate
Bundle "ervandew/supertab" # Perform all your vim insert mode completions with Tab
Bundle "tpope/vim-surround"
Bundle "scrooloose/syntastic" # syntax error checking
Bundle "godlygeek/tabular" # text filtering and alignment
Bundle "majutsushi/tagbar" # displays a list of ctags in a sidebar
# Bundle "vim-scripts/TailMinusF"
Bundle "vim-scripts/tComment"
Bundle "kana/vim-textobj-user"
# Bundle "thinca/vim-textobj-comment"
Bundle "nelstrom/vim-textobj-rubyblock"
Bundle "tomtom/tlib_vim" # (snipmate dependency) Some utility functions for VIM
# Bundle "SirVer/ultisnips" # code snipped engine. ships with some templates
Bundle "tpope/vim-unimpaired" # pairs of handy bracket mappings
# Bundle "Raimondi/vimoutliner"
Bundle "sjl/vitality.vim" # enables a thin cursor while in insert mode in console vim
Bundle "vim-scripts/YankRing.vim" # provides a yank buffer history
# Bundle "mattn/zencoding-vim"
Bundle "vim-scripts/ZoomWin" # enables temporary full screen for a viewport
Bundle "editorconfig/editorconfig-vim"

# plugins used by Janus:
# ap/vim-css-color
# tpope/vim-dispatch
# michaeljsmith/vim-indent-object
# rgarver/Kwbd.vim
# tpope/vim-eunuch
# chrisbra/NrrwRgn
# terryma/vim-multiple-cursors
# skalnik/vim-vroom

# plugins used by neo:
# Bundle "git://github.com/harleypig/vcscommand.vim"
# Bundle "git://github.com/vim-scripts/L9"
# Bundle "git://github.com/michaeljsmith/vim-indent-object"
# Bundle "git://github.com/wavded/vim-stylus"
# Bundle "git://github.com/digitaltoad/vim-jade"
# Bundle "https://github.com/vim-scripts/VimClojure"
# " Bundle git://github.com/skammer/vim-css-color
# " Use Aaron Baker's Fork to add SASS/SCSS color highlighting
# Bundle "git@github.com:bakis2011/vim-css-color"

# plugins used by spf13:
# Bundle 'amirh/HTML-AutoCloseTag' # Automatically closes HTML tags once you finish typing them.
# Bundle 'hail2u/vim-css3-syntax' # Add CSS3 syntax support to vim's built-in `syntax/css.vim`.
# Bundle 'godlygeek/csapprox' # Make gvim-only colorschemes work transparently in terminal vim
# Bundle 'elzr/vim-json' # A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing.
# Bundle 'briancollins/vim-jst' # for highlighting and indenting JST/EJS syntax
# Bundle 'spf13/PIV' # PHP Integration environment for Vim
# Bundle 'arnaud-lb/vim-php-namespace' # types "use" statements for you
# Bundle 'mattn/webapi-vim'
# Bundle 'vim-scripts/restore_view.vim' # automatically restoring file's cursor position and folding
# Bundle 'myusuf3/numbers.vim' # intelligently toggling line numbers between relative numbering (relativenumber) and absolute numbering (number)
# Bundle 'airblade/vim-gitgutter' # shows a git diff in the 'gutter' (sign column). It shows whether each line has been added, modified, and where lines have been removed.
# Bundle 'vim-scripts/sessionman.vim' # session manager

# plugins used by yadr
# " Ruby, Rails, Rake...
# Bundle "astashov/vim-ruby-debugger"
# Bundle "ecomba/vim-ruby-refactoring"
# Bundle "skwp/vim-ruby-conque"
# Bundle "tpope/vim-rvm"
# Bundle "vim-scripts/Specky"
# Bundle "ck3g/vim-change-hash-syntax"
#
# " Html, Xml, Css, Markdown...
# Bundle "aaronjensen/vim-sass-status"
# Bundle "claco/jasmine.vim"
# Bundle "digitaltoad/vim-jade"
# Bundle "jtratner/vim-flavored-markdown"
# Bundle "kogakure/vim-sparkup"
# Bundle "nelstrom/vim-markdown-preview"
# Bundle "skwp/vim-html-escape"
# Bundle "wavded/vim-stylus"
#
# " Git related...
# Bundle "gregsexton/gitv"
# Bundle "mattn/gist-vim"
# Bundle "skwp/vim-git-grep-rails-partial"
# Bundle "tjennings/git-grep-vim"
#
# " General text editing improvements...
# Bundle "AndrewRadev/splitjoin.vim"
# Bundle "Raimondi/delimitMate"
# Bundle "Shougo/neocomplcache"
# Bundle "briandoll/change-inside-surroundings.vim"
# Bundle "nelstrom/vim-visual-star-search"
# Bundle "skwp/vim-easymotion"
# Bundle "vim-scripts/IndexedSearch"
# Bundle "vim-scripts/matchit.zip"
# Bundle "terryma/vim-multiple-cursors"
#
# " General vim improvements
# Bundle "bogado/file-line"
# Bundle "mattn/webapi-vim"
# Bundle "rking/ag.vim"
# Bundle "skwp/greplace.vim"
# Bundle "skwp/vim-conque"
# Bundle "vim-scripts/AnsiEsc.vim"
# Bundle "vim-scripts/AutoTag"
# Bundle "vim-scripts/lastpos.vim"
# Bundle "vim-scripts/sudo.vim"
# Bundle "xsunsmile/showmarks"
#
# " Text objects
# Bundle "austintaylor/vim-indentobject"
# Bundle "bootleq/vim-textobj-rubysymbol"
# Bundle "coderifous/textobj-word-column.vim"
# Bundle "kana/vim-textobj-datetime"
# Bundle "kana/vim-textobj-entire"
# Bundle "kana/vim-textobj-function"
# Bundle "kana/vim-textobj-user"
# Bundle "lucapette/vim-textobj-underscore"
# Bundle "nathanaelkane/vim-indent-guides"
# Bundle "nelstrom/vim-textobj-rubyblock"
# Bundle "thinca/vim-textobj-function-javascript"
# Bundle "vim-scripts/argtextobj.vim"
#
# " Cosmetics, color scheme, Powerline...
# Bundle "chrisbra/color_highlight"
# Bundle "vim-scripts/TagHighlight"
# Bundle "bogado/file-line"
=======
>>>>>>> upstream/master
