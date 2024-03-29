class UsersDatatable
  delegate :params, :h, :link_to, :number_to_currency, :to => :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      :sEcho => params[:sEcho].to_i,
      :iTotalRecords => User.count,
      :iTotalDisplayRecords => users.count,
      :aaData => data
    }
  end

  private

  def data
    users.map do |user|
      [ 
        link_to(user.id, user), 
        link_to(user.name, user), 
        user.login          
      ]
    end
  end    

  def users
    @users ||= fetch_users
  end

  def fetch_users
    users =  User.order("#{sort_column} #{sort_direction}")
    if params[:sSearch].present?
      users =  User.where('(TRANSLATE(lower(users.name), \'áéíóúàèìòùãõâêîôôäëïöüçÁÉÍÓÚÀÈÌÒÙÃÕÂÊÎÔÛÄËÏÖÜÇ\', \'aeiouaeiouaoaeiooaeioucAEIOUAEIOUAOAEIOOAEIOUC\')) like ? or login like ?',"%#{params[:sSearch].downcase}%","%#{params[:sSearch].downcase}%").order("#{sort_column} #{sort_direction}")
    end
    users = users.page(page).per_page(per_page)      
    users
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id (TRANSLATE(users.name,\ 'áéíóúàèìòùãõâêîôôäëïöüçÁÉÍÓÚÀÈÌÒÙÃÕÂÊÎÔÛÄËÏÖÜÇ',\ 'aeiouaeiouaoaeiooaeioucAEIOUAEIOUAOAEIOOAEIOUC')) users.login]
    #columns = %w[id]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
