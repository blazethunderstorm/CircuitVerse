class DeletedProject
  ddef name
  I18n.t("deleted_project.name")
end

  def author
    DeletedUser.new
  end

  def id
    nil
  end
end
