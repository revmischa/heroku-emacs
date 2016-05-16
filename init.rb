require 'heroku/helpers'
require 'heroku/command'
require 'heroku/command/run'

class Heroku::Command::Emacs < Heroku::Command::Run

  # emacs
  # 
  # Run bash on heroku with emacs
  #  
  def index
    run_attached(emacs_cmd)
  end

  protected

  def emacs_cmd
    <<-CMD
curl https://s3-us-west-2.amazonaws.com/heroku-emacs/emacs-24.5-heroku-minimal.tar.gz --location --silent | tar zx -C emacs
export PATH=$PATH:/app/emacs/bin/emacs
bash
    CMD
  end

end