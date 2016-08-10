class LabelSerializer < ActiveModel::Serializer
  attributes :id, :name, :gist_ids

  def gist_ids
    object.gist_labels.pluck(:gist_id)
  end
end
