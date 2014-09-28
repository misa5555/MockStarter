json.array!(@projects) do |project|
  json.(project, :id, :title, :description, :category_id) 
  json.project_photo_url project.project_photo.url(:small)
  json.funded project.back_total
  json.funded_percentage project.funded_percentage
  json.days_to_go project.days_to_go
end
