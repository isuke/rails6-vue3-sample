module PagesHelper

  def view_name
    @view_name ||= action_name.dasherize
  end

  def assets_paths
    @assets_paths ||= {}

    assets_paths = JSON.parse(File.open(Rails.root.join('webpack-assets.json')).read)
    if dev_server_running?
      @assets_paths[:js]  ||= File.join "http://localhost:#{ENV['DEV_SERVER_PORT']}", assets_paths['main']['js']
      @assets_paths[:css] ||= File.join "http://localhost:#{ENV['DEV_SERVER_PORT']}", assets_paths['main']['css']
    else
      @assets_paths[:js]  ||= File.join '/', 'dist', assets_paths['main']['js']
      @assets_paths[:css] ||= File.join '/', 'dist', assets_paths['main']['css']
    end

    @assets_paths
  end


  def dev_server_running?
    Socket.tcp('localhost', ENV['DEV_SERVER_PORT']).close
    true
  rescue
    false
  end
end
