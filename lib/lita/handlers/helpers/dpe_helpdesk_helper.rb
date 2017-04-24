require 'telegram/bot'
module DpeHelpdeskHelper
  def telegram_keyboard(text, option = [])
    keyboard_markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
      keyboard: split_array(option, 3),
      one_time_keyboard: true,
      resize_keyboard: true
    )
    { text: text, reply_markup: keyboard_markup }
  end

  def split_array(array, len)
    a = []
    array.each_with_index do |x, i|
      a << [] if (i % len).zero?
      a.last << x
    end
    a
  end
end
