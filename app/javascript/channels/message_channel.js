import consumer from "channels/consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the MessageChannel")
    this.setConnectionStatus("Connected")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected from the MessageChannel")
    this.setConnectionStatus("Disconnected")
  },

  setConnectionStatus(value) {
    const tag = document.getElementById("connection_status-text");
    if (tag !== null) {
      tag.innerText = value;
    }
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("Received data from the MessageChannel")
    const message_html = this.createMessageLine(data)
    document.getElementById("messages").insertAdjacentHTML("beforeend", message_html)
  },

  createMessageLine(data) {
    return `
      <div>
        <p>${data["message"]["body"]}</p>
        <p>Posted by ${data["message"]["author"]} at ${data["message"]["posted_at"]}</p>
      </div>
    `
  }
});
