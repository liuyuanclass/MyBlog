Rails.application.routes.draw do


  resources :businesses
  resources :organizes
  resources :communities
  resources :schedules
  resources :teach_classes
  resources :courses
  resources :class2s
  resources :departments
  resources :class1s
  resources :ads
  resources :admins
  resources :teachers
  resources :students
  resources :clients
  resources :lists
  devise_for :users


  get '/teach_classes/read/:id', to: 'teach_classes#read'
  get '/schedules/read/:id', to: 'schedules#read'
  #查看社团
  get '/organizes/read/:id', to: 'organizes#read',as:"organize_read"
  get '/schedules/selection/:id', to: 'schedules#selection' ,as:"selection"
  #选课
  get '/schedules/add_course/:id,:tid', to: 'schedules#add_course' ,as:"add_course"
  #加入社团
  get '/organizes/add_organzie/:id,:cid', to: 'organizes#add_organize' ,as:"add_organize"
  #管理社团
  get '/organizes/my_organzie/:id', to: 'organizes#my_organize' ,as:"my_organize"
  #解散社团
  get '/communities/delete_community/:id', to: 'communities#delete_community' ,as:"delete_community"

  #下载文件
  get '/businesses/file_download/:id',to:'businesses#file_download',as:"file_download"
  #我的创业项目
  get '/businesses/mybusiness/:id',to:'businesses#mybusiness',as:"mybusiness"
  #我带领的创业项目
  get '/teachers/mentor/:id',to:'teachers#mentor',as:"mentor"
  #更改状态
  post '/businesses/edit_state/:id',to:'businesses#edit_state'

  post '/schedules/search/:id',to: 'schedules#search'
  get '/class1s/search/:cid',to:'class1s#search'
  root to: "home#index"




end
