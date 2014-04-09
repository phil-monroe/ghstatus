::Repo = Struct.new(:name, :pulls, :statuses) do
  def self.find(current_user, name)
    pulls = current_user.github.pull_requests(name)

    statuses = Hash.new
    statuses['master'] = current_user.github.status(name, 'master', accept: 'application/vnd.github.she-hulk-preview+json')

    threads = []
    pulls.each do |pull|
      threads << Thread.new do
        begin
          head = pull.head
          # puts head.to_yaml
          status = current_user.github.status(name, head.sha, accept: 'application/vnd.github.she-hulk-preview+json')
          statuses[head.ref] = status
        rescue => e
          Rails.logger.error e.message
          Rails.logger.error e.backtrace
        end
      end
    end
    threads.map(&:join)

    Repo.new name, pulls, statuses
  end
end
