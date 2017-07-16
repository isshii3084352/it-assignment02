class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    # Project.allのProjectは、/app/models/concerns/project.rb にて宣言されている。
    @projects = Project.all
  end
# Prefix            : projects
# Verb              : GET
# URI Pattern       : /projects(.:format)
# Controller#Action : projects#index


  def show
#    @project = Project.find(params[:id])
  end
# Prefix            : project
# Verb              : GET
# URI Pattern       : /projects/:id(.:format)
# Controller#Action : projects#show
# ★だから、こっちのは"@projects"ではなく、"@project"なんだ！


  def new
    @project = Project.new
  end
# Prefix            : new_project
# Verb              : GET
# URI Pattern       : /projects/new(.:format)
# Controller#Action : projects#new


# 脚注１
  def create
    @project = Project.new(project_params)
    # もし @project.saveが成功したら（validatesでtitleは空白NGとしてる）
    if @project.save
      # プロジェクト一覧ページへ戻る
      redirect_to projects_path
    else
      # newのviewsに戻る。
      render 'new'
    end
  end
# Prefix            : projects
# Verb              : POST
# URI Pattern       : /projects(.:format)
# Controller#Action : projects#create

  def edit
#    @project = Project.find(params[:id])
  end
# Prefix            : pdit_project
# Verb              : GET
# URI Pattern       : /projects/:id/edit(.:format)
# Controller#Action : projects#edit

  def update
#    @project = Project.find(params[:id])
    if @project.update(project_params)
      # プロジェクト一覧ページへ戻る
      redirect_to projects_path
    else
      # newのviewsに戻る。
      render 'edit'
    end
  end
# Prefix            : ***
# Verb              : ***
# URI Pattern       : ***
# Controller#Action : ***


  def destroy
#    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private
  
    def project_params
      params[:project].permit(:title)
    end
    # セキュリティー上の問題、フォームから渡ってくる場合、必要なものだけを引っ張ってくると定義する必要がある。
    # permit(許す)・・・指定のものだけを引っ張ってくる。


    def set_project
      @project = Project.find(params[:id])
    end
end


# 脚注１
# (http://qiita.com/1ulce/items/282cccba1e44158489c8)
#
# ・renderとは
# Action内で、呼び出すViewを指定するメソッド。そのAction内で@〜〜(インスタンス変数)として格納されたものは、Viewからrubyの構文で呼び出せます。
# 呼び出すViewの形式は、RHTML形式です。(RHTML形式は、普通のfoo.htmlや、hogehoge.html.erb等のruby構文が実行できる形式のHTMLのこと)
#
# ・redirect_toとは
# HTTPリクエストをサーバーに送り、ユーザーはそこから返ってくるHTMLが表示される。
#