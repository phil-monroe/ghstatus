Repo = Struct.new(:name, :pulls, :statuses) do
  def self.find(current_user, name)
    pulls = current_user.github.pull_requests(name)

    statuses = Hash.new
    statuses['master'] = current_user.github.status(name, 'master', accept: 'application/vnd.github.she-hulk-preview+json')

    pulls.inject(statuses) do |h, pull|
      head = pull.head
      status = current_user.github.status(name, head.ref, accept: 'application/vnd.github.she-hulk-preview+json')
      h[head.ref] = status
      h
    end

    Repo.new name, pulls, statuses
  end
end
