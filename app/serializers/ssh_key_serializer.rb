class SshKeySerializer < ActiveModel::Serializer
  attributes :id, :title, :fingerprint, :content, :user_id
end
