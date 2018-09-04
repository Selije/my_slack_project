defmodule AppuniteRec do

    def send_notify(name, version) do
        str_message = create_message(name, version)
        json_message = message_to_json(str_message)
        send_to_slack(json_message)
    end

    def create_message(name, version) do
        "Project #{name} in version #{version} has just started on the server."
    end

    def message_to_json(str_message) do
        Poison.encode!(%{"channel" => "#general", "text" => str_message})
    end

    def send_to_slack(json_message) do
        HTTPoison.start
        HTTPoison.post "https://slack.com/api/chat.postMessage", json_message, [{"Content-Type", "application/json"}, {"Authorization", "Bearer #{my_secret_token}"}]
    end


end
