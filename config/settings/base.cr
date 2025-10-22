Marten.configure do |config|
  config.auth.user_model = Auth::User

 # Lokalization settings
  # https://martenframework.com/docs/development/reference/settings#i18n
  config.i18n.default_locale = :de
  config.i18n.available_locales = [:de, :en]
  config.time_zone = Time::Location.load("Europe/Berlin")

  # IMPORTANT: please ensure that the secret key value is kept secret!
  config.secret_key = "__insecure_b8b086caf7cb9a549bcec2cf7f65704fecba44bacb7fe0e2820cf3e98ded7d27__"

  # Installed applications
  # https://martenframework.com/docs/development/reference/settings#installed_apps
  config.installed_apps = [
    
    Auth::App
  ] of Marten::Apps::Config.class

  # Application middlewares
  # https://martenframework.com/docs/development/reference/settings#middleware
  config.middleware = [
    Marten::Middleware::Session,
   # Marten::Middleware::I18n,
    Marten::Middleware::Flash,
    Marten::Middleware::GZip,
    Marten::Middleware::XFrameOptions,
    MartenAuth::Middleware
  ] of Marten::Middleware.class

  # Databases
  # https://martenframework.com/docs/development/reference/settings#database-settings
  config.database do |db| # ameba:disable Naming/BlockParameterName
    db.backend = :sqlite
    db.name = Path["openEHS.db"].expand
    executable_dir = Path[Process.executable_path.not_nil!].parent
    database_path = (executable_dir / "openEHS.db").to_s
    executable_dir = Path[Process.executable_path.not_nil!].parent
    
    # Debug-Ausgaben
    #puts "Executable path: #{Process.executable_path}"
    #puts "Executable dir: #{executable_dir}"
    #puts "Database path: #{database_path}"
    #puts "Database exists: #{File.exists?(database_path)}"
  end

  # Templates context producers
  # https://martenframework.com/docs/development/reference/settings#context_producers
  config.templates.context_producers = [
    Marten::Template::ContextProducer::Request,
    Marten::Template::ContextProducer::Flash,
    Marten::Template::ContextProducer::Debug,
    Marten::Template::ContextProducer::I18n,
  ]
end
