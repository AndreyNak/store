import consumer from "./consumer";

const createChatChannel = (chatId, setChat) => {
  return consumer.subscriptions.create(
    { channel: "ChatChannel", chat_id: chatId },
    {
      connected: () => console.log('WebSocket connected'),
      disconnected: () => console.log("WebSocket disconnected"),
      received: (data) => {
        return setChat(prevChat => ({
          ...prevChat,
          messages: [data, ...prevChat.messages]
        }));
      }
    }
  );
};

export default createChatChannel;

