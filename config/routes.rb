Rails.application.routes.draw do



  resources :energies
  resources :internets
  resources :records
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
 #查找社团
  post '/communities/search',to: 'communities#search'
  #下载文件
  get '/businesses/file_download/:id',to:'businesses#file_download',as:"file_download"
  #我的创业项目
  get '/businesses/mybusiness/:id',to:'businesses#mybusiness',as:"mybusiness"
  #我带领的创业项目
  get '/teachers/mentor/:id',to:'teachers#mentor',as:"mentor"
  #我的教学班级
  get '/teach_classes/myclass/:id', to: 'teach_classes#myclass',as: 'my_class'
  #查找创业项目
  post '/businesses/search',to: 'businesses#search'
  #更改状态
  post '/businesses/edit_state/:id',to:'businesses#edit_state'
 #查找课程
  post '/schedules/search/:id',to: 'schedules#search'
  #查找班级
  post '/class1s/search',to: 'class1s#search'
  #查看班级
  get '/departments/read/:id', to: 'departments#read',as:"read_department"
  #主页
  root to: "home#index"
  #登录账户
  get 'accounts/new'
  post 'accounts/create'
  get '/accounts/index/:id',to:"accounts#index" ,as:"account"
  #充值
  get '/accounts/charge/:id',to:"accounts#charge",as:"accounts_charge"
  post '/accounts/charge/:id',to:"accounts#charge"
  #交易记录
  get '/records/read/:id', to: 'records#read',as:"read_records"
  #电费
  get '/energies/read/:id', to: 'energies#read',as:"read_energy"
  get '/energies/charge/:id',to:"energies#charge"
  post '/energies/charge/:id',to:"energies#charge"
  #网费
  get '/internets/read/:id', to: 'internets#read',as:"read_internet"
  get '/internets/charge/:id',to:"internets#charge"
  post '/internets/charge/:id',to:"internets#charge"
  #验证密码
  get 'sessions/new'
  post 'sessions/create_internet'
  post 'sessions/create_energy'
  post 'sessions/create'


end
