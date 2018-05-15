users_manage 'sysadmin' do
  data_bag 'users'
  action %i[create]
end
