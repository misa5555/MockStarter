json.extract! @project, :id, :title, :description

json.project_photo_url @project.project_photo.url()
json.project_photo_url @project.project_photo.url(:big)

json.backers @project.backers do |backer|
  json.extract! backer, :id, :username
  #json.avator_url backer.avator.url()
  json.avator_url backer.avator.url(:middle)
end
