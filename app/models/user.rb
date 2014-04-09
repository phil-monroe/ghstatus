class User < ActiveRecord::Base

  has_many :backlogs

  def self.from_github_omniauth(auth_hash)
    puts auth_hash.to_yaml
    self.find_or_initialize_by(github_uid: auth_hash.uid).tap do |user|
      user.name         = auth_hash.info.name
      user.nickname     = auth_hash.info.nickname
      user.email        = auth_hash.info.email
      user.github_token = auth_hash.credentials.token
      user.save!
    end
  end


  def github
    @github ||= Octokit::Client.new(:access_token => self.github_token)
  end
end
