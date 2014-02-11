module ClientsHelper
  def session_graph_data(client)
    # Exercise.all.each do ||
    (4.weeks.ago.to_date..Date.today).map do |date|
      {
        updated_at: date
        triceps: client.crazy_method('triceps', date)
        triceps: client.crazy_method('triceps', date)
        triceps: client.crazy_method('triceps', date)
        triceps: client.crazy_method('triceps', date)
        triceps: client.crazy_method('triceps', date)
        triceps: client.crazy_method('triceps', date)
        triceps: client.crazy_method('triceps', date)
        triceps: client.crazy_method('triceps', date)
        triceps: client.crazy_method('triceps', date)
        triceps: client.crazy_method('triceps', date)
        triceps: client.crazy_method('triceps', date)
        triceps: client.crazy_method('triceps', date)
        triceps: client.crazy_method('triceps', date)
      }
    end
  end
end
