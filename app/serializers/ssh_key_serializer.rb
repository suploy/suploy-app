class SshKeySerializer < ActiveModel::Serializer
  attributes :title, :fingerprint, :content
end
