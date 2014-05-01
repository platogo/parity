require File.join(File.dirname(__FILE__), '..', 'lib', 'parity')

describe Parity::Environment do
  it 'backs up the database' do
    Kernel.stub(:system)

    Parity::Environment.new('production', ['backup']).run

    expect(Kernel).to have_received(:system).with(heroku_backup)
  end

  it 'opens the remote console' do
    Kernel.stub(:system)

    Parity::Environment.new('production', ['console']).run

    expect(Kernel).to have_received(:system).with(heroku_console)
  end

  it 'opens the log2viz visualization' do
    Kernel.stub(:system)

    Parity::Environment.new('production', ['log2viz']).run

    expect(Kernel).to have_received(:system).with(heroku_log2viz)
  end

  it 'automatically restarts processes when it migrates the database' do
    Kernel.stub(:system)

    Parity::Environment.new('production', ['migrate']).run

    expect(Kernel).to have_received(:system).with(migrate)
  end

  it 'tails logs' do
    Kernel.stub(:system)

    Parity::Environment.new('production', ['tail']).run

    expect(Kernel).to have_received(:system).with(tail)
  end

  it 'opens the app' do
    Kernel.stub(:system)

    Parity::Environment.new('production', ['open']).run

    expect(Kernel).to have_received(:system).with(open)
  end

  def heroku_backup
    "hk pgbackups:capture --expire -a production"
  end

  def heroku_console
    "hk run rails console -a production"
  end

  def heroku_log2viz
    "open https://log2viz.herokuapp.com/app/parity-production"
  end

  def migrate
     %{
        hk run rake db:migrate -a production &&
        hk restart -a production
      }
  end

  def tail
    "hk logs --tail -a production"
  end

  def open
    "hk open -a production"
  end
end
