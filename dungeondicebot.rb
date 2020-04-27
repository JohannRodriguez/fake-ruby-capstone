require 'telegram/bot'
require_relative './classes.rb'
#
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    crbl = Criticblunder.new
    calc = Calcs.new
    minor_than = message.text.split(/(bgt)/)
    if minor_than[1] == "bgt" and minor_than.length == 3
      case minor_than[0]
      when '/d4'
          roll = rand(1..4)
          comparison = minor_than[2].to_i
          if roll < comparison
            bot.api.send_message(chat_id: message.chat.id, text: "D4 smaller than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(0, roll)} Succes!")
          else
            bot.api.send_message(chat_id: message.chat.id, text: "D4 smaller than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(0, roll)} Failure")
          end
        when '/d6'
          roll = rand(1..6)
          comparison = minor_than[2].to_i
          if roll < comparison
            bot.api.send_message(chat_id: message.chat.id, text: "D6 smaller than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(1, roll)} Succes!")
          else
            bot.api.send_message(chat_id: message.chat.id, text: "D6 smaller than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(1, roll)} Failure")
          end
        when '/d8'
          roll = rand(1..8)
          comparison = minor_than[2].to_i
          if roll < comparison
            bot.api.send_message(chat_id: message.chat.id, text: "D8 smaller than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(2, roll)} Succes!")
          else
            bot.api.send_message(chat_id: message.chat.id, text: "D8 smaller than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(2, roll)} Failure")
          end
        when '/d10'
          roll = rand(1..10)
          comparison = minor_than[2].to_i
          if roll < comparison
            bot.api.send_message(chat_id: message.chat.id, text: "D10 smaller than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(3, roll)} Succes!")
          else
            bot.api.send_message(chat_id: message.chat.id, text: "D10 smaller than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(3, roll)} Failure")
          end
        when '/d20'
          roll = rand(1..20)
          comparison = minor_than[2].to_i
          if roll < comparison
            bot.api.send_message(chat_id: message.chat.id, text: "D20 smaller than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(4, roll)} Succes!")
          else
            bot.api.send_message(chat_id: message.chat.id, text: "D20 smaller than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(4, roll)} Failure")
          end
        when '/d100'
          roll = rand(1..100)
          comparison = minor_than[2].to_i
          if roll < comparison
            bot.api.send_message(chat_id: message.chat.id, text: "D100 smaller than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(5, roll)} Succes!")
          else
            bot.api.send_message(chat_id: message.chat.id, text: "D100 smaller than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(5, roll)} Failure")
          end
      end
    end

    bigger_than = message.text.split(/(smt)/)
    if bigger_than[1] == "smt" and bigger_than.length == 3
      case bigger_than[0]
      when '/d4'
          roll = rand(1..4)
          comparison = bigger_than[2].to_i
          if roll > comparison
            bot.api.send_message(chat_id: message.chat.id, text: "D4 bigger than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(0, roll)} Succes!")
          else
            bot.api.send_message(chat_id: message.chat.id, text: "D4 bigger than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(0, roll)} Failure")
          end
        when '/d6'
          roll = rand(1..6)
          comparison = bigger_than[2].to_i
          if roll > comparison
            bot.api.send_message(chat_id: message.chat.id, text: "D6 bigger than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(1, roll)} Succes!")
          else
            bot.api.send_message(chat_id: message.chat.id, text: "D6 bigger than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(1, roll)} Failure")
          end
        when '/d8'
          roll = rand(1..8)
          comparison = bigger_than[2].to_i
          if roll > comparison
            bot.api.send_message(chat_id: message.chat.id, text: "D8 bigger than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(2, roll)} Succes!")
          else
            bot.api.send_message(chat_id: message.chat.id, text: "D8 bigger than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(2, roll)} Failure")
          end
        when '/d10'
          roll = rand(1..10)
          comparison = bigger_than[2].to_i
          if roll > comparison
            bot.api.send_message(chat_id: message.chat.id, text: "D10 bigger than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(3, roll)} Succes!")
          else
            bot.api.send_message(chat_id: message.chat.id, text: "D10 bigger than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(3, roll)} Failure")
          end
        when '/d20'
          roll = rand(1..20)
          comparison = bigger_than[2].to_i
          if roll > comparison
            bot.api.send_message(chat_id: message.chat.id, text: "D20 bigger than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(4, roll)} Succes!")
          else
            bot.api.send_message(chat_id: message.chat.id, text: "D20 bigger than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(4, roll)} Failure")
          end
        when '/d100'
          roll = rand(1..100)
          comparison = bigger_than[2].to_i
          if roll > comparison
            bot.api.send_message(chat_id: message.chat.id, text: "D100 bigger than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(5, roll)} Succes!")
          else
            bot.api.send_message(chat_id: message.chat.id, text: "D100 bigger than #{comparison}. Your roll is #{roll}, #{crbl.cr_bl_roll(5, roll)} Failure")
          end
      end
    end

    critic_blunder_new = message.text.split(/(eql)/)
    if critic_blunder_new[1] == "eql" and critic_blunder_new.length == 3
      case critic_blunder_new[0]
      when '/d4cr'
        bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_assign(0, 'd4', critic_blunder_new[2], 'critic'))
      when '/d6cr'
        bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_assign(1, 'd6', critic_blunder_new[2], 'critic'))
      when '/d8cr'
        bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_assign(2, 'd8', critic_blunder_new[2], 'critic'))
      when '/d10cr'
        bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_assign(3, 'd10', critic_blunder_new[2], 'critic'))
      when '/d20cr'
        bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_assign(4, 'd20', critic_blunder_new[2], 'critic'))
      when '/d100cr'
        bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_assign(5, 'd100', critic_blunder_new[2], 'critic'))
      when '/d4bl'
        bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_assign(0, 'd4', critic_blunder_new[2], 'blunder'))
      when '/d6bl'
        bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_assign(1, 'd6', critic_blunder_new[2], 'blunder'))
      when '/d8bl'
        bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_assign(2, 'd8', critic_blunder_new[2], 'blunder'))
      when '/d10bl'
        bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_assign(3, 'd10', critic_blunder_new[2], 'blunder'))
      when '/d20bl'
        bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_assign(4, 'd20', critic_blunder_new[2], 'blunder'))
      when '/d100bl'
        bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_assign(5, 'd100', critic_blunder_new[2], 'blunder'))
      end
    end

    dices = message.text.split(/(tm)/)
    if dices[1] == 'tm' and dices.length == 3
      case dices[0]
      when '/d4'
        bot.api.send_message(chat_id: message.chat.id, text: "#{dices[2].to_i} D4 rolled, results:")
        dices[2].to_i.times do |i|
          roll = rand(1..4)
          bot.api.send_message(chat_id: message.chat.id, text: "#{roll}#{crbl.cr_bl_roll(0, roll)}")
        end
      when '/d6'
        bot.api.send_message(chat_id: message.chat.id, text: "#{dices[2].to_i} D4 rolled, results:")
        dices[2].to_i.times do |i|
          roll = rand(1..6)
          bot.api.send_message(chat_id: message.chat.id, text: "#{roll}#{crbl.cr_bl_roll(1, roll)}")
        end
      when '/d8'
        bot.api.send_message(chat_id: message.chat.id, text: "#{dices[2].to_i} D4 rolled, results:")
        dices[2].to_i.times do |i|
          roll = rand(1..8)
          bot.api.send_message(chat_id: message.chat.id, text: "#{roll}#{crbl.cr_bl_roll(2, roll)}")
        end
      when '/d10'
        bot.api.send_message(chat_id: message.chat.id, text: "#{dices[2].to_i} D4 rolled, results:")
        dices[2].to_i.times do |i|
          roll = rand(1..10)
          bot.api.send_message(chat_id: message.chat.id, text: "#{roll}#{crbl.cr_bl_roll(3, roll)}")
        end
      when '/d20'
        bot.api.send_message(chat_id: message.chat.id, text: "#{dices[2].to_i} D4 rolled, results:")
        dices[2].to_i.times do |i|
          roll = rand(1..20)
          bot.api.send_message(chat_id: message.chat.id, text: "#{roll}#{crbl.cr_bl_roll(4, roll)}")
        end
      when '/d100'
        bot.api.send_message(chat_id: message.chat.id, text: "#{dices[2].to_i} D4 rolled, results:")
        dices[2].to_i.times do |i|
          roll = rand(1..100)
          bot.api.send_message(chat_id: message.chat.id, text: "#{roll}#{crbl.cr_bl_roll(5, roll)}")
        end
      end
    end

    add = message.text.split(/(add)/)
    if add[1] == "add" and add.length == 3
      bigger_than = add[2].split(/(bgt)/)
      smaller_than = add[2].split(/(smt)/) if bigger_than.length == 1
      case add[0]
      when '/d4'
        roll = rand(1..4)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D4 roll is #{roll}#{crbl.cr_bl_roll(0, roll)} plus #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('+', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D4 roll is #{roll}#{crbl.cr_bl_roll(0, roll)} plus #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('+', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D4 roll is #{roll}#{crbl.cr_bl_roll(0, roll)} plus #{add[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('+', roll, add[2].to_i))
        end
      when '/d6'
        roll = rand(1..6)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D6 roll is #{roll}#{crbl.cr_bl_roll(1, roll)} plus #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('+', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D6 roll is #{roll}#{crbl.cr_bl_roll(1, roll)} plus #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('+', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D6 roll is #{roll}#{crbl.cr_bl_roll(1, roll)} plus #{add[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('+', roll, add[2].to_i))
        end
      when '/d8'
        roll = rand(1..8)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D8 roll is #{roll}#{crbl.cr_bl_roll(2, roll)} plus #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('+', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D8 roll is #{roll}#{crbl.cr_bl_roll(2, roll)} plus #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('+', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D8 roll is #{roll}#{crbl.cr_bl_roll(2, roll)} plus #{add[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('+', roll, add[2].to_i))
        end
      when '/10'
        roll = rand(1.10)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "10 roll is #{roll}#{crbl.cr_bl_roll(3, roll)} plus #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('+', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "10 roll is #{roll}#{crbl.cr_bl_roll(3, roll)} plus #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('+', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "10 roll is #{roll}#{crbl.cr_bl_roll(3, roll)} plus #{add[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('+', roll, add[2].to_i))
        end
      when '/d20'
        roll = rand(1..20)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D20 roll is #{roll}#{crbl.cr_bl_roll(4, roll)} plus #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('+', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D20 roll is #{roll}#{crbl.cr_bl_roll(4, roll)} plus #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('+', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D20 roll is #{roll}#{crbl.cr_bl_roll(4, roll)} plus #{add[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('+', roll, add[2].to_i))
        end
      when '/d100'
        roll = rand(1..100)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D100 roll is #{roll}#{crbl.cr_bl_roll(5, roll)} plus #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('+', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D100 roll is #{roll}#{crbl.cr_bl_roll(5, roll)} plus #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('+', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D100 roll is #{roll}#{crbl.cr_bl_roll(5, roll)} plus #{add[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('+', roll, add[2].to_i))
        end
      end
    end

    sub = message.text.split(/(sub)/)
    if sub[1] == "sub" and sub.length == 3
      bigger_than = sub[2].split(/(bgt)/)
      smaller_than = sub[2].split(/(smt)/) if bigger_than.length == 1
      case sub[0]
      when '/d4'
        roll = rand(1..4)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D4 roll is #{roll}#{crbl.cr_bl_roll(0, roll)} minus #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('-', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D4 roll is #{roll}#{crbl.cr_bl_roll(0, roll)} minus #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('-', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D4 roll is #{roll}#{crbl.cr_bl_roll(0, roll)} minus #{sub[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('-', roll, sub[2].to_i))
        end
      when '/d6'
        roll = rand(1..6)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D6 roll is #{roll}#{crbl.cr_bl_roll(1, roll)} minus #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('-', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D6 roll is #{roll}#{crbl.cr_bl_roll(1, roll)} minus #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('-', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D6 roll is #{roll}#{crbl.cr_bl_roll(1, roll)} minus #{sub[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('-', roll, sub[2].to_i))
        end
      when '/d8'
        roll = rand(1..8)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D8 roll is #{roll}#{crbl.cr_bl_roll(2, roll)} minus #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('-', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D8 roll is #{roll}#{crbl.cr_bl_roll(2, roll)} minus #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('-', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D8 roll is #{roll}#{crbl.cr_bl_roll(2, roll)} minus #{sub[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('-', roll, sub[2].to_i))
        end
      when '/10'
        roll = rand(1.10)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "10 roll is #{roll}#{crbl.cr_bl_roll(3, roll)} minus #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('-', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "10 roll is #{roll}#{crbl.cr_bl_roll(3, roll)} minus #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('-', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "10 roll is #{roll}#{crbl.cr_bl_roll(3, roll)} minus #{sub[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('-', roll, sub[2].to_i))
        end
      when '/d20'
        roll = rand(1..20)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D20 roll is #{roll}#{crbl.cr_bl_roll(4, roll)} minus #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('-', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D20 roll is #{roll}#{crbl.cr_bl_roll(4, roll)} minus #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('-', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D20 roll is #{roll}#{crbl.cr_bl_roll(4, roll)} minus #{sub[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('-', roll, sub[2].to_i))
        end
      when '/d100'
        roll = rand(1..100)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D100 roll is #{roll}#{crbl.cr_bl_roll(5, roll)} minus #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('-', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D100 roll is #{roll}#{crbl.cr_bl_roll(5, roll)} minus #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('-', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D100 roll is #{roll}#{crbl.cr_bl_roll(5, roll)} minus #{sub[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('-', roll, sub[2].to_i))
        end
      end
    end

    mult = message.text.split(/(mult)/)
    if mult[1] == "mult" and mult.length == 3
      bigger_than = mult[2].split(/(bgt)/)
      smaller_than = mult[2].split(/(smt)/) if bigger_than.length == 1
      case mult[0]
      when '/d4'
        roll = rand(1..4)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D4 roll is #{roll}#{crbl.cr_bl_roll(0, roll)} times #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('*', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D4 roll is #{roll}#{crbl.cr_bl_roll(0, roll)} times #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('*', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D4 roll is #{roll}#{crbl.cr_bl_roll(0, roll)} times #{add[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('*', roll, add[2].to_i))
        end
      when '/d6'
        roll = rand(1..6)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D6 roll is #{roll}#{crbl.cr_bl_roll(1, roll)} times #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('*', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D6 roll is #{roll}#{crbl.cr_bl_roll(1, roll)} times #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('*', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D6 roll is #{roll}#{crbl.cr_bl_roll(1, roll)} times #{add[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('*', roll, add[2].to_i))
        end
      when '/d8'
        roll = rand(1..8)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D8 roll is #{roll}#{crbl.cr_bl_roll(2, roll)} times #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('*', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D8 roll is #{roll}#{crbl.cr_bl_roll(2, roll)} times #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('*', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D8 roll is #{roll}#{crbl.cr_bl_roll(2, roll)} times #{add[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('*', roll, add[2].to_i))
        end
      when '/10'
        roll = rand(1.10)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "10 roll is #{roll}#{crbl.cr_bl_roll(3, roll)} times #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('*', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "10 roll is #{roll}#{crbl.cr_bl_roll(3, roll)} times #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('*', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "10 roll is #{roll}#{crbl.cr_bl_roll(3, roll)} times #{add[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('*', roll, add[2].to_i))
        end
      when '/d20'
        roll = rand(1..20)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D20 roll is #{roll}#{crbl.cr_bl_roll(4, roll)} times #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('*', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D20 roll is #{roll}#{crbl.cr_bl_roll(4, roll)} times #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('*', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D20 roll is #{roll}#{crbl.cr_bl_roll(4, roll)} times #{add[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('*', roll, add[2].to_i))
        end
      when '/d100'
        roll = rand(1..100)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D100 roll is #{roll}#{crbl.cr_bl_roll(5, roll)} times #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('*', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D100 roll is #{roll}#{crbl.cr_bl_roll(5, roll)} times #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('*', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D100 roll is #{roll}#{crbl.cr_bl_roll(5, roll)} times #{add[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('*', roll, add[2].to_i))
        end
      end
    end

    div = message.text.split(/(div)/)
    if mult[1] == "div" and mult.length == 3
      bigger_than = div[2].split(/(bgt)/)
      smaller_than = div[2].split(/(smt)/) if bigger_than.length == 1
      case div[0]
      when '/d4'
        roll = rand(1..4)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D4 roll is #{roll}#{crbl.cr_bl_roll(0, roll)} divided by #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('/', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D4 roll is #{roll}#{crbl.cr_bl_roll(0, roll)} divided by #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('/', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D4 roll is #{roll}#{crbl.cr_bl_roll(0, roll)} divided by #{div[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('/', roll, div[2].to_i))
        end
      when '/d6'
        roll = rand(1..6)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D6 roll is #{roll}#{crbl.cr_bl_roll(1, roll)} divided by #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('/', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D6 roll is #{roll}#{crbl.cr_bl_roll(1, roll)} divided by #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('/', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D6 roll is #{roll}#{crbl.cr_bl_roll(1, roll)} divided by #{div[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('/', roll, div[2].to_i))
        end
      when '/d8'
        roll = rand(1..8)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D8 roll is #{roll}#{crbl.cr_bl_roll(2, roll)} divided by #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('/', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D8 roll is #{roll}#{crbl.cr_bl_roll(2, roll)} divided by #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('/', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D8 roll is #{roll}#{crbl.cr_bl_roll(2, roll)} divided by #{div[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('/', roll, div[2].to_i))
        end
      when '/10'
        roll = rand(1.10)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "10 roll is #{roll}#{crbl.cr_bl_roll(3, roll)} divided by #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('/', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "10 roll is #{roll}#{crbl.cr_bl_roll(3, roll)} divided by #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('/', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "10 roll is #{roll}#{crbl.cr_bl_roll(3, roll)} divided by #{div[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('/', roll, div[2].to_i))
        end
      when '/d20'
        roll = rand(1..20)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D20 roll is #{roll}#{crbl.cr_bl_roll(4, roll)} divided by #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('/', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D20 roll is #{roll}#{crbl.cr_bl_roll(4, roll)} divided by #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('/', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D20 roll is #{roll}#{crbl.cr_bl_roll(4, roll)} divided by #{div[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('/', roll, div[2].to_i))
        end
      when '/d100'
        roll = rand(1..100)
        if bigger_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D100 roll is #{roll}#{crbl.cr_bl_roll(5, roll)} divided by #{bigger_than[0].to_i} bigger than #{bigger_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('/', roll, bigger_than[0].to_i, 'bgt', bigger_than[2].to_i))
        elsif smaller_than.length == 3
          bot.api.send_message(chat_id: message.chat.id, text: "D100 roll is #{roll}#{crbl.cr_bl_roll(5, roll)} divided by #{smaller_than[0].to_i} smaller than #{smaller_than[2].to_i}, result:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('/', roll, smaller_than[0].to_i, 'smt', smaller_than[2].to_i))
        else
          bot.api.send_message(chat_id: message.chat.id, text: "D100 roll is #{roll}#{crbl.cr_bl_roll(5, roll)} divided by #{div[2].to_i}, total:")
          bot.api.send_message(chat_id: message.chat.id, text: calc.operation('/', roll, div[2].to_i))
        end
      end
    end

    case message.text
    when '/help'
      bot.api.send_message(chat_id: message.chat.id, text: "/d# To roll a dice, the number you put represents the number of faces of the dice (example: /d6)")
      bot.api.send_message(chat_id: message.chat.id, text: "/d#crst (critic status) To check the value of the critic roll of a dice  (example: /d6crst)")
      bot.api.send_message(chat_id: message.chat.id, text: "/d#blst (blunder status) To check the value of the blunder roll of a dice  (example: /d6crst)")
      bot.api.send_message(chat_id: message.chat.id, text: "/d#creql#to# (critic equals) To assign value or range of the critic roll of a dice  (example: /d6creql3to6)")
      bot.api.send_message(chat_id: message.chat.id, text: "/d#bleql#to# (blunder equals) To assign value or range of the blunder roll of a dice  (example: /d6bleql1)")
      bot.api.send_message(chat_id: message.chat.id, text: "/d#bgt# (bigger than) Tells you if your roll is bigger than the number you assign  (example: /d6bgt4)")
      bot.api.send_message(chat_id: message.chat.id, text: "/d#bgt# (smaller than) Tells you if your roll is smaller than the number you assign  (example: /d6smt3)")
    when '/d4'
      roll = rand(1..4)
      bot.api.send_message(chat_id: message.chat.id, text: "D4 rolled, your roll is:")
      bot.api.send_message(chat_id: message.chat.id, text: "#{roll}#{crbl.cr_bl_roll(0, roll)}")
    when '/d6'
      roll = rand(1..6)
      bot.api.send_message(chat_id: message.chat.id, text: "D6 rolled, your roll is:")
      bot.api.send_message(chat_id: message.chat.id, text: "#{roll}#{crbl.cr_bl_roll(1, roll)}")
    when '/d8'
      roll = rand(1..8)
      bot.api.send_message(chat_id: message.chat.id, text: "D8 rolled, your roll is:")
      bot.api.send_message(chat_id: message.chat.id, text: "#{roll}#{crbl.cr_bl_roll(2, roll)}")
    when '/d10'
      roll = rand(1..10)
      bot.api.send_message(chat_id: message.chat.id, text: "D10 rolled, your roll is:")
      bot.api.send_message(chat_id: message.chat.id, text: "#{roll}#{crbl.cr_bl_roll(3, roll)}")
    when '/d20'
      roll = rand(1..20)
      bot.api.send_message(chat_id: message.chat.id, text: "D20 rolled, your roll is:")
      bot.api.send_message(chat_id: message.chat.id, text: "#{roll}#{crbl.cr_bl_roll(4, roll)}")
    when '/d100'
      roll = rand(1..100)
      bot.api.send_message(chat_id: message.chat.id, text: "D100 rolled, your roll is:")
      bot.api.send_message(chat_id: message.chat.id, text: "#{roll}#{crbl.cr_bl_roll(5, roll)}")
    when '/d4crst'
      bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_status(0, 'd4', 'critic'))
    when '/d6crst'
      bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_status(1, 'd6', 'critic'))
    when '/d8crst'
      bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_status(2, 'd8', 'critic'))
    when '/d10crst'
      bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_status(3, 'd10', 'critic'))
    when '/d20crst'
      bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_status(4, 'd20', 'critic'))
    when '/d100crst'
      bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_status(5, 'd100', 'critic'))
    when '/d4blst'
      bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_status(0, 'd4', 'blunder'))
    when '/d6blst'
      bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_status(1, 'd6', 'blunder'))
    when '/d8blst'
      bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_status(2, 'd8', 'blunder'))
    when '/d10blst'
      bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_status(3, 'd10', 'blunder'))
    when '/d20blst'
      bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_status(4, 'd20', 'blunder'))
    when '/d100blst'
      bot.api.send_message(chat_id: message.chat.id, text: crbl.cr_bl_status(5, 'd100', 'blunder'))
    end
  end
end
