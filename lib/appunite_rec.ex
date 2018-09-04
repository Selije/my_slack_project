defmodule AppuniteRec do

    def send_notify(name, version) do
        str_message = create_message(name, version)
        message_to_json(str_message)
    end

    def create_message(name, version) do
        "Project #{name} in version #{version} has just started on the server."
    end

    def message_to_json(str_message) do
        Poison.encode!(%{"channel" => "C061EG9SL", "text" => str_message })  #TODO Change channel
    end

    

end
