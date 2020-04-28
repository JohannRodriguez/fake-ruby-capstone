require 'telegram/bot'
require_relative './classes.rb'
token = '1275379380:AAEfkC8K31fMnVPdeEYMSX7hOFdQR-Asecs'

# To test
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    crbl = Criticblunder.new
    calc = Calcs.new
    roll = Rolls.new
    compare_with_math = message.text.split(/(\s|smt|bgt|add|sub|mul|div)/)
    op = message.text.split(/(\s|add|sub|mul|div)/)
    compare = message.text.split(/(\s|smt|bgt)/)
    various_rolls = message.text.split(/(tm)/)
    one_roll = message.text.split(/(d)/)
    critic_blunder_new = message.text.split(/(eql)/)
    crblst = message.text.split(/(st)/)
    new_dice = message.text.split((/(\s|n|d|eql)/))

    if critic_blunder_new[1] == "eql" and critic_blunder_new.length == 3
      dice = critic_blunder_new[0].split(/(\s|d|n)/)
      if dice[0] == '/' and  dice[1] == 'd' and dice[3] == 'n' and crbl.accepted_dices(dice[2].to_i) and dice.length == 5
        if dice[4] == 'cr' or dice[4] == 'bl'
          bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_assign(dice[2].to_i, critic_blunder_new[2], dice[4]))
        end
      end
    end

    if compare_with_math.length == 5 and compare_with_math[3] == 'smt' or compare_with_math[3] == 'bgt'
      if compare_with_math[1] == 'add' or compare_with_math[1] == 'sub' or compare_with_math[1] == 'mul' or compare_with_math[1] == 'div'
        dice = compare_with_math[0].split(/(d)/)
        if dice[0] == '/' and dice[1] == 'd' and crbl.accepted_dices(dice[2].to_i) and dice.length == 3
          compare_multiple_with_math = compare_with_math[4].split(/(tm)/)
          if compare_multiple_with_math.length == 3
            bot.api.send_message(chat_id: message.chat.id, text: roll.compare_roll_with_math(dice[2].to_i, compare_with_math[4].to_i, compare_with_math[3], compare_with_math[2].to_i, compare_with_math[1], compare_multiple_with_math[2].to_i))
          elsif compare_multiple_with_math.length == 1
            bot.api.send_message(chat_id: message.chat.id, text: roll.compare_roll_with_math(dice[2].to_i, compare_with_math[4].to_i, compare_with_math[3], compare_with_math[2].to_i, compare_with_math[1]))
          end
        end
      end
    elsif op.length == 3 and op[1] == "add" or op[1] == "sub" or op[1] == "mul" or op[1] == "div"
        dice = op[0].split(/(d)/)
        if dice[0] == '/' and dice[1] == 'd' and crbl.accepted_dices(dice[2].to_i) and dice.length == 3
          mult_op = op[2].split(/(tm)/)
          if mult_op.length == 3
            bot.api.send_message(chat_id: message.chat.id, text: roll.roll_with_operation(dice[2].to_i, mult_op[0].to_i, op[1], mult_op[2].to_i))
          elsif mult_op.length == 1
            bot.api.send_message(chat_id: message.chat.id, text: roll.roll_with_operation(dice[2].to_i, op[2].to_i, op[1]))
          end
        end
      elsif compare.length == 3 and compare[1] == "smt" or compare[1] == "bgt"
        dice = compare[0].split(/(d)/)
        if dice[0] == '/' and dice[1] == 'd' and crbl.accepted_dices(dice[2].to_i) and dice.length == 3
          compare_multiple = compare[2].split(/(tm)/)
          if compare_multiple.length == 3
            bot.api.send_message(chat_id: message.chat.id, text: roll.compare_roll(dice[2].to_i, compare_multiple[0].to_i, compare[1], compare_multiple[2].to_i))
          elsif compare_multiple.length == 1
            bot.api.send_message(chat_id: message.chat.id, text: roll.compare_roll(dice[2].to_i, compare[2].to_i, compare[1]))
        end
      end
    elsif various_rolls[1] == 'tm' and various_rolls.length == 3
      dices = various_rolls[0].split(/(d)/)
      if dices[0] == '/' and  dices[1] == 'd' and crbl.accepted_dices(dices[2].to_i) and dices.length == 3
        bot.api.send_message(chat_id: message.chat.id, text: roll.multiple_rolls(dices[2].to_i, various_rolls[2].to_i))
      end
    elsif one_roll[0] == '/' and one_roll[1] == 'd' and crbl.accepted_dices(one_roll[2].to_i) and one_roll.length == 3
      bot.api.send_message(chat_id: message.chat.id, text: roll.single_roll(one_roll[2].to_i))
    end

    if crblst.length == 2 and crblst[1] == 'st'
      crbl_validation = crblst[0].split(/(\s|cr|bl|st)/)
      if crbl_validation.length == 2 and crbl_validation[1] == 'cr' or crbl_validation[1] == 'bl'
        dice = crbl_validation[0].split(/(d)/)
        if dice[0] == '/' and dice[1] == 'd' and crbl.accepted_dices(dice[2].to_i) and dice.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_status(dice[2].to_i, crbl_validation[1]))
        end
      end
    end

    if new_dice.length == 7 and new_dice[0] == '/' and new_dice[1] == 'n' and new_dice[2] == '' and new_dice[3] == 'd' and new_dice[4] == '' and new_dice[5] == 'eql'
      unless crbl.accepted_dices(new_dice[6].to_i)
        bot.api.send_message(chat_id: message.chat.id, text: crbl.new_cr_bl(new_dice[6].to_i))
      end
    end

    case message.text
    when '/help'
      bot.api.send_message(chat_id: message.chat.id, text: "/d# To roll a dice, the number you put represents the number of faces of the dice (example: /d6)")
    end
  end
end
